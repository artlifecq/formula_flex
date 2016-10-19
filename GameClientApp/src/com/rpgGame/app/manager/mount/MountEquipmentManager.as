package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.type.SexType;
	import com.rpgGame.coreData.type.mount.MountEquipmentPos;
	
	import app.message.EquipType;
	import app.message.EquipmentDataProto;
	import app.message.GoodsType;
	import app.message.ContainerProto.ContainerType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 坐骑装备穿戴管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountEquipmentManager extends GoodsContainerMamager
	{
		private static var _ins:MountEquipmentManager;
		/** 装备格子数量 **/
		public static const COUNT:int = 6;
		/** 玩家所有坐骑数据 **/
		private var mountInfoDataVec:Vector.<MountInfoData>;
		/** 坐骑装备位置hash **/
		private var typeToPosMap:HashMap;
		
		public function MountEquipmentManager()
		{
			super(ItemContainerID.Mount);
			typeToPosMap = new HashMap();
			typeToPosMap.add( EquipType.SADDLE, MountEquipmentPos.POS_SADDLE );
			typeToPosMap.add( EquipType.STIRRUP, MountEquipmentPos.POS_STIRRUP );
			typeToPosMap.add( EquipType.REIN, MountEquipmentPos.POS_REIN );
			typeToPosMap.add( EquipType.HOOF, MountEquipmentPos.POS_HOOF);
			typeToPosMap.add( EquipType.VISOR, MountEquipmentPos.POS_VISOR );
			typeToPosMap.add( EquipType.WHIP, MountEquipmentPos.POS_WHIP );
			initMountEquipments();
		}
		
		public static function get instance():MountEquipmentManager
		{
			if(_ins == null)
				_ins = new MountEquipmentManager();
			return _ins;
		}
		
		/**
		 * 是否为待解锁格 
		 * @param index
		 * 
		 */		
		override public function isUnlock(index:int):Boolean
		{
			return false;
		}
		
		/**
		 * 初始化坐骑装备 
		 * 
		 */		
		private function initMountEquipments():void
		{
			var equipments:Array = new Array( COUNT );
			mountInfoDataVec = MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec;
		}
		
		/**
		 * 通过坐骑槽的idx获取该槽位的坐骑的装备数据 
		 * @param idx
		 * @return 
		 * 
		 */		
		public function getMountEquipsByIdx(idx:int):Array
		{
			var equipments : Array = new Array( COUNT );
			if( mountInfoDataVec == null )return null;
			for each (var data:MountInfoData in mountInfoDataVec ) 
			{
				if(data.idx != idx)continue;
				for(var i:int=0; i<COUNT; i++)
				{
					if( data.mountEquipInfo != null )
					{
						equipments[i] = data.mountEquipInfo.getItemInfoByPos(i);
					}
				}
			}
			return equipments;
		}
		
		/**
		 * 刷新坐骑装备显示 
		 * 
		 */		
		public function updateMountEquipList():void
		{
			setAllItem(getMountEquipsByIdx(MountManager.curSelectIdx ));
		}
		
		/**
		 * 智能分析该装备穿戴到的最合适的位置 
		 * @param item
		 * @return 
		 * 
		 */		
		public function getEquipPos(item:ItemInfo):int
		{
			var type:int = ItemCfgData.getEquipmentType(item.cfgId);
			var pos:* = typeToPosMap.getValue(type);
			var items:Array = getAllItem();
			if( pos is Array )
			{
				var index1:int = pos[0];
				var index2:int = pos[1];
				var equip1:EquipInfo = items[index1];
				var equip2:EquipInfo = items[index2];
				if( equip1 == null )
				{
					return index1;
				}
				else if( equip2 == null )
				{
					return index2;
				}
				else
				{
					var equip:EquipInfo = item as EquipInfo;
					var lowIndex:int = equip1.fighting_amount >= equip2.fighting_amount ? index2 : index1;
					var lowEquip:EquipInfo = items[lowIndex];
					if( lowEquip.fighting_amount < equip.fighting_amount )return lowIndex;
					return index1;
				}
				return index1;
			}
			return pos;
		}
		
		/**
		 * 是否比身上穿的要好 
		 * @param item
		 * @return 
		 * 
		 */		
		public function isBetterEquip(item:ItemInfo):Boolean
		{
			var type:int = ItemCfgData.getEquipmentType(item.cfgId);
			var pos:* = typeToPosMap.getValue(type);
			var items:Array = getAllItem();
			var equip:EquipInfo = item as EquipInfo;
			if(!equip)return false;
			if(pos is Array)
			{
				var index1:int = pos[0];
				var index2:int = pos[1];
				var equip1:EquipInfo = items[index1];
				var equip2:EquipInfo = items[index2];
				if(equip1 == null)
				{
					return true;
				}
				else if(equip2 == null)
				{
					return true;
				}
				else if(equip != null)
				{
					var lowIndex:int = equip1.fighting_amount >= equip2.fighting_amount ? index2 : index1;
					var lowEquip:EquipInfo = items[lowIndex];
					if( lowEquip.fighting_amount < equip.fighting_amount )return true;
				}
				return false;
			}
			equip1 = items[pos];
			return equip1 ==  null || equip1.fighting_amount < equip.fighting_amount;
		}
		
		/**
		 * 设置装备的位置 
		 * @param index
		 * @param info
		 * 
		 */		
		override public function setItemByIndex(index:int, info:ItemInfo):void
		{
			super.setItemByIndex(index, info);
			
			if( mountInfoDataVec == null )
				return;
			for each (var mountData:MountInfoData in mountInfoDataVec) 
			{
				if( mountData.idx != MountManager.curSelectIdx )
					continue;
				
				if( info != null )
				{
					mountData.mountEquipInfo.add(index, info);
					EventManager.dispatchEvent(ItemEvent.ITEM_WEARED_MOUNT_EQUIP, info);
				}
				else
				{
					info = mountData.mountEquipInfo.remove(index) as ItemInfo;
					EventManager.dispatchEvent(ItemEvent.ITEM_TOOK_OFF_MOUNT_EQUIP, info);
				}
			}
		}
		
		/**
		 * 装备是否穿戴 
		 * @param equip
		 * @return 
		 * 
		 */	
		public function equipIsWearing(equip:ItemInfo):Boolean
		{
			if(!equip)
				return false;
			if(equip.containerID != ContainerType.MOUNT_EQUIPMENT)
				return false;
			var items:Array = instance.getAllItem();
			for each(var roleEquip : EquipInfo in items)
			{
				if(roleEquip && roleEquip.cfgId == equip.cfgId && roleEquip.index == equip.index)
					return true;
			}
			return false;
		}
		
		/**
		 * 检测能否穿戴装备 
		 * @param item 装备
		 * @param pos 位置
		 * @param tip 是否需要提示信息
		 * @return 
		 * 
		 */	
		public function canPutOnEquipAt(item:ItemInfo, pos:int, tip:Boolean=true):Boolean
		{
			if(!item || item.type != GoodsType.EQUIPMENT || !instance.isEquipSuitablePos(item, pos))
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_POS);
				return false;
			}
			
			//装备其它属性检测
			var equip:EquipmentDataProto = ItemCfgData.getEquipmentDataProto(item.cfgId);
			if(!isSuitSex(equip.sex))
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_SEX, [SexType.getName(equip.sex)]);
				return false;
			}
			//装备等级判断
			var lv:int = ItemCfgData.getItemRequireLevel( item.cfgId );
			if(!isSuitLv(lv))
			{
				if(tip)NoticeManager.showNotify( LangMount.MOUNT_TIP_42, lv );
				return false;
			}
			return true;
		}
		
		/**
		 * 判断是不是坐骑穿戴装备，还是人物穿戴的装备 
		 * @param item
		 * @return 
		 * 
		 */
		public function isMountEquipType( item:ItemInfo ):Boolean
		{
			var equipData:EquipInfo = item as EquipInfo;
			var isBool:Boolean = ( equipData.equipType == EquipType.SADDLE
				|| equipData.equipType == EquipType.STIRRUP
				|| equipData.equipType == EquipType.REIN
				|| equipData.equipType == EquipType.HOOF
				|| equipData.equipType == EquipType.VISOR
				|| equipData.equipType == EquipType.WHIP ) ? true : false;
			return isBool;
		}
		
		/**
		 *此件装备是否合适放在pos位置上 
		 */		
		public function isEquipSuitablePos(item:ItemInfo, pos:int):Boolean
		{
			var type:int = ItemCfgData.getEquipmentType(item.cfgId);
			var tar:* = typeToPosMap.getValue(type);
			var b:Boolean;
			if(tar is Array)
				b = tar.indexOf(pos) != -1;
			else
				b = pos == int(tar);
			return b;
		}
		
		/**
		 * 性别判断 
		 * @param equipSex
		 * @return 
		 * 
		 */		
		public function isSuitSex( equipSex:int ):Boolean
		{
			if( equipSex == 0 )return true;
			var mountInfoDataVec:Vector.<MountInfoData> = MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec;
			for each (var mountInfoData:MountInfoData in mountInfoDataVec) 
			{
				if( mountInfoData.idx != MountManager.curSelectIdx )
					continue;
				var sex:int = mountInfoData.sex ? SexType.MALE : SexType.FEMALE;
			}
			return equipSex == sex;
		}
		
		/**
		 * 等级判断 
		 * @param lv
		 * @return 
		 * 
		 */		
		public function isSuitLv( lv:int ):Boolean
		{
			var mountInfoDataVec:Vector.<MountInfoData> = MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec;
			for each (var mountInfoData:MountInfoData in mountInfoDataVec) 
			{
				if( mountInfoData.idx != MountManager.curSelectIdx )
					continue;
				var level:int = mountInfoData.mountLevel;
			}
			return level >= lv ? true : false;
		}
		
		/**
		 * 通过坐骑装备类型，获取坐骑装备对应的位置
		 * @param type 坐骑装备类型
		 * @return 
		 * 
		 */		
		public function getMountEquipPos( type:int ):int
		{
			return typeToPosMap.getValue( type );
		}
	}
}