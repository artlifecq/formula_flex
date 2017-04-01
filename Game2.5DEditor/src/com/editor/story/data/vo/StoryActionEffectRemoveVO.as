package com.editor.story.data.vo
{
	/**
	 * 
	 @author Guodong.Zhang
	 * 创建时间：2015-9-25 下午5:41:45
	 */
	public class StoryActionEffectRemoveVO extends StoryActionEffectTypeVO
	{
		public function StoryActionEffectRemoveVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return effectID.toString();
		}
		
		override public function set actionValue(value:String):void
		{
			effectID = parseInt(value);
		}
		
	}
}