package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.ctrl.ControlAutoPick;
	import com.rpgGame.app.manager.ctrl.ControlTripleSkill;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
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
		private var _isLeftDown:Boolean=false;
		private var _stateMachine : AIStateMachine;
		private var _targetRoles : Vector.<SceneRole>;
		private var _findDist:int=0;
		private var ACTORTIME:int=4;
		private var _autoPickCtrl:ControlAutoPick;
		private var _autoSkillCtrl:ControlAutoFightSelectSkill;
		private var _tripleSkillCtrl:ControlTripleSkill;
		public var nextSpell:Q_skill_model;
		public var isNormalSpell:Boolean = false;
		
		public function TrusteeshipManager()
		{
			_gTimer = new GameTimer("TrusteeshipManager", 500, 0, onUpdate);
			_isFightActorRunning = false;
			_isAutoFightRunning = false;
			_isFightTargetRunning=false;
			_isBroken = false;
			if(GlobalSheetData.getSettingInfo(514)!=null)
			{
				ACTORTIME=GlobalSheetData.getSettingInfo(514).q_int_value;
			}
		}
		
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
			_autoPickCtrl=new ControlAutoPick(role);
			_autoSkillCtrl=new ControlAutoFightSelectSkill(role,(role.data as HeroData).job);
			_tripleSkillCtrl=new ControlTripleSkill();
			TrusteeshipFightSoulManager.getInstance().setup(role);
			
		}
		public  function get autoPickCtrl():ControlAutoPick
		{
			return _autoPickCtrl;
		}

		
		private var _isFightSelect:Boolean=false;
		private var _actorTime:Number;
		/**玩家被攻击*/
		public function killActor(role:SceneRole) : void
		{
			if(!isAutoFightRunning&&!isFightTargetRunning&&!isFightActorRunning)
			{
				if(MainRoleManager.actor.stateMachine.isIdle||MainRoleManager.actor.stateMachine.isHiting||MainRoleManager.actor.stateMachine.isPrewar)
				{
					var mdata:MonsterData=role.data as MonsterData;
					if(mdata!=null&&mdata.monsterData.q_monster_type>=1&&mdata.monsterData.q_monster_type<=3)
					{
						if(mdata.ownerId==-1||mdata.monsterData.q_owner==2)//不是召唤物或者是怪物召唤物
						{
							if(!_isFightSelect&&!_isLeftDown)
							{
								_isFightSelect=true;
								_actorTime=SystemTimeManager.curtTm + ACTORTIME*1000;
								_gTimer.start();
								setRoleList();
							}
						}
					}
				}
			}
			if(isFightActorRunning||_isFightSelect)
			{
				pushRoleList(role);
			}
			
		}
		/**被动防御*/
		private function actorFight() : void
		{
			
			_isFightSelect=false;
			if(!isAutoFightRunning&&!MainRoleManager.actor.stateMachine.isRunning&&!_isLeftDown)
			{
				_isFightActorRunning=true;
				startFightTarget(_targetRoles);
			}
			
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
			
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
			_targetRoles = targetRoles;
			_stateMachine.transition(AIStateType.AI_NONE);
			_gTimer.start();
			onUpdate(true);
		}
		
		public function startAutoFight() : void
		{
			stopFightTarget();
			var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
			var modeState : int = FightManager.getFightRoleState(selectedRole);
			if (selectedRole && modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
			{
				SceneRoleSelectManager.selectedRole = null;
			}
			isNormalSpell = false;
			nextSpell = null;
			_targetRoles=null;
			_isAutoFightRunning = true;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			_isFightSelect=false;
			_stateMachine.transition(AIStateType.AI_NONE);
			EventManager.dispatchEvent(TaskEvent.AUTO_FIGHT_START);
			_isAutoFhist=true;
			_gTimer.start();
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
			if(_isFightSelect)
			{
				TweenLite.killDelayedCallsTo(actorFight);
				_isFightSelect=false;
			}
			if (!_isFightActorRunning&&!_isFightTargetRunning)
				return;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			_isFightActorRunning = false;
			_isFightTargetRunning= false;
			if (_targetRoles)
			{
				_targetRoles.length = 0;
				_targetRoles = null;
			}
			_stateMachine.transition(AIStateType.AI_NONE);
			if (_isAutoFightRunning)
				return;
			stop();
		}
		
		public function stopAutoFight() : void
		{
			if(_isFightSelect)
			{
				TweenLite.killDelayedCallsTo(actorFight);
				_isFightSelect=false;
			}
			if (!_isAutoFightRunning)
				return;
			_isBroken = false;
			
			nextSpell = null;
			isNormalSpell = false;
			
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.killDelayedCallsTo(actorFight);
			EventManager.dispatchEvent(TaskEvent.AUTO_FIGHT_STOP);
			_isAutoFightRunning = false;
			_stateMachine.transition(AIStateType.AI_NONE);
			if (_isFightActorRunning||_isFightTargetRunning)
				return;
			stop();
			
		}
		
		public function stopAll() : void
		{
			if (!_isFightActorRunning && !_isAutoFightRunning&&!_isFightTargetRunning)
				return;
			stopFightTarget();
			stopAutoFight();
			
		}
		
		private function stop() : void
		{

			nextSpell = null;
			isNormalSpell = false;
			
			_gTimer.reset();
			_gTimer.stop();

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
		public function getHasRole() : Boolean
		{
			if(_targetRoles==null)
			{
				return false;
			}
			var isCompleted : Boolean = true;
			
			for(var i:int=0,flag:Boolean=true;i<_targetRoles.length;flag?i++:i){
				
				if (_targetRoles[i].usable && !_targetRoles[i].stateMachine.isDeadState)
				{
					isCompleted = false;
					flag=true;
				}
				else
				{
					_targetRoles.splice(i,1);
					flag=false;
				}
			}
			
			if (isCompleted)
			{
				_targetRoles.length = 0;
				_targetRoles = null;
				return false;
				
			}
			
			return true;
		}
		
		public function setRoleList(role:SceneRole=null):void
		{
			_targetRoles=new Vector.<SceneRole>();
			if(role!=null)
			{
				_targetRoles.push(role);
			}
			
		}
		
		public function pushRoleList(role:SceneRole):void
		{
			_targetRoles=_targetRoles?_targetRoles:new Vector.<SceneRole>();
			for(var i:int=0;i<_targetRoles.length;i++)
			{
				if(_targetRoles[i].id==role.id)
				{
					return;
				}
			}
			
			_targetRoles.push(role);;
		}
		
		private function onUpdate(force : Boolean = false) : void
		{
			if(testStopKey&&!_isFightTargetRunning)return;///测试用命令控制  选择的怪可自动杀
			
			if(_isFightSelect)
			{
				techFightActor();
			}
			if (!_isFightActorRunning && !_isAutoFightRunning&&!_isFightTargetRunning)
				return;
			if (_isBroken)
				return;
			
			if (_isAutoFightRunning) 
			{
				if (_autoPickCtrl.isPicking||autoPickCtrl.TryAutoPickItem()) 
				{
					//stopFightTarget();
					return;
				}
				if (_autoPickCtrl.isArrivePk) 
				{
					return;
				}
			}
		
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
//				_stateMachine.transition(AIStateType.USE_ITEM, null, force);
				_stateMachine.transition(AIStateType.FIND_ATTACKABLE, null, force);
				_stateMachine.transition(AIStateType.ATTACK_WALK, null, force);
				_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
			}
				
			else if(_isFightActorRunning)
			{
				if(getHasRole())
				{
//					_stateMachine.transition(AIStateType.USE_ITEM, null, force);
					_stateMachine.transition(AIStateType.FIND_ATTACKABLE, null, force);
					_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
				}
				else
				{
					stopFightTarget();
				}
				
			}
			else if(_isFightTargetRunning)
			{
				if(getHasRole())
				{
					
					_stateMachine.transition(AIStateType.ATTACK_WALK, null, force);
					_stateMachine.transition(AIStateType.ATTACK_TARGET, null, force);
					
				}
				else
				{
					stopFightTarget();
				}
			}
			//_stateMachine.transition(AIStateType.TASK_WALK, null, force);
		}
		private function techFightActor():void
		{
			if(MainRoleManager.actor.stateMachine.isIdle||MainRoleManager.actor.stateMachine.isHiting||MainRoleManager.actor.stateMachine.isPrewar)
			{
				if(SystemTimeManager.curtTm>=_actorTime)
				{
					actorFight();
				}
			}
			else
			{
				_isFightSelect=false;
			}
			
		}
		public function get isAutoFhist():Boolean
		{
			return _isAutoFhist;
		}
		
		public function set isAutoFhist(value:Boolean):void
		{
			_isAutoFhist = value;
		}
		
		public function get isFightActorRunning():Boolean
		{
			return _isFightActorRunning;
		}
		
		public function set isFightActorRunning(value:Boolean):void
		{
			_isFightActorRunning = value;
		}
		
		public function get isAutoing():Boolean
		{
			if(_isFightActorRunning||_isAutoFightRunning||_isFightTargetRunning)
			{
				return true;
			}
			return false;
		}
		
		public function get isLeftDown():Boolean
		{
			return _isLeftDown;
		}
		
		public function set isLeftDown(value:Boolean):void
		{
			_isLeftDown = value;
		}
		/**寻怪范围*/
		public function get findDist():int
		{
			return _findDist;
		}
		
		public function set findDist(value:int):void
		{
			_findDist = value;
		}
		
		private var testStopKey:Boolean=false;
		public function testStop():void
		{
			testStopKey=!testStopKey;
		}

		public function get autoSkillCtrl():ControlAutoFightSelectSkill
		{
			return _autoSkillCtrl;
		}

		public function get tripleSkillCtrl():ControlTripleSkill
		{
			return _tripleSkillCtrl;
		}
	}
}
