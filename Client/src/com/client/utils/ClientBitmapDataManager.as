package com.client.utils
{
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;

	/**
	 *
	 * 登录,剧情动画位图管理
	 * @author fly.liuyang
	 * 创建时间：2015-2-25 下午10:13:43
	 * 
	 */
	public class ClientBitmapDataManager
	{
		private static var _cacheDic:Dictionary = new Dictionary();
		private static var _isAlreadyDispose:Boolean = false;
		public function ClientBitmapDataManager()
		{
		}
		public static function getBitmapData(className:String):BitmapData
		{
			if(_isAlreadyDispose)return null;
			var bitmapData:BitmapData = _cacheDic[className];
			if(bitmapData == null)
			{
				var obj:* = ApplicationDomain.currentDomain.getDefinition(className);
				if(obj)
				{
					var cls:Class = obj as Class;
					bitmapData = new cls();
					_cacheDic[className] = bitmapData;
				}
			}
			return bitmapData;
		}
		
		public static function dispose():void
		{
			_isAlreadyDispose = true;
			for each (var bitmapData:BitmapData in _cacheDic) 
			{
				bitmapData.dispose();
				bitmapData = null;
			}
			_cacheDic = null;
		}
	}
}