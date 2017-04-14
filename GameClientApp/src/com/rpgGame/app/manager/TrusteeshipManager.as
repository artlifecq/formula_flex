package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;

	/**
	 *
	 * 战斗托管管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-1 上午10:02:16
	 *
	 */
	public class TrusteeshipManager
	{
		private static var _instance : TrusteeshipManager;

		public static function getInstance() : TrusteeshipManager
		{
			if (!_instance)
			{
				_instance = new TrusteeshipManager();
			}
			return _instance;
		}

		private var _gTimer : GameTimer;
		private var _isFightTargetRunning : Boolean;
		private var _isAutoFightRunning : Boolean;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _targetRoles : Vector.<SceneRole>;

		public function TrusteeshipManager()
		{
			_gTimer = new GameTimer("TrusteeshipManager", 200, 0, onUpdate);
			_isFightTargetRunning = false;
			_isAutoFightRunning = false;
			_isBroken = false;
		}

		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
		}

		public function startFightTarget(targetRoles : Vector.<SceneRole> = null) : void
		{
			_gTimer.start();
			_isFightTargetRunning = true;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_targetRoles = targetRoles;
			_stateMachine.transition(AIStateType.AI_NONE);
			onUpdate(true);
		}

		public function startAutoFight() : void
		{
			var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
			var modeState : int = FightManager.getFightRoleState(selectedRole);
			if (selectedRole && modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
			{
				SceneRoleSelectManager.selectedRole = null;
			}
			_gTimer.start();
			_isAutoFightRunning = true;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_stateMachine.transition(AIStateType.AI_NONE);
			onUpdate(true);
		}

		public function broken() : void
		{
			if (!_isFightTargetRunning && !_isAutoFightRunning)
				return;
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(0.5, onDelayedUnbroken);
		}

		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}

		public function stopFightTarget() : void
		{
			if (!_isFightTargetRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isFightTargetRunning = false;
			if (_targetRoles)
			{
				_targetRoles.length = 0;
				_targetRoles = null;
			}
			if (_isAutoFightRunning)
				return;
			stop();
		}

		public function stopAutoFight() : void
		{
			if (!_isAutoFightRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isAutoFightRunning = false;
			if (_isFightTargetRunning)
				return;
			stop();
		}

		public function stopAll() : void
		{
			if (!_isFightTargetRunning && !_isAutoFightRunning)
				return;
			stop();
		}

		private function stop() : void
		{
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isAutoFightRunning = false;
			_isFightTargetRunning = false;
			if (_targetRoles)
			{
				_targetRoles.length = 0;
				_targetRoles = null;
			}
			_gTimer.reset();
			_gTimer.stop();
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
			if (MainRoleManager.actor.stateMachine.isPrewarWaiting)
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR);
			else
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}

		public function get isAutoFightRunning() : Boolean
		{
			return _isAutoFightRunning;
		}

		public function getActiveSpellList() : Vector.<Q_skill_model>
		{
			return ((_stateMachine.owner as SceneRole).data as RoleData).spellList.getAutoSpellList();
		}

		public function getRoleList() : Vector.<SceneRole>
		{
			return _targetRoles;
		}

		private function onUpdate(force : Boolean = false) : void
		{
			if (!_isFightTargetRunning && !_isAutoFightRunning)
				return;
			if (_isBroken)
				return;
			if (_isFightTargetRunning && _targetRoles)
			{
				var isCompleted : Boolean = true;
				for each (var role : SceneRole in _targetRoles)
				{
					if (role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
						isCompleted = false;
				}
				if (isCompleted)
				{
					_targetRoles.length = 0;
					_targetRoles = null;
					stopFightTarget();
					return;
				}
			}
			_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
		}
		
		public function startFightSoulFight():void
		{
			//无战魂，不能释放技能
			if(FightSoulManager.instance().fightSoulInfo==null)
				return  ;
			var skill:Q_skill_model = FightSoulManager.instance().getSpellData();
			//技能冷却中不能释放技能里
			if(SkillCDManager.getInstance().getSkillHasCDTime(skill))
				return ;
			
			
			var role:HeroData = MainRoleManager.actorInfo;
			SpellSender.releaseSpellAtPos(skill.q_skillID,360*Math.random(),role.x,role.y);
			SkillCDManager.getInstance().addSkillCDTime(skill);
			var configCDTime : int = skill.q_cd; //配置的CD时间
//			TweenLite.delayedCall(configCDTime/1000, startFightSoulFight);
		}
	}
}
