package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;


	/**
	 * 物品信息类
	 */
	public class ItemInfo extends BaseFaceInfo
	{
		private var _expireTime : Number = 0;
		private var _duration : int = 0;
		/**从获得的那天的0点开始，获得多少天以后过期，客户端要刷新时间**/
//		public var expireDay : int = 0;
		/**物品标签，0-无特殊标签 1-全服唯一标签 2-非卖品 3-稀有**/
		public var tab : int = 0;
		//------------------------------------------
		public var binded : Boolean;
		private var _desc : String = null;

		/** 货币类型 */
		public var priceType : int = 0;
		/** 售价 */
		public var price : int = 0;
		/** 收税类型 */
		public var taxType : int = 0;

		public function ItemInfo(cfgId : int = 0, type : int = 0)
		{
			super(cfgId, type, FaceTypeEnum.ITEM);
		}

		/** 有效期，单位毫秒，0表示没有有效期*/
		public function get duration() : int
		{
			return _duration;
		}

		/**
		 * @private
		 */
		public function set duration(value : int) : void
		{
			_duration = value;
		}

		/** 物品过期时间，0表示没有过期时间  s为单位*/
		public function get expireTime() : Number
		{
			return _expireTime;
		}

		/**
		 * @private
		 */
		public function set expireTime(value : Number) : void
		{
			_expireTime = value;
		}

		/**
		 * 设置物品的动态属性
		 * @param expireTime
		 * @param count
		 *
		 */
		public function setItemInfoData(expireTime : Number, count : int) : void
		{
			expireTime = expireTime;
			count = count;
		}

		public function get getNormalUsableType() : int
		{
			return ItemCfgData.getNormalUsableType(cfgId);
		}

		public function get summonTokenType() : int
		{
			return ItemCfgData.getSummonTokenType(cfgId);
		}

		/**
		 * 物品唯一标识
		 * @return
		 */
		public function get tag() : String
		{
			return cfgId + "_" + expireTime;
		}

		/** 判断两个道具是否是同一个 **/
		public function isSame($item : ItemInfo) : Boolean
		{
			return tag == $item.tag;
		}

		public function getSelfName() : String
		{
			return super.name;
		}

		public function getSelfIco() : String
		{
			return super.icoName;
		}

		//-----------------------------------------------------------------------------------------
		/**
		 * 获取图标Bitmap
		 */
		override public function get icoName() : String
		{
			if (_icoName)
				return _icoName;
			return ItemCfgData.getItemIcon(cfgId);
		}

		override public function get type() : int
		{
			return ItemCfgData.getItemType(cfgId);
		}

		override public function get quality() : int
		{
			if (_quality)
				return _quality;
			return ItemCfgData.getItemQuality(cfgId);
		}

		override public function get name() : String
		{
			if (_name)
				return _name;
			return ItemCfgData.getItemName(cfgId);
		}

		public function get level() : int
		{
			return ItemCfgData.getItemRequireLevel(cfgId);
		}

		public function set desc(value : String) : void
		{
			_desc = value;
		}

		public function get desc() : String
		{
			if (_desc)
				return _desc;
			return ItemCfgData.getItemDesc(cfgId);
		}

		public function get sellPrize() : int
		{
			return ItemCfgData.getItemSellPrice(cfgId);
		}

		public function get group() : int
		{
			return ItemCfgData.getMaterialDataGroup(cfgId);
		}

		/**是否是贵重物品**/
		public function get isPreciousItem() : Boolean
		{
			return false;
		}

		/** 是否可以销毁**/
		public function get canDelete() : Boolean
		{
			return true;
		}

		public function clone() : ItemInfo
		{
			var itemInfo : ItemInfo;
			itemInfo = new ItemInfo(cfgId, ItemCfgData.getItemType(cfgId));
			itemInfo.setContainerId(containerID);
			itemInfo.cfgId = cfgId;
			itemInfo.name = ItemCfgData.getItemName(cfgId);
			itemInfo.expireTime = expireTime;
			itemInfo.count = count;
			itemInfo.setIndex(index);
			return itemInfo;
		}
	}
}
