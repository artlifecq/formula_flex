package com.rpgGame.app.state.ai.pet
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.state.IState;
	import com.game.engine3D.utils.MathUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.ctrl.FightDataVo;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.scene.animator.GirlPetFollowAnimator;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.state.ai.AIState;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	public class GirlPetAttackState extends AIState
	{
		private var _curTarget:int;
		public function GirlPetAttackState()
		{
			super(AIStateType.AI_GIRL_ATTACK);
		}
		private function get pet():SceneRole
		{
			return _machine.owner as SceneRole;
		}
		override public function enterPass(prevState:IState, force:Boolean=false):Boolean
		{
			var pet:SceneRole=_machine.owner as SceneRole;
			if (pet.stateMachine.isWalkMoving)
			{
				return false;	
			}
			if (pet.stateMachine.isJumpRising)
			{
				return false;
			}
			if (pet.stateMachine.isBlinkMoving)
			{
				return false;
			}
			if (pet.stateMachine.isBeatMoving)
			{
				return false;
			}
			if (pet.stateMachine.isDeadState)
			{
				return false;
			}
			if (pet.stateMachine.isAttackHarding)
			{
				return false;
			}
			if (pet.stateMachine.isLockCaseSpell)
			{
				return false;
			}
			return true;
		}
		override public function execute():void
		{
			super.execute();
			if (TrusteeshipManager.getInstance().myFighterCtrl.isInFightList(_curTarget)==false) 
			{
				_curTarget=0;
			}
			if (_curTarget==0) 
			{
				selectTargetWithNone();
			}
			else 
			{
				var role:SceneRole=SceneManager.getSceneObjByID(_curTarget) as SceneRole;
				if (isRoleAvalible(role))
				{
					selectTargetWithRole();
				}
				else
				{
					selectTargetWithNone();
				}
			}
			if (_curTarget!=0) 
			{
				var skill:Q_skill_model=Mgr.petMgr.getCurPetSkill();
				if (skill) 
				{
					var selRole:SceneRole=SceneManager.getSceneObjByID(_curTarget) as SceneRole;
					if (selRole) 
					{
						var targerPos : Vector3D =selRole.position;
						//	RoleStateUtil.walkToPos(MainRoleManager.actor, targerPos, 200, null, onArrive);
						//walkrun=true;
						var position : Vector3D = new Vector3D(targerPos.x, targerPos.z, 0, 0);
						RoleStateUtil.walkToPos(pet, position, skill.q_range_limit*SceneConfig.TILE_HEIGHT,[_curTarget,skill], onArrive2Target,null,null,true);
					}
				}
			}
		}
		private var _time:int=0;
		private function onArrive2Target(wref:WalkMoveStateReference):void
		{
			var arr:Array=wref.data as Array;
			var tar:int=arr[0];
			var skill:Q_skill_model=arr[1];
			if (!SkillCDManager.getInstance().getSkillHasCDTime(skill)) 
			{
				trace("pet cd:"+(getTimer()-_time));
				_time=getTimer();
				var pet:SceneRole=_machine.owner as SceneRole;
				SpellSender.releaseSpellAtTarget(skill.q_skillID,0,tar);
				//前端临时价格cd
				SkillCDManager.getInstance().addSkillCDTime(skill);
			}
		}
		private function selectTargetWithNone():void
		{	
			//主角正在攻击的玩家
			_curTarget=getNearestRole(SceneCharType.PLAYER,TrusteeshipManager.getInstance().myFighterCtrl.targets);
			if (_curTarget) 
			{
				return;
			}
			//攻击主角的玩家
			_curTarget=getNearestRole(SceneCharType.PLAYER,TrusteeshipManager.getInstance().myFighterCtrl.targetAttackMe);
			if (_curTarget) 
			{
				return;
			}
			//主角攻击的怪物
			_curTarget=getNearestRole(SceneCharType.MONSTER,TrusteeshipManager.getInstance().myFighterCtrl.targets);
			if (_curTarget) 
			{
				return;
			}
			//攻击主角的怪物
			_curTarget=getNearestRole(SceneCharType.MONSTER,TrusteeshipManager.getInstance().myFighterCtrl.targetAttackMe);
			if (_curTarget) 
			{
				return;
			}
			//随机找最近的怪
			_curTarget=getNearestMonster();
		}
		private function selectTargetWithRole():void
		{
			var tmp:int;
			//主角正在攻击的玩家
			tmp=getNearestRole(SceneCharType.PLAYER,TrusteeshipManager.getInstance().myFighterCtrl.targets);
			if (tmp) 
			{
				_curTarget=tmp;
				return;
			}
			//攻击主角的玩家
			tmp=getNearestRole(SceneCharType.PLAYER,TrusteeshipManager.getInstance().myFighterCtrl.targetAttackMe);
			if (tmp) 
			{
				_curTarget=tmp;
				return;
			}
			var petAttack:SceneRole=SceneManager.getSceneObjByID(_curTarget) as SceneRole;
			//美人再打玩家不处理
			if (petAttack&&SceneCharType.PLAYER==petAttack.type) 
			{
				return;
			}
			//主角攻击的怪物
			tmp=getNearestRole(SceneCharType.MONSTER,TrusteeshipManager.getInstance().myFighterCtrl.targets);
			if (tmp) 
			{
				_curTarget=tmp;
				return;
			}
			//攻击主角的怪物不处理
//			_curTarget=getNearestRole(SceneCharType.MONSTER,TrusteeshipManager.getInstance().myFighterCtrl.targetAttackMe);
//			if (_curTarget) 
//			{
//				return;
//			}
		}
		/**
		 *获取 打打我主人最近的角色
		 * @param type
		 * @return 
		 * 
		 */		
		private function getNearestRole(type:String,roles:Vector.<FightDataVo>):int
		{
			var dis:int=0;
			var role:SceneRole;
			var len:int=roles.length;
			var tmp:FightDataVo;
			var nowDist:int=int.MAX_VALUE;
			var nowId:int;
			var pet:SceneRole=_machine.owner as SceneRole;
			for (var i:int = 0; i <len; i++) 
			{
				tmp=roles[i];
				role=SceneManager.getSceneObjByID(tmp.targetId) as SceneRole;
				if (!isRoleAvalible(role)) 
				{
					continue;
				}
				if (role.type==SceneCharType.GIRL_PET) 
				{
					continue;
				}
				if (role.isMainChar) 
				{
					continue;
				}
				if (role.type!=type) 
				{
					continue;
				}
				dis=MathUtil.getDistanceNoSqrt(pet.pos.x,pet.pos.y,role.pos.x,role.pos.y);
				if (dis<nowDist) 
				{
					nowDist=dis;
					nowId=tmp.targetId;
				}
			}
			return nowId;
		}
		/**距离是否ok.主玩家和目标的距离是否大于跟随距离+施法距离，两个圆心的距离**/
		private function isDistanceOk(tar:SceneRole,skill:Q_skill_model):Boolean
		{
			if (tar==null||skill==null) 
			{
				return false;
			}
			var mainDis:Number=MathUtil.getDistance(MainRoleManager.actor.pos.x,MainRoleManager.actor.pos.y,tar.pos.x,tar.pos.y);
			var petPlayerDis:Number=MathUtil.getDistance(MainRoleManager.actor.pos.x,MainRoleManager.actor.pos.y,pet.pos.x,pet.pos.y);
			var maxAllow:Number=GirlPetFollowAnimator.MIN_NEAR_2+skill.q_range_limit*SceneConfig.TILE_HEIGHT;
			if (mainDis>maxAllow) 
			{
				return false;
			}
			return true;
		}
		private function isRoleAvalible(role:SceneRole):Boolean
		{
			if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState&&!role.isHiding&&FightManager.getFightRoleState(role)!=FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT)
			{
				if (!isDistanceOk(role,Mgr.petMgr.getCurPetSkill())) 
				{
					return false;
				}
				return true;
			}
			
			return false;
		}
	
		private function getNearestMonster():int
		{
			var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			var rerlle:SceneRole;
			var currDist:int=int.MAX_VALUE;
			var pet:SceneRole=_machine.owner as SceneRole;
			while (roleList.length)
			{
				var role : SceneRole = roleList.shift();
				if (!isDistanceOk(role,Mgr.petMgr.getCurPetSkill())) 
				{
					continue;
				}
				var monsterData : MonsterData = role.data as MonsterData;
				var modeState : int = FightManager.getFightRoleState(role);
				if (role &&monsterData&& role.usable && monsterData.monsterData.q_monster_type>=1&&monsterData.monsterData.q_monster_type<=3&& !role.stateMachine.isDeadState&&(modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY ||modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND))//if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var dist:int = MathUtil.getDistanceNoSqrt(pet.pos.x,pet.pos.y,role.pos.x,role.pos.y);
					if(dist<currDist)
					{
						rerlle= role;
						currDist=dist;
					}
				}
			}
			if (rerlle) 
			{
				return (rerlle.data as RoleData).id;
			}
			return 0;
		}
	}
}