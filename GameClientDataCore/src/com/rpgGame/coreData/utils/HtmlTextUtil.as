package com.rpgGame.coreData.utils
{
	
	
	/**
	 * htmltext 工具类 
	 * @author fly
	 * 
	 */	
	public class HtmlTextUtil
	{
		/**
		 * 获得粗体 html文字 
		 * @param text
		 * @return 
		 */		
		public static function bold(text:String):String
		{
			return "<b>" + text + "</b>";
		}
		
		/**
		 * 获取带下划线的html文字 
		 * @param text
		 * @return 
		 * 
		 */
		public static function underLine(text:String):String
		{
			return "<u>" + text + "</u>";
		}
		
		/**
		 * 获得有颜色的html文字 
		 * @param color 文字颜色
		 * @param text 文本
		 * @return 
		 * 
		 */
		public static function getTextColor(color:*,text:String):String
		{
			var colorStr:String = color;
			if(color is int)
			{
				colorStr = "#" + int(color).toString(16);
			}
			var str:String = "<font color=\'" + colorStr + "\'>" + text + "</font>";
			return str;
		}
		
		/**
		 * 使用 <textformat> 标签可在文本字段中使用 TextFormat 类的段落格式设置属性的子集，其中包括行距、缩进、边距和 Tab 停靠位。 您可以将 <textformat> 标签与内置 HTML 标签结合使用。 
			<textformat> 标签具有以下属性： 
			blockindent：指定块缩进（以磅为单位）；对应于 TextFormat.blockIndent。 
			indent：指定从左边距到段落中第一个字符的缩进；对应于 TextFormat.indent。 正数和负数均可以接受。 
			leading：指定行与行之间的前导量（垂直间距）；对应于 TextFormat.leading。 正数和负数均可以接受。 
			leftmargin：指定段落的左边距（以磅为单位）；对应于 TextFormat.leftMargin。 
			rightmargin：指定段落的右边距（以磅为单位）；对应于 TextFormat.rightMargin。 
			tabstops：将自定义 Tab 停靠位指定为一个非负整数的数组；对应于 TextFormat.tabStops。
		 * 
		 */		
		public static function leading(txt:String, leading:int=5):String
		{
			return "<textformat leading='"+ leading +"' font='Microsoft YaHei'><p align='left'><font face='Microsoft YaHei'>" + txt + "</font></p></textformat>";
		}
		
//		/**
//		 * 在游戏中会存在比较复杂的彩色文本，用这个函数来简化getXXXText函数的调用 
//		 * @param arrText 色彩文本描述数组，例如[["红色", StaticValue.RED, 14], ["绿色", StaticValue.GREEN, 14]]
//		 * @return 返回格式化后的文本
//		 * @author 康露 2014年8月13日
//		 */
//		public static function getColorfulText(arrText:Array) : String
//		{
//			var ret:String = "";
//			var len:int = arrText.length;
//			for (var idx:int=0; idx<len; idx++)
//			{
//				var arr:Array = arrText[idx];
//				var l:int = arr.length;
//				
//				var text:String = l[0];
//				var color:int = (l>1)?arr[1]:StaticValue.WHITE;
//				var size:int = (l>2)?arr[2]:14;
//				var isBlod:Boolean = (l>3)?arr[3]:false;
//				ret += getTextColor(color, text, size, isBlod);
//			}
//			return ret;
//		}
	}
}