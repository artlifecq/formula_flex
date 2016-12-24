package com.editor.story.data.vo
{
	public class StoryActionRoleZoomVO extends StoryActionRoleTypeVO
	{
		public var scale:Number;
		
		public function StoryActionRoleZoomVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString() + ","
				+ scale;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			roleID = parseInt(valueArr[0]);
			scale = parseFloat(valueArr[1]);
		}
		
	}
}