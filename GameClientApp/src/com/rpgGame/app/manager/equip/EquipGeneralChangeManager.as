package com.rpgGame.app.manager.equip
{
	import com.rpgGame.app.manager.cost.CostCheckManager;
	import com.rpgGame.app.sender.EquipmentSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.cost.CostCheckTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.cost.CostInfo;
	import com.rpgGame.coreData.info.cost.CostItem;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeGoodsInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import app.message.EquipmentGeneralChangeDataProto;
	import app.message.GoodsType;
	import app.message.Quality;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 改造 
	 * 这里只用检测工具检测了金钱，因为检测机制和其他几个不太一样。
	 * @author Mandragora
	 * 
	 */
	public class EquipGeneralChangeManager extends EquipBaseManager
	{
		public function EquipGeneralChangeManager()
		{
			super(ItemContainerID.EQUIP_GENERAL);
			costCheck.useBackPack = true;
			goodsAndItemMap = new HashMap();
			checkQuality = [Quality.PURPLE];
			checkType = [GoodsType.EQUIPMENT];
		}
		
		private static var _ins:EquipGeneralChangeManager;
		public static function get instance():EquipGeneralChangeManager
		{
			if(_ins == null)
			{
				_ins = new EquipGeneralChangeManager();
			}
			return _ins;
		}
		/**格子和配置对应**/
		public var goodsAndItemMap : HashMap;
		
		public var selectIndex : int = -1;
		
		override protected function sendMsg():void
		{
			var equip : EquipInfo = mainGrid as EquipInfo;
			if(!equip)
				return;
			var equipGeneral : EquipmentGeneralChangeDataProto = goodsAndItemMap.getValue(selectIndex);// = EquipmentGeneralCfgData.getGeneralChangeData(equip.levelStage);
			if(!equipGeneral)
				return;
			EquipmentSender.equipGeneralChange(equip,equipGeneral.id,costCheck.getBytes());
		}
		
		public function selectMaterial(index:int):void
		{
			selectIndex = index;
			var equipGeneral : EquipmentGeneralChangeDataProto = goodsAndItemMap.getValue(selectIndex);// = EquipmentGeneralCfgData.getGeneralChangeData(equip.levelStage);
			if(!equipGeneral)
				return;
			var upgrade:UpgradeProtoInfo = new UpgradeProtoInfo();
			var goods:UpgradeGoodsInfo;
			upgrade.setProto(equipGeneral.upgradeData);
			var i:int=0;
			var len:int=upgrade.goodsInfoVect.length;
			var costItem:CostItem;
			var dragDropItem:DragDropItem;
			var haveCount:int=0;
			var costInfo : CostInfo;
			costCheck.removeCostByType(CostCheckTypeEnum.ITEM_AND_BAND);
			for (; i < len; i++)
			{
				goods=upgrade.goodsInfoVect[i];
				if (!goods)
					continue;
				costInfo = CostCheckManager.createCostInfoForItem(goods.cfgId,i,goods.upgradeGoodsCount);
				costCheck.addCost(costInfo);
			}
		}
		
		/**绑定状态提示,fun 检测完成后的操作**/
		override public function updateItemBind(item : ItemInfo,okfun:Function):Boolean
		{
			if(!item)
				return true;
			if(_isNotShowAlertBind)
				return true;
			var alertSet : AlertSetInfo = new AlertSetInfo();
			alertSet.isShowCBox = !_isNotShowAlertBind;
			if(item.binded && !costCheck.isUseSilver)
			{
				alertSet.setAlertInfo(LangAlertInfo.EQUIP_MATERIAL_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}else if(costCheck.isUseSilver && !item.binded)
			{
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
		
		/**改变银两的绑定状态**/
		override public function changeSilverBind(isBind:Boolean):void
		{
			if(_isNotShowAlertBind || !mainGrid)
			{
				resetSilverCost(isBind);
				return;
			}
			if(itemsIsNull())
			{
				resetSilverCost(isBind);
				return;
			}
			if(mainGrid.binded != isBind)
			{
				var alertSet : AlertSetInfo = new AlertSetInfo();
				alertSet.isShowCBox = !_isNotShowAlertBind;
				if(isBind)
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_SILVER_BIND);
				else
					alertSet.setAlertInfo(LangAlertInfo.EQUIP_SILVER_BIND);
				GameAlert.showAlert(alertSet,changeSilverBindClick);
			}else
				resetSilverCost(isBind);
		}
		
		private function changeSilverBindClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					changeSilverBindComplete();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					changeSilverCancel();
					break;
			}
			hideAlertBind(gameAlert.isCheckSelected);
		}
		
//		override public function getAllItem():Array
//		{
//			//(之后再改)
//			var back : Array = BackPackManager.instance.getItemsByType(GoodsType.EQUIPMENT);
//			var role : Array = RoleEquipmentManager.instance.getAllItem();
//			return back.concat(role);
//		}
		
	}
}