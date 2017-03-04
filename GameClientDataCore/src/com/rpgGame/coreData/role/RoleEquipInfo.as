package com.rpgGame.coreData.role
{
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.item.EquipmentPos;
	
	import app.message.HeroEquipmentListProto;
	import app.message.EquipmentListProto.EquipClientProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *角色穿戴的装备信息 
	 * @author wewell@163.com
	 * 
	 */	
	public class RoleEquipInfo
	{
		private var _equips:HashMap;
		
		public function RoleEquipInfo()
		{
			_equips = new HashMap();
		}
		
		public function setEquipsProto(proto:HeroEquipmentListProto):void
		{
			_equips.clear();
			var ep:EquipClientProto;
			var item:ClientItemInfo;
			var clientIndex:int;
			for each(ep in proto.equipmentList.equipments)
			{
//				item = (ep && ep.equip) ? ItemUtil.convertGoodsProtoToItemInfo(ep.equip) : null;
				if(item != null)
				{
					//翻译成客户端下标
					clientIndex = EquipmentPos.getClientPos(ep.pos);
					item.setIndex( clientIndex );
					item.setContainerId( ItemContainerID.Role );
					_equips.add(clientIndex, item);
				}
			}
		}
		
		/**
		 * 获取位置对应的装备信息 
		 * @param pos 装备位置，见HeroEquipPos
		 * return ItemInfo
		 * 
		 */	
		public function getItemInfoByPos(pos:int):ClientItemInfo
		{
			return _equips.getValue(pos);
		}
		
		/**
		 *穿上 
		 * @param pos 装备位置，见HeroEquipPos
		 * @param item 
		 * 
		 */		
		public function add(pos:int, item:ClientItemInfo):void
		{
			_equips.add(pos, item);
		}
		
		/**
		 * 脱下
		 * @param pos 装备位置
		 * 
		 */		
		public function remove(pos:int):*
		{
			_equips.remove(pos);
		}
		
		
	}
}