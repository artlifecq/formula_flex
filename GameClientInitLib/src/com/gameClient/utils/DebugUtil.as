package com.gameClient.utils
{
    
    import flash.utils.getQualifiedClassName;

    /**
     * 调试工具都写这里哈
     * @author NEIL
     */
    public class DebugUtil
    {
		/**
		 * 根据对象或类型得到字符串 
		 * @param data
		 * 
		 */
		public static function getObjectNameStr(data:* = null):String
		{
			var str:String = getQualifiedClassName(data);
			return str.substr(str.search("::") + 2);
		}
    }
}
