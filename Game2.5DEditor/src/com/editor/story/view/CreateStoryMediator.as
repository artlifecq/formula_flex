package com.editor.story.view
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.manager.DataStructuresManager;
	import com.editor.story.controller.StoryController;
	import com.editor.story.data.StoryConfig;
	import com.editor.story.data.StoryProxy;
	import com.editor.story.event.StoryEvent;
	import com.editor.story.view.component.CreateStoryPanel;
	
	import flash.events.MouseEvent;
	
	import org.client.mainCore.manager.EventManager;

	public class CreateStoryMediator
	{
		private var _view:CreateStoryPanel;
		private var _editing:Boolean;

		public function get view():CreateStoryPanel
		{
			return _view;
		}

		
		public function CreateStoryMediator($view:CreateStoryPanel)
		{
			_view = $view;
		}
		
		protected function btnCancelClickHandler(event:MouseEvent):void
		{
			StoryController.closeCreateStoryPanel();
		}
		
		protected function btnSureClickHandler(event:MouseEvent):void
		{
			if(_view.mapList.selectedIndex < 0)
			{
				return;
			}
			var res:String = _view.mapList.selectedItem["label"];
			var plotIDStr:String = _view.plotIDText.text;
			var plotID:int = parseInt(plotIDStr);
			if(plotIDStr == null || plotIDStr == "" || plotID.toString() == plotIDStr)
			{
				
			}
			else
			{
				return;
			}
			var scriptIDStr:String = _view.scriptIDText.text;
			var scriptID:int = parseInt(scriptIDStr);
			if(scriptIDStr == null || scriptIDStr == "" || scriptID.toString() == scriptIDStr)
			{
				
			}
			else
			{
				return;
			}
			var desc:String = _view.descText.text;
			if(_view.storyTypeList.selectedIndex < 0)
			{
				return;
			}
			var type:int = _view.storyTypeList.selectedItem["type"];
			if(_editing)
			{
				StoryConfig.edit(res,desc,type,plotID,scriptID);
			}
			else
			{
				var tabel:TabelData=DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
				if(tabel)
				{
					var cfg : StoryConfig = ConfigData.create(tabel.desc,["mRes","mDesc","mPlotID","mScriptID","mType"],[res,desc,plotID,scriptID,type],StoryConfig) as StoryConfig;
					EventManager.dispatchEvent(StoryEvent.STORY_CREATED,cfg);
				}
				
			}
			StoryController.closeCreateStoryPanel();
		}
		
		private function updateTypeList($editing:Boolean):void
		{
			_view.storyTypeDatas.removeAll();
			var typeArr:Array = StoryProxy.getAllStoryType();
			var len:int = typeArr.length;
			
			var tabel:TabelData=DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
			if(!tabel)
				return;
			
			var storyConfig:StoryConfig = ConfigData.getCfg(tabel.desc,StoryConfig.currentEditingStoryID) as StoryConfig;
			
			for(var i:int = 0; i < len; i++)
			{
				var type:int = typeArr[i];
				var typeName:String = StoryProxy.getStoryTypeName(type);
				var item:Object = {label: typeName,type:type};
				_view.storyTypeDatas.addItem(item);
				if($editing)
				{
					if(storyConfig.mType == type)
					{
						_view.storyTypeList.selectedItem = item; 
					}
				}
			}
			_view.storyTypeList.enabled = !$editing;
		}
		
		private function updateMapResList($editing:Boolean):void
		{
			var tabel:TabelData=DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
			if(!tabel)
				return;
			
			var storyConfig:StoryConfig = ConfigData.getCfg(tabel.desc,StoryConfig.currentEditingStoryID) as StoryConfig;
			
			var mapResVec:Vector.<String> = StoryProxy.mapResArr;
			if(mapResVec != null)
			{
				_view.datas.removeAll();
				var len:int = mapResVec.length;
				var res:String;
				for(var i:int = 0; i < len; i++)
				{
					res = mapResVec[i];
					var item:Object = {label: res};
					_view.datas.addItem(item);
					if($editing)
					{
						if(storyConfig.mRes == item.label)
						{
							_view.mapList.selectedItem = item;
						}
					}
				}
			}
		}
		
		public function start($editing:Boolean):void
		{
			_editing = $editing;
			if(_editing)
			{
				_view.title = "编辑剧情";
				_view.descText.text = StoryProxy.currentEditingStoryVO.mDesc;
				_view.plotIDText.text = StoryProxy.currentEditingStoryVO.mPlotID.toString();
				_view.scriptIDText.text = StoryProxy.currentEditingStoryVO.mScriptID.toString();
			}
			else
			{
				_view.title = "添加剧情";
				_view.descText.text = "";
				_view.plotIDText.text = "";
				_view.scriptIDText.text = "";
			}
			_view.btn_sure.addEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.btn_cancel.addEventListener(MouseEvent.CLICK,btnCancelClickHandler);
			updateMapResList($editing);
			updateTypeList($editing);
		}
		
		public function stop():void
		{
			_view.btn_sure.removeEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.btn_cancel.removeEventListener(MouseEvent.CLICK,btnCancelClickHandler);
		}
		
		public function dispose():void
		{
			
		}
	}
}