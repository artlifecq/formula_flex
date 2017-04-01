package com.gameClient.utils
{
	import com.adobe.serialization.json.JSON;
	

	/**
	 * json 数据处理 
	 * @author Administrator
	 * 
	 */
	public class JSONUtil
	{
		public static var DEBUG_MODE:Boolean = false;
		
		public function JSONUtil()
		{
		}
		
		/**
		 * 对象编码为json字符串 
		 * @param o
		 * @return 
		 * 
		 */
		public static function encode(o:Object):String
		{
			return com.adobe.serialization.json.JSON.encode(o);
		}
		
		/**
		 * json字符串解码成对象
		 * @param s
		 * @return 
		 * 
		 */
		public static function decode(s:String):*
		{
			var ret:Object = null;
			try
			{
				ret = com.adobe.serialization.json.JSON.decode(s);
			}
			catch(err:Error)
			{
				if (DEBUG_MODE)
				{
					trace("decode json error:" + err.getStackTrace());
				}
				ret = null;
			}
			
			return ret;
		}
		
		public static function isJson(s:String):Boolean
		{
			try
			{
				com.adobe.serialization.json.JSON.decode(s);
			}
			catch(err:Error)
			{
				return false;
			}
			
			return true;
		}
	}
}