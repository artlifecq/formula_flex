package com.editor.story.data.vo
{
	public class StoryActionRoleFaceToVO extends StoryActionRoleTypeVO
	{
		public var rotationY:int;
		
		public function StoryActionRoleFaceToVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString() + ","
				+ rotationY;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			roleID = parseInt(valueArr[0]);
			rotationY = parseInt(valueArr[1]);
		}
		
	}
}