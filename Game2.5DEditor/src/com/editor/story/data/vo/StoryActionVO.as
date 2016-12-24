package com.editor.story.data.vo
{
	public class StoryActionVO
	{
		public var storyID:int;
		public var eventID:int;
		public var actionID:int;
		public var startTime:int;
		public var totalTime:int;
		public var actionType:int;
		private var _actionValue:String;

		public function get actionValue():String
		{
			return _actionValue;
		}

		public function set actionValue(value:String):void
		{
			_actionValue = value;
		}

		public var desc:String;
	}
}