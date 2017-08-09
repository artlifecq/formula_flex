package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.ItemCDManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.alert.EquipAutoDressEffectPanelExt;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.backpack.message.ResChangeBindItemMessage;
	import com.rpgGame.netData.backpack.message.ResChangeLimitItemMessage;
	import com.rpgGame.netData.backpack.message.ResItemAddMessage;
	import com.rpgGame.netData.backpack.message.ResItemChangeMessage;
	import com.rpgGame.netData.backpack.message.ResItemInfoMessage;
	import com.rpgGame.netData.backpack.message.ResItemRemoveMessage;
	import com.rpgGame.netData.backpack.message.ResTakeUpSuccessMessage;
	import com.rpgGame.netData.backpack.message.ResUseItemSuccessMessage;
	import com.rpgGame.netData.backpack.message.SCFlyItemsMessage;
	import com.rpgGame.netData.cooldown.bean.CooldownInfo;
	import com.rpgGame.netData.cooldown.message.ResCooldownInfoListMessage;
	import com.rpgGame.netData.equip.message.ResEquipInfoMessage;
	import com.rpgGame.netData.equip.message.ResEquipOperateResultMessage;
	import com.rpgGame.netData.equip.message.UnwearEquipItemMessage;
	import com.rpgGame.netData.equip.message.WearEquipItemMessage;
	import com.rpgGame.netData.store.message.ResStoreItemAddMessage;
	import com.rpgGame.netData.store.message.ResStoreItemChangeMessage;
	import com.rpgGame.netData.store.message.ResStoreItemInfosMessage;
	import com.rpgGame.netData.store.message.ResStoreItemRemoveMessage;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import app.message.EquipOperateType;
	
	import away3d.cameras.Camera3D;
	import away3d.core.math.Matrix3DUtils;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
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
			SocketConnection.addCmdListener(108105, onResUseItemSuccessMessage );
			SocketConnection.addCmdListener(108107, onResTakeUpSuccessMessage );
			SocketConnection.addCmdListener(108115, onResChangeBindItemMessage );
			SocketConnection.addCmdListener(108116, onResChangeLimitItemMessage );
			SocketConnection.addCmdListener(108117,onFlyItems);
			SocketConnection.addCmdListener(105100, onResStoreItemInfosMessage );
			SocketConnection.addCmdListener(105101, onResStoreItemAddMessage );
			SocketConnection.addCmdListener(105102, onResStoreItemChangeMessage );
			SocketConnection.addCmdListener(105103, onResStoreItemRemoveMessage );
			
			SocketConnection.addCmdListener(107101, onWearEquipItemMessage );
			SocketConnection.addCmdListener(107102, onUnwearEquipItemMessage );
			SocketConnection.addCmdListener(107105, onResEquipInfoMessage );
			SocketConnection.addCmdListener(107106, onResEquipOperateResultMessage );
			SocketConnection.addCmdListener(228100, onResCooldownInfoListMessage );
			finish();
		}
		
		private function onFlyItems(msg:SCFlyItemsMessage):void
		{
			// TODO Auto Generated method stub
			ItemActionManager.flyItemsToBagByList(msg.itemModels);
		}
		
		private function onResTakeUpSuccessMessage(msg:ResTakeUpSuccessMessage):void
		{
			var role : SceneRole = SceneManager.getScene().getSceneObjByID(msg.goodsId.ToGID(), SceneCharType.DROP_GOODS) as SceneRole;
			
			var cam:Camera3D = SceneManager.scene.view3d.camera;
			var point:Point = new Point(role.x-cam.x,cam.y-role.z);
			ItemActionManager.tweenMode(point);
		}
		private function onResEquipOperateResultMessage(msg:ResEquipOperateResultMessage):void
		{
			switch(msg.opaque){
				case EquipOperateType.STRENGTH_NORMAL:
				case EquipOperateType.STRENGTH_ONEKEY:
					EventManager.dispatchEvent(ItemEvent.ITEM_STRENGTH_MSG,msg);
					break;
				case EquipOperateType.POLISH_NORMAL:
				case EquipOperateType.POLISH_ONEKEY:
					EventManager.dispatchEvent(ItemEvent.ITEM_POLISH_MSG,msg);
					break;
				case EquipOperateType.WASH_NORMAL:
					EventManager.dispatchEvent(ItemEvent.ITEM_WASH_MSG,msg);
					break;
				case EquipOperateType.COMBO_NORMAL:
					EventManager.dispatchEvent(ItemEvent.ITEM_COMBO_MSG,msg);
				case EquipOperateType.JICHENG_NORMAL:
					EventManager.dispatchEvent(ItemEvent.ITEM_JICHENG_MSG,msg);
					break;
			}
		}
		
		private function onResChangeLimitItemMessage(msg:ResChangeLimitItemMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).changItemLimit(msg);	
		}
		
		private function onResChangeBindItemMessage(msg:ResChangeBindItemMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).changItemBind(msg);	
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
			EquipAutoDressEffectPanelExt.checkShowDressEffect(msg.equip);
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
			ItemCDManager.getInstance().addItemCDTimeByid(msg.itemModelId);

		}
		private function onResCooldownInfoListMessage(msg:ResCooldownInfoListMessage):void
		{
			if(msg&&msg.list)
			{
				for each(var cdinfo:CooldownInfo in msg.list)
				{
					CDDataManager.playCD(cdinfo.key, cdinfo.cdTime);
				}
			}
		}
		private function onResItemChangeMessage(msg:ResItemChangeMessage):void
		{
			if(msg.item.type==0){
				GoodsContainerMamager.getMrg(ItemContainerID.Role).changItem(msg.item,msg.type);
			}else{
				GoodsContainerMamager.getMrg(ItemContainerID.BackPack).changItem(msg.item,msg.type);
			}
		}
		
		private function onResItemRemoveMessage(msg:ResItemRemoveMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).removeItems(msg.gridId);
		}
		
		private function onResItemAddMessage(msg:ResItemAddMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).addItem(msg.item);
		}
		
		private function onResItemInfoMessage(msg:ResItemInfoMessage):void
		{
			GoodsContainerMamager.getMrg(ItemContainerID.BackPack).setItemsInfo(msg.cellnum,msg.items);
		}
	}
}


