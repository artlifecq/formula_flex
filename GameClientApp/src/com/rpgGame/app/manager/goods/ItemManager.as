package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	
	import app.message.GoodsType;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *所有的物品管理总类（以前的物品管理太分散类。。。）
	 *@author dik
	 *2017-4-7上午11:15:15
	 */
	public class ItemManager
	{
		private static var isGeting:Boolean;
		private static var _isGetBackEquip:Boolean;
		private static var _initComs:Vector.<Function>=new Vector.<Function>();
		public function ItemManager()
		{
		}

		/**
		 *获取背包和装备 
		 * @param complete
		 * 
		 */
		public static function getBackEquip(complete:Function):void
		{
			if(_isGetBackEquip){
				complete();
				return;
			}
			
			if(isGeting){
				return;
			}
			_initComs.push(complete);
			isGeting=true;
			if(!ItemSender.isReqPack){
				EventManager.addEvent(ItemEvent.ITEM_INIT,initPackDatas);
				ItemSender.getItemsByType(ItemContainerID.BackPack);
			}else{
				initPackDatas();
			}
		}
		
		private static function initPackDatas(containerId:int=ItemContainerID.BackPack):void
		{
			if(containerId!=ItemContainerID.BackPack){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initPackDatas);
			if(!ItemSender.isReqRole){
				EventManager.addEvent(ItemEvent.ITEM_INIT,initEquipDatas);
			}else{
				initEquipDatas();
			}
		}
		
		private static function initEquipDatas(containerId:int=ItemContainerID.Role):void 
		{
			if(containerId!=ItemContainerID.Role){
				return;
			}
			EventManager.removeEvent(ItemEvent.ITEM_INIT,initEquipDatas);
			isGeting=false;
			_isGetBackEquip=true;
			
			for each(var f:Function in _initComs){
				f();
			}
			_initComs.length=0;
		}
		
		public static function getAllEquipDatas():Array
		{
			var roleDatas:Array=RoleEquipmentManager.instance.getAllItem();
			BackPackManager.instance.checkType=[GoodsType.EQUIPMENT];
			var backDatas:Array=BackPackManager.instance.getAllItem();
			var allDatas:Array=roleDatas.concat(backDatas);
			var i:int=0
			while(i<allDatas.length){
				if(!allDatas[i]){
					allDatas.splice(i,1);
					continue;
				}
				i++;
			}
			return allDatas;
		}
	}
}