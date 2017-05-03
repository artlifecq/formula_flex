package feathers.controls.text
{
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	
	import feathers.themes.GuiTheme;

	/**
	 * 字体工具,支持多套字体的嵌入 
	 * @author wewell@163.com
	 * 
	 */	
	public class Fontter
	{
		//字体英文名
		public static const FONT_Hei:String = "SimHei";
		public static const FONT_YaHei:String = "Microsoft YaHei";
		public static const FONT_Sun:String = "SimSun";
		public static const FONT_Lisu:String = "LiSu";
		public static const FONT_huaLisu:String = "STLiti";//华文隶书
		public static const FONT_Arial:String = "Arial";
		
		public static var DEFAULT_FONT_COLOR:uint = 0xFFFFFF;
		/** 默认去锯齿的粗细*/
		public static var DEFAULT_THICKNESS:uint = 30;
		
		//常用文本滤镜
		public static var filterObj:Object = {};//<id(String)-->filter(Object)>
		
		//常用文本颜色及其描边颜色
		public static var textFormatObj:Object = {};//<id(String)-->textFormat(Object)>
		
		public static var truncateToFit:Boolean = true;
		
		public static  var embedFonts:Boolean = false;
		public static var sharpness:Number = 0;
		
		//as3 new出来的TextFiled有对齐缺陷，因此支持flash cs工具导出的文本框;
		public static var flashExportedTextFiledClass:Class;
		
		private static var _embedFonts:Dictionary = new Dictionary();
		
		public static function addEmbedFont(systemFontName:String, emebedRegularName:String, embedBoldName:String):void
		{
			_embedFonts[systemFontName] = [emebedRegularName, embedBoldName];
		}
		
		public static function removeEmbedFont(systemFontName:String):void
		{
			delete _embedFonts[systemFontName];
		}
		
		public static function transTextFormat(tf:TextFormat):TextFormat
		{
			if(!tf || !embedFonts ||  !_embedFonts.hasOwnProperty(tf.font)) return tf;
			var embedNames:Array = _embedFonts[tf.font];
			tf.font = tf.bold ? embedNames[1] : embedNames[0];
			return tf;
		}
		
		/**
		 *全局默认字体
		 */	
		private static var _defautFontName:String = Fontter.FONT_YaHei;//MSYaHei SimSun
		public static function set DEFAULT_FONT_NAME(value:String):void
		{
			if(_defautFontName == value)
			{
				return;
			}
			_defautFontName = value;
			GuiTheme.updateDefaultFont(_defautFontName, _defaultFontSize);
		}
		
		public static function get DEFAULT_FONT_NAME():String
		{
			return _defautFontName;
		}
		
		
		/**
		 *全局默认字号 
		 */		
		private static var _defaultFontSize:int = 12;
		public static function set DEFAULT_FONT_SIZE(value:int):void
		{
			if(_defaultFontSize == value)
			{
				return;
			}
			_defaultFontSize = value;
			GuiTheme.updateDefaultFont(_defautFontName, _defaultFontSize);
		}
		
		public static function get DEFAULT_FONT_SIZE():int
		{
			return _defaultFontSize;
		}
		
		private static var _filters:Dictionary = new Dictionary();
		public static function getFilterId(filter:Array):String
		{
			if(!filter)return "0";
			var filterId:String = _filters[filter] || "0";
			if(!_filters[filter])
			{
				for(filterId in filterObj)
				{
					if(filterObj[filterId] == filter)
					{
						_filters[filter] = filterId;
						break;
					}
				}
			}
			return filterId;
		}
	}
}