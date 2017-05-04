package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.info.item.ClientItemInfo;

	public class BuessesItemInfo
	{
		private var _item:ClientItemInfo;

		public function get item():ClientItemInfo
		{
			return _item;
		}

		public function set item(value:ClientItemInfo):void
		{
			_item = value;
		}

		public function BuessesItemInfo():void
		{
		}
		
		
		private var _useMoneyType:int;

		public function get useMoneyType():int
		{
			return _useMoneyType;
		}

		public function set useMoneyType(value:int):void
		{
			_useMoneyType = value;
		}
		
		public function  get playerHaveMoney():int
		{
			return MainRoleManager.actorInfo.totalStat.getResData(_useMoneyType);
		}
		
		public function get price():int
		{
			return 5;
		}
		
		public function getMaxNum():int
		{
			return Math.floor(playerHaveMoney/price);
		}
	}
}