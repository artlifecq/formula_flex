package com.editor.story.data.vo
{
	import com.editor.data.RoleActionType;

	public class StoryActionRoleWalkVO extends StoryActionRoleTypeVO
	{
		public var tx:int;
		public var tz:int;
		public var action:String;
		
		public function StoryActionRoleWalkVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString() + ","
				+ tx + ","
				+ tz + ","
				+ action;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			roleID = parseInt(valueArr[0]);
			tx = parseInt(valueArr[1]);
			tz = parseInt(valueArr[2]);
			if(valueArr.length > 3)
			{
				action = valueArr[3];
			}
			else
			{
				action = RoleActionType.WALK;
			}
		}
		
	}
}