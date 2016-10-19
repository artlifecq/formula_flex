package com.rpgGame.app.manager.chat
{
	import org.client.mainCore.ds.HashMap;

	/**
	 * 聊天输入框数据管理
	 * @author Guodong.Zhang
	 * 
	 */
	public class ChatInputManager
	{
		public static const START_LAG:String = "{";
		public static const END_LAG:String = "}";
		/**特殊数据匹配正则表达式*/
		private static const SPECIAL_INFO_REGEXP:RegExp = /\{[^{}]*?\}/g;
		private static var  _specialInfoMap:HashMap;
		
		/**
		 * 添加特殊信息
		 * @param key
		 * @param value
		 * 
		 */
		public static function addSpecialInfo(key:String,value:Object):void
		{
			if(_specialInfoMap == null)
			{
				_specialInfoMap = new HashMap();
			}
			_specialInfoMap.add(key,value);
		}
		
		/**
		 * 替换消息中的特殊信息成数据
		 * @param inputStr
		 * @return 
		 * 
		 */
		public static function replaceSpecialInfo(inputStr:String):String
		{
			if(_specialInfoMap)
			{
				var keyArr:Array = _specialInfoMap.keys();
				var len:int = keyArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:String = keyArr[i];
					var data:String = _specialInfoMap.getValue(key);
					if(data != null || data == "")
					{
						if(key.indexOf(key) >= 0)
						{
							inputStr = inputStr.replace(key,data);
						}
					}
				}
			}
			
			/*var keyArr:Array = inputStr.match(SPECIAL_INFO_REGEXP);
			if(keyArr)
			{
				var len:int = keyArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:String = keyArr[i];
					if(_specialInfoMap)
					{
						var data:String = _specialInfoMap.getValue(key);
						if(data != null || data == "")
						{
							inputStr = inputStr.replace(key,data);
						}
					}
				}
			}*/
			return inputStr;
		}
		
		public static function removeNonlicetSpecialInfo(inputStr:String):String
		{
			var keyArr:Array = inputStr.match(SPECIAL_INFO_REGEXP);
			if(keyArr)
			{
				var len:int = keyArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var key:String = keyArr[i];
					if(_specialInfoMap)
					{
						var data:String = _specialInfoMap.getValue(key);
						if(data == null)
						{
							inputStr = inputStr.replace(key,"");
						}
					}
				}
			}
			return inputStr;
		}
		
	}
}