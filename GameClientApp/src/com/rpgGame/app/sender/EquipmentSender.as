package com.rpgGame.app.sender
{
	import com.rpgGame.app.utils.UpgradeUtil;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	
	import app.cmd.EquipmentModuleMessages;
	import app.message.UpgradeProto;
	
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 装备相关数据请求 
	 * @author wewell@163.com
	 * moduleId == 6
	 */	
	public class EquipmentSender extends BaseSender
	{
		public function EquipmentSender()
		{
		}
		
		/**
		 * 移动装备，包括穿装备，脱装备，替换装备，发送C2S_MOVE_EQUIPMENT，附带以下信息
		 * varint32 背包位置
		 * varint32 装备位置，0-武器 1-帽子 2-衣服 3-鞋子 4-项链 5-手镯
		 * 成功返回S2C_MOVE_EQUIPMENT，附带以下信息
		 * varint32 背包位置
		 * varint32 装备位置
		 *
		 * 客户端根据背包位置和装备位置，互换2个位置的物品，如果其中一个位置没有物品，则将物品从原来的位置移到另一边
		 * 注意：如果背包中的装备是没有绑定，则穿上后，客户端将该装备设置成已绑定物品，服务器不会发消息通知
		 *
		 * 装备成功后服务器会发送一条英雄属性变更消息，更新英雄的最新属性，消息内容参考人物属性文档
		 */
		public static function moveEquipment(backpackIndex:int, roleEquipPos:int):void
		{
			_bytes.clear();
			_bytes.writeVarint32(backpackIndex);
			_bytes.writeVarint32(roleEquipPos);
		}
		
		/**
		 * 材料合成
		 *
		 * varint32 材料合成id[CombineDataProto.id]
		 *
		 * varint32 合成材料数量
		 *
		 * UpgradeProto 材料合成需要的消耗[CombineDataProto.upgrade_data]
		 */
		public static function combineMaterial(id:int,count:int,upgradeProto:UpgradeProto):void
		{
			_bytes.clear();
			_bytes.writeVarint32(id);
			_bytes.writeVarint32(count);
			var upgrade : UpgradeProtoInfo = new UpgradeProtoInfo(upgradeProto);
			upgrade.count = count;
			_bytes.writeBytes(UpgradeUtil.getUpgradeItemListVo(upgrade).getByte());
			send(EquipmentModuleMessages.C2S_COMBINE_MATERIAL,_bytes);
		}
		/**
		 * 装备合成
		 *
		 * 锁定，在此期间不要发送合成消息了
		 *
		 * bool 是否使用银两代替绑银, true 使用银两代替，false 不使用银两代替
		 *
		 * varint32 中间装备在背包中的位置
		 *
		 * for(buffer.readable()){
		 *      varint32 四周的装备在背包中的位置
		 * }
		 */
		public static function combineEquipment(mainPos : int , items:Array,useBind:Boolean):void
		{
			_bytes.clear();
			_bytes.writeBoolean(useBind);
			_bytes.writeVarint32(mainPos);
			var itemInfo : ItemInfo;
			for each(itemInfo in items)
			{
				_bytes.writeVarint32(itemInfo.index);
			}
			send(EquipmentModuleMessages.C2S_COMBINE_EQUIPMENT,_bytes);
		}
		/**
		 * 请求升星
		 *
		 * varint32 升星id
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
		 * varint32 容器位置
		 * varint32 升星的装备[防止在此期间变动]
		 *
		 * UpgradeProto 升星所需要的消耗
		 */
		public static function refineEquipment(refine : int,costBytes:ByteBuffer,containerId : int,pos:int,cfgId : int,index:int = 0):void
		{
			_bytes.clear();
			_bytes.writeVarint32(refine);
			ItemUtil.writeContainerToBytes(_bytes,containerId,index);
			_bytes.writeVarint32(pos);
			_bytes.writeVarint32(cfgId);
			_bytes.writeBytes(costBytes);
			send(EquipmentModuleMessages.C2S_REFINE_EQUIPMENT,_bytes);
		}
		/**
		 * 装备拆解
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
		 * varint32 装备id，防止拆解错误
		 * bool 使用银两替代绑银
		 */
		public static function destoryEquipment(containerId : int,pos:int,cfgId : int,usebind:Boolean,index = 0):void
		{
			_bytes.clear();
			ItemUtil.writeContainerToBytes(_bytes,containerId,index);
			_bytes.writeVarint32(pos);
			_bytes.writeVarint32(cfgId);
			_bytes.writeBoolean(usebind);
			send(EquipmentModuleMessages.C2S_DESTROY_EQUIPMENT,_bytes);
		}
		/**
		 * 请求打造装备
		 * 发送该消息加锁，在未收到S2C_BUILD_EQUIPMENT或S2C_BUILD_EQUIPMENT_FAIL的一定时间内一直保持该锁
		 * 
		 * varint32 装备id
		 * varint32 材料等级数量
		 * for(i->材料等级数量){
		 *      varint32 材料i等级
		 * }
		 * 
		 * bool 是否使用银两代替绑银, true 使用银两代替，false 不使用银两代替
		 * 
		 * for(buffer.readable()){
		 *      varint32 背包中的位置
		 *      varint32 物品的数量
		 * }
		 */
		public static function makeEquipment(equipId : int,materials : Array,useBind:Boolean,items:Array):void
		{
			_bytes.clear();
			_bytes.writeVarint32(equipId);
			var len : int = materials.length;
			var i : int = 0;
			_bytes.writeVarint32(len);
			for(;i<len;i++)
			{
				_bytes.writeVarint32(materials[i]);
			}
			_bytes.writeBoolean(!useBind);
			i=0;
			len = items.length;
			var item : ItemInfo;
			for(;i<len;i++)
			{
				item = items[i];
				if(!item)
					continue;
				_bytes.writeVarint32(item.index);
				_bytes.writeVarint32(item.count);
			}
			send(EquipmentModuleMessages.C2S_BUILD_EQUIPMENT,_bytes);
		}
		/**
		 * 名将改造
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
		 * varint32 装备id[防止发错]
		 *
		 * varint32 改造id
		 * UpgradeProto 改造的消耗需要的数据
		 */
		public static function equipGeneralChange(equip:EquipInfo,generalId : int,upgrade:ByteBuffer):void
		{
			_bytes.clear();
			ItemUtil.writeContainerToBytes(_bytes,equip.containerID);
			_bytes.writeVarint32(equip.index);
			_bytes.writeVarint32(equip.cfgId);
			_bytes.writeVarint32(generalId);
			_bytes.writeBytes(upgrade);
			send(EquipmentModuleMessages.C2S_CHANGE_EQUIPMENT_GENERAL,_bytes);
		}
	}
}