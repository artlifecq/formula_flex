package com.rpgGame.app.manager.equip
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.sender.EquipmentSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.equip.CombineCfgData;
	import com.rpgGame.coreData.cfg.equip.EquipmentCombineCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangEquip;
	
	import app.message.CombineDataProto;
	import app.message.GoodsType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 装备合成 
	 * @author Mandragora
	 * 
	 */	
	public class EquipCombineManager extends EquipBaseManager
	{
		
		public const minGridConst : int = 5;
		public function EquipCombineManager()
		{
			super(ItemContainerID.EQUIP_COMBINE);
		}
		
		override protected function init():void
		{
			super.init();
		}
		
		private static var _ins:EquipCombineManager;
		public static function get instance():EquipCombineManager
		{
			if(_ins == null)
			{
				_ins = new EquipCombineManager();
			}
			return _ins;
		}
		
		override protected function sendMsg():void
		{
			switch(type)
			{
				case MATER:
					sendMaterMsg();
					break;
				case EQUIP:
					sendEquipMsg();
					break;
				
			}
		}
		
		public function createFun(fun:Function,...pram):Function
		{
			return fun(pram);
		}
		
		private function sendEquipMsg():void
		{
			var item : EquipInfo;
			var grids : Array = _gridMap.getValues();
			var useCount : int = 0;
			for each(item in grids)
			{
				if(item)
					useCount++;
			}
			if(checkEquipCombine && mainGrid && useCount == 4)
				EquipmentSender.combineEquipment(mainGrid.index,getItemInfos(),costCheck.isUseSilver);
		}
		
		public function checkEquipCombine():Boolean
		{
			var item : EquipInfo;
			var grids : Array = _gridMap.getValues();
			for each(item in grids)
			{
				if(!checkEquipMaterialCombine(item))
					return false;
			}
			return true;
		}
		
		public function checkEquipMaterialCombine(item:EquipInfo):Boolean
		{
			var main : EquipInfo = mainGrid as EquipInfo;
			if(!main)
			{
				NoticeManager.showNotify(LangEquip.ERROR_COMBINE_1);
				return false;
			}
			if(!item)
			{
				NoticeManager.showNotify(LangEquip.ERROR_COMBINE_2);
				return false;
			}
			if(item.quality != mainGrid.quality)
			{
				NoticeManager.showNotify(LangEquip.ERROR_COMBINE_3);
				return false;
			}
			if(item.levelStage < (mainGrid as EquipInfo).levelStage)
			{
				NoticeManager.showNotify(LangEquip.ERROR_COMBINE_4,item.levelStage,item.levelStage-EquipmentCombineCfgData.combineLevelStageGap);
				return false;
			}
			return true;
		}
		
		public function getItemInfos():Array
		{
			var result : Array = [];
			var item : ItemInfo;
			var grids : Array = _gridMap.getValues();
			for each(item in grids)
			{
				if(item && item.cfgId)
					result.push(item);
			}
			return result;
		}
		
		public function getMinNum():int
		{
			var items : Array = _gridMap.getValues();
			var minCount : int = int.MAX_VALUE;
			var itemInfo : ItemInfo;
			var hasIndex : int;
			for each(itemInfo in items)
			{
				if(!itemInfo)
					continue;
				hasIndex++;
				if(itemInfo.count < minCount)
					minCount = itemInfo.count;
			}
			
			if(hasIndex == 1)
			{
				return minCount>=minGridConst?Math.floor(minCount / minGridConst):1;//五个格子
			}else
				return minCount;
		}
		
		public function getHasItem():int
		{
			var items : Array = _gridMap.getValues();
			var itemInfo : ItemInfo;
			var hasIndex : int;
			var minCount : int = int.MAX_VALUE;
			for each(itemInfo in items)
			{
				if(!itemInfo)
					continue;
				hasIndex++;
				if(itemInfo.count < minCount)
					minCount = itemInfo.count;
			}
			if(hasIndex == 1)
			{
				if(minCount < minGridConst)
					return minCount;
				else
					return minGridConst;
			}
			return hasIndex;
		}
		
		public function getAutoEquip():Array
		{
			var array : Array = BackPackManager.instance.getItemsByType(GoodsType.EQUIPMENT);
			var equipMap : HashMap = new HashMap();
			var levelMap : HashMap;
			var levelEquips : Array;
			var equip : EquipInfo;
			for each(equip in array)
			{
				if(!equip)
					continue;
				levelMap = equipMap.getValue(equip.quality);
				if(!levelMap)
				{
					levelMap = new HashMap();
					equipMap.add(equip.quality,levelMap);
				}
				levelEquips = levelMap.getValue(equip.levelStage);
				if(!levelEquips)
				{
					levelEquips = [];
					levelMap.add(equip.levelStage,levelEquips);
				}
				levelEquips.push(equip);
			}
			for each(levelMap in equipMap.getValues())
			{
				for each (levelEquips in levelMap.getValues())
				{
					if(levelEquips.length < minGridConst)
						continue;
					return levelEquips.slice(0,minGridConst);
				}
			}
			return [];
		}
		
		private function sendMaterMsg():void
		{
			var items : Array = _gridMap.getValues();
			var minCount : int = getMinNum();
			var useItemInfo : ItemInfo = new ItemInfo();
			var itemInfo : ItemInfo;
			for each(itemInfo in items)
			{
				if(itemInfo)
				{
					useItemInfo.count += itemInfo.count;
					useItemInfo.cfgId = itemInfo.cfgId;
				}
			}
			if(useItemInfo.count <=1)
			{
				NoticeManager.showNotify(LangEquip.COMMONERROR_3);
				return;
			}
			
			var combineProto : CombineDataProto = CombineCfgData.getCombineDataProtoByCost(useItemInfo,getHasItem());
			if(!combineProto)
			{
				NoticeManager.showNotify(LangEquip.COMMONERROR_1);
				return;
			}
			EquipmentSender.combineMaterial(combineProto.id,minCount,combineProto.upgradeData);
		}
		
		/**改变银两的绑定状态**/
		override public function changeSilverBind(isBind:Boolean):void
		{
			if(_isNotShowAlertBind)
			{
				resetSilverCost(isBind);
				return;
			}
			if(itemsIsNull())
			{
				resetSilverCost(isBind);
				return;
			}
			var arr : Array;
			if(type == EQUIP)
			{
				arr = _gridMap.getValues();
				arr.push(mainGrid);
			}else
				arr = _gridMap.getValues();
			var isBindItem : Boolean = false;
			for each(var item : ItemInfo in arr)
			{
				if(item && item.binded)
				{
					isBindItem = true;
					break;
				}
			}
			if(isBindItem !=isBind)
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
		
		/**绑定状态提示,fun 检测完成后的操作**/
		override public function updateItemBind(item : ItemInfo,okfun:Function):Boolean
		{
			if(!item)
				return true;
			if(_isNotShowAlertBind)
				return true;
			var haveBindItem : Boolean = false;
			var arr : Array;
			if(type == EQUIP)
			{
				arr = _gridMap.getValues();
				arr.push(mainGrid);
			}else
				arr = _gridMap.getValues();
			for each(var itemInfo : ItemInfo in arr)
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
	}
}