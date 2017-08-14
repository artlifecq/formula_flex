package com.rpgGame.app.manager.ctrl
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	
	import org.game.netCore.data.long;

	/**
	 *记录 和主角发生战斗角色数据
	 * 
	 */		
	public class ControlMainPlayerFight
	{
		/**
		 *我打的角色 
		 */		
		private var _mytargets:Vector.<long>=new Vector.<long>();
		/**
		 *最新打我的 
		 */		
		private var _targetAttackMe:Vector.<long>=new Vector.<long>();
		private var _mainRole:long;
		public function ControlMainPlayerFight()
		{
			_mainRole=MainRoleManager.actorInfo.serverID;
		}
		public function update(msg:ResFightBroadcastMessage):void
		{
			//我打别人
			if (msg.personId.EqualTo(_mainRole)) 
			{
				updateMyTarget(msg.fightTarget,msg.targets);
			}
			//别人打我
			else if (msg.fightTarget.EqualTo(_mainRole)) 
			{
				updateFightMe(msg.fightTarget);
			}
			//别人伤害列表有我
			else  
			{
				var len:int=msg.targets.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (msg.targets[i].EqualTo(_mainRole)) 
					{
						updateFightMe(msg.personId);
						break;
					}
				}
				
			}
		}
		//更新我打的数据
		private function updateMyTarget(tar:long,tars:Vector.<long>):void
		{
			_mytargets.length=0;
			if (tar&&tar.IsZero()==false) 
			{
				_mytargets.push(tar);
			}
			_mytargets=_mytargets.concat(tars);
		}
		private function updateFightMe(tar:long):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(tar.ToGID()) as SceneRole;
			if (!role) 
			{
				return;
			}
			_targetAttackMe.length=0;
			if (SceneCharType.GIRL_PET==role.type&&role.ownerIsMainChar==false) 
			{
				_targetAttackMe.push((role.data as GirlPetData).ownerLongId);
			}
			else if (SceneCharType.MONSTER==role.type&&MonsterData(role.data).ownerId!=0&&role.ownerIsMainChar==false) 
			{
				_targetAttackMe.push(new long((role.data as RoleData).ownerId));
			}
			else
			{
				_targetAttackMe.push(tar);
			}
			
		}
		public function get targets():Vector.<long>
		{
			return _mytargets;
		}

		public function get targetAttackMe():Vector.<long>
		{
			return _targetAttackMe;
		}


	}
}