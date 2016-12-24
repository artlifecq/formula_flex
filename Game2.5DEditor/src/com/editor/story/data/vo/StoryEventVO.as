package com.editor.story.data.vo
{
	import org.client.mainCore.ds.HashMap;

	public class StoryEventVO implements IActionContainer
	{
		public var storyID:int;
		public var eventID:int;
		public var triggerType:int;
		public var triggerTypeValue:*;
		public var desc:String;
		private var _actionHash:HashMap = new HashMap();

		public function get actionHash():HashMap
		{
			return _actionHash;
		}

		private var _actionMaxID:int;

		public function get actionMaxID():int
		{
			return _actionMaxID;
		}

		public function set actionMaxID(value:int):void
		{
			_actionMaxID = value;
		}
		
		private var _roleMaxID:int;
		
		public function get roleMaxID():int
		{
			return _roleMaxID;
		}
		
		public function set roleMaxID(value:int):void
		{
			_roleMaxID = value;
		}

		private var _effectMaxID:int;
		
		public function get effectMaxID():int
		{
			return _effectMaxID;
		}
		
		public function set effectMaxID(value:int):void
		{
			_effectMaxID = value;
		}
		
	}
}