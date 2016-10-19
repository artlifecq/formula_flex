package com.rpgGame.app.richText.component
{
	import flash.text.TextFormat;
	
	/**
	 * 富文本元素的实例数据
	 * @author GuoDong.Zhang
	 * 创建时间：2016-7-4 下午4:36:22
	 * 
	 */
	public class RichTextUnitData
	{
		/**对应文本中的起始索引位置*/
		public var indexInMessageString:int;
		/**由RichTextUnitType枚举*/
		public var type:String;
		/**完整的字符数据,包括起始分割符*/
		public var code:String;
		/**资源链接*/
		public var res:String;
		/**显示的文本*/
		public var label:String;
		/**文本颜色*/
		public var labelColor:Number = -1;
		/**文本大小*/
		public var labelSize:int;
		/**由RichTextLinkType枚举*/
		public var linkType:String;
		/**链接携带的数据*/
		public var linkData:String;
		/**替代文本对应的格式*/
		public var textFormat:TextFormat;
		/**此单元单独的y向偏移量，负数向上偏移，正数向下偏移*/
		public var offsetY:int;
		/**文本滤镜*/
		public var labelFilters:Array;
	}
}