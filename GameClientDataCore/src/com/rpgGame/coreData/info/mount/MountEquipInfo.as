package com.rpgGame.coreData.info.mount
{
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 坐骑穿戴装备信息 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountEquipInfo
	{
		private var _equips:HashMap;
		
		public function MountEquipInfo()
		{
			_equips = new HashMap();
		}
		
		/**
		 * 设置坐骑装备数据 
		 * @param proto
		 * 
		 */		
//		public function setMountEquipsProto( proto:EquipmentListProto ):void
//		{
//			_equips.clear();
//			var ep:EquipClientProto;
//			var item:ClientItemInfo;
//			for each( ep in proto.equipments )
//			{
////				item = ( ep && ep.equip ) ? ItemUtil.convertGoodsProtoToItemInfo( ep.equip ) : null;
//				if( item != null )
//				{
//					item.setIndex( ep.pos );
//					item.setContainerId( ItemContainerID.Mount );
//					_equips.add( ep.pos, item );
//				}
//			}
//		}
		
		/**
		 * 获取位置对应的装备信息 
		 * @param pos 装备位置
		 * return ItemInfo
		 * 
		 */	
		public function getItemInfoByPos( pos:int ):ClientItemInfo
		{
			return _equips.getValue( pos );
		}
		
		/**
		 *穿上 
		 * @param pos 装备位置
		 * @param item 
		 * 
		 */		
		public function add( pos:int, item:ClientItemInfo ):void
		{
			_equips.add( pos, item );
		}
		
		/**
		 * 脱下
		 * @param pos 装备位置
		 * 
		 */		
		public function remove( pos:int ):*
		{
			_equips.remove( pos );
		}
		
		/**
		 * 获取坐骑装备 
		 * @return 
		 * 
		 */		
		public function get equipHashMap():Array
		{
			return _equips.getValues();
		}
		
	}
}