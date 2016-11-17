package org.game.netCore.data
{
	

	/**
	 * long型（SID）和int（GID）之间的映射 
	 * 通常用作key
	 * @author tyevlag
	 */
	public final class LongIdMap
	{
		public static const ERR_GID:int = 0x7FFFFFF0;
		public static const WARNING_NUM:int = 20000;
		
		private static var WARING_COUNT:int = 0;
		private static var CUR_GID:int = 10001;
		
		private static var map:Object = Init();
		
		private static function Init():Object
		{
			var ret:Object = new Object();
			ret[Int64.ZERO] = 0;
			return ret;
		}
		
		/**
		 * 构建long映射 
		 * @param lid
		 * @return 
		 */
		public static function ToGID(sid:Int64):int
		{
			var strValue:String = sid.hexValue;
			var gid:* = map[strValue];
			if (gid == null)
			{
				gid = CUR_GID++;
				map[strValue] = gid;
			}
			
			return gid;
		}
		
		public static function get NEXTGID():int
		{
			++CUR_GID;
			++WARING_COUNT;
			if (WARING_COUNT >= WARNING_NUM)
			{
				WARING_COUNT = 0;
				//LogUtil.Trace("[((((((((((((((((((((((((()))))))))))))))))))))))>>gid cur：" + CUR_GID + "]");
			}
			
			return CUR_GID;
		}
		
		/**
		 *改变sid映射 
		 * @param oldSid
		 * @param newSid
		 * @return 
		 * 
		 */	
		public static function ChangeGID(oldSid:Int64, newSid:Int64):int
		{
			if (oldSid.EqualTo(newSid))
				return map[oldSid.hexValue];
			
			var strValue:String = oldSid.hexValue;
			var strVal2:String = newSid.hexValue;
			
			var gid:* = map[strValue];
			if (gid == null)
			{
				return 0;			
			}
			
			map[strVal2] = gid;
			map[strValue] = null;
			return gid;
		}
	}
}