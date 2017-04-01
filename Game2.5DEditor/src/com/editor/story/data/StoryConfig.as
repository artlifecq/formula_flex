package com.editor.story.data
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.manager.DataStructuresManager;
	import com.editor.story.data.vo.IActionContainer;
	import com.editor.story.event.StoryEvent;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	public class StoryConfig extends ConfigData implements IActionContainer
	{
		public static var currentEditingStoryID:int;
		private var _eventMaxID:int;

		public function get eventMaxID():int
		{
			return _eventMaxID;
		}

		public function set eventMaxID(value:int):void
		{
			_eventMaxID = value;
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
		
		public var eventHash:HashMap = new HashMap();
		private var _actionHash:HashMap = new HashMap();

		public function get actionHash():HashMap
		{
			return _actionHash;
		}
		
		public function StoryConfig()
		{
			super();
		}
		
		public function get mRes():String
		{
			var field : String = "res";
			return this[field];
		}
		
		public function set mRes(value:String):void
		{
			var field : String = "res";
			this[field] = value;
		}
		
		public function get mDesc():String
		{
			var field : String = "desc";
			return this[field];
		}
		
		public function set mDesc(value:String):void
		{
			var field : String = "desc";
			this[field] = value;
		}
		
		public function get mPlotID():int
		{
			var field : String = "plotID";
			return this[field];
		}
		
		public function set mPlotID(value:int):void
		{
			var field : String = "plotID";
			this[field] = value;
		}
		
		public function get mScriptID():int
		{
			var field : String = "scriptID";
			return this[field];
		}
		
		public function set mScriptID(value:int):void
		{
			var field : String = "scriptID";
			this[field] = value;
		}
		
		public function get mType():int
		{
			var field : String = "type";
			return this[field];
		}
		
		public function set mType(value:int):void
		{
			var field : String = "type";
			this[field] = value;
		}
		
		public function get value():String
		{
			var storyValue:String = "";
			if(eventHash.length > 0)
			{
				storyValue = StoryProxy.transEventHashStr(eventHash);
			}
			else if(actionHash.length > 0)
			{
				storyValue = StoryProxy.transActionHashToStr(actionHash);
			}
			return storyValue;
		}
		
		public function set value($value:String):void
		{
			StoryProxy.transStrToHash($value,this);
		}
		
		public function get typeName():String
		{
			return StoryProxy.getStoryTypeName(mType);
		}
		
//		public static function create(res:String, desc:String, type:int,plotID:int,scriptID:int) : void
//		{
//			var cfg : StoryConfig = ConfigData.create(configDesc,["mRes","mDesc","mPlotID","mScriptID","mType"],[res,desc,plotID,scriptID,type],StoryConfig) as StoryConfig;
////			UID++;
////			var cfg : StoryConfig = new StoryConfig();
////			configDesc.initDataFields(cfg);
////			cfg.id = UID;
////			cfg.mRes = res;
////			cfg.mDesc = desc;
////			cfg.mPlotID = plotID;
////			cfg.mScriptID = scriptID;
////			cfg.mType = type;
////			configDesc.cacheDic[cfg.id] = cfg;
//			EventManager.dispatchEvent(StoryEvent.STORY_CREATED,cfg);
//		}
		
		public static function edit(mapRes:String,desc:String, type:int,plotID:int,scriptID:int):void
		{
			var tabel:TabelData=DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
			if(!tabel)
				return;
			
			var storyConfig:StoryConfig = ConfigData.getCfg(tabel.desc,currentEditingStoryID) as StoryConfig;
			storyConfig.mRes = mapRes;
			storyConfig.mDesc = desc;
			storyConfig.mType = type;
			storyConfig.mPlotID = plotID;
			storyConfig.mScriptID = scriptID;
			EventManager.dispatchEvent(StoryEvent.STORY_EDITED);
		}
		
//		public static function remove(id : int) : void
//		{
//			var cfg : StoryConfig = getCfg(id);
//			delete configDesc.cacheDic[id];
//			EventManager.dispatchEvent(StoryEvent.STORY_DELETED);
//		}
//		
//		public static function getCfg(id : int) : StoryConfig
//		{
//			return configDesc.cacheDic[id];
//		}

	}
}