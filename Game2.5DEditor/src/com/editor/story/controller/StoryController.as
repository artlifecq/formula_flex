package com.editor.story.controller
{
	import com.editor.manager.AppManager;
	import com.editor.story.view.CreateStoryActionMediator;
	import com.editor.story.view.CreateStoryEventMediator;
	import com.editor.story.view.CreateStoryMediator;
	import com.editor.story.view.StoryActionListMediator;
	import com.editor.story.view.StoryEventListMediator;
	import com.editor.story.view.component.CreateStoryActionPanel;
	import com.editor.story.view.component.CreateStoryEventPanel;
	import com.editor.story.view.component.CreateStoryPanel;
	import com.editor.story.view.component.StoryActionListWindow;
	import com.editor.story.view.component.StoryEventListWindow;
	
	import mx.managers.PopUpManager;

	public class StoryController
	{
		private static var _storyEventListMediator:StoryEventListMediator;
		private static var _storyActionListMediator:StoryActionListMediator;
		private static var _createStoryMediator:CreateStoryMediator;
		private static var _createStoryEventMediator:CreateStoryEventMediator;
		private static var _createStoryActionMediator:CreateStoryActionMediator;
		
		
		public function StoryController()
		{
		}
		
		/**
		 * 打开剧情事件列表窗口
		 * 
		 */
		public static function openStoryEventListWindow():void
		{
			var window:StoryEventListWindow;
			if(_storyEventListMediator == null)
			{
				 window = new StoryEventListWindow();
				_storyEventListMediator = new StoryEventListMediator(window);
			}
			else
			{
				window = _storyEventListMediator.view;
			}
			PopUpManager.addPopUp(window, AppManager.getInstance().appRoot, false);
			window.move(0, 430);
			PopUpManager.bringToFront(window);
			_storyEventListMediator.start();
		}
		
		/**
		 * 关闭剧情事件列表窗口
		 * 
		 */
		public static function closeStoryEventListWindow():void
		{
			if(_storyEventListMediator != null)
			{
				_storyEventListMediator.stop();
				var window:StoryEventListWindow = _storyEventListMediator.view;
				PopUpManager.removePopUp(window);
			}
		}
		
		/**
		 * 打开剧情行为列表窗口
		 * 
		 */
		public static function openStoryActionListWindow():void
		{
			if(_storyActionListMediator == null)
			{
				var window:StoryActionListWindow = new StoryActionListWindow();
				PopUpManager.addPopUp(window, AppManager.getInstance().appRoot, false);
				window.move(400, AppManager.getInstance().appRoot.stage.stageHeight - window.height);
				_storyActionListMediator = new StoryActionListMediator(window);
			}
			PopUpManager.bringToFront(window);
		}
		
		/**
		 * 关闭剧情行为列表窗口
		 * 
		 */
		public static function closeStoryActionListWindow():void
		{
			if(_storyActionListMediator != null)
			{
				var window:StoryActionListWindow = _storyActionListMediator.view;
				PopUpManager.removePopUp(window);
				_storyActionListMediator.dispose();
				_storyActionListMediator = null;
			}
		}
		
		/**
		 * 打开创建剧情面板
		 * 
		 */
		public static function openCreateStoryPanel(editing:Boolean = false):void
		{
			var window:CreateStoryPanel;
			if(_createStoryMediator == null)
			{
				window = new CreateStoryPanel();
				_createStoryMediator = new CreateStoryMediator(window);
			}
			else
			{
				window = _createStoryMediator.view;
			}
			PopUpManager.addPopUp(window,AppManager.getInstance().appRoot,true);
			window.x = 50;
			window.y = 50;
			_createStoryMediator.start(editing);
		}
		
		/**
		 * 关闭创建剧情面板
		 * 
		 */
		public static function closeCreateStoryPanel():void
		{
			if(_createStoryMediator != null)
			{
				_createStoryMediator.stop();
				var window:CreateStoryPanel = _createStoryMediator.view;
				PopUpManager.removePopUp(window);
			}
		}
		
		/**
		 * 打开创建剧情事件面板
		 * 
		 */
		public static function openCreateStoryEventPanel(editing:Boolean = false):void
		{
			var window:CreateStoryEventPanel;
			if(_createStoryEventMediator == null)
			{
				window = new CreateStoryEventPanel();
				_createStoryEventMediator = new CreateStoryEventMediator(window);
			}
			else
			{
				window = _createStoryEventMediator.view;
			}
			PopUpManager.addPopUp(window,AppManager.getInstance().appRoot,true);
			window.x = _storyEventListMediator.view.x + 50;
			window.y = _storyEventListMediator.view.y + 50;
			_createStoryEventMediator.start(editing);
		}
		
		/**
		 * 关闭创建剧情事件面板
		 * 
		 */
		public static function closeCreateStoryEventPanel():void
		{
			if(_createStoryEventMediator != null)
			{
				_createStoryEventMediator.stop();
				var window:CreateStoryEventPanel = _createStoryEventMediator.view;
				PopUpManager.removePopUp(window);
			}
		}
		
		/**
		 * 打开创建剧情行为面板
		 * 
		 */
		public static function openCreateStoryActionPanel(editing:Boolean = false):void
		{
			var window:CreateStoryActionPanel;
			if(_createStoryActionMediator == null)
			{
				window = new CreateStoryActionPanel();
				_createStoryActionMediator = new CreateStoryActionMediator(window);
			}
			else
			{
				window = _createStoryActionMediator.view;
			}
			PopUpManager.addPopUp(window,AppManager.getInstance().appRoot);
			window.x = _storyActionListMediator.view.x + 50;
			window.y = _storyActionListMediator.view.y - window.height;
			_createStoryActionMediator.start(editing);
		}
		
		/**
		 * 关闭创建剧情行为面板
		 * 
		 */
		public static function closeCreateStoryActionPanel():void
		{
			if(_createStoryActionMediator != null)
			{
				_createStoryActionMediator.stop();
				var window:CreateStoryActionPanel = _createStoryActionMediator.view;
				PopUpManager.removePopUp(window);
			}
		}
	}
}