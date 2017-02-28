package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.backpack.message.ResItemAddMessage;
	import com.rpgGame.netData.backpack.message.ResItemChangeMessage;
	import com.rpgGame.netData.backpack.message.ResItemInfosMessage;
	import com.rpgGame.netData.backpack.message.ResItemRemoveMessage;
	import com.rpgGame.netData.backpack.message.ResUseItemSuccessMessage;
	import com.rpgGame.netData.equip.message.ResEquipInfoMessage;
	import com.rpgGame.netData.equip.message.UnwearEquipItemMessage;
	import com.rpgGame.netData.equip.message.WearEquipItemMessage;
	import com.rpgGame.netData.store.message.ResStoreItemAddMessage;
	import com.rpgGame.netData.store.message.ResStoreItemChangeMessage;
	import com.rpgGame.netData.store.message.ResStoreItemInfosMessage;
	import com.rpgGame.netData.store.message.ResStoreItemRemoveMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 * 
	 * 玩家物品容器相关ModuleID==5
	 * @author wewell@163.com
	 * 
	 */	
	public class GoodsContainerCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(108101, onResItemInfoMessage );
			SocketConnection.addCmdListener(108102, onResItemAddMessage );
			SocketConnection.addCmdListener(108103, onResItemChangeMessage );
			SocketConnection.addCmdListener(108104, onResItemRemoveMessage );
//			SocketConnection.addCmdListener(108105, onResUseItemSuccessMessage );暂时不用物品使用成功
			
			SocketConnection.addCmdListener(105100, onResStoreItemInfosMessage );
			SocketConnection.addCmdListener(105101, onResStoreItemAddMessage );
			SocketConnection.addCmdListener(105102, onResStoreItemChangeMessage );
			SocketConnection.addCmdListener(105103, onResStoreItemRemoveMessage );
			
			SocketConnection.addCmdListener(107101, onWearEquipItemMessage );
			SocketConnection.addCmdListener(107102, onUnwearEquipItemMessage );
			SocketConnection.addCmdListener(107105, onResEquipInfoMessage );
			
			finish();
		}
		
		private function onResEquipInfoMessage(msg:ResEquipInfoMessage):void
		{
			var equips:Vector.<ItemInfo>=msg.equips;
			for each(var item:ItemInfo in equips){
				item.gridId=ItemConfig.getQItemByID(item.itemModelId).q_kind;
			}
			GoodsContainerMamager.getMrg(ItemContainerID.Role).setItemsInfo(10,msg.equips);
		}
		
		private function onUnwearEquipItemMessage(msg:UnwearEquipItemMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.Role).removeItem(msg.gridId);
		}
		
		private function onWearEquipItemMessage(msg:WearEquipItemMessage):void
		{
			msg.equip.gridId=ItemConfig.getQItemByID(msg.equip.itemModelId).q_kind;
			GoodsContainerMamager.getMrg(ItemContainerID.Role).addItem(msg.equip);
		}
		
		private function onResStoreItemRemoveMessage(msg:ResStoreItemRemoveMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.Storage).removeItem(msg.gridId);
		}
		
		private function onResStoreItemAddMessage(msg:ResStoreItemAddMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.Storage).addItem(msg.item);			
		}
		
		private function onResStoreItemChangeMessage(msg:ResStoreItemChangeMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.Storage).changItem(msg.item);			
		}
		
		private function onResStoreItemInfosMessage(msg:ResStoreItemInfosMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.Storage).setItemsInfo(msg.cellnum,msg.items);
		}
		
		private function onResUseItemSuccessMessage(msg:ResUseItemSuccessMessage):void
		{
			
		}
		
		private function onResItemChangeMessage(msg:ResItemChangeMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).changItem(msg.item,msg.type);
		}
		
		private function onResItemRemoveMessage(msg:ResItemRemoveMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).removeItem(msg.gridId);
		}
		
		private function onResItemAddMessage(msg:ResItemAddMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).addItem(msg.item);
		}
		
		private function onResItemInfoMessage(msg:ResItemInfosMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).setItemsInfo(msg.cellnum,msg.items);
		}
	}
}


