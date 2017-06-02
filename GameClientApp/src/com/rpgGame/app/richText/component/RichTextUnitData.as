package com.rpgGame.app.richText.component
{
	
	/**
	 * 富文本元素的实例数据
	 * @author GuoDong.Zhang
	 * 创建时间：2016-7-4 下午4:36:22
	 * 
	 */
	public class RichTextUnitData
	{
		private static var _pool:Vector.<RichTextUnitData>;
		public static function pushToPool(value:RichTextUnitData):void
		{
			if(value == null)
			{
				return;
			}
			value.reset();
			if(_pool == null)
			{
				_pool = new Vector.<RichTextUnitData>();
			}
			_pool.push(value);
		}
		
		public static function getFromPool():RichTextUnitData
		{
			if(_pool != null && _pool.length > 0)
			{
				return _pool.pop();
			}
			return new RichTextUnitData();
		}

		private var _indexInMessageStringFirstConvert:int;

		/**对应文本中的起始索引位置，第一次转换的时候的位置，用于自动断行*/
		public function get indexInMessageStringFirstConvert():int
		{
			return _indexInMessageStringFirstConvert;
		}

		/**
		 * @private
		 */
		public function set indexInMessageStringFirstConvert(value:int):void
		{
			_indexInMessageStringFirstConvert = value;
			_indexInMessageStringToShow = _indexInMessageStringFirstConvert;
		}

		private var _indexInMessageStringToShow:int;

		public function set indexInMessageStringToShow(value:int):void
		{
			_indexInMessageStringToShow = value;
		}


		/**对应文本中的起始索引位置*/
		public function get indexInMessageStringToShow():int
		{
			return _indexInMessageStringToShow;
		}

		/**由RichTextUnitType枚举*/
		public var type:String;
		/**完整的字符数据,包括起始分割符*/
		public var code:String;
		/**资源链接*/
		public var res:String;
		/**显示的文本*/
		public var label:String;
		/**文本颜色*/
		public var labelColor:Number = -1;
		/**文本大小*/
		public var labelSize:int;
		/**由RichTextLinkType枚举*/
		public var linkType:String;
		/**链接携带的数据*/
		public var linkData:String;
		/**此单元单独的y向偏移量，负数向上偏移，正数向下偏移*/
		public var offsetY:int;
		/**自定义宽，为0时动态获取*/
		public var width:int;
		/**是否下划线*/
		public var underLine:Boolean = true;
		/**是否支持双击*/
		public var doubleClick:Boolean;
		/**对齐方式,由RichTextAlign枚举*/
		public var align:String;
		/**文本滤镜*/
		public var labelFilters:Array;
		/**占用字符个数*/
		public var chars:int;
		
		private function reset():void
		{
			_indexInMessageStringFirstConvert = 0;
			_indexInMessageStringToShow = 0;
			type = null;
			code = null;
			res = null;
			label = null;
			labelColor = -1;
			labelSize = 0;
			linkType = null;
			linkData = null;
			offsetY = 0;
			width = 0;
			align = null;
			labelFilters = null;
			chars = 0;
			underLine = true;
			doubleClick = false;
		}
	}
}