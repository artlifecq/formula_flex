package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	

	/**
	 * 仓库物品管理 
	 * @author wewell@163.com
	 * 
	 */	
	public class StorageManager extends GoodsContainerMamager
	{
		public var PAGE_SIZE:int;
		private var isLoaded:Boolean;
		private var _hasStorage:Boolean;
		
		public function StorageManager()
		{
			super(ItemContainerID.Storage)
			defaultCol = 8;
			defaultRow = 8;
			PAGE_SIZE = defaultCol * defaultRow;
		}
		
		private static var _ins:StorageManager;
		public static function get instance():StorageManager
		{
			if(_ins == null)
			{
				_ins = new StorageManager();
			}
			return _ins;
		}
		
		public function setHasStorage(b:Boolean):void
		{
			_hasStorage = b;
		}
		
		public function get hasStorage():Boolean
		{
			return _hasStorage;
		}
		
		public function checkOpenStorage():void
		{
			if(isLoaded)
			{
				AppManager.showApp(AppConstant.STORAGE_PANEL);
			}else{
				loadStorageData();
			}
		}
		
		private function loadStorageData():void
		{
			if(!isLoaded)
			{
				ItemSender.reqDepotStorageGetData();
				isLoaded = true;
			}
		}
		
	}
}