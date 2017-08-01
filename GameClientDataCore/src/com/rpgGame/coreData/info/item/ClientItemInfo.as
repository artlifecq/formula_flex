package com.rpgGame.coreData.info.item
{
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;


	/**
	 * 该类是客户端封装的物品信息类
	 * 物品信息类
	 */
	public class ClientItemInfo extends BaseFaceInfo
	{
		private var _itemInfo:ItemInfo;
		private var _qItem:Q_item;

		public function ClientItemInfo(cfgId : int = 0)
		{
			super(cfgId, type, FaceTypeEnum.ITEM);
			qItem=ItemConfig.getQItemByID(cfgId);
		}
		
		
		public function set qItem(value:Q_item):void
		{
			_qItem = value;
		}

		public function get qItem():Q_item
		{
			return _qItem;
		}

		public function get itemInfo():ItemInfo
		{
			return _itemInfo;
		}

		public function set itemInfo(value:ItemInfo):void
		{
			_itemInfo = value;
			updateParameters();
		}
	
		/**
		 *更新参数 
		 * 
		 */
		public function updateParameters():void
		{
			
		}
		
		override public function set cfgId(value:int):void
		{
			//_cfgId = value;
			super.cfgId=value;
			_qItem=ItemConfig.getQItemByID(cfgId);
		}

		/**
		 *价格 
		 * @return 
		 * 
		 */
		public function get price():Boolean
		{
			return _qItem?_qItem.q_buy_price:0;
		}
		
		/**
		 *是否绑定 
		 * @return 
		 * 
		 */
		public function get binded():Boolean
		{
			return _itemInfo?_itemInfo.isbind:false;
		}
		

		/** 物品过期时间，0表示没有过期时间  s为单位*/
		public function get expireTime() : Number
		{
			return _itemInfo?_itemInfo.lostTime:0;
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

		/**
		 * 物品唯一标识
		 * @return
		 */
		public function get tag() : String
		{
			return cfgId + "_" + expireTime;
		}

		/** 判断两个道具是否是同一个 **/
		public function isSame($item : ClientItemInfo) : Boolean
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

		public function get level() : int
		{
			return ItemConfig.getItemRequireLevel(cfgId);
		}
		
		public function get group() : int
		{
			return ItemConfig.getMaterialDataGroup(cfgId);
		}
		
		//-----------------------------------------------------------------------------------------
		/**
		 * 获取图标Bitmap
		 */
		override public function get icoName() : String
		{
			if (!_icoName)
				_icoName=this._qItem.q_icon.toString();
			return _icoName;
		}

		override public function get type() : int
		{
			if(!_qItem){
				return -1;
			}
			return this._qItem.q_type;
		}

		override public function get quality() : int
		{
			if (_qItem)
				_quality=_qItem.q_default;
				return _quality;
		}

		override public function get name() : String
		{
			if(!_qItem){
				return "";
			}
			
			_name=_qItem.q_name;
			return _name;
		}


		public function get desc() : String
		{
			return ItemConfig.getItemDesc(cfgId);
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
		
		public function clone():ClientItemInfo
		{
			return null
		}
	}
}
