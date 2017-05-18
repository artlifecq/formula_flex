package com.rpgGame.app.manager
{
	public class VipManager
	{
		public static var ins:VipManager=new VipManager();
		
		private var _vipLv:int;
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

	}
}