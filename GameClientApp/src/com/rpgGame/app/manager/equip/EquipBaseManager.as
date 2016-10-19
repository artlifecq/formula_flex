package com.rpgGame.app.manager.equip
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.cost.CostCheckManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.EquipEvent;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.cost.CostCheckTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.cost.CostInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import app.message.GoodsType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	public class EquipBaseManager extends GoodsContainerMamager
	{

		/**
		 * 材料
		 */
		public static const MATER:int=1;
		/**
		 * 装备
		 */
		public static const EQUIP:int=0;

		private static var _lockSend:Boolean=false;

		/**
		 * 这里是针对在界面内再有一个分页的情况定的
		 */
		private var _type:int=EQUIP;

		public var costCheck:CostCheckManager;
		/**
		 * 检测后回调的方法
		 */
		public var costCompleteFun:Function;

		private var needSendMsg:Boolean=false;

		protected var _gridMap:HashMap;

		public var mainGrid:ItemInfo;
		/**是否不再显示绑定切换**/
		public var _isNotShowAlertBind : Boolean = false;

		public function EquipBaseManager(containerId:int)
		{
			super(containerId);
			init();
		}

		protected function init():void
		{
			costCheck=new CostCheckManager(checkComplete);
			_gridMap=new HashMap();
		}

		/**
		 * 检测并且回调
		 * @param costComplete
		 *
		 */
		public function checkCost(needSendMsg:Boolean=false):void
		{
			this.needSendMsg=needSendMsg;
			resetGridMap();
			costCheck.checkCost();
		}
		/**绑定状态提示,fun 检测完成后的操作**/
		public function updateItemBind(item : ItemInfo,okfun:Function):Boolean
		{
			return true;
		}
		/**是否有物品存在**/
		public function itemsIsNull():Boolean
		{
			var isNull : Boolean = true;
			var item : ItemInfo;
			for each(item in _gridMap.getValues())
			{
				if(item)
					isNull = false;
			}
			if(mainGrid != null)
				isNull = false;
			return isNull;
		}
		
		protected function hideAlertBind(isSelected:Boolean):void
		{
			_isNotShowAlertBind = isSelected;
		}
		/**改变银两的绑定状态**/
		public function changeSilverBind(isBind:Boolean):void
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
			var arr : Array = _gridMap.getValues();
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
		
		protected function changeSilverCancel():void
		{
			EventManager.dispatchEvent(EquipEvent.EQUIP_SILVER_BIND_CHANGE);
		}
		
		protected function changeSilverBindComplete():void
		{
			resetSilverCost(true);
		}
		
		protected function changeSilverNotBindComplete():void
		{
			resetSilverCost(false);
		}
		/**改变银两的绑定状态**/
		protected function resetSilverCost(isBind:Boolean):void
		{
			var type : int;
			if(costCheck.isUseSilver)
				type = CostCheckTypeEnum.BAND_MONEY;
			else
				type =CostCheckTypeEnum.MONEY;
			var costInfo : CostInfo = costCheck.getCostByType(type);
			var num : int = costInfo?costInfo.costMoneyNum:0;
			costCheck.removeCostByType(type);
			costCheck.isUseSilver = isBind;
			setSilverCost(num);
		}
		
		public function setSilverCost(num:Number):void
		{
			var cost : CostInfo = new CostInfo();
			if(costCheck.isUseSilver)
				cost.type = CostCheckTypeEnum.BAND_MONEY;
			else
				cost.type = CostCheckTypeEnum.MONEY;
			cost.costMoneyNum = num;
			costCheck.addCost(cost);
		}

		/**
		 * 刷新物品
		 *
		 */
		private function resetGridMap():void
		{
			var i:uint=0;
			var vs:Array=_gridMap.getValues()
			var len:uint=vs.length;
			var itemInfo:ItemInfo;
			costCheck.clearHaveItem();
			var costInfo : CostInfo;
			for (; i < len; i++)
			{
				itemInfo=vs[i];
				if (!itemInfo)
					continue;
				costInfo = CostCheckManager.createCostInfoForItem(itemInfo.cfgId,itemInfo.index,itemInfo.count);
				costCheck.setHaveItem(costInfo);
			}
		}

		public function updateGridData(index:int, itemInfo:ItemInfo):void
		{
			_gridMap.add(index, itemInfo);
		}

		private function checkComplete(isPass:Boolean, cost:CostInfo=null, lackNum:int=0):void
		{
			if (isPass)
			{
				//验证通过，可以向服务器派发成功消息
				costCompleteFun && costCompleteFun();
				if (needSendMsg)
					seendMsgToService();
			}
			else
			{
				costCompleteFun && costCompleteFun(costCheck.replaceCostType(cost));
			}
		}

		private function seendMsgToService():void
		{
			if(lockSend)
			{
				NoticeManager.showNotify("消息发送过于频繁");
				return;
			}
			lockSend=true;
			sendMsg();
		}

		/**
		 * 验证通过向服务器发送消息的部分
		 *
		 */
		protected function sendMsg():void
		{

		}

		override public function isUnlock(index:int):Boolean
		{
			return false;
		}

		public function get type():int
		{
			return _type;
		}

		/**
		 * 如果类型被重设之后需要刷新一下数据
		 */
		public function set type(value:int):void
		{
			_type=value;
			if(_type == MATER)
				GoodsContainerMamager.getMrg(containerId).checkType = [GoodsType.MATERIAL];
			else if(_type == EQUIP)
				GoodsContainerMamager.getMrg(containerId).checkType = [GoodsType.EQUIPMENT];
//			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, this.containerId);
		}

		public static function get lockSend():Boolean
		{
			return _lockSend;
		}

		public static function set lockSend(v:Boolean):void
		{
			trace("设置lock send " + v);
			TweenLite.killDelayedCallsTo(onSetUnLock);
			_lockSend=v;
			if(v)
				TweenLite.delayedCall(2,onSetUnLock);
		}
		
		public static function onSetUnLock():void
		{
			lockSend = false;
		}
	}
}
