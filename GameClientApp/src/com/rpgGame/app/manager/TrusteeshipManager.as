package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.state.ai.AIAttackWalk;
	import com.rpgGame.app.state.ai.AIUseItem;
	import com.rpgGame.app.state.ai.FindAttackable;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;

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
		private var _isFightActorRunning : Boolean;
		private var _isAutoFightRunning : Boolean;
		private var _isFightTargetRunning : Boolean;
		private var _isAutoFhist : Boolean;
		private var _isBroken : Boolean;
		private var _stateMachine : AIStateMachine;
		private var _targetRoles : Vector.<SceneRole>;

		public function TrusteeshipManager()
		{
			_gTimer = new GameTimer("TrusteeshipManager", 500, 0, onUpdate);
			_isFightActorRunning = false;
			_isAutoFightRunning = false;
			_isFightTargetRunning=false;
			_isBroken = false;
		}

		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
		}
		
		
		private var _isFightSelect:Boolean=false;
		/**玩家被攻击*/
		public function killActor() : void
		{
			if(!isAutoFightRunning&&!isFightTargetRunning)
			{
				if(MainRoleManager.actor.stateMachine.isIdle||MainRoleManager.actor.stateMachine.isHiting||MainRoleManager.actor.stateMachine.isPrewar)
				{
					//startFightSelected();
					if(!_isFightSelect)
					{
						_isFightSelect=true;
						TweenLite.delayedCall(4, actorFight);
					}
					
				}
			}
			
			
		}
		/**被动防御*/
		private function actorFight() : void
		{
			_isFightSelect=false;
			_isFightActorRunning=true;
			startFightTarget();
		}
		public function startFightSelected() : void
		{
			
			var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
			if(selectedRole!=null)
			{
				_isFightTargetRunning=true;
				startFightRole(selectedRole);
			}
		
		}
		
		public function startFightRole(targetRole : SceneRole= null) : void
		{
			
			if(targetRole!=null)
			{
				var targetRoles : Vector.<SceneRole>=new Vector.<SceneRole>();
				targetRoles.push(targetRole);
				startFightTarget(targetRoles);
			}
			
		}
		public function startFightTarget(targetRoles : Vector.<SceneRole> = null) : void
		{
			_gTimer.start();
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
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
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			EventManager.dispatchEvent(TaskEvent.AUTO_FIGHT_START);
			_isAutoFhist=true;
			onUpdate(true);
		}

		public function broken() : void
		{
			if (!_isFightActorRunning && !_isAutoFightRunning&&!_isFightTargetRunning)
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
			if (!_isFightActorRunning&&!_isFightTargetRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
			_isFightActorRunning = false;
			_isFightTargetRunning= false;
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
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
			_isAutoFightRunning = false;
			if (_isFightActorRunning||_isFightTargetRunning)
				return;
			stop();
			EventManager.dispatchEvent(TaskEvent.AUTO_FIGHT_STOP);
		}

		public function stopAll() : void
		{
			if (!_isFightActorRunning && !_isAutoFightRunning&&!_isFightTargetRunning)
				return;
			stop();
		}

		private function stop() : void
		{
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isAutoFightRunning = false;
			_isFightActorRunning = false;
			_isFightTargetRunning = false;
			if (_targetRoles)
			{
				_targetRoles.length = 0;
				_targetRoles = null;
			}
			_gTimer.reset();
			_gTimer.stop();
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
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
		public function get isFightTargetRunning() : Boolean
		{
			return _isFightActorRunning;
		}

		public function getActiveSpellList() : Vector.<Q_skill_model>
		{
			return ((_stateMachine.owner as SceneRole).data as RoleData).spellList.getAutoSpellList();
		}

		public function getRoleList() : Vector.<SceneRole>
		{
			return _targetRoles;
		}

		public function setRoleList(role:SceneRole):void
		{
			_targetRoles=new Vector.<SceneRole>();
			if(_targetRoles!=null)
			{
				_targetRoles.push(role);
			}
		}
		
		private function onUpdate(force : Boolean = false) : void
		{
			if (!_isFightActorRunning && !_isAutoFightRunning&&!_isFightTargetRunning)
				return;
			if (_isBroken)
				return;
			/*if (_isFightTargetRunning && _targetRoles)
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
			}*/
			setAiState(force);
			
		}
		
		//private function 
		
		private function setAiState(force:Boolean):void
		{
			
			
			if(_isAutoFightRunning)
			{
				if(AIUseItem.isUseItem())
				{
					_stateMachine.transition(AIStateType.USE_ITEM, null, force);
				}
				if(FindAttackable.isFind())
				{
					_stateMachine.transition(AIStateType.FIND_ATTACKABLE, null, force);
				}
				if(AIAttackWalk.isWalk()&&_isAutoFhist)
				{
					_isAutoFhist=false;
					_stateMachine.transition(AIStateType.ATTACK_WALK, null, force);
				}
				else if(!FindAttackable.isFind())
				{
					
					_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
				}
			}
			
			else if(_isFightActorRunning)
			{
				
				if(FindAttackable.isFind())
				{
					_stateMachine.transition(AIStateType.FIND_ATTACKABLE, null, force);
				}
				_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
			}
			else if(_isFightTargetRunning)
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
					
				}
				else
				{
					if(AIAttackWalk.isWalk())
					{
						_stateMachine.transition(AIStateType.ATTACK_WALK, null, force);
					}
					else
					{
						_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
					}
					
				}
				
			}
			//_stateMachine.transition(AIStateType.TASK_WALK, null, force);
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
			
			
			SpellSender.releaseSpellAtPos(skill.q_skillID,360*Math.random(),MainRoleManager.actor.x,MainRoleManager.actor.z);
			SkillCDManager.getInstance().addSkillCDTime(skill);
			/*var configCDTime : int = skill.q_cd; //配置的CD时间
			TweenLite.delayedCall(configCDTime/1000, startFightSoulFight);*/
		}

		public function get isAutoFhist():Boolean
		{
			return _isAutoFhist;
		}

		public function set isAutoFhist(value:Boolean):void
		{
			_isAutoFhist = value;
		}

	}
}
