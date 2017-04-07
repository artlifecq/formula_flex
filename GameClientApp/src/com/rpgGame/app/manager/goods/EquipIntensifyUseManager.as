package com.rpgGame.app.manager.goods
{
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.netData.backpack.bean.ItemInfo;

	/**
	 *装备强化消耗数据
	 *@author dik
	 *2017-4-6下午9:16:09
	 */
	public class EquipIntensifyUseManager extends GoodsContainerMamager
	{
		public function EquipIntensifyUseManager()
		{
			super(ItemContainerID.INTENSIFY_USE);
		}
		private static var _ins:EquipIntensifyUseManager;
		public static function get instance():EquipIntensifyUseManager
		{
			if(_ins == null)
			{
				_ins = new EquipIntensifyUseManager();
			}
			return _ins;
		}
		
		override public function setItemsInfo(cellnum:int,items:Vector.<ItemInfo>):void
		{
			var newList:Vector.<ItemInfo>=new Vector.<ItemInfo>();
			for(var i:int=0; i<items.length; i++)
			{
				var cfg:Q_item =  ItemConfig.getQItemByID(items[i].itemModelId);
				if(isEquip(cfg)){
					newList.push(items[i]);
				}
			}
			
			super.setItemsInfo(newList.length,newList);
		}
		
		override public function addItem(item:ItemInfo):void
		{
			var cfg:Q_item =  ItemConfig.getQItemByID(item.itemModelId);
			if(isEquip(cfg)){
				super.addItem(item);
			}
		}
		
		override public function changItem(item:ItemInfo,type:int=4):void
		{
			var cfg:Q_item =  ItemConfig.getQItemByID(item.itemModelId);
			if(isEquip(cfg)){
				super.changItem(item,type);
			}
		}
	}
}