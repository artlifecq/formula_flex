package com.rpgGame.core.utils
{
	import com.rpgGame.coreData.cfg.StaticValue;
	
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	
	/**
	 *  TextFormat工具类
	 *  避免生成大量TextFormat实例
	 * @author wewell@163.com
	 * 
	 */	
	public class TextFormatPool
	{
		private static var pool:Dictionary=new Dictionary;
		public static function getTextFormat(color:uint, size:int=12,bold:Boolean=false,underline:Boolean=false, leading:int= 5, align:String="left",italic:Boolean=false,font:String="Microsoft YaHei"):TextFormat
		{
			var key:String = color+"_"+size+"_"+leading+"_"+bold+"_"+italic+"_"+font+"_"+underline+"_"+align;
			var f:TextFormat = pool[key]
			if(!f)
			{
				f = pool[key] = new TextFormat(font,size, color, bold, italic, underline, null, null,align, null, null, null, leading);
			}
			return f;
		}
		
		
		public static function getRed(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_13,size,isBlod);
		}
		
		public static function getWhite(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_1,size,isBlod);
		}
		
		public static function getGreen(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_16,size,isBlod);
		}
		
		public static function getPurple(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_20,size,isBlod);
		}
		
		public static function getOrange(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_25,size,isBlod);
		}
		
		public static function getYellow(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_4,size,isBlod);
		}
		
		public static function getBlue(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_19,size,isBlod);
		}
		
		public static function getBlack(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.COLOR_CODE_24,size,isBlod);
		}
	}
}

