package com.editor.story.data.vo
{
	public class StoryActionRoleControlVO extends StoryActionVO
	{
		public var roleID:int;
		public var tx:int;
		public var tz:int;
		/** 资源 **/
		public var resRole:String;
		/** 动态障碍id **/
		public var areaID:int;
		public function StoryActionRoleControlVO()
		{
			super();
		}
		
		/**
		 * @return 
		 */		
		override public function get actionValue():String
		{
			return tx + ","
				+ tz + ","
				+ resRole + ","
				+ actionID + ","
				+ roleID + ","
				+ areaID;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			tx = valueArr[0];
			tz = parseInt(valueArr[1]);
			resRole = valueArr[2];
			actionID = parseInt(valueArr[3]);
			roleID = parseInt(valueArr[4]);
			areaID = parseInt(valueArr[5]);
		}
	}
}