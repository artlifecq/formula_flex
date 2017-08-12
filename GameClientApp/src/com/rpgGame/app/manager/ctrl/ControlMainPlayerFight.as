package com.rpgGame.app.manager.ctrl
{
	import com.rpgGame.app.manager.role.MainRoleManager;
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
			_targetAttackMe.length=0;
			_targetAttackMe.push(tar);
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