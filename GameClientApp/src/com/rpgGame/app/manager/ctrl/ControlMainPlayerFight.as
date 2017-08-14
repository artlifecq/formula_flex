package com.rpgGame.app.manager.ctrl
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	
	import flash.utils.getTimer;
	
	import org.game.netCore.data.long;

	/**
	 *记录 和主角发生战斗角色数据
	 * 
	 */		
	public class ControlMainPlayerFight
	{
		/**5s超时**/
		public static const TIME_OUT:int=5000*100;
		/**
		 *我打的角色 
		 */		
		private var _mytargets:Vector.<FightDataVo>=new Vector.<FightDataVo>();
		/**
		 *最新打我的 
		 */		
		private var _targetAttackMe:Vector.<FightDataVo>=new Vector.<FightDataVo>();
		private var _mainRole:long;
		private var _timer:GameTimer;
		public function ControlMainPlayerFight()
		{
			_mainRole=MainRoleManager.actorInfo.serverID;
			_timer=new GameTimer("ControlMainPlayerFight");
			_timer.onUpdate=onTimer;
			_timer.start();
		}
		private var _del:Array=[];
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			if (_mytargets.length>0) 
			{
				checkTime(_mytargets);
			}
			if (_targetAttackMe.length>0) 
			{
				checkTime(_targetAttackMe);
			}
			
		}
		private function checkTime(list:Vector.<FightDataVo>):void
		{
			var len:int=list.length;
			var time:int=getTimer();
			var vo:FightDataVo;
			_del.length=0;
			for (var i:int = 0; i < len; i++) 
			{
				vo=list[i];
				if ((time-vo.updateTime)>=TIME_OUT) 
				{
					_del.push(vo);
					FightDataVo.revert(vo);
				}
			}
			len=_del.length;
			for (var j:int = 0; j < len; j++) 
			{
				list.splice(list.indexOf(_del[j]),1);
			}
		}
		/**
		 *这个存在的意思是，战斗广播没同步战斗信息 ，比如说兵家空放技能打到玩家了
		 * @param info
		 * 
		 */		
		public function addFightInfo(info:AttackResultInfo):void
		{
			//我打的
			if (info.attackerId.EqualTo(_mainRole)) 
			{
				var hgid:Number=info.targetId.ToGID();
				for each (var vo:FightDataVo in _mytargets) 
				{
					//已经有了
					if (vo.targetGid==hgid) 
					{
						return;
					}
				}
				add2List(info.targetId,_mytargets);
			}
			//打我的
			else if (info.targetId.EqualTo(_mainRole)) 
			{
				var attackGid:Number=info.attackerId.ToGID();
				for each (var vo2:FightDataVo in _targetAttackMe) 
				{
					//已经有了
					if (vo2.targetGid==attackGid) 
					{
						return;
					}
				}
				add2List(info.attackerId,_targetAttackMe);
			}
		}
		/**
		 *更新数据 
		 * @param personId 打人者
		 * @param fightTarget 挨打者
		 * @param targets 挨打列表
		 * 
		 */		
		public function update(personId:long,fightTarget:long,targets:Vector.<long>):void
		{
			//我打别人
			if (personId&&personId.EqualTo(_mainRole)) 
			{
				updateMyTarget(fightTarget,targets);
			}
			//别人打我
			else if (fightTarget&&fightTarget.EqualTo(_mainRole)) 
			{
				updateFightMe(personId);
			}
			//别人伤害列表有我
			else  if(targets)
			{
				var len:int=targets.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (targets[i].EqualTo(_mainRole)) 
					{
						updateFightMe(personId);
						break;
					}
				}
				
			}
		}
		//更新我打的数据
		private function updateMyTarget(tar:long,tars:Vector.<long>):void
		{
			for each (var vo:FightDataVo in _mytargets) 
			{
				FightDataVo.revert(vo);
			}
			_mytargets.length=0;
			if (tar&&tar.IsZero()==false) 
			{
				add2List(tar,_mytargets);
				//_mytargets.push(tar);
			}
			for each (var tmp:long in tars) 
			{
				add2List(tmp,_mytargets);
			}
			
			//_mytargets=_mytargets.concat(tars);
		}
		private function add2List(id:long,list:Vector.<FightDataVo>):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(id.ToGID()) as SceneRole;
			if (!role) 
			{
				return;
			}
			if (role.ownerIsMainChar) 
			{
				return;
			}
			var vo:FightDataVo=FightDataVo.gain();
			vo.targetGid=id.ToGID();
			vo.targetId=id;
			vo.type=role.type;
			vo.updateTime=getTimer();
			list.push(vo);
		}
		private function updateFightMe(tar:long):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(tar.ToGID()) as SceneRole;
			if (!role) 
			{
				return;
			}
			for each (var vo:FightDataVo in _targetAttackMe) 
			{
				FightDataVo.revert(vo);
			}
			_targetAttackMe.length=0;
			if (SceneCharType.GIRL_PET==role.type&&role.ownerIsMainChar==false) 
			{
				//_targetAttackMe.push((role.data as GirlPetData).ownerLongId);
				add2List((role.data as GirlPetData).ownerLongId,_targetAttackMe);
			}
			else if (SceneCharType.MONSTER==role.type&&MonsterData(role.data).ownerId!=0&&role.ownerIsMainChar==false) 
			{
				//_targetAttackMe.push(new long((role.data as RoleData).ownerId));
				add2List(new long((role.data as RoleData).ownerId),_targetAttackMe);
			}
			else
			{
				//_targetAttackMe.push(tar);
				add2List(tar,_targetAttackMe);
			}
			
		}
		public function get targets():Vector.<FightDataVo>
		{
			return _mytargets;
		}

		public function get targetAttackMe():Vector.<FightDataVo>
		{
			return _targetAttackMe;
		}
		public function isInFightList(id:long):Boolean
		{
			if (id==null||(_mytargets.length==0&&_targetAttackMe.length==0)) 
			{
				return false;
			}
			var gid:Number=0;
			var vo:FightDataVo;
			for each (vo in _mytargets) 
			{
				if (vo.targetGid==gid) 
				{
					return true;
				}
			}
			for each (vo in _targetAttackMe) 
			{
				if (vo.targetGid==gid) 
				{
					return true;
				}
			}
			return false;
		}
	}
}