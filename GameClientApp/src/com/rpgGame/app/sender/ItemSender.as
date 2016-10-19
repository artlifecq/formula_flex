package com.rpgGame.app.sender
{
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.type.item.EquipmentPos;
	
	import app.cmd.GoodsContainerModuleMessages;
	import app.cmd.ShopModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 * @author lpp
	 * ModuleID==5
	 */
	public class ItemSender extends BaseSender
	{
		
		public static var isReqDepot:Boolean = false;//是否请求过仓库数据
		
		public function ItemSender()
		{
			super();
		}
		
		/**
		 * 拆分物品发送C2S_SPLIT_GOODS，附带以下信息
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
		 *
		 * 失败返回S2C_SPLIT_GOODS_FAIL，附带byte错误码.错误码详见后面的说明.
		 */
		public static function reqSplitGoods(containerId:int, srcIndex:int, dstIndex:int, count:int):void
		{
			var by:ByteBuffer = new ByteBuffer();
			ItemUtil.writeContainerToBytes(by,containerId);
			by.writeVarint32(srcIndex);
			by.writeVarint32(dstIndex);
			by.writeVarint32(count);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_SPLIT_GOODS,by);
		}
		
		/**
		 * 背包物品移动，发送C2S_MOVE_GOODS，附带以下信息
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
		 */
		public static function reqMoveGoods( srcContainerId:int, dstContainerId:int, srcGridIndex:int, dstGridIndex:int, idx:int=0 ):void
		{
			//client和server对pos定义不一致，需要一次翻译
			if(srcContainerId == ItemContainerID.Role)
			{
				srcGridIndex = EquipmentPos.getServerPos(srcGridIndex);
			}
			if(dstContainerId == ItemContainerID.Role)
			{
				dstGridIndex = EquipmentPos.getServerPos(dstGridIndex);
			}
			
			_bytes.clear();
			var by:ByteBuffer = new ByteBuffer();
			ItemUtil.writeContainerToBytes(by,srcContainerId,idx);
			ItemUtil.writeContainerToBytes(by,dstContainerId,idx);
			by.writeVarint32(srcGridIndex);
			by.writeVarint32(dstGridIndex);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_MOVE_GOODS,by);
		}
		
		/**
		 * 背包仓库整理发送C2S_CLEAN，附带以下信息
		 * varint32 操作类型：0-背包整理 1-仓库整理
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
		 */
		public static function reqClean(controlType:int=0):void
		{
			var by:ByteBuffer = new ByteBuffer();
			ItemUtil.writeContainerToBytes(by,controlType);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_CLEAN,by);
		}
		
		/**
		 * 手动解锁背包仓库格子发送C2S_DEPOT_STORAGE_OPEN_SLOT,附带以下信息 <br>
		 * varint32 类型 0-背包 1-仓库 <br>
		 * varint32 开启格子的位置 <br>
		 *
		 * 当需要使用元宝才能开启时，元宝开启字段需要发送true <br>
		 */	
/*		public static function reqDepotStorageOpenSlot(containerId:int, index:int, isYuanbao:Boolean=true):void
		{
			var by:ByteBuffer = new ByteBuffer();
			by.writeByte(containerId);
			by.writeVarint32(index);
			by.writeBoolean(isYuanbao);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_DEPOT_STORAGE_OPEN_SLOT,by);
		}*/
		
		/**
		 * 手动解锁仓库页， UpgradeProto StorageUnlockProto.upgradeData
		 */	
		public static function reqStorageOpenPage(itemListVo:UpgradeItemListVo):void
		{
			_bytes.clear();
			_bytes.writeBytes(itemListVo.getByte());
			SocketConnection.send(GoodsContainerModuleMessages.C2S_STORAGE_OPEN_PAGE, _bytes);
		}
		
		/**
		 * 请求仓库数据
		 * 
		 */		
		public static function reqDepotStorageGetData():void
		{
			var by:ByteBuffer = new ByteBuffer();
			SocketConnection.send(GoodsContainerModuleMessages.C2S_DEPOT_STORAGE_GET_DATA, by);
			isReqDepot = true;
		}
		
		/**
		 * 丢弃物品，客户端先判断物品是否可以丢弃，是否处于安全区等限制，判断通过后，发送C2S_DROP_GOODS消息，
		 * 附带丢弃物品的格子位置pos，物品ID，此时客户端需要锁定背包面板，等待服务器返回消息后才可以继续操作背包
		 * 在收到确认消息之前，会先收到背包物品移除消息，此时客户端根据此消息将物品移除
		 *
		 * 然后客户端会收到物品视野相关的消息，具体参考物品视野文档
		 *
		 * 丢弃物品发送C2S_DROP_GOODS，附带以下信息
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
		 * varint32 goodsId 防御性，防止客户端与服务器数据不一致，导致丢掉了重要物品
		 *
		 * 失败返回S2C_DROP_GOODS_FAIL，详见消息说明.
		 * 解锁面板
		 */
		public static function reqDropGoods(container : int ,index:int, itemId:int):void
		{
			var by:ByteBuffer = new ByteBuffer();
			ItemUtil.writeContainerToBytes(by,container);
			by.writeVarint32(index);
			by.writeVarint32(itemId);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_DROP_GOODS, by);
		}
		
		/**
		 * 使用物品发送C2S_USE_GOODS，附带以下信息
		 * varint32 物品位置（背包中）
		 * varint32 使用数量
		 *
		 * 其他数据，后面会再加上
		 *
		 * 使用王者之印，后面单上参数
		 *
		 * varint32 要传送去的普通场景
		 * varint32 要传送去的普通场景的x坐标
		 * varint32 要传送去的普通场景的y坐标
		 *
		 * 失败返回S2C_USE_GOODS_FAIL，附带byte错误码.错误码详见消息的说明.
		 */
		public static function reqUseGoods(index:int,count:int,param:ByteBuffer = null):void
		{
			var by:ByteBuffer = new ByteBuffer();
			by.writeVarint32(index);
			by.writeVarint32(count);
			if(param)
				by.writeBytes(param,0,param.bytesAvailable);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_USE_GOODS, by); 
		}
		
		/**
		 * 卖出物品发送C2S_SELL_GOODS，附带以下信息
 		 * varint32 出售的物品index
		 * varint32 出售的物品的数量
		 */		
		public static function reqSellGoods(index:int):void
		{
			var by:ByteBuffer = new ByteBuffer();
			by.writeVarint32(index);
			SocketConnection.send(ShopModuleMessages.C2S_SELL_GOODS, by); 
		}
		
		public static function giveUpMoney(money:int):void
		{
			/*var by:ByteBuffer = new ByteBuffer();
			by.writeVarint32(money);
			SocketConnection.send(GoodsContainerModuleMessages.C2S_SELL_GOODS, by); */
		}
		
		/**
		 *请求元宝礼包奖励物品
		 * @param goodsId 道具ID
		 */
		public static function showGoods( goodsId:int ):void
		{
			var by:ByteBuffer = new ByteBuffer();
			by.writeVarint32(goodsId);
//			send(GoodsContainerModuleMessages.C2S_YUANBAO_PACKAGE_SHOW_GOODS,by);
		}
	}
}