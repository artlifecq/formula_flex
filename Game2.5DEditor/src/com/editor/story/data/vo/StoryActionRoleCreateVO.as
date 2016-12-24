package com.editor.story.data.vo
{
	public class StoryActionRoleCreateVO extends StoryActionRoleTypeVO
	{
		public function StoryActionRoleCreateVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			return roleID.toString() + ","
				+ bodyRes + ","
				+ tx + ","
				+ tz + ","
				+ action + ","
				+ rotationY + ","
				+ scale;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			roleID = parseInt(valueArr[0]);
			bodyRes = valueArr[1];
			tx = parseInt(valueArr[2]);
			tz = parseInt(valueArr[3]);
			action = valueArr[4];
			rotationY = parseInt(valueArr[5]);
			if(valueArr.length > 6)
			{
				scale = parseFloat(valueArr[6]);
			}
			else
			{
				scale = 1;
			}
		}
		
		public var bodyRes:String;
		public var tx:int;
		public var tz:int;
		public var action:String;
		public var rotationY:int;
		public var scale:Number;
	}
}