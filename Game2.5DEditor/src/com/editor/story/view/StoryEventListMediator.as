package com.editor.story.view
{
	import com.editor.story.controller.StoryController;
	import com.editor.story.data.StoryConfig;
	import com.editor.story.data.StoryProxy;
	import com.editor.story.data.vo.StoryEventVO;
	import com.editor.story.event.StoryEvent;
	import com.editor.story.view.component.StoryEventListWindow;
	
	import flash.events.MouseEvent;
	
	import mx.events.CloseEvent;
	
	import org.client.mainCore.manager.EventManager;

	public class StoryEventListMediator
	{
		private var _view:StoryEventListWindow;
		
		public function get view():StoryEventListWindow
		{
			return _view;
		}

		
		public function StoryEventListMediator($view:StoryEventListWindow)
		{
			_view = $view;
		}
		
		private function storyEventListClickHandler(event:MouseEvent):void
		{
			var item:Object = _view.data_grid.selectedItem;
			if (item != null)
			{
				var id:int = int(item.id);
				StoryProxy.currentEditingEventID = id;
				StoryController.openStoryActionListWindow();
				EventManager.dispatchEvent(StoryEvent.STORY_EVENT_EDITING_CHANGED);
			}
		}
		
		private function storyEventDeletedHandler(id:int):void
		{
			updateEventList();
		}
		
		private function storyEditingChanged():void
		{
			updateEventList();
		}
		
		protected function closeHandler(event:CloseEvent):void
		{
			StoryController.closeStoryEventListWindow();
		}
		
		private function btnEditClickHandler(event:MouseEvent):void
		{
			if(_view.data_grid.selectedIndex < 0)
			{
				return;
			}
			StoryController.openCreateStoryEventPanel(true);
		}
		
		private function btnDelClickHandler(event:MouseEvent):void
		{
			if(_view.data_grid.selectedIndex < 0)
			{
				return;
			}
			var id:int = _view.data_grid.selectedItem.id;
			StoryProxy.removeStoryEvent(id);
			StoryController.closeStoryActionListWindow();
		}
		
		protected function btnAddClickHandler(event:MouseEvent):void
		{
			if(StoryConfig.currentEditingStoryID <= 0)
			{
				return;
			}
			StoryController.openCreateStoryEventPanel();
		}
		
		private function storyEventCreatedHandler(storyEventVO:StoryEventVO):void
		{
			if(_view.stage)
			{
				var triggerType:String = StoryProxy.getTriggerTypeName(storyEventVO.triggerType);
				_view.datas.addItem({id:storyEventVO.eventID,type:triggerType,value:storyEventVO.triggerTypeValue,desc:storyEventVO.desc});
			}
		}
		
		private function updateEventList():void
		{
			if(_view.stage)
			{
				_view.datas.removeAll();
				var storyEventArr:Array = StoryProxy.currentEditingEventArr;
				var len:int = storyEventArr.length;
				for(var i:int = 0; i < len; i++)
				{
					var storyEventVO:StoryEventVO = storyEventArr[i];
					var triggerType:String = StoryProxy.getTriggerTypeName(storyEventVO.triggerType);
					_view.datas.addItem({id:storyEventVO.eventID,type:triggerType,value:storyEventVO.triggerTypeValue,desc:storyEventVO.desc});
				}
			}
		}
		
		public function start():void
		{
			_view.btn_add.addEventListener(MouseEvent.CLICK,btnAddClickHandler);
			_view.btn_edit.addEventListener(MouseEvent.CLICK,btnEditClickHandler);
			_view.btn_del.addEventListener(MouseEvent.CLICK,btnDelClickHandler);
			_view.addEventListener(CloseEvent.CLOSE,closeHandler);
			_view.data_grid.addEventListener(MouseEvent.CLICK,storyEventListClickHandler);
			EventManager.addEvent(StoryEvent.STORY_EVENT_CREATED,storyEventCreatedHandler);
			EventManager.addEvent(StoryEvent.STORY_EDITING_CHANGED,storyEditingChanged);
			EventManager.addEvent(StoryEvent.STORY_EVENT_DELETED,storyEventDeletedHandler);
			EventManager.addEvent(StoryEvent.STORY_EVENT_EDITED,updateEventList);
		}
		
		public function stop():void
		{
			_view.btn_add.removeEventListener(MouseEvent.CLICK,btnAddClickHandler);
			_view.btn_edit.removeEventListener(MouseEvent.CLICK,btnEditClickHandler);
			_view.btn_del.removeEventListener(MouseEvent.CLICK,btnDelClickHandler);
			_view.removeEventListener(CloseEvent.CLOSE,closeHandler);
			_view.data_grid.removeEventListener(MouseEvent.CLICK,storyEventListClickHandler);
			EventManager.removeEvent(StoryEvent.STORY_EVENT_CREATED,storyEventCreatedHandler);
			EventManager.removeEvent(StoryEvent.STORY_EDITING_CHANGED,storyEditingChanged);
			EventManager.removeEvent(StoryEvent.STORY_EVENT_DELETED,storyEventDeletedHandler);
			EventManager.removeEvent(StoryEvent.STORY_EVENT_EDITED,updateEventList);
		}
		
		public function dispose():void
		{
			
		}
	}
}