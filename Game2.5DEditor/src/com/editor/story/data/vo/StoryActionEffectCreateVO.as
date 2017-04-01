package com.editor.story.data.vo
{
	/**
	 * 创建特效
	 @author Guodong.Zhang
	 * 创建时间：2015-9-25 下午2:11:36
	 */
	public class StoryActionEffectCreateVO extends StoryActionEffectTypeVO
	{
		public function StoryActionEffectCreateVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return effectID.toString() + ","
				+ res + ","
				+ tx + ","
				+ tz + ","
				+ rotationY + ","
				+ scale;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			effectID = parseInt(valueArr[0]);
			res = valueArr[1];
			tx = parseInt(valueArr[2]);
			tz = parseInt(valueArr[3]);
			rotationY = parseInt(valueArr[4]);
			scale = parseFloat(valueArr[5]);
		}
		
		public var res:String;
		public var tx:int;
		public var tz:int;
		public var rotationY:int;
		public var scale:Number;
	}
}