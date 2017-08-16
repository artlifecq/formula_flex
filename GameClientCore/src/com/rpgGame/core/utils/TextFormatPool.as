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
			return getTextFormat(StaticValue.RED_TEXT,size,isBlod);
		}
		
		public static function getWhite(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.WHITE_TEXT,size,isBlod);
		}
		
		public static function getGreen(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.GREEN_TEXT,size,isBlod);
		}
		
		public static function getPurple(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.PURPLE_TEXT,size,isBlod);
		}
		
		public static function getOrange(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.OEANGE_TEXT,size,isBlod);
		}
		
		public static function getYellow(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.YELLOW_TEXT,size,isBlod);
		}
		
		public static function getBlue(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.BLUE_TEXT,size,isBlod);
		}
		
		public static function getBlack(size:int = 12,isBlod:Boolean = false):TextFormat
		{
			return getTextFormat(StaticValue.GRAY_TEXT,size,isBlod);
		}
	}
}

