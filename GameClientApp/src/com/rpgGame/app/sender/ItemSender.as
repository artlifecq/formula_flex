package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.StorageManager;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.netData.backpack.message.ReqCellTimeQueryMessage;
	import com.rpgGame.netData.backpack.message.ReqClearUpGoodsMessage;
	import com.rpgGame.netData.backpack.message.ReqDelItemMessage;
	import com.rpgGame.netData.backpack.message.ReqDestroyMessage;
	import com.rpgGame.netData.backpack.message.ReqDiscardMessage;
	import com.rpgGame.netData.backpack.message.ReqGetItemsMessage;
	import com.rpgGame.netData.backpack.message.ReqMoveItemMessage;
	import com.rpgGame.netData.backpack.message.ReqOpenCellMessage;
	import com.rpgGame.netData.backpack.message.ReqOpenTimeCellMessage;
	import com.rpgGame.netData.backpack.message.ReqSplitItemMessage;
	import com.rpgGame.netData.backpack.message.ReqUseItemMessage;
	import com.rpgGame.netData.equip.message.ReqEquipInheritMessage;
	import com.rpgGame.netData.equip.message.ReqEquipPolisgOneKeyMessage;
	import com.rpgGame.netData.equip.message.ReqEquipPolishMessage;
	import com.rpgGame.netData.equip.message.ReqEquipStrengthMessage;
	import com.rpgGame.netData.equip.message.ReqEquipStrengthOneKeyMessage;
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
					if(toItem.containerID==ItemContainerID.BackPack){
						msg=new ReqMoveItemMessage();
						msg.itemId=(fromItem.data as ClientItemInfo).itemInfo.itemId;
						msg.toGridId=toItem.index;
					}
					else if(toItem.containerID==ItemContainerID.Storage){
						var info:ClientItemInfo=fromItem.data as ClientItemInfo;
						ItemSender.bagToStore(info.itemInfo.itemId,toItem.index);
						return;
					}
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
			if(StorageManager.instance.useGridLen()>=StorageManager.instance.hasOpenCount){
				NoticeManager.showNotifyById(12007);
				return;
			}
			
			var msg:ReqBagToStoreMessage=new ReqBagToStoreMessage();
			msg.itemId=itemId;
			msg.toCellId=toCellId;
			SocketConnection.send(msg);
		}
		
		public static function StoreTobag(itemId:long,toCellId:int):void
		{
			if(BackPackManager.instance.useGridLen()>=BackPackManager.instance.hasOpenCount){
				NoticeManager.showNotifyById(12008);
				return;
			}
			
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
		 *一键强化装备 
		 * @param equipId 装备ID
		 * @param type 装备来源
		 * @param lv 装备阶数
		 * @param quality 装备品质
		 */
		public static function strengthAllEquip(opaqueType:int,equipId:long,type:int,lv:int,quality:int):void
		{
			var msg:ReqEquipStrengthOneKeyMessage=new ReqEquipStrengthOneKeyMessage();
			msg.opaque=opaqueType;
			msg.equipId=equipId;
			msg.type=type;
			msg.order=lv;
			msg.quality=quality;
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
		 *一键琢磨装备 
		 * @param equipId 装备ID
		 * @param type 装备来源
		 * @param lv 装备阶数
		 * @param quality 装备品质
		 */
		public static function polishAllEquip(opaqueType:int,equipId:long,type:int,lv:int,quality:int):void
		{
			var msg:ReqEquipPolisgOneKeyMessage=new ReqEquipPolisgOneKeyMessage();
			msg.opaque=opaqueType;
			msg.equipId=equipId;
			msg.type=type;
			msg.order=lv;
			msg.quality=quality;
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
		 * @param opaqueType 
		 * @param recipeid
		 * @param num
		 * */
		public static function reqItemCompositionMessage(opaqueType:int,recipeid:int,num:int):void
		{
			var msg:ReqItemCompositionMessage=new ReqItemCompositionMessage();
			msg.opaque=opaqueType;
			msg.recipeId=recipeid;
			msg.num=num;
			SocketConnection.send(msg);
		}
		
		/**
		 * 继承请求
		 * @param opaqueType 操作ID
		 * @param fromEquipId 被继承装备
		 * @param toEquipId 继承装备
		 * @param toType 继承装备来源 0-角色身上 1-背包
		 * @param index 继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
		 * */
		public static function reqEquipInheritMessage(opaqueType:int,fromEquipId:long,toEquipId:long,toType:int,index:int):void
		{
			var msg:ReqEquipInheritMessage=new ReqEquipInheritMessage();
			msg.opaque=opaqueType;
			msg.fromEquipId=fromEquipId;
			msg.toEquipId=toEquipId;
			msg.toType=toType;
			msg.index=index;
			SocketConnection.send(msg);
		}
		
		/**
		 * 打开格子请求（时间到了之后的开格请求）
		 * @param type 1_背包 2_仓库 3_寻宝仓库
		 * */
		public static function reqOpenTimeCellMessage(type:int):void
		{
			var msg:ReqOpenTimeCellMessage=new ReqOpenTimeCellMessage();
			msg.type=type;
			SocketConnection.send(msg);
		}
		
		/**
		 * 打开格子请求（消耗元宝等开格子）
		 * @param type 1_背包 2_仓库 3_寻宝仓库
		 * */
		public static function reqOpenCellMessage(type:int,cellid:int):void
		{
			var msg:ReqOpenCellMessage=new ReqOpenCellMessage();
			msg.type=type;
			msg.cellId=cellid;
			SocketConnection.send(msg);
		}
		
		/**请求格子信息*/
		public static function reqCellTimeQueryMessage(type:int,cellid:int):void
		{
			var msg:ReqCellTimeQueryMessage=new ReqCellTimeQueryMessage();
			msg.type=type;
			msg.cellId=cellid;
			SocketConnection.send(msg);
		}
	}
}