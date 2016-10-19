package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.goods.StorageManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.lang.LangBackPack;
	import com.rpgGame.coreData.lang.LangGoods;
	import com.rpgGame.coreData.type.item.EquipmentPos;
	
	import flash.utils.ByteArray;
	
	import app.cmd.GoodsContainerModuleMessages;
	import app.message.GoodsContainerProto;
	import app.message.GoodsProto;
	import app.message.PrizeProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	
	import utils.UIStateSetHelper;
	
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
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_MOVE_GOODS,onMoveGoods);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_MOVE_GOODS_FAIL,onMoveGoodsFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_SPLIT_GOODS,onSplitGoods);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_SPLIT_GOODS_FAIL,onSplitGoodsFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_ADD_GOODS,onAddGoods);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_SET_GOODS_COUNT,onSetGoodsCount);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_REMOVE_GOODS,onRemoveGoods);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_DROP_GOODS, onDropGoods);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_DROP_GOODS_FAIL,onDropGoodsFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_CLEAN_SUCCESS, onClean);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_CLEAN_FAIL, onCleanFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_USE_GOODS,onUsePackageGoods);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_USE_GOODS_FAIL,onUseGoodsFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_GOODS_COOLDOWN,onGoodsCoolDown);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_GOODS_TYPE_COOLDOWN,onGoodsTypeCoolDown);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_DEPOT_STORAGE_GET_DATA,onStorage);
//			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_STORAGE_NOT_OPEN,onStorageNotOpen);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_UNLOCK_DEPOT_GRID,onBackPackGridOpen);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_OPEN_STORAGE,onStorageOpen);
//			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_DEPOT_STORAGE_OPEN_SLOT,onGridOpen);
//			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_DEPOT_STORAGE_OPEN_SLOT_FAIL,onGridOpenFail);
			
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_STORAGE_OPEN_PAGE_FAIL,onStorageOpenPageFail);
			SocketConnection.addCmdListener(GoodsContainerModuleMessages.S2C_STORAGE_OPEN_PAGE,onStorageOpenPage);
			
			finish();
		}
		
		/**
		 * 客户端收到S2C_ADD_GOODS消息，在背包或者仓库中添加一个物品，该消息附带以下信息 <br>
		 * varint32 类型 0-背包 1-仓库 <br>
		 * for (byteArray.avaliable) <br>
		 *     varint32 位置 <br>
		 *     varint32 动态数据大小 <br>
		 *     bytes 物品动态数据，客户端解析成GoodsProto <br>
		 */
		private function onAddGoods(buffer:ByteBuffer):void
		{
			var len:int, pos:int;
			var containerId:int = buffer.readVarint32();
			while(buffer.bytesAvailable > 0)
			{
				pos = buffer.readVarint32();
				len = buffer.readVarint32();
				var goods:ByteArray = new ByteArray();
				buffer.readBytes(goods,0,len);
				var goodsProto:GoodsProto = new GoodsProto();
				goodsProto.mergeFrom(goods);
				var info:ItemInfo = ItemUtil.convertGoodsProtoToItemInfo(goodsProto);
				info.setIndex( pos );
				info.setContainerId( containerId );
				GoodsContainerMamager.addItem(containerId, info);
				EventManager.dispatchEvent(ItemEvent.ITEM_GETED_NEW_ITEM, info);
			}
		}
		
		/**
		 * 操作成功后，附带以下信息
		 *
		 * varint32 value
		 *      容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * varint32 value
		 *      容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * varint32 原格子位置
		 * varint32 目标格子位置
		 * varint32 count，堆叠个数
		 */
		private function onMoveGoods(buffer:ByteBuffer):void
		{
			var srcContainer:int = ItemUtil.readContainerBytes(buffer).containerId;
			var tarContainer:int = ItemUtil.readContainerBytes(buffer).containerId;
			var srcIndex:int = buffer.readVarint32();
			var tarIndex:int = buffer.readVarint32();
			var count:int =  buffer.readVarint32();
			
			//client和server对pos定义不一致，需要一次翻译
			if(srcContainer == ItemContainerID.Role)
			{
				srcIndex = EquipmentPos.getClientPos(srcIndex);
			}
			if(tarContainer == ItemContainerID.Role)
			{
				tarIndex = EquipmentPos.getClientPos(tarIndex);
			}
			fuck2Item(srcContainer, tarContainer, srcIndex, tarIndex, count);
		}
		
		/**
		 * 移动失败，发挥byte错误码
		 *
		 * 1. 客户端发送的type无效
		 * 2. 客户端发送的源位置与目标位置相同
		 * 3. 客户端发送的源位置无效
		 * 4. 客户端发送的目标位置无效
		 * 5. 客户端发送的源位置已经被锁定
		 * 6. 客户端发送的目标位置已经被锁定
		 * 7. 客户端发送的源位置上面的物品不存在
		 * 8. 英雄还没有仓库
		 * 9. 物品不能够移出背包
		 * 10. 过期
		 * 11. 不是装备
		 * 12. 性别不符
		 * 13. 装备类型不符
		 * 14. 副武器不匹配
		 * 15. 等级不符
		 * 16. 服务器bug
		 * 17. 距离仓库NPC过远
		 * 18. 坐骑未鉴定
		 */
		private function onMoveGoodsFail(buffer:ByteBuffer):void
		{
			var failId:int = buffer.readUnsignedByte();
			var failStr:String = "";
			switch (failId)
			{
				case 1:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_1;
					break;
				case 2:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_2;
					break;
				case 3:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_3;
					break;
				case 4:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_4;
					break;
				case 5:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_5;
					break;
				case 6:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_6;
					break;
				case 7:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_7;
					break;
				case 8:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_8;
					break;
				case 9:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_9;
					break;
				case 10:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_10;
					break;
				case 11:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_11;
					break;
				case 12:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_12;
					break;
				case 13:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_13;
					break;
				case 14:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_14;
					break;
				case 15:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_15;
					break;
				case 16:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_16;
					break;
				case 17:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_17;
					break;
				case 18:
					failStr = LangGoods.GOODS_CONTAINER_FAIL_18;
					break;
			}
			if( failId != 2 )
				NoticeManager.showNotify( failStr, failId );
			EventManager.dispatchEvent(ItemEvent.ITEM_MOVE_FAIL);
		}
		
		/**
		 * 操作成功后，附带以下信息
		 * varint32 value
		 *      容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * varint32 原格子位置（拆分哪个）
		 * varint32 目标格子位置（拆分到哪里）
		 * varint32 拆分数量（拆分多少个出来）
		 */
		private function onSplitGoods(buffer:ByteBuffer):void
		{
			var srcContainer:int = ItemUtil.readContainerBytes(buffer).containerId;
			var tarContainer:int = srcContainer;
			var srcIndex:int = buffer.readVarint32();
			var tarIndex:int = buffer.readVarint32();
			var count:int =  buffer.readVarint32();
			fuck2Item(srcContainer, tarContainer, srcIndex, tarIndex, count);
//			GoodsContainerMamager.refleshGridByItemIndex(srcContainer,srcIndex);
//			GoodsContainerMamager.refleshGridByItemIndex(tarContainer,tarIndex);
		}
		
		/**
		 * 物品拖动，支持容器间拖动 
		 * @param srcContainer
		 * @param tarContainer
		 * @param srcIndex
		 * @param tarIndex
		 * @param count 数量
		 * 
		 */		
		private function fuck2Item(srcContainer:int, tarContainer:int,srcIndex:int,tarIndex:int,count:int):void
		{
			var srcItem:ItemInfo = GoodsContainerMamager.getItemInfo(srcContainer, srcIndex);
			var tarItem:ItemInfo = GoodsContainerMamager.getItemInfo(tarContainer, tarIndex);
			if(srcItem == null)
			{
				trace("onMoveGoods srcItem:null");
				return;
			}
			if(srcContainer == ItemContainerID.BackPack && tarContainer == ItemContainerID.Role)
			{
				if(srcItem)
				{
					NoticeManager.showNotify("你更换了"+srcItem.name);
					srcItem.binded = true;
				}
			}
			if(srcContainer == ItemContainerID.Role && tarContainer == ItemContainerID.BackPack)
			{
				if(srcItem)
				{
					NoticeManager.showNotify("你脱下了"+srcItem.name);
					srcItem.binded = true;
				}
			}
			//移动个数
			var srcCount:int = count > 0 ? count : GoodsContainerMamager.getItemInfo(srcContainer,srcIndex).count;
			if(tarItem != null)
			{
				
				//不同物品或同类不可堆叠物品，则直接交换(count 为0表示与目标交换)　
				if(tarItem.cfgId != srcItem.cfgId || count == 0)
				{
					srcItem.setIndex(tarIndex );
					srcItem.setContainerId( tarContainer );
					tarItem.setIndex(srcIndex);
					tarItem.setContainerId( srcContainer );
					GoodsContainerMamager.setItemInfo(srcContainer,srcIndex, tarItem);
					GoodsContainerMamager.setItemInfo(tarContainer,tarIndex, srcItem);
				}
				//同一种物品
				else
				{
					if(tarItem.binded != srcItem.binded)
					{
						//提示将变为绑定
					}
					
					tarItem.count += srcCount;
					//全部移过去,清空源格子
					if(srcItem.count == srcCount)
					{
						srcItem = null;
					}else{
						srcItem.count -= count;
					}
					GoodsContainerMamager.setItemInfo(srcContainer,srcIndex, srcItem);
					GoodsContainerMamager.setItemInfo(tarContainer,tarIndex, tarItem);
				}
			}else{//目标为空格子
				tarItem = UIStateSetHelper.clone(srcItem);
				if(srcItem.count == srcCount)//全部移过去,清空源格子
				{
					srcItem = null;
				}else{//只移动其中一部分，例如分拆
					if(tarItem is EquipInfo && srcItem is EquipInfo)
					{
						(tarItem as EquipInfo).base_stat = (srcItem as EquipInfo).base_stat;
						(tarItem as EquipInfo).refined_stat = (srcItem as EquipInfo).refined_stat;
						(tarItem as EquipInfo).random_stat = (srcItem as EquipInfo).random_stat;
					}
					srcItem.count -= srcCount;
				}
				
				tarItem.setContainerId( tarContainer );
				tarItem.setIndex( tarIndex );
				tarItem.count = srcCount;
				
				if(srcItem && srcItem.count)
					GoodsContainerMamager.setItemInfo(srcContainer,srcIndex, srcItem);
				else
					GoodsContainerMamager.setItemInfo(srcContainer,srcIndex, null);
				GoodsContainerMamager.setItemInfo(tarContainer,tarIndex, tarItem);
			}
			EventManager.dispatchEvent( MountEvent.MOUNT_AUTO_PEELING_EQUIPMENT, tarItem );
		}
		
		/**
		 * 拆分失败，返回byte错误码
		 * 1.客户端发送的type无效
		 * 2.客户端发送的源位置与目标位置相同
		 * 3.客户端发送的源位置无效
		 * 4.客户端发送的目标位置无效
		 * 5.客户端发送的源位置已经被锁定
		 * 6.客户端发送的源位置上面的物品不存在
		 * 7.客户端发送的目标位置上面的物品已经存在
		 * 8.客户端发送的拆分数量错误，1、count <= 0 或者 count >= 源堆中的数量
		 * 9.英雄还没有仓库
		 * 10.距离仓库npc过远
		 */	
		private function onSplitGoodsFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readUnsignedByte();
			NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_onSplitGoodsFail_"+errID));
		}
		
		
		/**
		 * 使用升阶物品失败
		 * varint32 物品id
		 * bool 是否失败
		 *      true，下面是失败返还物品；false，下面是比如坐骑等阶超过目标等阶以后的返还物品，具体提示找文慧
		 * PrizeProto 奖励
		 */
		
		private function onUseUpgradeGoodPrizeFail(buffer:ByteBuffer):void
		{
			var itemcfgID:int = buffer.readVarint32();
			var isFail:Boolean = buffer.readBoolean();
			
			var prizeInfo:PrizeInfo = new PrizeInfo();
			var prizeProto:PrizeProto = new PrizeProto();
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			prizeProto.mergeFrom(bytes);
			prizeInfo.converData(prizeProto);
			
			var itemStr:String = "";
			var itemVec:Vector.<ItemInfo> = prizeInfo.getItemInfoVec();
			for each(var info:ItemInfo in itemVec)
			{
				itemStr += "["+info.count+"个"+ItemCfgData.getItemName(info.cfgId)+"]";
			}
			
			if(isFail)
			{
				//很抱歉，进阶失败，但是返还了一部分进阶丹给您，请查收
				NoticeManager.showNotify("很抱歉，进阶失败，但是返还了"+itemStr+"给您，请查收");
			}
			else
			{
				//很抱歉，您的坐骑/光翼已经超过了，赠送了您一部分进阶丹，请查收
				NoticeManager.showNotify("很抱歉，当前阶数已超过，赠送了您"+itemStr+"，请查收");
			}
		}
		
		
		/**
		 * 使用升阶物品成功
		 * varint32 物品id
		 */
		private function onUseGoodsPrizeSuccess(buffer:ByteBuffer):void
		{
			var itemCfgID:int = buffer.readVarint32();
			NoticeManager.showNotify("恭喜您,进阶成功了");
		}
		
		/**
		 * 使用物品成功，附带以下信息 <br>
		 * varint32 物品位置（背包中） <br>
		 * varint32 该位置剩余数量（如果是0，则移除该位置物品） <br>
		 */
		private function onUsePackageGoods(buffer:ByteBuffer):void
		{
			var index:int = buffer.readVarint32();
			var leftCount:int = buffer.readVarint32();
			var containerID:int = ItemContainerID.BackPack;
			var itemInfo:ItemInfo = GoodsContainerMamager.getItemInfo(containerID, index);
			if(itemInfo)
			{
				if(itemInfo is EquipInfo)
					NoticeManager.showNotify("你更换了"+itemInfo.name);
			}
			if(leftCount <= 0)
			{
				GoodsContainerMamager.setItemInfo(containerID,index, null);
			}else
			{
				if(itemInfo != null)
				{
					itemInfo.count = leftCount;
				}
				GoodsContainerMamager.setItemInfo(containerID,index, itemInfo);
			}
		}
		
		private function onShowAwward(msg:String):void
		{
			NoticeManager.showNotify(msg);
		}
		
		
		/**
		 * 客户端收到S2C_CHANGE_GOODS_COUNT消息，在背包或者仓库中修改一个或者多个物品的个数，该消息附带以下信息 <br>
		 * varint32 类型 0-背包 1-仓库 <br>
		 * while (byteArray.avaliable) <br>
		 *     varint32 位置 <br>
		 *     varint32 新数量（如果数量为0，则客户端移除该位置的物品） <br>
		 */
		private function onSetGoodsCount(buffer:ByteBuffer):void
		{
			var containerID:int = buffer.readVarint32();
			var count:int = 0;
			var item:ItemInfo;
			var index:int=0;
			while(buffer.bytesAvailable > 0)
			{
				index = buffer.readVarint32();
				count = buffer.readVarint32();
				item = GoodsContainerMamager.getItemInfo(containerID, index);
				if(item)
				{
					if(count <= 0)
					{
						GoodsContainerMamager.setItemInfo(containerID,index,null);
					}else{
						item.count = count;
						GoodsContainerMamager.setItemInfo(containerID,index,item);
					}
				}else{
					trace("onSetGoodsCount Error", containerID, index, count);
				}
			}
		}
		
		/**
		 * 背包或者仓库物品移除一个或者多个物品时，收到此消息，附带以下信息 <br>
		 * varint32 类型 0-背包 1-仓库 <br>
		 * if (byteArray.avaliable) <br>
		 *     varint32 物品的位置 <br>
		 * 客户端收到这条消息时，移除物品 <br>
		 */
		private function onRemoveGoods(buffer:ByteBuffer):void
		{
			var index:int = 0;
			var containerID:int = buffer.readVarint32();
			var item:ItemInfo;
			while(buffer.bytesAvailable > 0)
			{
				index = buffer.readVarint32();
				GoodsContainerMamager.setItemInfo(containerID, index, null);
			}
		}
		
		/**
		 * 服务器返回S2C_STORAGE_GET_DATA，附带以下信息 <br>
		 * bytes GoodsContainerProto仓库数据 <br>
		 *
		 * 当英雄还没有仓库时，返回S2C_STORAGE_NOT_OPEN消息 <br>
		 *
		 * 注意：S2C_STORAGE_GET_DATA消息服务器只会返回一次 <br>
		 */
		private function onStorage(buffer:ByteBuffer):void
		{
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			var goods : GoodsContainerProto = new GoodsContainerProto();
			goods.mergeFrom(bytes);
			StorageManager.instance.setGoodsInfo(goods);
			AppManager.showApp(AppConstant.STORAGE_PANEL);
		}
		
		private function onStorageNotOpen(buffer:ByteBuffer):void
		{
			NoticeManager.mouseFollowNotify(LanguageConfig.getText(LangBackPack.ITEM_onCleanFail_5));
		}
		
		/**
		 * 给英雄开放仓库时发生这条消息，收到这条消息后，客户端可以显示仓库按钮，可以使用仓库 <br>
		 */
		private function onStorageOpen(buffer:ByteBuffer):void
		{
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_OPEN_STORAGE);
		}
		
		/**
		 * 解锁背包格子
		 *
		 * varint32 当前总共的格子数量
		 */
		private function onBackPackGridOpen(buffer:ByteBuffer):void
		{
			var total:int = buffer.readVarint32();
			BackPackManager.instance.setUnlocked( total - 1);
		}
		
		/**
		 * 成功返回S2C_DEPOT_STORAGE_OPEN_SLOT,附带以下信息. <br>
		 * varint32 类型 0-背包 1-仓库 <br>
		 * varint32 开启格子的位置 <br>
		 * varint32 消耗的元宝 <br>
		 * 
		 */
/*		private function onGridOpen(buffer:ByteBuffer):void
		{
			var containerId:int = buffer.readVarint32();
			var index:int = buffer.readVarint32();
			var gold:int = buffer.readVarint32();
			NoticeManager.notify(NoticeManager.MOUSE_FOLLOW_TIP,"成功开启，消耗金子"+gold);
			
			GoodsContainerMamager.setUnlocked(containerId, index);
		}*/
		
		/**
		 * 失败返回S2C_DEPOT_STORAGE_OPEN_SLOT_FAIL，附带byte错误码. <br>
		 * 1、客户端发送的type无效 <br>
		 * 2、占位，暂时没用 <br>
		 * 3、客户端发送的解锁位置不合法，1、该位置已经被解锁了，2、该位置超出最大位置 <br>
		 * 4、没有格子需要解锁，全部格子都解锁了 <br>
		 * 5、元宝不足 <br>
		 * 6、英雄还没有仓库 <br>
		 * 7、有格子需要元宝开启，但是客户端发送的类型不是元宝开启的（客户端BUG） <br>
		 */
		private function onGridOpenFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readUnsignedByte();
			NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_onDepotStorageOpenSlotFail_"+errID));
		}
		
		/**
		 * 失败返回S2C_DEPOT_STORAGE_OPEN_PAGE_FAIL，附带byte错误码.
		 *
		 * 1. 当前没有仓库
		 * 2. 已经是最后一页了，无法再解锁
		 * 3. 银两不足
		 * 4. 金子不足
		 * 5. 物品不足
		 * 6. 距离仓库npc过远
		 */	
		private function onStorageOpenPageFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readByte();
			NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_onDepotStorageOpenSlotFail_"+errID));
			switch(errID)
			{
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					break;
				case 5:
					break;
			}
		}
		
		/**
		 * 成功解锁仓库页, 附带以下信息.
		 *
		 * varint32 格子第N页
		 */		
		private function onStorageOpenPage(buffer:ByteBuffer):void
		{
			var page:int = buffer.readVarint32();
			var pageSize:int = StorageManager.instance.PAGE_SIZE;
			var openToIndex:int = page * pageSize - 1;
			StorageManager.instance.setUnlocked(openToIndex);
		}
		
		/**
		 * 物品层级冷却，附带
		 * varint32 type 冷却层级
		 * varint32 冷却时间，单位毫秒，3000表示收到这个消息后，冷却时间转3秒
		 */	
		private function onGoodsTypeCoolDown(buffer:ByteBuffer):void
		{
			var cdType:int = buffer.readVarint32();
			var cdTime:int = buffer.readVarint32() + 500;
			var arr:Array = BackPackManager.instance.getAllItem();
			for each (var itemInfo:ItemInfo in arr) 
			{
				if(!itemInfo)continue;
				var itemCdType:int = ItemCfgData.getItemCdType(itemInfo.cfgId);
				if(itemCdType == cdType)
				{
					var key:String = FaceTypeEnum.ITEM+"_"+itemInfo.cfgId;
					CDDataManager.playCD(key,cdTime);
				}
			}
		}
		
		/**
		 * 物品冷却，附带
		 * varint32 goodsId
		 * varint32 冷却时间，单位毫秒，3000表示收到这个消息后，冷却时间转3秒
		 */
		private function onGoodsCoolDown(buffer:ByteBuffer):void
		{
			var cfgId:int = buffer.readVarint32();
			var cdTime:int = buffer.readVarint32() + 50;
			//			var itemCdType:int = ItemCfgData.getItemCdType(cfgId);
			//			var key:String = CoolingType.GOODS+"_" + itemCdType;
			var key:String = FaceTypeEnum.ITEM+"_" + cfgId;
			CDDataManager.playCD(key,cdTime);
		}
		
		/**
		 * 有以下几种情况
		 * 1、客户端发送的背包位置无效
		 * 2、客户端发送的位置上没有物品
		 * 3、物品不能使用（如装备）
		 * 4、物品不能批量使用（客户端发送的数量大于1）
		 * 5、物品个数不足（物品只有五个，客户端说要用6个）
		 * 6、物品使用等级不足
		 * 7、物品已经过期
		 * 8、物品CD中
		 * 9、英雄已经挂了
		 * 10、物品已经被锁定，不能使用
		 * 11、使用物品数量过多
		 *
		 * --包裹
		 * 11、打开包裹所需空间不足，后面在读一个varint32，表示需要的空格数
		 *
		 * 15、打开金子礼包，金子不足
		 * 16、打开金子礼包，背包空位不足
		 *
		 * 17、使用传说卡，对应系统未激活
		 * 18、使用传说卡，背包空位不足
		 *
		 * --传送卷轴
		 * 30、传送失败
		 * 31、当前等级还不能进入目标场景
		 * 32、当前家族不是无双城占领家族
		 * 33、攻城战期间不能传送
		 *
		 * --任务卷轴
		 * 50、英雄未完成第二章主线任务
		 * 51、今日接受任务个数已达最大个数
		 * 52、当前机缘任务列表个数已达最大个数
		 *
		 * --药品
		 * 60、PK值为0，不能使用物品减少PK值
		 * 61、加Buff类物品，英雄的Buff已满
		 * 62、使用经验丹，但是经验已满
		 * 63、使用真气丹，但是真气已满
		 * 64、使用银两物品，但是银两已满
		 * 65、使用绑金物品，但是绑金已满
		 * 66、使用家族历练物品，但是家族历练已满
		 * 67、使用加家族贡献物品，但是不在家族中
		 * 68、使用限制个数的物品，但是已经达到使用上限
		 * 69、使用升级物品（大还丹），但是英雄已经满级了
		 *
		 * --坐骑技能书
		 * 70、英雄还没有坐骑
		 * 71、坐骑等级不足
		 * 72、坐骑还没有技能格子
		 *
		 * 74、英雄还没有天劫，天劫等级不足或者没有技能格子
		 *
		 * 75、英雄还没有天罪，天罪等级不足或者没有技能格子
		 *
		 * 76、英雄技能，不是你这个职业学的
		 * 77、英雄技能，这个技能已经学会了
		 * 78、英雄技能，没有学会这个技能的前置技能（还没有学会1级就想学2级技能）
		 *
		 * 79、神兵心法，英雄还没有激活这把神兵
		 * 80、神兵心法，英雄已经激活过了这个心法
		 *
		 * 81、英雄还没有琴心
		 * 82、琴心等级不足
		 * 83、琴心还没有技能格子
		 *
		 * 85、使用潜能丹或者幻化丹，英雄还没有对应的系统（坐骑，凤舞），客户端bug
		 * 86、使用潜能丹或者幻化丹或者淬剑丹，英雄对应的系统的等级不足（坐骑，凤舞,古剑），客户端bug
		 * 87、使用潜能丹或者幻化丹或者淬剑丹，使用数量已达到上限(已达上限不应请求使用,bug)
		 *
		 * 95、使用祝福丹或者XX之魂等级(坐骑，凤舞，天劫，天罪)不够，不能够添加祝福值，客户端bug
		 * 96、使用祝福丹或者XX之魂对应系统(坐骑，凤舞，天劫，天罪)已经满级，不能够添加祝福值，客户端bug
		 * 97、使用祝福丹或者XX之魂对应系统(坐骑，凤舞，天劫，天罪)祝福值已满，不能够添加祝福值，客户端bug
		 *
		 * 100、已经达到主动技能等级上限，无法使用，客户端bug
		 *
		 * //古剑灵魂石
		 * 109.古剑找不到
		 *
		 * 淬剑丹
		 * 110.古剑找不到
		 * 111.古剑阶数未达到使用淬剑丹阶数(未达阶数不应请求使用淬剑丹,bug)
		 *
		 * //古剑突破丹
		 * 112、使用古剑突破丹没有附身古剑
		 * 113、使用古剑突破丹等阶太高了，无法使用
		 *
		 * //古剑灵药
		 * 114、使用古剑灵药时，没有附身古剑
		 * 115、使用古剑灵药时，附身古剑等阶不满足
		 * 116、使用古剑灵药时，目标等阶没有找到
		 *
		 * //古剑技能丹
		 * 117、使用古剑技能丹，没有附身古剑
		 * 118、使用古剑技能丹，所有技能满级了
		 *
		 * //活动物品
		 * 119、已经有使用该活动物品
		 *
		 * //古剑突破丹
		 * 123、使用古剑突破丹没有附身古剑
		 * 124、使用古剑突破丹星级太高了，无法使用
		 *
		 * //古剑灵药
		 * 125、使用古剑灵药时，没有附身古剑
		 * 126、使用古剑灵药时，附身古剑星级不满足
		 * 127、使用古剑灵药时，目标星级没有找到
		 *
		 * 128、没有坐骑
		 *
		 * // 家族活跃度卡
		 * 130、没有家族
		 * 131、使用数量太多
		 *
		 * 132、无法兑换没有解锁的古剑
		 *
		 * 133、使用古剑灵药时，附身古剑无法使用
		 * 134、使用古剑突破丹，附身古剑无法使用
		 *
		 * 135、使用寻宝任务书，当前寻宝中
		 * 136、使用烟花失败，当前放烟花中
		 *
		 * 137、已经激活该称号
		 *
		 * 138、背包已经全部解锁
		 *
		 * 139、权限不足，不能使用
		 * 140、当前场景无法使用该物品
		 * 141、死了
		 * 142、战斗中
		 * 143、等级不足进入目标场景
		 * 144、传送目标点不可行走
		 * 145、不是帮主
		 *
		 * 146、银两不足
		 * 147、绑银不足
		 *
		 * 148、该物品不是兽牌
		 * 149、没有空的坐骑槽位了
         *
         * 150、当前有折扣，无法使用
         */
		private function onUseGoodsFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readUnsignedByte();//8 "当前物品正在冷却中"
			NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_UseItemFail_"+errID));
		}
		/**
		 * 成功返回S2C_DROP_GOODS，该消息只有消息头，解锁面板
		 * 解锁面板
		 *
		 * varint32 value
		 *      容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * varint32 丢弃的物品位置
		 * varint32 goodsId 防御性，防止客户端与服务器数据不一致
		 *
		 */
		private function onDropGoods(buffer:ByteBuffer):void
		{
			var item:ItemInfo = GoodsContainerMamager.waitingDropItem;
			if(!item)return;
			var containerId:int = ItemUtil.readContainerBytes(buffer).containerId;
			var index:int = item.index;
			NoticeManager.showNotify(item.name+"被销毁了");
			GoodsContainerMamager.setItemInfo(containerId, index,null);
			GoodsContainerMamager.waitingDropItem = null;
		}
		
		
		/**
		 * 失败返回byte错误码，详见消息说明.
		 * 解锁面板
		 *
		 * 1、客户端发送的位置无效
		 * 2、客户端发送的位置上没有物品
		 * 3、客户端发送的位置上的物品ID，与客户端发送的物品ID不同
		 * 4、物品不能丢弃
		 * 5、处于安全区，不能丢弃物品
		 * 6、跳跃中，不能丢弃物品
		 * 7、物品已过期，不能丢弃物品
		 * 8、英雄挂了，不能丢弃物品
		 * 9、物品已经被锁定，不能丢弃物品
		 * 10. 跨服区域不能丢物品
		 * 11. 距离仓库npc过远
		 * 12. 无效的容器类型
		 */
		private function onDropGoodsFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readUnsignedByte();
			switch(errID)
			{
				case 2:
					NoticeManager.mouseFollowNotify(LanguageConfig.getText(LangBackPack.ITEM_UseItemFail_2));
					break;
				default:
					NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_DropItemFail_"+errID));
					break;
			}
			GoodsContainerMamager.waitingDropItem = null;
		}
		
		/**
		 * 成功，附带以下信息
		 * varint32 value
		 *      容器类型：
		 *      if(容器类型=MOUNT_EQUIPMENT){
		 *          (坐骑第几个槽位 << 8) | ContainerType
		 *      } else if(容器类型=STORAGE){
		 *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *          (npcId << 8) | ContainerType
		 *      } else {
		 *          ContainerType
		 *      }
		 * varint64 下次可整理时间
		 * while(readable()){
		 *      varint32 未整理前所在的位置，根据这个位置读取物品信息
		 *      varint32 整理后对应下标的物品数量
		 * }
		 */
		private function onClean(buffer:ByteBuffer):void
		{
			var containerId:int = ItemUtil.readContainerBytes(buffer).containerId;
			var nextTime:Number = buffer.readVarint64();
			var newIndex:int;
			var itemInfo:ItemInfo;
			var newItems:Array = [];
			while(buffer.bytesAvailable)
			{
				var oldIndex:int = buffer.readVarint32();
				var count:int = buffer.readVarint32();
				trace(oldIndex,count);
				itemInfo = GoodsContainerMamager.getItemInfo(containerId, oldIndex);
				if(!itemInfo)
				{
					trace("Goods clean maybe Error, oldIndex item is null ");
					continue;
				}
				itemInfo.setIndex( newIndex );
				itemInfo.count = count;
				newItems[newIndex] = itemInfo;
				newIndex++;
			}
			GoodsContainerMamager.setAllItem(containerId, newItems);
			
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH_CD, containerId, nextTime);
		}
		
		/**
		 * 失败返回S2C_CLEAN_FAIL，附带byte错误码
		 *
		 * 1.客户端发送的type无效
		 * 2.背包下次更新时间未到
		 * 3.仓库下次更新时间未到
		 * 4.背包已锁定
		 * 5.英雄还没有仓库
		 * 6.距离仓库npc太远
		 */
		private function onCleanFail(buffer:ByteBuffer):void
		{
			var errID:int = buffer.readUnsignedByte();
			NoticeManager.mouseFollowNotify(LanguageConfig.getText("ITEM_onCleanFail_"+errID));
			if(errID != 1)
			{
				var containerId:int = (errID == 2 || errID == 4) ? ItemContainerID.BackPack : ItemContainerID.Storage;
				EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH_FAIL, containerId);
			}
		}
		
		/** 添加活动buff */
		private function onAddHeroActivityBuff(buffer:ByteBuffer):void
		{
			var goodId:int = buffer.readVarint32();
			var endTime:Number = buffer.readVarint64();
			//ActiBuffController.instance.addActiBuf(goodId,endTime);
		}
		
		
		private function onShowGoods( buffer:ByteBuffer ):void
		{
			var goodsId:int = buffer.readVarint32();
			
			var prizeInfo:PrizeInfo = new PrizeInfo();
			var prizeProto:PrizeProto = new PrizeProto();
			var bytes:ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			prizeProto.mergeFrom(bytes);
			prizeInfo.converData(prizeProto);
			
			//			ItemByYuanbaoManager.onShowGoods( goodsId, prizeInfo );
		}
		
		/*		private function onUseCleaeGuildCDSuccess(buffer:ByteBuffer):void
		{
		NoticeManager.mouseFollowNotify("当前换帮CD时间清除成功！您现在可以自由更换帮派啦");
		}*/
	}
}


