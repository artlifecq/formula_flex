package com.rpgGame.app.manager.equip
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.sender.EquipmentSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.equip.EquipmentRefineDestoryCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.equip.EquipmentDestoryInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangEquip;
	
	import app.message.GoodsType;
	import app.message.Quality;

	public class EquipDestoryManager extends EquipBaseManager
	{
		public function EquipDestoryManager()
		{
			super(ItemContainerID.EQUIP_DESTORY);
		}
		
		override protected function init():void
		{
			super.init();
			defaultCol = 8;
			defaultRow = 8;
		}
		
		private static var _ins:EquipDestoryManager;
		public static function get instance():EquipDestoryManager
		{
			if(_ins == null)
			{
				_ins = new EquipDestoryManager();
			}
			return _ins;
		}
		
		override protected function sendMsg():void
		{
			if(!mainGrid)
			{
				NoticeManager.showNotify(LangEquip.DESTORY_FAIL_4);
				return;
			}
			
			var equip:EquipInfo=mainGrid as EquipInfo;
			var equipDestory:EquipmentDestoryInfo=EquipmentRefineDestoryCfgData.getEquipmentDestoryItemInfos(equip);
			if(!equipDestory)
			{
				NoticeManager.showNotify(LangEquip.DESTORY_FAIL_5);
				return;
			}
			
			EquipmentSender.destoryEquipment(mainGrid.containerID,mainGrid.index,mainGrid.cfgId,costCheck.isUseSilver);
		}
		
		/**绑定状态提示,fun 检测完成后的操作**/
		override public function updateItemBind(item : ItemInfo,okfun:Function):Boolean
		{
			if(!item)
				return true;
			if(_isNotShowAlertBind)
				return true;
			
			var alertSet : AlertSetInfo= new AlertSetInfo();
			alertSet.isShowCBox = !_isNotShowAlertBind;
			if(item.binded && !costCheck.isUseSilver)
			{
				alertSet.setAlertInfo(LangAlertInfo.EQUIP_DESTORY_EQUIP_BIND);
				GameAlert.showAlert(alertSet,onUpdateItemBindClick,okfun);
				return false;
			}else if(costCheck.isUseSilver && !item.binded)
			{
				alertSet.setAlertInfo(LangAlertInfo.EQUIP_DESTORY_EQUIP_NOT_BIND);
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
		
		override public function getAllItem():Array
		{
			//(之后再改)
			var result : Array = [];
			var back : Array = BackPackManager.instance.getItemsByType(GoodsType.EQUIPMENT);
			var role : Array = RoleEquipmentManager.instance.getAllItem();
			var data : Array =  back.concat(role);
			for each(var item : EquipInfo in data)
			{
				if(!item)
					continue;
				if(item.quality >= Quality.PURPLE || item.refined_times > 0)
					result.push(item);
			}
			return result;
		}
		
	}
}