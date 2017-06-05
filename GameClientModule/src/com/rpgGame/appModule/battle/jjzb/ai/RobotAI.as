package com.rpgGame.appModule.battle.jjzb.ai
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display2D.AttackFace;
	import com.rpgGame.app.fight.spell.SpellResultTweenUtil;
	import com.rpgGame.app.fight.spell.ui.ReleaseSpellUIHelper;
	import com.rpgGame.app.fight.spell.ui.ReleaseSpellUIInfo;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.action.BlinkStateReference;
	import com.rpgGame.app.state.role.action.RunStateReference;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SpellBlinkType;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import gs.TweenMax;
	
	import org.mokylin.skin.app.zhanchang.Head_Role_Left;
	import org.mokylin.skin.app.zhanchang.Head__Role_Right;
	import org.mokylin.skin.app.zhanchang.ZhangCheng_Scene;
	
	import starling.display.DisplayObjectContainer;

	public class RobotAI
	{
		private var _skin:ZhangCheng_Scene;
		private var _winer:RoleModelShow;
		private var _loser:RoleModelShow;
		private var _winerRole:SceneRole;
		private var _callBack:Function;
		private var _skillDic:Dictionary=new Dictionary();
		private var _winerActionArr:Array;
		private var _loserActionArr:Array;
		private var _round:int;
		private var _endCount:int=0;
		private var _forceOver:Boolean=true;
		private var _contianer:DisplayObjectContainer;
		private var _hpLeft:SkinnableContainer;
		private var _hpRight:SkinnableContainer;
		private var _maxLeftHp:int;
		private var _maxRightHp:int;
		private var _nowLeftHp:int;
		private var _nowRightHp:int;
		private var _initX:int;
		private var _initW:int;
		private var _winerIsLeft:Boolean;
		public function RobotAI(skin:ZhangCheng_Scene,call:Function,con:DisplayObjectContainer)
		{
			_skin=skin;
			_callBack=call;
			_contianer=con;
			_hpLeft=(skin.skinLeft.skin as Head_Role_Left).role_xuecao;
			_hpRight=(skin.skinRight.skin as Head__Role_Right).role_xuecao;
			_initX=_hpRight.x;
			_initW=_hpRight.width;
		}
		public function stop():void
		{
			_forceOver=true;
		}
		private function getSide(role:RoleModelShow):int
		{
			if (role==_winer) 
			{
				if (_winerIsLeft) 
				{
					return 0;
				}
				else
				{
					return 1;
				}
			}
			else
			{
				if (_winerIsLeft) 
				{
					return 1
				}
				else
				{
					return 0;
				}
			}
		}
		public function setLeftPlayer(winer:RoleModelShow,loser:RoleModelShow,winHp:int,loseHp:int,round:int,isLeft:Boolean):void
		{
			_forceOver=false;
			_winerIsLeft=isLeft;
			_round=round;
			_winer=winer;
			_loser=loser;
			_winerRole=winer.avatar.curRole;
			_hpLeft.scaleX=1;
			_hpRight.scaleX=1;
			_hpRight.x=_initX;
			winHp=Math.max(1,winHp);
			loseHp=Math.max(1,loseHp);
			if (isLeft) 
			{
				_maxLeftHp=winHp;
				_maxRightHp=loseHp;
				_nowLeftHp=winHp;
				_nowRightHp=loseHp;
			}
			else
			{
				_maxLeftHp=loseHp;
				_maxRightHp=winHp;
				_nowLeftHp=loseHp;
				_nowRightHp=winHp;
			}
			setBlood(winHp,loseHp,round);
			_endCount=0;
			startRun();
		}
		private function startRun():void
		{
			startMove(_winer,_loser.data.job);
			startMove(_loser,_winer.data.job);
//			var runRef : RunStateReference = (_winer.avatar.curRole as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
//			runRef.setParams(0.5,0);
//			_winer.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_RUN,runRef);
//			TweenMax.to(_winer,1,{x:_skin.uiEnd1.x,y:_skin.uiEnd1.y,onComplete :onMoveComplete,onCompleteParams:[_winer]});
//			runRef= (_loser.avatar.curRole as SceneRole).stateMachine.getReference(RunStateReference) as RunStateReference;
//			runRef.setParams(0.5,0);
//			_loser.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_RUN,runRef);
//			TweenMax.to(_loser,1,{x:_skin.uiEnd2.x,y:_skin.uiEnd2.y,onComplete :onMoveComplete,onCompleteParams:[_loser]})
		}
		private function startMove(roleShow:RoleModelShow,otherJob:int):void
		{
			//兵家要滚动
			if (roleShow.data.job==JobEnum.ROLE_1_TYPE) 
			{
				var actionRef : BlinkStateReference = roleShow.avatar.curRole.stateMachine.getReference(BlinkStateReference) as BlinkStateReference;
				actionRef.setParams("dodge", false, 1,0,0,0);
				roleShow.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_BLINK, actionRef, true);
				var tarPos:UIAsset=null;
				//在左边
				var isFar:Boolean=false;
				var side:int=getSide(roleShow);
				if (side==0) 
				{
					if (otherJob!=JobEnum.ROLE_1_TYPE) 
					{
						tarPos=_skin.uiEnd2;
						isFar=true;
					}
					else
					{
						tarPos=_skin.uiEnd1;
					}
				}
				//右边
				else
				{
					if (otherJob!=JobEnum.ROLE_1_TYPE) 
					{
						tarPos=_skin.uiEnd1;
						isFar=true;
					}
					else
					{
						tarPos=_skin.uiEnd2;
					}
				}
				TweenMax.to(roleShow,isFar?1:0.8,{x:tarPos.x,y:tarPos.y,onComplete :onMoveComplete,onCompleteParams:[roleShow]});
			}
			//其他的开打
			else
			{
				onMoveComplete(roleShow);
			}
		}
		private function onMoveComplete(role:RoleModelShow):void
		{
			role.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
			if (role.avatar.curRole) 
			{
				relaseSkill(role.avatar.curRole);
			}
		}
		private function setOverState():void
		{
			_winer.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
			_loser.avatar.curRole.stateMachine.transition(RoleStateType.ACTION_DEATH);
			if (_callBack) 
			{
				_callBack();
			}
		}
		private function relaseSkill(role:SceneRole):void
		{
			
			if (_forceOver) 
			{
				fightComplete(role);
				return;
			}
			var skillAct:Array=_skillDic[role];
			if (skillAct.length>0) 
			{
				
				var att:AttackResult=skillAct.shift();
				trace((role==_winerRole?"赢家":"输家")+"开始攻击 "+att.skillId+" 伤害："+att.damage);
				var spellInfo:ReleaseSpellUIInfo=ReleaseSpellUIInfo.setReleaseInfo(att.skillId,role,att.damage,releaseSkillComplete,showSkillHurt);
				ReleaseSpellUIHelper.releaseSpell(spellInfo);
				
			}
			else
			{
				//赢家打完了
				if (role==_winerRole) 
				{
					_forceOver=true;
					setOverState();
				}
				//输家先打完，赢家还没打完,输家继续打
				else
				{
					trace("输家补充技能");
					var skillCtrl:ControlAutoFightSelectSkill=new ControlAutoFightSelectSkill(_loser.avatar.curRole,_loser.data.job);
					var arr:Array=getRandomHpList(100,_round,skillCtrl);
					_skillDic[role]=arr;
					relaseSkill(role);
				}
//				fightComplete(role);
			}
		}
		private function fightComplete(role:SceneRole):void
		{
			setOverState();
		}
		private function releaseSkillComplete(...arg):void
		{
			relaseSkill(arg[0]);
		}
		/**
		 *攻击方 
		 * @param arg
		 * 
		 */		
		private function showSkillHurt(...arg):void
		{
			
			var hurter:RoleModelShow=getOtherShow(arg[0]);
		//	var caster:RoleModelShow=getOtherShow(hurter.avatar.curRole);
			//攻击方打的血量
			var hurt:int=arg[1];
			
			var attackFace : AttackFace = AttackFace.createAttackFace("", FightFaceHelper.NUMBER_PC_HPSUB, -hurt, null, null,null);
			attackFace.touchAcross = true;
			attackFace.touchable = false;
			attackFace.touchGroup = false;
			
			
			attackFace.x=hurter.x;
			attackFace.y=hurter.y-hurter.height/2;
			
			_contianer.addChild(attackFace);
			
			var start:Point=new Point(hurter.x+hurter.width/2,hurter.y-hurter.height/2);
			//var e
			SpellResultTweenUtil.TweenDiaoXue(attackFace,start,start,FightFaceHelper.onAtackFaceComplete);
			var side:int=getSide(hurter);
			//挨打方是赢家
			if (0==side) 
			{
				_nowLeftHp=_nowLeftHp-hurt;
				_hpLeft.scaleX=_nowLeftHp/_maxLeftHp;
			}
			else
			{
				_nowRightHp=_nowRightHp-hurt;
				_hpRight.scaleX=_nowRightHp/_maxRightHp;
				_hpRight.x=_initX+_initW*(1-_nowRightHp/_maxRightHp);
			}
			trace((hurter.avatar.curRole==_winerRole?"赢家":"输家")+"受到攻击  伤害："+hurt);
		}
		private function getOtherShow(role:SceneRole):RoleModelShow
		{
			if (role==_winer.avatar.curRole) 
			{
				return _loser;
			}
			else
			{
				return _winer;
			}
		}
		private function getWinBloodLeftPer(round:int):Number
		{
			switch(round)
			{
				case 1:
				{
					return 1;
					break;
				}
				case 2:
				{
					return 0.8;
					break;
				}
				case 3:
				{
					return 0.5;
					break;
				}
				case 4:
				{
					return 0.3;
					break;
				}
				default:
				{
					return 0.1;
					break;
				}
			}
		}
		private function setBlood(winHp:int,loseHp:int,round:int):void
		{
			
			
			var winHpLeftPer:Number=getWinBloodLeftPer(round);
			var winHpLose:int=winHp*(1-winHpLeftPer);
			var loseHpLose:int=loseHp;
			var skillCtrl:ControlAutoFightSelectSkill=new ControlAutoFightSelectSkill(_winer.avatar.curRole,_winer.data.job);
			//赢家打的技能伤害就是输家的血量
			_winerActionArr=getRandomHpList(loseHpLose,_round,skillCtrl);
			_skillDic[_winer.avatar.curRole]=_winerActionArr;
			var str:String="";
			for (var i:int = 0; i < _winerActionArr.length; i++) 
			{
				str+=JSONUtil.encode(_winerActionArr[i])+" ";
			}
			trace("win skill:"+str);
			skillCtrl=new ControlAutoFightSelectSkill(_loser.avatar.curRole,_loser.data.job);
			_loserActionArr=getRandomHpList(winHpLose,_round*2,skillCtrl);
			_skillDic[_loser.avatar.curRole]=_loserActionArr;
			str="";
			for (var i:int = 0; i < _loserActionArr.length; i++) 
			{
				str+=JSONUtil.encode(_loserActionArr[i])+" ";
			}
			trace("lose skill:"+str);
		}
		private function getRandomHpList(hp:int,round:int,mySkill:ControlAutoFightSelectSkill):Array
		{
			var ret:Array=[];
			var leftHp:int=hp;
			var time:int=round-1;
			var val:int;
			var tmp:int;
			var obj:AttackResult;
			for (var i:int = 0; i < time; i++) 
			{
				obj=new AttackResult();
				tmp=leftHp*Math.random();
				obj.damage=tmp;
				obj.skillId=mySkill.getNextSkillId();
				ret.push(obj);
				val+=tmp;
				leftHp-=tmp;
			}
			obj=new AttackResult();
			obj.damage=leftHp;
			obj.skillId=mySkill.getNextSkillId();
			ret.push(obj);
			return ret;
		}
		public function clear():void
		{
			if (_winer) 
			{
				TweenMax.killTweensOf(_winer);
				TweenMax.killTweensOf(_loser);
				_endCount=0;
				delete _skillDic[_winer.avatar.curRole];
				delete _skillDic[_loser.avatar.curRole];
				_winer=null;
				_loser=null;
				_winerRole=null;
				_winerActionArr=null;
				_loserActionArr=null;
				_round=0;
				_forceOver=true;
			}
			
		}

		public function get forceOver():Boolean
		{
			return _forceOver;
		}

	}
}
class AttackResult
{
	public var skillId:int;
	public var damage:int;
}