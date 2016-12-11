package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.utils.RaceUtil;
	import com.rpgGame.coreData.cfg.ShopCfgData;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.role.RoleEquipInfo;
	import com.rpgGame.coreData.type.SexType;
	import com.rpgGame.coreData.type.item.EquipmentPos;
	
	import app.message.EquipType;
	import app.message.EquipmentDataProto;
	import app.message.GoodsType;
	import app.message.ContainerProto.ContainerType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 角色穿戴装备
	 * @author wewell
	 */
	public class RoleEquipmentManager extends GoodsContainerMamager
	{
		public static const COUNT:int = 12;
		private var typeToPosMap:HashMap;
		
		public function RoleEquipmentManager()
		{
			super(ItemContainerID.Role)
			
			typeToPosMap = new HashMap();
			typeToPosMap.add(EquipType.ARMOR, EquipmentPos.POS_ARMOR);
			typeToPosMap.add(EquipType.WEAPON, EquipmentPos.POS_WEAPON);
			typeToPosMap.add(EquipType.SECOND_WEAPON, EquipmentPos.POS_SECOND_WEAPON);
			typeToPosMap.add(EquipType.HELM, EquipmentPos.POS_HELM);
			typeToPosMap.add(EquipType.BRACER, [EquipmentPos.POS_LEFT_BRACER, EquipmentPos.POS_RIGHT_BRACER]);
			typeToPosMap.add(EquipType.NECKLACE, EquipmentPos.POS_NECKLACE);
			typeToPosMap.add(EquipType.SHOE, EquipmentPos.POS_SHOE);
			typeToPosMap.add(EquipType.RING, [EquipmentPos.POS_LEFT_RING, EquipmentPos.POS_RIGHT_RING]);
			typeToPosMap.add(EquipType.BELT, EquipmentPos.POS_BELT);
			
			initEquipments(MainRoleManager.actorInfo.equipInfo);
		}
		
		private static var _ins:RoleEquipmentManager;
		public static function get instance():RoleEquipmentManager
		{
			if(_ins == null)
			{
				_ins = new RoleEquipmentManager();
			}
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
		
		public function initEquipments( equipInfo:RoleEquipInfo ):void
		{
			var equipments:Array = new Array(COUNT);
			for(var i:int=0; i<COUNT; i++)
			{
				equipments[i] = equipInfo.getItemInfoByPos(i);
			}
			setAllItem(equipments);
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
			{
				b = tar.indexOf(pos) != -1;
			}else
			{
				b = pos == int(tar);
			}
			return b;
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
			if(pos is Array)
			{
				var index1:int = pos[0];
				var index2:int = pos[1];
				var equip1:EquipInfo = items[index1];
				var equip2:EquipInfo = items[index2];
				if(equip1 == null)
				{
					return index1;
				}else if(equip2 == null)
				{
					return index2;
				}else{
					var equip:EquipInfo = item as EquipInfo;
					var lowIndex:int = equip1.fighting_amount >= equip2.fighting_amount ? index2 : index1;
					var lowEquip:EquipInfo = items[lowIndex];
					if(lowEquip.fighting_amount < equip.fighting_amount)return lowIndex;
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
				}else if(equip2 == null)
				{
					return true;
				}else if(equip != null){
					var lowIndex:int = equip1.fighting_amount >= equip2.fighting_amount ? index2 : index1;
					var lowEquip:EquipInfo = items[lowIndex];
					if(lowEquip.fighting_amount < equip.fighting_amount)return true;
				}
				return false;
			}
			equip1 = items[pos];
			return equip1 ==  null || equip1.fighting_amount < equip.fighting_amount;
		}
		
		override public function setItemByIndex(index:int, info:ItemInfo):void
		{
			super.setItemByIndex(index, info);
			if(info != null)
			{
				MainRoleManager.actorInfo.equipInfo.add(index, info);
				EventManager.dispatchEvent(ItemEvent.ITEM_WEARED_PERSON_EQUIP, info);
			}else{
				info = MainRoleManager.actorInfo.equipInfo.remove(index) as ItemInfo;
				EventManager.dispatchEvent(ItemEvent.ITEM_TOOK_OFF_PERSON_EQUIP, info);
			}
		}
		
		public function getRepairAllMoney():int
		{
			var items:Array = getAllItem();
			var money:int;
			for each(var equip:EquipInfo in items)
			{
				if(!equip)continue;
				money += equip.used_durability*ShopCfgData.buyBackCapacity*ShopCfgData.durabilityRepairCost;
			}
			return money;
		}
		
		public static function equipIsWearing(equip:ItemInfo):Boolean
		{
			if(!equip)
				return false;
			if(equip.containerID != ContainerType.HERO_EQUIPMENT)
				return false;
			var items:Array = instance.getAllItem();
			for each(var roleEquip : EquipInfo in items)
			{
				if(roleEquip && roleEquip.cfgId == equip.cfgId && roleEquip.index == equip.index)
					return true;
			}
			return false;
		}
		
		public static function canPutOnEquipAt(item:ItemInfo, pos:int, tip:Boolean=true):Boolean
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
			if(!isSuitRace(equip.race))
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_RACE, [RaceUtil.getRaceTitle(equip.race)]);
				return false;
			}
			var lv:int = ItemCfgData.getItemRequireLevel(item.cfgId);
			if(lv > MainRoleManager.actorInfo.totalStat.level)
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_LEVEL, [ lv ]);
				return false;
			}
			return true;
		}
		
		public static function isSuitSex(equipSex:int):Boolean
		{
			if(equipSex == 0)return true;
			var sex:int = MainRoleManager.actorInfo.sex ? SexType.MALE : SexType.FEMALE;
			return equipSex == sex;
		}
		
		public static function isSuitRace(job:int):Boolean
		{
			if(job == 0 || instance.getItemInfoByIndex(EquipmentPos.POS_SECOND_WEAPON) == null)return true;
			return job == MainRoleManager.actorInfo.job;
		}
	}	
}


