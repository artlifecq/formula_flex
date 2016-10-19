package com.rpgGame.coreData.info.friend
{
	import app.message.EnemyProto;

	public class EnemyInfo extends FriendBaseInfo
	{
		public function EnemyInfo()
		{
			super();
		}
		public var winTime : int;
		public var failTime : int;
		
		public function setup(data:EnemyProto):void
		{
			id = data.enemyId.toNumber();
			winTime = data.winTimes;
			failTime = data.failTimes;
		}
	}
}