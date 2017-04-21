package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.netData.backpack.message.ReqClearUpGoodsMessage;
	import com.rpgGame.netData.backpack.message.ReqDelItemMessage;
	import com.rpgGame.netData.backpack.message.ReqDestroyMessage;
	import com.rpgGame.netData.backpack.message.ReqDiscardMessage;
	import com.rpgGame.netData.backpack.message.ReqGetItemsMessage;
	import com.rpgGame.netData.backpack.message.ReqMoveItemMessage;
	import com.rpgGame.netData.backpack.message.ReqSplitItemMessage;
	import com.rpgGame.netData.backpack.message.ReqUseItemMessage;
	import com.rpgGame.netData.equip.message.ReqEquipPolishMessage;
	import com.rpgGame.netData.equip.message.ReqEquipStrengthMessage;
	import com.rpgGame.netData.equip.message.ReqEquipWashMessage;
	import com.rpgGame.netData.equip.message.ReqItemCompositionMessage;
	import com.rpgGame.netData.equip.message.UnwearEquipMessage;
	import com.rpgGame.netData.equip.message.WearEquipMessage;
	import com.rpgGame.netData.store.message.ReqBagToStoreMessage;
	import com.rpgGame.netData.store.message.ReqStoreClearUpMessage;
	import com.rpgGame.netData.store.message.ReqStoreGetItemsMessage;
	import com.rpgGame.netData.store.message.ReqStoreMoveItemMessage;
	import com.rpgGame.netData.store.message.ReqStoreToBagMessage;
	
	import app.message.EquipOperateType;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
	/**
	 *物品请求 
	 * @author dik
	 * 
	 */
	public class ItemSender extends BaseSender
	{
		/**
		 *是否请求过背包 
		 */
		public static var isReqPack:Boolean=false;
		/**
		 *是否请求过仓库 
		 */
		public static var isReqStorage:Boolean=false;
		
		/**
		 *是否请求过Role
		 */
		public static var isReqRole:Boolean=false;
		
		public function ItemSender()
		{
			super();
		}
		
		/**
		 * 获得物品
		 * @param parcelType
		 * 
		 */
		public static function getItemsByType(containerId:int):void
		{
			var msg:*;
			switch(containerId){
				case ItemContainerID.BackPack:
					msg=new ReqGetItemsMessage();
					break;
				case ItemContainerID.Storage:
					msg=new ReqStoreGetItemsMessage();
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		/**
		 * 删除物品
		 * @param parcelType
		 * 
		 */
		public static function deleteItem(containerId:int):void
		{
			var msg:*;
			switch(containerId){
				case ItemContainerID.BackPack:
					msg=new ReqDelItemMessage();
					break;
				default:
					return;
			}
			
			SocketConnection.send(msg);
		}
		
		/**
		 *丢弃 
		 * @param parcelType
		 * @param gridId
		 * 
		 */
		public static function discardItem(itemInfo:ClientItemInfo):void
		{
			var msg:*;
			switch(itemInfo.containerID){
				case ItemContainerID.BackPack:
					msg=new ReqDiscardMessage();
					msg.cellId=itemInfo.itemInfo.gridId;
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		/**
		 * 使用 
		 * @param itemInfo
		 * @param num
		 * 
		 */
		public static function useItem(itemInfo:ClientItemInfo,num:int=-1):void
		{
			var msg:*;
			switch(itemInfo.containerID){
				case ItemContainerID.BackPack:
					msg=new ReqUseItemMessage();
					msg.itemId=itemInfo.itemInfo.itemId;
					msg.num=num;
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		/**
		 * 移动
		 * @param fromItem
		 * @param toItem
		 * @param num
		 * 
		 */
		public static function moveItem(fromItem:GridInfo,toItem:GridInfo=null,num:int=-1):void
		{
			var msg:*;
			switch(fromItem.containerID){
				case ItemContainerID.BackPack:
					msg=new ReqMoveItemMessage();
					msg.itemId=(fromItem.data as ClientItemInfo).itemInfo.itemId;
					msg.toGridId=toItem.index;
					break;
				case ItemContainerID.Storage:
					msg=new ReqStoreMoveItemMessage();
					msg.itemId=(fromItem.data as ClientItemInfo).itemInfo.itemId;
					msg.toGridId=toItem.index;
					msg.num=num;
					break;
				default:
					return;
			}
			
			SocketConnection.send(msg);
		}
		
		/**
		 *整理 
		 * @param parcelType
		 * 
		 */
		public static function clearUpItem(containerId:int):void
		{
			var msg:*;
			switch(containerId){
				case ItemContainerID.BackPack:
					msg=new ReqClearUpGoodsMessage();
					break;
				case ItemContainerID.Storage:
					msg=new ReqStoreClearUpMessage();
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		/**
		 *销毁 
		 * @param parcelType
		 * 
		 */
		public static function destroyItem(containerId:int,gridId:int):void
		{
			
			var msg:*;
			switch(containerId){
				case ItemContainerID.BackPack:
					msg=new ReqDestroyMessage();
					msg.cellId=gridId;
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		/**
		 * 拆分
		 * 
		 */
		public static function reqSplitItem(itemInfo:ClientItemInfo,num:int):void
		{
			var msg:*;
			switch(itemInfo.containerID){
				case ItemContainerID.BackPack:
					msg=new ReqSplitItemMessage();
					msg.itemId=itemInfo.itemInfo.itemId;
					msg.num=num;
					break;
				default:
					return;
			}
			SocketConnection.send(msg);
		}
		
		public static function bagToStore(itemId:long,toCellId:int):void
		{
			var msg:ReqBagToStoreMessage=new ReqBagToStoreMessage();
			msg.itemId=itemId;
			msg.toCellId=toCellId;
			SocketConnection.send(msg);
		}
		
		public static function StoreTobag(itemId:long,toCellId:int):void
		{
			var msg:ReqStoreToBagMessage=new ReqStoreToBagMessage();
			msg.itemId=itemId;
			msg.toCellId=toCellId;
			SocketConnection.send(msg);
		}
		
		/**
		 *穿装备 
		 * @param itemId
		 * 
		 */
		public static function wearEquip(itemId:long):void
		{
			var msg:WearEquipMessage=new WearEquipMessage();
			msg.itemId=itemId;
			SocketConnection.send(msg);
		}
		
		/**
		 *卸装备 
		 * @param itemId
		 * 
		 */
		public static function unwearEquip(itemId:long,gridId:int=-1):void
		{
			var msg:UnwearEquipMessage=new UnwearEquipMessage();
			msg.itemId=itemId;
			msg.cellId=gridId;
			SocketConnection.send(msg);
		}
		
		/**
		 *强化装备 
		 * @param equipId
		 * @param type
		 * @param list
		 * 
		 */
		public static function strengthEquip(equipId:long,type:int,list:Vector.<long>,opaqueType:int):void
		{
			var msg:ReqEquipStrengthMessage=new ReqEquipStrengthMessage();
			msg.equipId=equipId;
			msg.type=type;
			msg.useItemIds=list;
			msg.opaque=opaqueType;
			SocketConnection.send(msg);
		}
		
		/**
		 * 琢磨装备 
		 * @param equipId
		 * @param type
		 * @param list
		 * @param opaqueType
		 * 
		 */
		public static function polishEquip(equipId:long,type:int,list:Vector.<long>,opaqueType:int):void
		{
			var msg:ReqEquipPolishMessage=new ReqEquipPolishMessage();
			msg.equipId=equipId;
			msg.type=type;
			msg.useItemIds=list;
			msg.opaque=opaqueType;
			SocketConnection.send(msg);
		}
		
		/**
		 *洗炼装备 
		 * 
		 */
		public static function washEquip(equipId:long,type:int,lockIndex:int):void
		{
			var msg:ReqEquipWashMessage=new ReqEquipWashMessage();
			msg.equipId=equipId;
			msg.type=type;
			msg.lockIndex=lockIndex;
			msg.opaque=EquipOperateType.WASH_NORMAL;
			SocketConnection.send(msg);
		}
		
		/**
		 * 合成物品请求
		 * @opaqueType 
		 * @recipeid
		 * @num
		 * */
		public static function reqItemCompositionMessage(opaqueType:int,recipeid:int,num:int):void
		{
			var msg:ReqItemCompositionMessage=new ReqItemCompositionMessage();
			msg.opaque=opaqueType;
			msg.recipeId=recipeid;
			msg.num=num;
			SocketConnection.send(msg);
		}
	}
}