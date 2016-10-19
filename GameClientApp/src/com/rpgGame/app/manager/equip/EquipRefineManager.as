package com.rpgGame.app.manager.equip
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.sender.EquipmentSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.equip.RefineCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangEquip;
	
	import app.message.EquipmentRefineCostDataProto;
	import app.message.GoodsType;

	/**
	 * 装备强化 
	 * @author Mandragora
	 * 
	 */
	public class EquipRefineManager extends EquipBaseManager
	{
		public function EquipRefineManager()
		{
			super(ItemContainerID.EQUIP_REFINE);
		}
		
		public var costCount : int;
		
		/**
		 * 最大强化等级 
		 */		
		public var autoMaxRefineTimes : int = 10;
		
		public var autoRefine : Boolean = false;
		/**
		 * 强化石 
		 */		
		public var MATERIAL_GROUP : int = 7060;
		
		public var autoRefineing : Boolean = false;
		
		private static var _ins:EquipRefineManager;
		public static function get instance():EquipRefineManager
		{
			if(_ins == null)
			{
				_ins = new EquipRefineManager();
			}
			return _ins;
		}
		
		override protected function init():void
		{
			super.init();
			costCheck.useBackPack = false;
		}
		
		override public function updateItemBind(item:ItemInfo, okfun:Function):Boolean
		{
			if(!item)
				return true;
			if(_isNotShowAlertBind)
				return true;
			var haveBindItem : Boolean = false;
			var items : Array = _gridMap.getValues();
			for each(var itemInfo : ItemInfo in items)
			{
				if(itemInfo && itemInfo.binded)
					haveBindItem = true;
			}
			var alertSet : AlertSetInfo = new AlertSetInfo();
			alertSet.isShowCBox = !_isNotShowAlertBind;
			if(item.binded != haveBindItem)
			{
				if(haveBindItem && !item.binded)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_NOW_MATER_BIND);
				else if(item.binded && !haveBindItem)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_MATERIAL_HAVE_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}
			if(item.binded != costCheck.isUseSilver)
			{
				if(item.binded && !costCheck.isUseSilver)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_MATERIAL_BIND);
				else if(costCheck.isUseSilver && !item.binded)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_SILVER_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}
			return true;
		}
		
		private function onUpdateItemBindClick(gameAlert:GameAlert,fun:Function):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					fun();
					break;
			}
			hideAlertBind(gameAlert.isCheckSelected);
		}
		
		override protected function sendMsg():void
		{
			var items : Array = _gridMap.getValues();
			if(items.length != 1)
				trace("长度不是1 那肯定是出错了。");
			var item : ItemInfo = items[0];
			var main : EquipInfo = mainGrid as EquipInfo;
			if(!item || !main)
				return ;
			var cost : EquipmentRefineCostDataProto = RefineCfgData.getCostDataByRefineAndItem(main.refined_times,item.cfgId,costCount);
			if(!cost || !cost.upgradeData)
			{
				NoticeManager.showNotify(LangEquip.COMMONERROR_1);
				return;
			}
			EquipmentSender.refineEquipment(cost.id,costCheck.getBytes(),main.containerID,main.index,main.cfgId);
		}
		
		override public function getAllItem():Array
		{
			//(之后再改)
			switch(type)
			{
				case EQUIP:
					var back : Array = BackPackManager.instance.getItemsByType(GoodsType.EQUIPMENT);
					var role : Array = RoleEquipmentManager.instance.getAllItem();
					return back.concat(role);
				case MATER:
					return BackPackManager.instance.getItemsByGroup(MATERIAL_GROUP);
			}
			return null;
		}
	}
}