package com.rpgGame.coreData.cfg.active
{
	public class JiXianAcInfo extends ActivetyInfo
	{
		private var _atNextRank:int=0;
		private var _nowRank:int=0;
		private var _reward:Object;
		public function JiXianAcInfo(uprank:int,nowrank:int,arr:Object)
		{
			_atNextRank = uprank;
			_nowRank = nowrank;
			_reward = arr;
			super();
		}
		
		public function get upRank():int
		{
			return _atNextRank;
		}
		
		public function get nowRank():int
		{
			return _nowRank;
		}
		
		public function get reWard():Object
		{
			return _reward;
		}
	}
}