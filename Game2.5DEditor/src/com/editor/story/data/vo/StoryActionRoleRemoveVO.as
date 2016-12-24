package com.editor.story.data.vo
{
	public class StoryActionRoleRemoveVO extends StoryActionRoleTypeVO
	{
		public function StoryActionRoleRemoveVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString();
		}
		
		override public function set actionValue(value:String):void
		{
			roleID = parseInt(value);
		}
		
	}
}