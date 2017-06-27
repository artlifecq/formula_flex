package com.rpgGame.app.manager
{
	public class VipManager
	{
		public static var ins:VipManager=new VipManager();
		
		private var _vipLv:int;
		private var _endTime:int;
		public function VipManager()
		{
		}

		public function get vipLv():int
		{
			return _vipLv;
		}

		public function set vipLv(value:int):void
		{
			_vipLv = value;
		}
		public function iWantBecomeVip():void
		{
			
		}

		/**
		 *过期时间，秒 
		 */
		public function get endTime():int
		{
			return _endTime;
		}


	}
}