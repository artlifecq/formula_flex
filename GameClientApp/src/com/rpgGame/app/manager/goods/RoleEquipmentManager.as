package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.type.SexType;
	import com.rpgGame.coreData.type.item.EquipmentPos;
	
	import app.message.EquipType;
	import app.message.GoodsType;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * 角色穿戴装备
	 * @author wewell
	 */
	public class RoleEquipmentManager extends GoodsContainerMamager
	{
		public static const COUNT:int = 10;
		private var typeToPosMap:HashMap;
		
		public function RoleEquipmentManager()
		{
			super(ItemContainerID.Role)
			typeToPosMap = new HashMap();
			typeToPosMap.add(EquipType.WEAPON, EquipmentPos.POS_WEAPON);
			typeToPosMap.add(EquipType.HELM, EquipmentPos.POS_HELM);
			typeToPosMap.add(EquipType.ARMOR, EquipmentPos.POS_ARMOR);
			typeToPosMap.add(EquipType.LEGHARNESS,EquipmentPos.POS_LEGHARNESS);
			typeToPosMap.add(EquipType.SHOE, EquipmentPos.POS_SHOE);
			typeToPosMap.add(EquipType.SCAPULA, EquipmentPos.POS_SCAPULA);
			typeToPosMap.add(EquipType.RING,EquipmentPos.POS_RING);
			typeToPosMap.add(EquipType.NECKLACE,EquipmentPos.POS_NECKLACE);
			typeToPosMap.add(EquipType.BRACER,EquipmentPos.POS_BRACER);
			typeToPosMap.add(EquipType.JADE,EquipmentPos.POS_JADE);
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
		
		
		/**
		 *此件装备是否合适放在pos位置上 
		 */		
		public function isEquipSuitablePos(item:ClientItemInfo, pos:int):Boolean
		{
			var type:int = ItemConfig.getItemType(item.cfgId);
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
		 * 
		 * @param index EquipType的值
		 * @return 
		 * 
		 */
		public function getEquipInfoByIndex(equipType:int):ClientItemInfo
		{
			return goodsList[equipType];
		}
		
		
		/**
		 * 智能分析该装备穿戴到的最合适的位置 
		 * @param item
		 * @return 
		 * 
		 */		
		public function getEquipPos(item:ClientItemInfo):int
		{
			var type:int = ItemConfig.getItemType(item.cfgId);
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
		public function getEquipByPos(pos:int):EquipInfo
		{
			var items:Array = getAllItem();
			for each (var equ:ClientItemInfo in items) 
			{
				if (!equ) 
				{
					continue;
				}
				if (equ.qItem.q_kind==pos) 
				{
					return equ as EquipInfo;
				}
			}
			return null;
		}
		public function isBetterEquipCompareWithEquiped(item:ClientItemInfo):Boolean
		{
			if((item.qItem.q_job==0||item.qItem.q_job==MainRoleManager.actorInfo.job)&&item.qItem.q_level<=MainRoleManager.actorInfo.totalStat.level)
			{
				var equ:EquipInfo=getEquipByPos(item.qItem.q_kind);
				if (!equ||equ.itemInfo.fightPower<item.itemInfo.fightPower) 
				{
					return true;
				}
			}
			return false;
		}
		/**
		 * 是否比身上穿的要好 ?没看懂，用上面的吧
		 * @param item
		 * @return 
		 * 
		 */		
		public function isBetterEquip(item:ClientItemInfo):Boolean
		{
			var type:int = ItemConfig.getItemType(item.cfgId);
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
		
		override public function setItemByIndex(index:int, info:ClientItemInfo):void
		{
			super.setItemByIndex(index, info);
			/*if(info != null)
			{
			MainRoleManager.actorInfo.equipInfo.add(index, info);
			EventManager.dispatchEvent(ItemEvent.ITEM_WEARED_PERSON_EQUIP, info);
			}else{
			info = MainRoleManager.actorInfo.equipInfo.remove(index) as ClientItemInfo;
			EventManager.dispatchEvent(ItemEvent.ITEM_TOOK_OFF_PERSON_EQUIP, info);
			}*/
		}
		
		public function getRepairAllMoney():int
		{
			return 0;
		}
		
		public static function equipIsWearing(equip:ClientItemInfo):Boolean
		{
			if(!equip)
				return false;
			var items:Array = instance.getAllItem();
			for each(var roleEquip : ClientItemInfo in items)
			{
				if( roleEquip&&roleEquip.itemInfo.itemId.ToGID()==equip.itemInfo.itemId.ToGID())
					return true;
			}
			return false;
		}
		
		public static function isEquip(type:int):Boolean
		{
			if(type==GoodsType.EQUIPMENT||type==GoodsType.EQUIPMENT1||GoodsType.EQUIPMENT2){
				return true;
			}
			return false;
		}
		
		public static function canPutOnEquipAt(item:ClientItemInfo, pos:int, tip:Boolean=true):Boolean
		{
			if(!item || !isEquip(item.type) || !instance.isEquipSuitablePos(item, pos))
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_POS);
				return false;
			}
			//装备其它属性检测
			var sex:int=ItemConfig.getItemSex(item.cfgId);
			var race:int=ItemConfig.getItemRace(item.cfgId);
			if(!isSuitSex(sex))
			{
				if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_SEX, [SexType.getName(sex)]);
				return false;
			}
			/*	if(!isSuitRace(race))
			{
			if(tip)NoticeManager.showHint(EnumHintInfo.EQUIPMENT_ERROR_RACE, [RaceUtil.getRaceTitle(race)]);
			return false;
			}*/
			var lv:int = ItemConfig.getItemRequireLevel(item.cfgId);
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
	}	
}


