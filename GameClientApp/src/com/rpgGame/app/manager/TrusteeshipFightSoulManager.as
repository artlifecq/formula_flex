package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.ai.AIStateMachine;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import gs.TweenLite;

	/**
	*
	* 战魂战斗托管管理器
	* @author YT
	*
	*/
	public class TrusteeshipFightSoulManager
	{
		private static var _instance : TrusteeshipFightSoulManager;
		
		public static function getInstance() : TrusteeshipFightSoulManager
		{
			if (!_instance)
			{
				_instance = new TrusteeshipFightSoulManager();
			}
			return _instance;
		}
		
		private var _gTimer : GameTimer;
		private var _stateMachine : AIStateMachine;
		private var _isFightSoulRunning : Boolean;
		private var _isBroken : Boolean;
		public function TrusteeshipFightSoulManager()
		{
			_gTimer = new GameTimer("TrusteeshipFightSoulManager", 500, 0, onUpdate);
			
			_isFightSoulRunning = false;
			_isBroken = false;
		}
		private function onUpdate(force : Boolean = false) : void
		{
			if (!_isFightSoulRunning)
				return;
			if (_isBroken)
				return;
			
			
			if(!soulFightId||FightManager.getFightRoleState( SceneManager.getSceneObjByID(soulFightId) as SceneRole)==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)//不能攻击
			{
				stopFightSoulAuto();
				return;
			}	
			if(!MainRoleManager.actor.usable||MainRoleManager.actor.stateMachine.isDeadState)
			{
				stopFightSoulAuto();
				return;
			}
			
			_stateMachine.transition(AIStateType.FIGHTSOUL_ATTACE, null, force);
		}
		public function setup(role : SceneRole) : void
		{
			_stateMachine = new AIStateMachine(role);
		}
		public function startFightSoulAuto(targetId:int,type:int) : void
		{
			fightSoulTarget(targetId,type);
			if(!_isFightSoulRunning&&_stateMachine!=null)
			{
				_isFightSoulRunning = true;
				_isBroken = false;
				TweenLite.killDelayedCallsTo(onDelayedUnbroken);
				_stateMachine.transition(AIStateType.AI_NONE);
				onUpdate(true);
				_gTimer.start();
			}
		}
		public function stopFightSoulAuto() : void
		{
			if (!_isFightSoulRunning)
				return;
			_isBroken = false;
			_isFightSoulRunning = false;
			soulFightId=0;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			stop();
		}
		public function stop() : void
		{
			_gTimer.reset();
			_gTimer.stop();
			
		}
		private function onDelayedUnbroken() : void
		{
			_isBroken = false;
		}
		public function broken() : void
		{
			if (!_isFightSoulRunning)
				return;
			_isBroken = true;
			TweenLite.killDelayedCallsTo(onDelayedUnbroken);
			TweenLite.delayedCall(0.5, onDelayedUnbroken);
		}
		
		private var _soulFightId:int;
		private var soulType:int;
		/**设置攻击目标*/
		public function fightSoulTarget(targetId:int,type:int):void
		{
			
			var srole:SceneRole=SceneManager.getSceneObjByID(targetId) as SceneRole;
			if(!srole)
				return ;
			if (srole.type != SceneCharType.MONSTER)
				return ;
			var targetState : int = FightManager.getFightRoleState( SceneManager.getSceneObjByID(targetId) as SceneRole);//攻击类型
			if(targetState==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)//不能攻击
				return ;
			if(!soulFightId)
			{
				soulFightId=targetId;
			}
			
			/*
			攻击规则 ：优先自己攻击   再被动攻击
			var targetState : int = FightManager.getFightRoleState( SceneManager.getSceneObjByID(targetId.ToGID()) as SceneRole);//攻击类型
			if(targetState==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)//不能攻击
				return ;
			if(soulFightId!=null)
			{
				if(!soulFightId.EqualTo(targetId))
				{
					var soulState : int = FightManager.getFightRoleState(SceneManager.getSceneObjByID(soulFightId.ToGID()) as SceneRole);//攻击类型
					if(soulState==FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)//上一攻击怪不能攻击了 
					{
						soulFightId=targetId;
						soulType=type;
					}
					else if(type==1&&soulType==2)//上一攻击怪可以攻击 本次是主动攻击前一次为被动攻击怪
					{
						soulFightId=targetId;
						soulType=type;
					}
				}
			}
			else
			{
				soulFightId=targetId;
				soulType=type;
			}*/
			/*if(soulFightId)
			{
				soulBroken=false;
				TweenLite.delayedCall(skill.q_cd*0.001, soulFightBroken);
				SpellSender.releaseSpellAtTarget(skill.q_skillID,360*Math.random(),soulFightId);
				SkillCDManager.getInstance().addSkillCDTime(skill);
			}*/
			
			
			//SpellSender.releaseSpellAtPos(skill.q_skillID,360*Math.random(),MainRoleManager.actor.x,MainRoleManager.actor.z);
			
			/*var configCDTime : int = skill.q_cd; //配置的CD时间
			TweenLite.delayedCall(configCDTime/1000, startFightSoulFight);*/
		}
		
		

		public function get soulFightId():int
		{
			return _soulFightId;
		}

		public function set soulFightId(value:int):void
		{
			_soulFightId = value;
		}

		public function get isFightSoulRunning():Boolean
		{
			return _isFightSoulRunning;
		}

		public function set isFightSoulRunning(value:Boolean):void
		{
			_isFightSoulRunning = value;
		}
		
		
		
		
	}
}