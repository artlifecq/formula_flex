package com.editor.story.data.vo
{
	public class StoryActionRoleDoActionVO extends StoryActionRoleTypeVO
	{
		public var action:String;
		public var count:int;
		
		public function StoryActionRoleDoActionVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString() + ","
				+ action + ","
				+ count;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			roleID = parseInt(valueArr[0]);
			action = valueArr[1];
			count = parseInt(valueArr[2]);
		}
		
	}
}