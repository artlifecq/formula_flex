package com.rpgGame.appModule.common.tools
{
	import flash.utils.ByteArray;

	/**
	 * 字符串util 
	 * @author LCC 2012.10.3
	 * 
	 */	
	public class StringTool
	{
		
		private static var tempBytes : ByteArray = new ByteArray();
		/**
		 * 获得字符数
		 * @param src 源字符串	输入的必须是UTF字符串
		 * @return 字符数
		 * @author LCC 2012.10.3
		 */		
		public static function getCharCount( src:String ):int
		{
			tempBytes.clear();
			tempBytes.writeUTFBytes(src);
			tempBytes.position = 0;
			return tempBytes.bytesAvailable
//			var charcnt:int = 0;
//			var charcode:Number = 0;
//			for ( var idx:int = 0; idx < src.length; ++idx )
//			{
//				charcode = src.charCodeAt( idx );
//				charcnt += StringTool.isWideChars( charcode ) ? 2 : 1;
//			}
//			var bytes : ByteArray = new ByteArray();
//			return charcnt;
		}
		
		/**
		 * 是否是宽字符
		 * PS:此范围判定来源于网络，应该有98%的正确性，如果有遗漏请补充
		 * @return 
		 * @author LCC 2012.10.3
		 */		
		public static function isWideChars( charcode:Number ):Boolean
		{
			// 优化
			// 如果是英文字母和汉字，优先判定
			if ( charcode < 0x80 )		// 英文
			{
				return false;
			}
			
			if ( charcode >= 0x4E00 && charcode <= 0x9FFF )	// 常用汉字
			{
				return true;
			}
			
			if ( 
				( charcode >= 0x1100 && charcode <= 0x115f) || /* Hangul Jamo */
				( charcode >= 0x2e80 && charcode <= 0xa4cf && ( charcode & ~0x0011 ) != 0x300a && charcode != 0x303f ) || /* CJK ... Yi */      
				( charcode >= 0xac00 && charcode <= 0xd7a3) || /* Hangul Syllables */
				( charcode >= 0xf900 && charcode <= 0xfaff) || /* CJK Compatibility Ideographs */
				( charcode >= 0xfe30 && charcode <= 0xfe6f) || /* CJK Compatibility Forms */
				( charcode >= 0xff00 && charcode <= 0xff5f) || /* Fullwidth Forms */
				( charcode >= 0xffe0 && charcode <= 0xffe6) ||
				( ( charcode >= 0x2600 && charcode <= 0x2671 )  /* 实物体字符 1*/
					&& !( charcode >= 0x2639 && charcode <= 0x263C )
					&& !( charcode >= 0x2660 && charcode <= 0x2666 )
					&& charcode != 0x2669 && charcode != 0x266b && charcode != 0x266c && charcode != 0x266e && charcode != 0x266f && charcode != 0x2670 ) ||
				( charcode >= 0x2700 && charcode <= 0x27FF)	   /* 实物体字符 2*/
			)
			{
				return true;
			}
			return false;
		}
		
		public static function getSubString(str:String,len:int):String
		{
			if(str.length<=len)
				return str;
			return str.substr(0,len)
		}

	}
}