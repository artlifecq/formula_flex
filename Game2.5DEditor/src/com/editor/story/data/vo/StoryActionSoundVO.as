package com.editor.story.data.vo
{
	public class StoryActionSoundVO extends StoryActionVO
	{
		/** 音轨 **/
		public var channel:int;
		public var voicePath:String;
		public function StoryActionSoundVO()
		{
			super();
		}
		
		/**
		 * @return 
		 */		
		override public function get actionValue():String
		{
			return voicePath + ","
				+ channel;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			voicePath = valueArr[0];
			channel = parseInt(valueArr[1]);
		}
		
	}
}