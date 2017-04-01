package com.editor.story.data.vo
{
	public class StoryActionRoleHideVO extends StoryActionRoleTypeVO
	{
		public function StoryActionRoleHideVO()
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