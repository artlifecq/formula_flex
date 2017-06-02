package com.rpgGame.app.richText.component
{
	/**
	 * 富文本元素的配置数据
	 * @author GuoDong.Zhang
	 * 
	 */
	public class RichTextUnitConfigData
	{
		private static var _pool:Vector.<RichTextUnitConfigData>;
		public static function pushToPool(value:RichTextUnitConfigData):void
		{
			if(value == null)
			{
				return;
			}
			value.reset();
			if(_pool == null)
			{
				_pool = new Vector.<RichTextUnitConfigData>();
			}
			_pool.push(value);
		}
		
		public static function getFromPool():RichTextUnitConfigData
		{
			if(_pool != null && _pool.length > 0)
			{
				return _pool.pop();
			}
			return new RichTextUnitConfigData();
		}
		
		/**对应的快捷字符*/
		public var shortcutCode:String = "";
		/**资源链接名称*/
		public var res:String = "";
		/**类型*/
		public var type:String = "";
		/**占用字符个数*/
		public var chars:int;
		
		public function RichTextUnitConfigData()
		{
		}
		
		private function reset():void
		{
			shortcutCode = "";
			res = "";
			type = "";
			chars;
		}
		
	}
}