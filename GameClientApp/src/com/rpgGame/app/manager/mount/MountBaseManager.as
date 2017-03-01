package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.cost.CostCheckManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.EquipEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.cost.CostCheckTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.cost.CostInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	public class MountBaseManager extends GoodsContainerMamager
	{
		/** 材料 **/
		public static const MATER:int=1;
		/** 装备 **/
		public static const EQUIP:int=0;
		/** 是否锁定 **/
		private static var _lockSend:Boolean=false;
		/** 这里是针对在界面内再有一个分页的情况定的 **/
		private var _type:int=EQUIP;
		/** 消耗检测的工具 **/
		public var costCheck:CostCheckManager;
		/** 检测后回调的方法 */
		public var costCompleteFun:Function;
		/** 是否需要发送消息 **/
		private var needSendMsg:Boolean=false;
		/** 容器 **/
		protected var _gridMap:HashMap;
		/** 中心格子数据 **/
		public var mainGrid:ClientItemInfo;
		/**是否不再显示绑定切换**/
		public var _isNotShowAlertBind : Boolean = false;
		
		public function MountBaseManager(containerID:int)
		{
			super(containerID);
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
		
		/**
		 * 绑定状态提示,fun 检测完成后的操作 
		 * @param item
		 * @param okfun
		 * @return 
		 * 
		 */		
		public function updateItemBind(item : ClientItemInfo,okfun:Function):Boolean
		{
			return true;
		}
		
		/**
		 * 是否有物品存在 
		 * @return 
		 * 
		 */		
		public function itemsIsNull():Boolean
		{
			var isNull : Boolean = true;
			var item : ClientItemInfo;
			for each(item in _gridMap.getValues())
			{
				if(item)
					isNull = false;
			}
			if(mainGrid != null)
				isNull = false;
			return isNull;
		}
		
		/**
		 * 是否不再显示绑定切换 
		 * @param isSelected
		 * 
		 */		
		protected function hideAlertBind(isSelected:Boolean):void
		{
			_isNotShowAlertBind = isSelected;
		}
		
		/**
		 * 改变银两的绑定状态 
		 * @param isBind
		 * 
		 */		
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
			for each(var item : ClientItemInfo in arr)
			{
				if(item && item.binded)
				{
					isBindItem = true;
					break;
				}
			}
			if(isBindItem !=isBind)
			{
				var alertSet : AlertSetInfo;
				if(isBind)
				{
					alertSet = new AlertSetInfo(LangAlertInfo.EQUIP_SILVER_BIND);
					alertSet.isShowCBox = !_isNotShowAlertBind;
					GameAlert.showAlert(alertSet,changeSilverBindClick,isBind);
				}
				else
				{
					alertSet = new AlertSetInfo(LangAlertInfo.EQUIP_MATERIAL_BIND);
					alertSet.isShowCBox = !_isNotShowAlertBind;
					GameAlert.showAlert(alertSet,changeSilverBindClick,isBind);
				}
			}else
				resetSilverCost(isBind);
		}
		
		private function changeSilverBindClick(gameAlert:GameAlert,isBind:Boolean):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					if(isBind == true)
						changeSilverBindComplete();
					else
						changeSilverNotBindComplete();
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
		
		/**
		 * 改变银两的绑定状态 
		 * @param isBind
		 * 
		 */		
		protected function resetSilverCost(isBind:Boolean):void
		{
			var type : int;
			if(costCheck.isUseSilver)
				type = CostCheckTypeEnum.MONEY;
			else
				type =CostCheckTypeEnum.BAND_MONEY;
			var costInfo : CostInfo = costCheck.getCostByType(type);
			var num : int = costInfo?costInfo.costMoneyNum:0;
			costCheck.removeCostByType(type);
			costCheck.isUseSilver = !isBind;
			setSilverCost(num);
		}
		
		public function setSilverCost(num:Number):void
		{
			var cost : CostInfo = new CostInfo();
			if(costCheck.isUseSilver)
				cost.type = CostCheckTypeEnum.MONEY;
			else
				cost.type = CostCheckTypeEnum.BAND_MONEY;
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
			var itemInfo:ClientItemInfo;
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
		
		/**
		 * 更新grids数据 
		 * @param index
		 * @param itemInfo
		 * 
		 */		
		public function updateGridData(index:int, itemInfo:ClientItemInfo):void
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
		
		/**
		 * 是否解锁 
		 * @param index
		 * @return 
		 * 
		 */		
		override public function isUnlock(index:int):Boolean
		{
			return false;
		}
		
		/**
		 * 获取解锁grids的物品数据 
		 * @param index
		 * @return 
		 * 
		 */		
//		override public function getUnlockInfo(index:int):ItemGridUnlockInfo
//		{
//			return null;
//		}
		
		
		public function get type():int
		{
			return _type;
		}
		
		/**
		 * 如果类型被重设之后需要刷新一下数据
		 * @param value
		 * 
		 */		
		public function set type(value:int):void
		{
			_type=value;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, this.containerId);
		}
		
		/**
		 * 是否锁定 
		 * @return 
		 * 
		 */		
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
		
		/**
		 * 设置解锁 
		 * 
		 */		
		public static function onSetUnLock():void
		{
			lockSend = false;
		}
	}
}