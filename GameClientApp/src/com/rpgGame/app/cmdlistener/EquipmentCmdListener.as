package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.equip.EquipBaseManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.core.events.EquipEvent;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.lang.LangEquip;
	
	import app.cmd.EquipmentModuleMessages;
	import app.message.GoodsProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	import org.game.netCore.net_protobuff.BytesUtil;

	/**
	 *
	 * 装备消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-26 下午4:50:25
	 *
	 */
	public class EquipmentCmdListener extends BaseBean
	{
		public function EquipmentCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_BUILD_EQUIPMENT,onBuildEquipMent);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_BUILD_EQUIPMENT_FAIL,onBuildEquipFail);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_BUILD_EQUIPMENT_BROADCAST,onBuildEquipBroadcast);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_COMBINE_MATERIAL,onCombineMaterial);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_COMBINE_MATERIAL_FAIL,onCombineMaterialFail);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_COMBINE_EQUIPMENT,onCombineEquipment);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_COMBINE_EQUIPMENT_FAIL,onCombineEquipmentFail);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_DESTROY_EQUIPMENT,onDestoryEquipment);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_DESTROY_EQUIPMENT_FAIL,onDestoryEquipmentFail);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_CHANGE_EQUIPMENT_GENERAL,onChangeEquipmentGeneral);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_CHANGE_EQUIPMENT_GENERAL_FAIl,onChangeEquipmentGeneralFail);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_REFINE_EQUIPMENT,onEquipmentRefine);
			SocketConnection_protoBuffer.addCmdListener(EquipmentModuleMessages.S2C_REFINE_EQUIPMENT_FAIL,onEquipmentRefineFail);
			
			finish();
		}
		/**
		 * 升星失败，返回varint32错误码
		 *
		 * 1. 该升星未找到
		 * 2. 容器类型非法
		 * 3. 装备位置非法
		 * 4. 要升星的装备没有找到
		 * 5. 装备没找到
		 * 6. 升星跟装备的星级不匹配
		 * 7. 物品不够
		 * 8. 物品位置非法
		 * 9. 银两不足
		 */
		private function onEquipmentRefineFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var error : int = buffer.readVarint32();
			var fail : String;
			switch(error)
			{
				case 1:
					fail = LangEquip.REFINE_FAIL_1;
					break;
				case 2:
					fail = LangEquip.REFINE_FAIL_2;
					break;
				case 3:
					fail = LangEquip.REFINE_FAIL_3;
					break;
				case 4:
					fail = LangEquip.REFINE_FAIL_4;
					break;
				case 5:
					fail = LangEquip.REFINE_FAIL_5;
					break;
				case 6:
					fail = LangEquip.REFINE_FAIL_6;
					break;
				case 7:
					fail = LangEquip.REFINE_FAIL_7;
					break;
				case 8:
					fail = LangEquip.REFINE_FAIL_8;
					break;
				case 9:
					fail = LangEquip.REFINE_FAIL_9;
					break;
			}
			NoticeManager.showNotify(fail, error);
		}
		/**
		 * 升星完成，将该物品覆盖上去
		 *
		 * if(!buffer.readable()){
		 *      什么都没变
		 *      return;
		 * }
		 *
		 * varint32 value
		 *     容器类型：
		 *     if(容器类型=MOUNT_EQUIPMENT){
		 *         (坐骑第几个槽位 << 8) | ContainerType
		 *     } else if(容器类型=STORAGE){
		 *         如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
		 *         (npcId << 8) | ContainerType
		 *     } else {
		 *         ContainerType
		 *     }
		 * varint32 容器位置
		 * bytes 降星后的装备，解析成GoodsProto，客户端自己去判断是升星还是降星
		 */
		private function onEquipmentRefine(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var refine : Boolean;
			if(buffer.bytesAvailable)
			{
				var id : int = ItemUtil.readContainerBytes(buffer).containerId;
				var index : int = buffer.readVarint32();
				var oldEquip : EquipInfo = GoodsContainerMamager.getItemInfo(id,index) as EquipInfo;
				var goods : GoodsProto = new GoodsProto;
				goods.mergeFrom(buffer);
				var equip : EquipInfo = ItemUtil.createEquipInfo(goods);
				equip.setContainerId( id );
				equip.setIndex( index );
				var space : int = 0;
				if(oldEquip &&  equip)
				{
					if(oldEquip.refined_times > equip.refined_times)
						refine = false;
					else
						refine = true;
				}
				GoodsContainerMamager.getMrg(id).setItemByIndex(index,equip);
				NoticeManager.showNotify("强化等级"+(refine?"+":"-")+Math.abs(equip.refined_times-oldEquip.refined_times));
			}else
			{
				refine = false;
//				NoticeManager.notify(NoticeManager.CENTER_BOTTOM, "没有发生改变");
			}
			EventManager.dispatchEvent(EquipEvent.EQUIP_REFINE_COMPLETE,refine);
		}
		/**
		 * 改造失败，返回varint32错误码
		 *
		 * 1. 改造没找到
		 * 2. 该装备无法改造
		 * 3. 容器类型非法
		 * 4. 装备位置非法
		 * 5. 不是装备
		 * 6. 物品不够
		 * 7. 钱不够
		 * 8. 装备未找到
		 */
		private function onChangeEquipmentGeneralFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var error : int = buffer.readVarint32();
			var fail : String;
			switch(error)
			{
				case 1:
					fail = LangEquip.GENERAL_FAIL_1;
					break;
				case 2:
					fail = LangEquip.GENERAL_FAIL_2;
					break;
				case 3:
					fail = LangEquip.GENERAL_FAIL_3;
					break;
				case 4:
					fail = LangEquip.GENERAL_FAIL_4;
					break;
				case 5:
					fail = LangEquip.GENERAL_FAIL_5;
					break;
				case 6:
					fail = LangEquip.GENERAL_FAIL_6;
					break;
				case 7:
					fail = LangEquip.GENERAL_FAIL_7;
					break;
				case 8:
					fail = LangEquip.GENERAL_FAIL_8;
					break;
			}
			NoticeManager.showNotify(fail, error);
		}
		/**
		 * 改造成功
		 *
		 * if(!buffer.readable()){
		 *      改造没有任何变化，客户端提示，套装属性什么的都不会变化
		 *      return;
		 * }
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
		 * varint32 装备所在位置
		 * bytes GoodsProto 改造后的装备
		 *
		 */
		private function onChangeEquipmentGeneral(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			if(!buffer.bytesAvailable)
			{
				EventManager.dispatchEvent(EquipEvent.EQUIP_GENERAL_CHANGE);
				return;
			}
			var id : int = ItemUtil.readContainerBytes(buffer).containerId;
			var index : int = buffer.readVarint32();
			var goods : GoodsProto = new GoodsProto;
			goods.mergeFrom(buffer);
			var equip : EquipInfo = ItemUtil.createEquipInfo(goods);
			equip.setContainerId( id );
			equip.setIndex( index );
			GoodsContainerMamager.getMrg(id).setItemByIndex(index,equip);
			EventManager.dispatchEvent(EquipEvent.EQUIP_GENERAL_CHANGE);
		}
		/**
		 * 拆解失败，返回varint32错误码
		 * 
		 * 1. 容器类型非法
		 * 2. 装备位置非法
		 * 3. 要拆解的物品不是装备
		 * 4. 要拆解的装备没有找到
		 * 5. 该装备无法拆解
		 * 6. 该星级的装备无法拆解
		 * 7. 银两不足
		 * 8. 背包空间不足
		 * 9. 服务器bug
		 */
		private function onDestoryEquipmentFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var error : int = buffer.readVarint32();
			var fail : String;
			switch(error)
			{
				case 1:
					fail = LangEquip.DESTORY_FAIL_1;
					break;
				case 2:
					fail = LangEquip.DESTORY_FAIL_2;
					break;
				case 3:
					fail = LangEquip.DESTORY_FAIL_3;
					break;
				case 4:
					fail = LangEquip.DESTORY_FAIL_4;
					break;
				case 5:
					fail = LangEquip.DESTORY_FAIL_5;
					break;
				case 6:
					fail = LangEquip.DESTORY_FAIL_6;
					break;
				case 7:
					fail = LangEquip.DESTORY_FAIL_7;
					break;
				case 8:
					fail = LangEquip.DESTORY_FAIL_8;
					break;
				case 9:
					fail = LangEquip.DESTORY_FAIL_9;
					break;
			}
			NoticeManager.showNotify(fail, error);
			
		}
		/**
		 * 拆解成功
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
		 * varint32 装备位置
		 * varint32 装备id
		 *
		 * while(readable()){
		 *      varint32 拆解后的材料的id
		 *      varint32 拆解后的材料的数量
		 * }
		 */
		private function onDestoryEquipment(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var containerId : int = ItemUtil.readContainerBytes(buffer).containerId;
			var pos : int = buffer.readVarint32();
			var id : int = buffer.readVarint32();
			var itemInfo : ItemInfo = GoodsContainerMamager.getItemInfo(containerId,pos);
			if(itemInfo && itemInfo.cfgId == id)
				GoodsContainerMamager.getMrg(containerId).removeItemByIndex(pos);
			var destoryItems : Array = [];
			while(buffer.bytesAvailable)
			{
				itemInfo = new ItemInfo();
				itemInfo.cfgId = buffer.readVarint32();
				itemInfo.count = buffer.readVarint32();
				destoryItems.push(itemInfo);
			}
			NoticeManager.showNotify(LangEquip.DESTORY_COMPLETE_TRUE);
			EventManager.dispatchEvent(EquipEvent.EQUIP_PANEL_UPDATE);
			EventManager.dispatchEvent(EquipEvent.EQUIP_DESTORY_COMPLETE,destoryItems);
		}
		/**
		 * 装备合成失败，返回varint32错误码
		 * 
		 * 解锁
		 * 
		 * 1. 物品位置非法
		 * 2. 物品不是装备
		 * 3. 装备无法合成
		 * 4. 银两不足
		 * 5. 物品不足
		 * 6. 不在一个有效等级段内
		 * 7. 服务器bug
		 */
		private function onCombineEquipmentFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var error : int = buffer.readVarint32();
			var fail : String;
			switch(error)
			{
				case 1:
					fail = LangEquip.COMBINE_FAIL_1;
					break;
				case 2:
					fail = LangEquip.COMBINE_FAIL_2;
					break;
				case 3:
					fail = LangEquip.COMBINE_FAIL_3;
					break;
				case 4:
					fail = LangEquip.COMBINE_FAIL_4;
					break;
				case 5:
					fail = LangEquip.COMBINE_FAIL_5;
					break;
				case 6:
					fail = LangEquip.COMBINE_FAIL_6;
					break;
				case 7:
					fail = LangEquip.COMBINE_FAIL_7;
					break;
			}
			NoticeManager.showNotify(fail, error);
		}
		/**
		 * 装备合成完成，可能没有合成出物品
		 *
		 * 解锁
		 *
		 * varint32 装备在背包中的位置
		 *
		 * boolean 合成成功
		 *
		 * if(合成成功){
		 *      合成成功，客户端将新的装备覆盖旧的装备，并且根据需要进行提示
		 *      bytes GoodsProto
		 * } else {
		 *      合成失败
		 *      boolean 装备是否绑定
		 * }
		 */
		private function onCombineEquipment(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var pos : int = buffer.readVarint32();
			var bool : Boolean = buffer.readBoolean();
			var itemInfo : EquipInfo;
			if(bool)
			{
				var goods : GoodsProto = new GoodsProto();
				goods.mergeFrom(buffer);
				itemInfo = ItemUtil.convertGoodsProtoToItemInfo(goods) as EquipInfo;
				itemInfo.setIndex( pos );
				BackPackManager.instance.addItem(itemInfo);
			}else
			{
				itemInfo = BackPackManager.instance.getItemInfoByIndex(pos) as EquipInfo;
				if(itemInfo)
					itemInfo.binded = buffer.readBoolean();
			}
			EventManager.dispatchEvent(EquipEvent.EQUIP_PANEL_UPDATE);
			EventManager.dispatchEvent(EquipEvent.EQUIP_COMBINE_COMBPLETE,itemInfo,bool);
		}
		/**
		 * 
		 * @param buffer
		 *  1. 无法合成
         * 2. 合成数量非法
         * 3. 背包格子不够
         * 4. 物品不够
         * 5. 物品位置非法
         * 6. 银两不足
		 */		
		private function onCombineMaterialFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var error : int = buffer.readVarint32();
			var fail : String;
			switch(error)
			{
				case 1:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_1;
					break;
				case 2:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_2;
					break;
				case 3:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_3;
					break;
				case 4:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_4;
					break;
				case 5:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_5;
					break;
				case 6:
					fail = LangEquip.COMBINE_MATERIAL_FAIL_6;
					break;
			}
			NoticeManager.showNotify(fail, error);
		}
		
		/**
		 * 合成完成
		 *
		 * boolean true[合成成功] / false[合成失败]
		 *
		 * if(合成成功){
		 *      varint32 合成后的id
		 *      varint32 数量
		 * }
		 */
		private function onCombineMaterial(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var boolean : Boolean = buffer.readBoolean();
			EventManager.dispatchEvent(EquipEvent.EQUIP_PANEL_UPDATE);
			var itemInfo : ItemInfo;
			if(boolean)
			{
				var id : int = buffer.readVarint32();
				var count : int = buffer.readVarint32();
				itemInfo = new ItemInfo(id);
				itemInfo.count = count;
			}
			EventManager.dispatchEvent(EquipEvent.EQUIP_COMBINE_COMBPLETE,itemInfo,boolean);
			
		}
		/**
		 * 装备打造成功广播
		 *
		 * varint32 装备id
		 * varint32 装备品质(Quality)
		 * varint32 装备评价(Evaluate)
		 * varint64 打造者的id
		 * bytes 打造者的名字
		 */	
		private function onBuildEquipBroadcast(buffer : ByteBuffer):void
		{
			var equipId : int = buffer.readVarint32();
			var quality : int = buffer.readVarint32();
			var evaluate : int = buffer.readVarint32();
			var makeId : Number = buffer.readVarint64();
			var makeName : String = BytesUtil.bytes2UTF(buffer);
			NoticeManager.showNotify(LangEquip.BUILD_BROADCAST,makeName,ItemCfgData.getItemName(equipId));
		}
		
		/**
		 * 装备打造失败，返回varint32错误码
		 * 解锁
		 *
		 * 1. 背包空位不足
		 * 2. 装备不存在，无法打造
		 * 3. 服务器bug
		 * 4. 物品不够
		 * 5. 物品位置非法
		 * 6. 银两不够
		 * 7. 装备无法打造
		 */
		private function onBuildEquipFail(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var errorId : int = buffer.readVarint32();
			var fail : String;
			switch(errorId)
			{
				case 1:
					fail = LangEquip.BUILD_FAIL_1;
					break;
				case 2:
					fail = LangEquip.BUILD_FAIL_2;
					break;
				case 3:
					fail = LangEquip.BUILD_FAIL_3;
					break;
				case 4:
					fail = LangEquip.BUILD_FAIL_4;
					break;
				case 5:
					fail = LangEquip.BUILD_FAIL_5;
					break;
				case 6:
					fail = LangEquip.BUILD_FAIL_6;
					break;
				case 7:
					fail = LangEquip.BUILD_FAIL_7;
					break;
			}
			NoticeManager.showNotify(fail, errorId);
		}
		/**
		 * 打造成功 
		 * @param buffer
		 * 
		 */		
		private function onBuildEquipMent(buffer : ByteBuffer):void
		{
			EquipBaseManager.lockSend = false;
			var index: int = buffer.readVarint32();
			var equip : GoodsProto = new GoodsProto();
			equip.mergeFrom(buffer);
			var equipInfo : EquipInfo = ItemUtil.convertGoodsProtoToItemInfo(equip) as EquipInfo;
			equipInfo.setContainerId(ItemContainerID.BackPack);
			BackPackManager.instance.setItemByIndex(index,equipInfo);
			EventManager.dispatchEvent(EquipEvent.EQUIP_PANEL_UPDATE);
			EventManager.dispatchEvent(EquipEvent.EQUIP_MAKE_COMPLETE,equipInfo);
		}
	}
}
