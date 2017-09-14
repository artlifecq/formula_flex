package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.ctrl.ControlAutoPick;
	import com.rpgGame.app.manager.ctrl.ControlMainPlayerFight;
	import com.rpgGame.app.manager.ctrl.ControlTripleSkill;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.PickAutoManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	
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
		
		private var _autoSkillCtrl:ControlAutoFightSelectSkill;
		private var _tripleSkillCtrl:ControlTripleSkill;
		public var nextSpell:Q_skill_model;
		private var _isNormalSpell:Boolean = false;
		private var _isAutoWalking:Boolean=false;
		private var _myFighterCtrl:ControlMainPlayerFight;
		public function TrusteeshipManager()
		{
			_gTimer = new GameTimer("TrusteeshipManager", 500, 0, onUpdate);
			_isFightActorRunning = false;
			_isAutoFightRunning = false;
			_isFightTargetRunning=false;
			_isBroken = false;
			ACTORTIME=GlobalSheetData.getSettingInfo(514)!=null?GlobalSheetData.getSettingInfo(514).q_int_value:4;
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,flyComplete);
		}
		
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
			_autoSkillCtrl=new ControlAutoFightSelectSkill(role,(role.data as HeroData).job);
			_tripleSkillCtrl=new ControlTripleSkill();
			_myFighterCtrl=new ControlMainPlayerFight();
			TrusteeshipFightSoulManager.getInstance().setup(role);
			PickAutoManager.getInstance().setup(role);
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
			_isFightSelect=false;
			_targetRoles = targetRoles;
			SceneRoleSelectManager.selectedRole=null;
			_stateMachine.transition(AIStateType.AI_NONE);
			_gTimer.start();
			onUpdate(true);
		}
		/**到达某点继续战斗
		 * @param target 根据type传不同的值 1:[场景id,x,y] 2:刷新表id 3：模型id
		 * @param type  1目标点 2:刷新表id 3：模型id
		 * @param dist 自动战斗寻怪距离 0：设置的距离，-1：全屏寻怪
		 * */
		public function startAutoFightToPos(target:*,type:int=1,dist:int=-1) : void
		{
			switch(type)
			{
				case 1:
					var targetPos:Array=target as Array;
					if(targetPos&&targetPos.length==3)
					{
						MainRoleSearchPathManager.walkToScenePreAttack(targetPos[0], targetPos[1], targetPos[2],onArrive, 100,null,true,true);
					}
					break;
				case 2:
					var areaId:int=int(target);
					var monsterAreaData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(areaId);
					if (monsterAreaData)
					{
						MainRoleSearchPathManager.walkToScenePreAttack(monsterAreaData.q_mapid, monsterAreaData.q_center_x, monsterAreaData.q_center_y,onArrive, 100,null,true,true);
					}
					break;
				case 3:
					var monsterId:int=int(target);
					var monsterData : Q_scene_monster_area = MonsterDataManager.getMonsterByModelId(monsterId,SceneSwitchManager.currentMapId);
					if (monsterData)
					{
						MainRoleSearchPathManager.walkToScenePreAttack(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y,onArrive, 100,null,true,true);
					}
					break;
			}
			findDist=dist;
			
		}
		private function onArrive(data :Object=null):void
		{
			startAutoFight();
		}
		private var startAutoFightfromFlyKey:Array=[0,0,0];
		/**飞鞋到达某点继续战斗
		 * @param target 根据type传不同的值 1:[场景id,x,y] 2:刷新表id 3：模型id
		 * @param type  1目标点 2:刷新表id 3：模型id
		 * */
		public function startAutoFightfromFly(target:*,type:int=1) : void
		{
			switch(type)
			{
				case 1:
					var targetPos:Array=target as Array;
					if(targetPos&&targetPos.length==3)
					{
						startAutoFightfromFlyKey[0]=targetPos[0];
						startAutoFightfromFlyKey[1]=targetPos[1];
						startAutoFightfromFlyKey[2]=targetPos[2];
						SceneSender.sceneMapTransport(targetPos[0], targetPos[1],-Math.abs(targetPos[2]));
					}
					break;
				case 2:
					var areaId:int=int(target);
					var monsterAreaData : Q_scene_monster_area = MonsterDataManager.getAreaByAreaID(areaId);
					if (monsterAreaData)
					{
						startAutoFightfromFlyKey[0]=monsterAreaData.q_mapid;
						startAutoFightfromFlyKey[1]=monsterAreaData.q_center_x;
						startAutoFightfromFlyKey[2]=monsterAreaData.q_center_y;
						SceneSender.sceneMapTransport(monsterAreaData.q_mapid, monsterAreaData.q_center_x, monsterAreaData.q_center_y);
					}
					break;
				case 3:
					var monsterId:int=int(target);
					var monsterData : Q_scene_monster_area = MonsterDataManager.getMonsterByModelId(monsterId,SceneSwitchManager.currentMapId);
					if (monsterData)
					{
						startAutoFightfromFlyKey[0]=monsterData.q_mapid;
						startAutoFightfromFlyKey[1]=monsterData.q_center_x;
						startAutoFightfromFlyKey[2]=monsterData.q_center_y;
						SceneSender.sceneMapTransport(monsterData.q_mapid, monsterData.q_center_x, monsterData.q_center_y);
					}
					break;
			}
		}
		/**飞鞋完成*/
		private function flyComplete():void
		{
			TweenLite.killDelayedCallsTo(flyTostartAutoFight);
			TweenLite.delayedCall(0.5, flyTostartAutoFight);//位置坐标还未同步过来
		}
		
		private function flyTostartAutoFight():void
		{
			if(startAutoFightfromFlyKey[0]==SceneSwitchManager.currentMapId)
			{
				var dist:int = Point.distance(new Point(MainRoleManager.actor.x,MainRoleManager.actor.z),new Point(startAutoFightfromFlyKey[1],startAutoFightfromFlyKey[2]));
				if(dist<50)
				{
					startAutoFight();
				}
				startAutoFightfromFlyKey[0]=0;
			}
		}
		
		public function startAutoFight() : void
		{
			//PickAutoManager.getInstance().startPickAuto();//自动战斗同时开启自动拾取
			stopFightTarget();
			var selectedRole:SceneRole=SceneRoleSelectManager.selectedRole;
			/*if(selectedRole)
			{
				var mdata:MonsterData=selectedRole.data as MonsterData;
				if(mdata==null||(mdata.ownerId>0&&mdata.monsterData.q_owner==1))//挂机不打玩家和玩家的召唤物
				{
					SceneRoleSelectManager.selectedRole=null;
				}
			}
			selectedRole=SceneRoleSelectManager.selectedRole;*/
			if (selectedRole)
			{
				var modeState : int = FightManager.getFightRoleState(selectedRole);
				if(modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
				{
					SceneRoleSelectManager.selectedRole = null;
				}
			}
			isNormalSpell = false;
			nextSpell = null;
			_targetRoles=null;
			_isAutoFightRunning = true;
			_isBroken = false;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
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
				_isFightSelect=false;
			}
			if (!_isAutoFightRunning)
				return;
			_isBroken = false;
			
			nextSpell = null;
			isNormalSpell = false;
			
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
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
			if(PickAutoManager.getInstance().techPickItem())
			{
				return;
			}
			/*if (_isAutoFightRunning) 
			{
				if (PickAutoManager.getInstance().autoPickCtrl.isPicking||PickAutoManager.getInstance().autoPickCtrl.TryAutoPickItem()) 
				{
					//stopFightTarget();
					return;
				}
				if (PickAutoManager.getInstance().autoPickCtrl.isArrivePk) 
				{
					return;
				}
			}*/
		
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
			if(_findDist<0)
			{
				return 10000;
			}
			else if(_findDist==0)
			{
				return int(SystemSetManager.hookValue*50);
			}
			else
			{
				return _findDist;
			}
			
		}
		
		public function set findDist(value:int):void
		{
			if(value<0)
			{
				findDist=10000;
			}
			else if(value==0)
			{
				findDist=int(SystemSetManager.hookValue*50);
			}
			else
			{
				_findDist = value;
			}
			
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

		public function get isNormalSpell():Boolean
		{
			return _isNormalSpell;
		}

		public function set isNormalSpell(value:Boolean):void
		{
			_isNormalSpell = value;
		}

		public function get myFighterCtrl():ControlMainPlayerFight
		{
			return _myFighterCtrl;
		}

		public function get isAutoWalking():Boolean
		{
			return _isAutoWalking;
		}

		public function set isAutoWalking(value:Boolean):void
		{
			_isAutoWalking = value;
		}


		//以下是美人ai需求的===========================================================
		/**
		 * 和主人打架的角色
		 */		
		public var playerFightTarget:long;
	}
}
