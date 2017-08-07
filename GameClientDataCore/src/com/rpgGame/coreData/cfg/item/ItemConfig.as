package com.rpgGame.coreData.cfg.item
{
	import com.game.mainCore.core.utils.TextFormatUtil;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	
	import flash.utils.ByteArray;
	
	import app.message.GoodsType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *物品数据配置
	 * @author dik
	 * 
	 */
	public class ItemConfig
	{
		public function ItemConfig()
		{
		}
		
		private static var _datas:HashMap;
		
		public static function setup( data:ByteArray ):void
		{
			_datas = new HashMap();
			
			var arr : Array = data.readObject();
			
			for each(var info : Q_item in arr)
			{
				_datas.add(info.q_id,info);
			}
		}
		
		public static function getAllItems():Array
		{
			return _datas.getValues();
		}
		
		public static function getItemsByType(type:int):Array
		{
			var arr:Array = [];
			for each (var item:Q_item in _datas.getValues())
			{
				if (item.q_type == type)
				{
					arr.push(item);
				}
			}
			return arr;
		}

		
		/**
		 * 通过id获取物品信息
		 * @param id
		 * @return 
		 * 
		 */
		public static function getQItemByID(id:int):Q_item
		{
			return _datas.getValue(id);
		}
	
		
		/**
		 *通过id获取物品名称 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemName(id:int):String
		{
			if(hasItemCfg(id)==false){
				return null;
			}
			return getQItemByID(id).q_name;
		}
		
		/**
		 * 通过id获取物品品质
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemQuality(id:int):int
		{
			var item:Q_item=getQItemByID(id);
			if(item)
			{
				return item.q_default;
			}
			return 0;
		}
		
		/**
		 * 通过id获取物品类型
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemType(id:int):int
		{
			return getQItemByID(id).q_type;
		}
		/**
		 * 获得药品的子类型 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getItemLocation(id:int):int
		{
			return getQItemByID(id).q_location;
		}
		
		/**
		 * 通过id获取物品描述
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemDesc(id:int):String
		{
			return getQItemByID(id).q_describe;
		}
		
		/**
		 * 通过id获取最大堆叠数
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemMaxCount( id:int):int
		{
			return getQItemByID(id).q_max;
		}
		
		/**
		 * 通过id获取物品公共冷却层级 
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemCdType(id:int) : int
		{
			return getQItemByID(id).q_cooldown_level;
		}
		
		/**
		 *  通过id获取物品icon
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemIcon(id:int) : String
		{
			return getQItemByID(id).q_icon.toString();
		}
		
		/**
		 *  通过id获取物品最低需求等级
		 * @param id
		 * @return 
		 * 
		 */
		public static function getItemRequireLevel(id:int) : int
		{
			var item:Q_item=getQItemByID(id);
			if(item)
			{
				return item.q_level;
			}
			return 0;
		}
		
		/**
		 * 通过id获取物品品质颜色文本
		 * @param cfgId
		 * @return 
		 * 
		 */
		public static function getItemNameWithQualityColor(cfgId:int):String
		{
			var cloor:uint = getItemQualityColor(cfgId);
			var itemName:String = getItemName(cfgId);
			return TextFormatUtil.getColorSizeText(itemName,cloor,14);
		}
		
		/** 物品品质颜色 */
		public static function getItemQualityColor(cfgId:int) : int
		{
			var quality:int = getItemQuality(cfgId);
			return ItemQualityType.getColorValue(quality);
		}
		
		public static function hasItemCfg(cfgId:int):Boolean
		{
			return getQItemByID(cfgId) != null;
		}
		
		/**
		 *物品需要的性别 
		 * @param cfgId
		 * @return 
		 * 
		 */
		public static function getItemSex(cfgId:int):int
		{
			return getQItemByID(cfgId).q_sex;
		}
		
		/**
		 *物品属性 
		 * @param cfgId
		 * @return 
		 * 
		 */
		public static  function getItemRace(cfgId:int):int
		{
			return int(getQItemByID(cfgId).q_att_type);
		}
		
		/**
		 * 获得药品的作用效果 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getMedicEfficacy(cfgId:uint):int
		{
			return 0;
		}
		
		
		
		/**
		 * 判断当前物品是否为加血药水
		 * @param cfgId
		 * @return 
		 * 
		 */
		public static function isAddHpItem(cfgId:int):Boolean
		{
			if (getItemType(cfgId) == GoodsType.MEDICINE && getItemLocation(cfgId) == 1)
			{
				return true;
			}
			return false;
		}
		/**
		 * 判断当前物品是否为复活类型
		 */
		public static function isResurgenceItem(cfgId:int):Boolean
		{
			if (getItemType(cfgId) == GoodsType.RESURGENCE)
			{
				return true;
			}
			return false;
		}
		/**
		 * 获取分组ID 
		 * @param cfgId
		 * @return 
		 * 
		 */		
		public static function getMaterialDataGroup(cfgId:int):int
		{
			return 0;
		}
		
		public static function getItemLevelNum(itemId:int):int
		{
			var qItem:Q_item=getQItemByID(itemId);
			if (qItem) 
			{
				return qItem.q_levelnum;
			}
			return 0;
		}
	}
}