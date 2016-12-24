package com.editor.story.data.vo
{
	public class StoryActionRoleInfoVO extends StoryActionVO
	{
		/**
		 * 对齐方式
		 */
		public var alignType:int;
		/**
		 * x轴偏移
		 */
		public var offsetX:int;
		/**
		 * y轴偏移
		 */
		public var offsetY:int;
		/**
		 * 背景图片
		 */
		public var imgBg:String;
		/**
		 * 名字图片
		 */
		public var imgName:String;
		/**
		 * 职业图片
		 */
		public var imgProfession:String;
		/**
		 * 主角or怪物
		 */
		public var type:int;
		
		public function StoryActionRoleInfoVO()
		{
			super();
		}
		
		/**
		 * @return 
		 */		
		override public function get actionValue():String
		{
			return imgBg + ","
				+ imgName + ","
				+ imgProfession + ","
				+ alignType + ","
				+ offsetX + ","
				+ offsetY + ","
				+ type;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			imgBg = valueArr[0];
			imgName = valueArr[1];
			imgProfession = valueArr[2];
			alignType = int(valueArr[3]);
			offsetX = int(valueArr[4]);
			offsetY = int(valueArr[5]);
			type = int(valueArr[6]);
		}
	}
}