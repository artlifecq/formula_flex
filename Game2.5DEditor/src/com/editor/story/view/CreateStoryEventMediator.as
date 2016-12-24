package com.editor.story.view
{
	import com.editor.story.controller.StoryController;
	import com.editor.story.data.StoryProxy;
	import com.editor.story.data.vo.StoryEventVO;
	import com.editor.story.enum.StoryEventTriggerTypeEnum;
	import com.editor.story.view.component.CreateStoryEventPanel;
	
	import flash.events.MouseEvent;
	
	import spark.events.IndexChangeEvent;

	public class CreateStoryEventMediator
	{
		private var _view:CreateStoryEventPanel;
		private var _editing:Boolean;

		public function get view():CreateStoryEventPanel
		{
			return _view;
		}

		public function CreateStoryEventMediator($view:CreateStoryEventPanel)
		{
			_view = $view;
		}
		
		protected function btnCancelClickHandler(event:MouseEvent):void
		{
			StoryController.closeCreateStoryEventPanel();
		}
		
		protected function btnSureClickHandler(event:MouseEvent):void
		{
			if(_view.triggerTypeList.selectedIndex < 0)
			{
				return;
			}
			var type:int = _view.triggerTypeList.selectedItem.type;
			var valueStr:String = _view.valueText.text;
			if(valueStr == null || valueStr == "")
			{
				//value不可为空
				return;
			}
			var value:int = parseInt(valueStr);
			if(value.toString() != valueStr)
			{
				//value必须为数字
				return;
			}
			var desc:String = _view.descText.text;
			if(_editing)
			{
				StoryProxy.editStoryEvent(type,value,desc);
			}
			else
			{
				StoryProxy.createStoryEvent(type,value,desc);
			}
			StoryController.closeCreateStoryEventPanel();
		}
		
		private function updateEventTriggerTypeList($editing:Boolean):void
		{
			_view.datas.removeAll();
			var typeArr:Array = StoryProxy.getAllEventTriggerType();
			var len:int = typeArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var type:int = typeArr[i];
				var typeName:String = StoryProxy.getTriggerTypeName(type);
				var item:Object = {label: typeName,type:type};
				_view.datas.addItem(item);
				if($editing)
				{
					var eventVO:StoryEventVO = StoryProxy.currentEditingEventVO;
					if(eventVO.triggerType == type)
					{
						_view.triggerTypeList.selectedItem = item;
					}
				}
			}
		}
		
		private function updateValue($editing:Boolean):void
		{
			_view.valueText.text = "";
			if($editing)
			{
				var eventVO:StoryEventVO = StoryProxy.currentEditingEventVO;
				_view.valueText.text = eventVO.triggerTypeValue;
			}
			else if(_view.triggerTypeList.selectedIndex >= 0)
			{
				if(_view.triggerTypeList.selectedItem.type == StoryEventTriggerTypeEnum.TIME)
				{
					_view.valueText.text = "100";
				}
			}
		}
		
		private function triggerTypeChangedHandler(event:IndexChangeEvent):void
		{
			updateValue(false);
		}
		
		public function start($editing:Boolean = false):void
		{
			_editing = $editing;
			if(_editing)
			{
				_view.title = "编辑事件";
			}
			else
			{
				_view.title = "添加事件";
			}
			_view.btn_sure.addEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.btn_cancel.addEventListener(MouseEvent.CLICK,btnCancelClickHandler);
			_view.triggerTypeList.addEventListener(IndexChangeEvent.CHANGE,triggerTypeChangedHandler);
			updateEventTriggerTypeList($editing);
			updateValue($editing);
		}
		
		public function stop():void
		{
			_view.btn_sure.removeEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.btn_cancel.removeEventListener(MouseEvent.CLICK,btnCancelClickHandler);
			_view.triggerTypeList.removeEventListener(IndexChangeEvent.CHANGE,triggerTypeChangedHandler);
		}
		
		public function dispose():void
		{
			
		}
	}
}