package com.editor.story.event
{
	public class StoryEvent
	{
		/**新建剧情,携带剧情数据StoryVO的实例*/
		public static const STORY_CREATED:String = "STORY_CREATED";
		/**新建剧情事件,携带剧情事件数据StoryEventVO的实例*/
		public static const STORY_EVENT_CREATED:String = "STORY_EVENT_CREATED";
		/**新建剧情行为，携带剧情行为数据StoryActionVO的实例*/
		public static const STORY_ACTION_CREATED:String = "STORY_ACTION_CREATED";
		/**移除剧情*/
		public static const STORY_DELETED:String = "STORY_DELETED";
		/**移除剧情事件，携带剧情行为id:int*/
		public static const STORY_EVENT_DELETED:String = "STORY_EVENT_DELETED";
		/**移除剧情行为，携带剧情行为id:int*/
		public static const STORY_ACTION_DELETED:String = "STORY_ACTION_DELETED";
		/**当前编辑的剧情对象变化了*/
		public static const STORY_EDITING_CHANGED:String = "STORY_EDITING_CHANGED";
		/**当前编辑的剧情事件对象变化了*/
		public static const STORY_EVENT_EDITING_CHANGED:String = "STORY_EVENT_EDITING_CHANGED";
		/**剧情被编辑了*/
		public static const STORY_EDITED:String = "STORY_EVENT_EDITED";
		/**剧情事件被编辑了*/
		public static const STORY_EVENT_EDITED:String = "STORY_EVENT_EDITED";
		/**剧情行为被编辑了*/
		public static const STORY_ACTION_EDITED:String = "STORY_ACTION_EDITED";
		/**剧情行为的文字显示*/
		public static const STORY_ACTION_TEXT_SHOW:String = "STORY_ACTION_TEXT_SHOW";
		/**剧情行为的文字隐藏*/
		public static const STORY_ACTION_TEXT_HIDE:String = "STORY_ACTION_TEXT_HIDE";
		/**更新当前时间*/
		public static const STORY_UPDATE_TIME:String = "STORY_UPDATE_TIME";
	}
}