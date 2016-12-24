package com.editor.story.data
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalConfig;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.manager.DataStructuresManager;
	import com.editor.story.data.vo.IActionContainer;
	import com.editor.story.data.vo.StoryActionCameraRoleVO;
	import com.editor.story.data.vo.StoryActionCameraVO;
	import com.editor.story.data.vo.StoryActionEffectCreateVO;
	import com.editor.story.data.vo.StoryActionEffectRemoveVO;
	import com.editor.story.data.vo.StoryActionEffectTypeVO;
	import com.editor.story.data.vo.StoryActionEndVO;
	import com.editor.story.data.vo.StoryActionRoleControlVO;
	import com.editor.story.data.vo.StoryActionRoleCreateVO;
	import com.editor.story.data.vo.StoryActionRoleDoActionVO;
	import com.editor.story.data.vo.StoryActionRoleFaceToVO;
	import com.editor.story.data.vo.StoryActionRoleHideVO;
	import com.editor.story.data.vo.StoryActionRoleInfoVO;
	import com.editor.story.data.vo.StoryActionRoleRemoveVO;
	import com.editor.story.data.vo.StoryActionRoleTypeVO;
	import com.editor.story.data.vo.StoryActionRoleWalkVO;
	import com.editor.story.data.vo.StoryActionRoleZoomVO;
	import com.editor.story.data.vo.StoryActionSoundVO;
	import com.editor.story.data.vo.StoryActionTextVO;
	import com.editor.story.data.vo.StoryActionVO;
	import com.editor.story.data.vo.StoryEventVO;
	import com.editor.story.enum.SeparatorEnum;
	import com.editor.story.enum.StoryActionTimeType;
	import com.editor.story.enum.StoryActionTypeEnum;
	import com.editor.story.enum.StoryEventTriggerTypeEnum;
	import com.editor.story.enum.StoryTargetTypeEnum;
	import com.editor.story.enum.StoryTypeEnum;
	import com.editor.story.event.StoryEvent;
	
	import flash.filesystem.File;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	public class StoryProxy
	{
		/**时间轴当前时间：毫秒*/
		public static var timelineTime:int;
		
		public static function get newEffectID():int
		{
			return currentEditingActionContainer.effectMaxID + 1;
		}
		
		public static function get newRoleID():int
		{
			return currentEditingActionContainer.roleMaxID + 1;
		}
		
		public static function get newStoryEventID():int
		{
			return currentEditingStoryVO.eventMaxID + 1;
		}
		
		public static function get newStoryActionID():int
		{
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				return currentEditingStoryVO.actionMaxID + 1;
			}
			return currentEditingEventVO.actionMaxID + 1;
		}
		
		public static function get storyArr():Array
		{
			return _storyVOHash.getValues();
		}
		
		private static var _storyVOHash:HashMap = new HashMap();
		private static var _mapResVec:Vector.<String>;
		
		public static function get mapResArr():Vector.<String>
		{
			if(_mapResVec == null)
			{
				_mapResVec = new Vector.<String>();
				var mapPath : String = GlobalConfig.mapPath;
				var mapDireFile : File = new File(mapPath);
				if (mapDireFile.exists && mapDireFile.isDirectory)
				{
					var mapFiles : Array = mapDireFile.getDirectoryListing();
					var fileLen : int = mapFiles.length;
					for (var i : int = 0; i < fileLen; i++)
					{
						var mapFile : File = mapFiles[i];
						if (mapFile.isDirectory)
						{
							var mapAwd : File = mapFile.resolvePath(mapFile.name + ".awd");
							if (mapAwd.exists && !mapAwd.isDirectory)
							{
								_mapResVec.push(mapFile.name);
							}
						}
					}
				}
			}
			return (_mapResVec != null)?_mapResVec.concat():null;
		}
		
		public static var currentEditingEventID:int;
		public static var currentEditingActionID:int = -1;
		
		/**
		 * 获取当前行为数据的父容器
		 * @return 
		 * 
		 */
		public static function get currentEditingActionContainer():IActionContainer
		{
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				return currentEditingStoryVO;
			}
			return currentEditingEventVO;
		}
		
		/**
		 * 当前编辑的剧情数据对象
		 * @return 
		 * 
		 */
		public static function get currentEditingStoryVO():StoryConfig
		{
			var tabel:TabelData=DataStructuresManager.getInstance().getTabel(InternalTabelName.XXXStoryConfigName);
			if(!tabel)
				return null;

			var storyConfig:StoryConfig = ConfigData.getCfg(tabel.desc,StoryConfig.currentEditingStoryID) as StoryConfig;
			return storyConfig;
		}
		
		/**
		 * 当前编辑剧情的所有事件
		 * @return 
		 * 
		 */
		public static function get currentEditingEventArr():Array
		{
			return currentEditingStoryVO.eventHash.getValues();
		}
		
		/**
		 * 当前编辑的事件数据对象
		 * @return 
		 * 
		 */
		public static function get currentEditingEventVO():StoryEventVO
		{
			return currentEditingStoryVO.eventHash.getValue(currentEditingEventID);
		}
		
		/**
		 * 当前编辑事件的所有行为
		 * @return 
		 * 
		 */
		public static function get currentEditingActionArr():Array
		{
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				return currentEditingStoryVO.actionHash.getValues();
			}
			return currentEditingEventVO.actionHash.getValues();
		}
		
		/**
		 * 当前编辑的行为数据对象
		 * @return 
		 * 
		 */
		public static function get currentEditingActionVO():StoryActionVO
		{
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				return currentEditingStoryVO.actionHash.getValue(currentEditingActionID);
			}
			return currentEditingEventVO.actionHash.getValue(currentEditingActionID);
		}
		
		/**
		 * 获取当前在编辑的角色对象的行为的创建行为对象
		 * @param actionID
		 * @return 
		 * 
		 */
		public static function getCrrentEdingActionRoleCreateVO(roleID:int):StoryActionRoleCreateVO
		{
			var actionHash:HashMap;
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				actionHash = currentEditingStoryVO.actionHash;
			}
			else
			{
				actionHash = currentEditingEventVO.actionHash;
			}
			var createRoleVO:StoryActionRoleCreateVO;
			var arr:Array = currentEditingActionArr;
			var len:int = arr.length;
			for(var i:int = 0; i < len; i++)
			{
				createRoleVO = arr[i] as StoryActionRoleCreateVO;
				if(createRoleVO && createRoleVO.roleID == roleID)
				{
					break;
				}
			}
			return createRoleVO;
		}
		
		/**
		 * 创建新的剧情事件
		 * @param id
		 * @param type
		 * @param value
		 * @param desc
		 * 
		 */
		public static function createStoryEvent(type:int,value:*,desc:String):void
		{
			var id:int = newStoryEventID;
			var storyEventVO:StoryEventVO = new StoryEventVO();
			storyEventVO.storyID = StoryConfig.currentEditingStoryID;
			storyEventVO.eventID = id;
			storyEventVO.triggerType = type;
			storyEventVO.triggerTypeValue = value;
			storyEventVO.desc = desc;
			var storyVO:StoryConfig = currentEditingStoryVO;
			storyVO.eventHash.add(id,storyEventVO);
			storyVO.eventMaxID = id;
			EventManager.dispatchEvent(StoryEvent.STORY_EVENT_CREATED,storyEventVO);
		}
		
		public static function editStoryEvent(type:int,value:*,desc:String):void
		{
			var storyEventVO:StoryEventVO = currentEditingEventVO;
			storyEventVO.triggerType = type;
			storyEventVO.triggerTypeValue = value;
			storyEventVO.desc = desc;
			EventManager.dispatchEvent(StoryEvent.STORY_EVENT_EDITED);
		}
		
		/**
		 * 创建剧情行为
		 * @param type
		 * @param value
		 * @param desc
		 * 
		 */
		public static function createStoryAction(startTime:int,totalTime:int,type:int,value:String,desc:String):void
		{
			var storyActionVO:StoryActionVO = newActionVO(type);
			storyActionVO.storyID = StoryConfig.currentEditingStoryID;
			storyActionVO.actionID = newStoryActionID;
			storyActionVO.startTime = startTime;
			storyActionVO.totalTime = totalTime;
			storyActionVO.actionType = type;
			storyActionVO.actionValue = value;
			storyActionVO.desc = desc;
			currentEditingActionContainer.actionHash.add(storyActionVO.actionID,storyActionVO);
			currentEditingActionContainer.actionMaxID = storyActionVO.actionID;
			var targetType:int = getTargetTypeByActionType(storyActionVO.actionType);
			if(targetType == StoryTargetTypeEnum.ROLE)
			{
				var actionRoleTypeVO:StoryActionRoleTypeVO = storyActionVO as StoryActionRoleTypeVO;
				currentEditingActionContainer.roleMaxID = Math.max(currentEditingActionContainer.roleMaxID,actionRoleTypeVO.roleID);
			}
			else if(targetType == StoryTargetTypeEnum.EFFECT)
			{
				var actionEffectTypeVO:StoryActionEffectTypeVO = storyActionVO as StoryActionEffectTypeVO;
				currentEditingActionContainer.effectMaxID = Math.max(currentEditingActionContainer.effectMaxID,actionEffectTypeVO.effectID);
			}
			EventManager.dispatchEvent(StoryEvent.STORY_ACTION_CREATED,storyActionVO);
		}
		
		/**
		 * 编辑剧情行为
		 * @param id
		 * @param time
		 * @param type
		 * @param value
		 * @param desc
		 * 
		 */
		public static function editStoryAction(startTime:int,totalTime:int,type:int,value:String,desc:String):void
		{
			var storyActionVO:StoryActionVO = currentEditingActionVO;
			storyActionVO.startTime = startTime;
			storyActionVO.totalTime = totalTime;
			storyActionVO.actionType = type;
			storyActionVO.actionValue = value;
			storyActionVO.desc = desc;
			EventManager.dispatchEvent(StoryEvent.STORY_ACTION_EDITED,storyActionVO);
		}
		
		/**
		 * 移除剧情事件
		 * @param id
		 * 
		 */
		public static function removeStoryEvent(id:int):void
		{
			var storyVO:StoryConfig = currentEditingStoryVO;
			var eventVO:StoryEventVO = storyVO.eventHash.getValue(id);
			if(eventVO)
			{
				storyVO.eventHash.remove(id);
				EventManager.dispatchEvent(StoryEvent.STORY_EVENT_DELETED,id);
			}
		}
		
		/**
		 * 移除剧情行为
		 * @param id
		 * 
		 */
		public static function removeStoryAction(id:int):void
		{
			var actionVO:StoryActionVO;
			var actionHash:HashMap;
			if(currentEditingStoryVO.mType == StoryTypeEnum.ANIMATION)
			{
				actionHash = currentEditingStoryVO.actionHash;
			}
			else
			{
				var eventVO:StoryEventVO = currentEditingEventVO;
				actionHash = eventVO.actionHash;
			}
			
			actionVO = actionHash.getValue(id);
			if(actionVO)
			{
				actionHash.remove(id);
				EventManager.dispatchEvent(StoryEvent.STORY_ACTION_DELETED,id);
			}
		}
		
		public static function getAllStoryType():Array
		{
			return [StoryTypeEnum.ANIMATION,StoryTypeEnum.SCRIPT];
		}
		
		/**
		 * 获取所有事件触发类型
		 * @return 
		 * 
		 */
		public static function getAllEventTriggerType():Array
		{
			return [StoryEventTriggerTypeEnum.TIME];
		}
		
		/**
		 * 获取所有行为类型
		 * @return 
		 * 
		 */
		public static function getAllActionType():Array
		{
			return [
				StoryActionTypeEnum.CAMERA,
				StoryActionTypeEnum.CREATE_ROLE,
				StoryActionTypeEnum.REMOVE_ROLE,
//				StoryActionTypeEnum.ROLE_CHANGE_RES,
				StoryActionTypeEnum.ROLE_DO_ACTION,
				StoryActionTypeEnum.ROLE_FACE_TO,
				StoryActionTypeEnum.ROLE_WALK,
				StoryActionTypeEnum.ROLE_ZOOM,
				StoryActionTypeEnum.EFFECT_CREATE,
				StoryActionTypeEnum.EFFECT_REMOVE,
				StoryActionTypeEnum.ADD_SOUND,
				StoryActionTypeEnum.ADD_CAMERA_ROLE,
				StoryActionTypeEnum.ADD_ROLE_INFO,
				StoryActionTypeEnum.ROLE_CONTROL,
				StoryActionTypeEnum.HIDE_ROLE,
				StoryActionTypeEnum.TEXT_1,
				StoryActionTypeEnum.END
			];
		}
		
		public static function getStoryTypeName(type:int):String
		{
			switch(type)
			{
				case StoryTypeEnum.ANIMATION:
					return "动画";
				case StoryTypeEnum.SCRIPT:
					return "脚本";
			}
			return type.toString();
		}
		
		/**
		 * 获取触发类型名称
		 * @param type
		 * @return 
		 * 
		 */
		public static function getTriggerTypeName(type:int):String
		{
			switch(type)
			{
				case StoryEventTriggerTypeEnum.TIME:
					return "时间(毫秒)";
			}
			return type.toString();
		}
		
		/**
		 * 获取行为类型名称
		 * @param type
		 * @return 
		 * 
		 */
		public static function getActionTypeName(type:int):String
		{
			switch(type)
			{
				case StoryActionTypeEnum.CAMERA:
					return "镜头";
				case StoryActionTypeEnum.CREATE_ROLE:
					return "创建模型";
				case StoryActionTypeEnum.REMOVE_ROLE:
					return "移除模型";
				case StoryActionTypeEnum.ROLE_CHANGE_RES:
					return "模型换装";
				case StoryActionTypeEnum.ROLE_DO_ACTION:
					return "模型做动作";
				case StoryActionTypeEnum.ROLE_FACE_TO:
					return "模型转向";
				case StoryActionTypeEnum.ROLE_WALK:
					return "模型行走";
				case StoryActionTypeEnum.ROLE_ZOOM:
					return "模型缩放";
				case StoryActionTypeEnum.EFFECT_CREATE:
					return "添加特效";
				case StoryActionTypeEnum.TEXT_1:
					return "添加对白";
				case StoryActionTypeEnum.EFFECT_REMOVE:
					return "移除特效";
				case StoryActionTypeEnum.END:
					return "结束";
				case StoryActionTypeEnum.ADD_SOUND:
					return "添加音效";
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					return "镜头模型";
				case StoryActionTypeEnum.ADD_ROLE_INFO:
					return "人物介绍";
				case StoryActionTypeEnum.ROLE_CONTROL:
					return "机关控制";
				case StoryActionTypeEnum.HIDE_ROLE:
					return "隐藏角色";
			}
			return type.toString();
		}
		
		/**
		 * 获取剧情对象类型
		 * @param actionType
		 * @return 
		 * 
		 */
		public static function getTargetTypeByActionType(actionType:int):int
		{
			switch(actionType)
			{
				case StoryActionTypeEnum.CAMERA:
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					return StoryTargetTypeEnum.CAMERA;
				case StoryActionTypeEnum.CREATE_ROLE:
				case StoryActionTypeEnum.REMOVE_ROLE:
				case StoryActionTypeEnum.ROLE_CHANGE_RES:
				case StoryActionTypeEnum.ROLE_DO_ACTION:
				case StoryActionTypeEnum.ROLE_DO_ACTION:
				case StoryActionTypeEnum.ROLE_FACE_TO:
				case StoryActionTypeEnum.ROLE_WALK:
				case StoryActionTypeEnum.ROLE_ZOOM:
				case StoryActionTypeEnum.HIDE_ROLE:
					return StoryTargetTypeEnum.ROLE;
				case StoryActionTypeEnum.EFFECT_CREATE:
				case StoryActionTypeEnum.EFFECT_REMOVE:
					return StoryTargetTypeEnum.EFFECT;
				case StoryActionTypeEnum.TEXT_1:
					return StoryTargetTypeEnum.TEXT;
				case StoryActionTypeEnum.END:
					return StoryTargetTypeEnum.END;
				case StoryActionTypeEnum.ADD_SOUND:
					return StoryTargetTypeEnum.SOUND;
				case StoryActionTypeEnum.ADD_ROLE_INFO:
					return StoryTargetTypeEnum.ROLE_INFO;
				case StoryActionTypeEnum.ROLE_CONTROL:
					return StoryTargetTypeEnum.ROLE_CONTROL;
			}
			return 0;
		}
		
		/**
		 * 获取剧情行为的执行时间类型
		 * @param actionType
		 * @return 
		 * 
		 */
		public static function getTimeTypeByActionType(actionType:int):int
		{
			switch(actionType)
			{
				case StoryActionTypeEnum.CAMERA:
				case StoryActionTypeEnum.ROLE_WALK:
				case StoryActionTypeEnum.ROLE_FACE_TO:
				case StoryActionTypeEnum.ROLE_ZOOM:
				case StoryActionTypeEnum.ROLE_DO_ACTION:
				case StoryActionTypeEnum.TEXT_1:
					return StoryActionTimeType.NORMAL;
				case StoryActionTypeEnum.CREATE_ROLE:
				case StoryActionTypeEnum.REMOVE_ROLE:
				case StoryActionTypeEnum.ROLE_CHANGE_RES:
				case StoryActionTypeEnum.EFFECT_CREATE:
				case StoryActionTypeEnum.EFFECT_REMOVE:
				case StoryActionTypeEnum.END:
					return StoryActionTimeType.NONE;
			}
			return 0;
		}
		
		/**
		 * 转换事件列表成字符串
		 * @param hash
		 * @return 
		 * 
		 */
		public static function transEventHashStr(hash:HashMap):String
		{
			var value:String = "";
			var arr:Array = hash.getValues();
			var len:int = arr.length;
			for(var i:int = 0; i < len; i++)
			{
				var vo:StoryEventVO = arr[i];
				value += transEventVOToStr(vo);
				if(i < len - 1)
				{
					value += SeparatorEnum.EVENT;
				}
			}
			return value;
		}
		
		/**
		 * 转换事件对象成字符串
		 * @param vo
		 * @return 
		 * 
		 */
		private static function transEventVOToStr(vo:StoryEventVO):String
		{
			var value:String = "";
			value += vo.eventID;
			value += SeparatorEnum.EVENT_PROPERTY;
			value += vo.triggerType;
			value += SeparatorEnum.EVENT_PROPERTY;
			value += vo.triggerTypeValue;
			value += SeparatorEnum.EVENT_PROPERTY;
			value += vo.desc;
			value += SeparatorEnum.EVENT_PROPERTY;
			value += transActionHashToStr(vo.actionHash);
			return value;
		}
		
		/**
		 * 转换行为列表成字符串
		 * @param hash
		 * @return 
		 * 
		 */
		public static function transActionHashToStr(hash:HashMap):String
		{
			var value:String = "";
			var arr:Array = hash.getValues();
			var len:int = arr.length;
			for(var i:int = 0; i < len; i++)
			{
				var vo:StoryActionVO = arr[i];
				value += transActionVOToStr(vo);
				if(i < len - 1)
				{
					value += SeparatorEnum.ACTION;
				}
			}
			return value;
		}
		
		/**
		 * 转换行为对象成字符串
		 * @param vo
		 * @return 
		 * 
		 */
		private static function transActionVOToStr(vo:StoryActionVO):String
		{
			var value:String = "";
			value += vo.actionID;
			value += SeparatorEnum.ACTION_PROPERTY;
			value += vo.actionType;
			value += SeparatorEnum.ACTION_PROPERTY;
			value += vo.startTime;
			value += SeparatorEnum.ACTION_PROPERTY;
			value += vo.totalTime;
			value += SeparatorEnum.ACTION_PROPERTY;
			value += vo.actionValue;
			value += SeparatorEnum.ACTION_PROPERTY;
			value += vo.desc;
			return value;
		}
		
		/**
		 * 转换字符串成事件行为列表
		 * @param str
		 * @param storyVO
		 * 
		 */
		public static function transStrToHash(str:String,storyVO:StoryConfig):void
		{
			if(str && str.length > 0)
			{
				if(str.indexOf(SeparatorEnum.EVENT_PROPERTY) >= 0)
				{
					transStrToEventHash(str,storyVO);
				}
				else
				{
					transStrToActionHash(str,storyVO);
				}
			}
		}
		
		/**
		 * 转换字符串成事件列表
		 * @param str
		 * @param storyVO
		 * 
		 */
		private static function transStrToEventHash(str:String,storyVO:StoryConfig):void
		{
			var eventStrArr:Array = str.split(SeparatorEnum.EVENT);
			var len:int = eventStrArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var eventStr:String = eventStrArr[i];
				var eventVO:StoryEventVO = transStrToEventVO(eventStr);
				storyVO.eventMaxID = Math.max(storyVO.eventMaxID,eventVO.eventID);
				storyVO.eventHash.add(eventVO.eventID,eventVO);
			}
		}
		
		/**
		 * 转换字符串成行为列表
		 * @param str
		 * @param actionContainer
		 * 
		 */
		private static function transStrToActionHash(str:String,actionContainer:IActionContainer):void
		{
			var actionStrArr:Array = str.split(SeparatorEnum.ACTION);
			var len:int = actionStrArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var actionStr:String = actionStrArr[i];
				var actionVO:StoryActionVO = transStrToActionVO(actionStr);
				actionContainer.actionMaxID = Math.max(actionContainer.actionMaxID,actionVO.actionID);
				actionContainer.actionHash.add(actionVO.actionID,actionVO);
				var targetType:int = getTargetTypeByActionType(actionVO.actionType);
				if(targetType == StoryTargetTypeEnum.ROLE)
				{
					var actionRoleTypeVO:StoryActionRoleTypeVO = actionVO as StoryActionRoleTypeVO;
					actionContainer.roleMaxID = Math.max(actionContainer.roleMaxID,actionRoleTypeVO.roleID);
				}
				else if(targetType == StoryTargetTypeEnum.EFFECT)
				{
					var actionEffectTypeVO:StoryActionEffectTypeVO = actionVO as StoryActionEffectTypeVO;
					actionContainer.effectMaxID = Math.max(actionContainer.effectMaxID,actionEffectTypeVO.effectID);
				}
			}
		}
		
		/**
		 * 转换字符串成行为对象
		 * @param str
		 * @return 
		 * 
		 */
		private static function transStrToActionVO(str:String):StoryActionVO
		{
			var strArr:Array = str.split(SeparatorEnum.ACTION_PROPERTY);
			var actionType:int = parseInt(strArr[1]);
			var storyActionVO:StoryActionVO = newActionVO(actionType);
			storyActionVO.actionID = parseInt(strArr[0]);
			storyActionVO.actionType = actionType;
			storyActionVO.startTime = parseInt(strArr[2]);
			storyActionVO.totalTime = parseInt(strArr[3]);
			storyActionVO.actionValue = strArr[4];
			storyActionVO.desc = strArr[5];
			return storyActionVO;
		}
		
		/**
		 * 转换字符串成事件对象
		 * @param str
		 * @return 
		 * 
		 */
		private static function transStrToEventVO(str:String):StoryEventVO
		{
			var strArr:Array = str.split(SeparatorEnum.EVENT_PROPERTY);
			var vo:StoryEventVO = new StoryEventVO();
			vo.eventID = parseInt(strArr[0]);
			vo.triggerType = parseInt(strArr[1]);
			vo.triggerTypeValue = strArr[2];
			vo.desc = strArr[3];
			var actionStrs:String = strArr[4];
			if(actionStrs != null && actionStrs.length > 0)
			{
				transStrToActionHash(actionStrs,vo);
			}
			return vo;
		}
		
		/**
		 * 更具行为类型新建行为对象
		 * @param actionType
		 * @return 
		 * 
		 */
		private static function newActionVO(actionType:int):StoryActionVO
		{
			var storyActionVO:StoryActionVO;
			switch(actionType)
			{
				case StoryActionTypeEnum.CAMERA:
					storyActionVO = new StoryActionCameraVO();
					break;
				case StoryActionTypeEnum.CREATE_ROLE:
					storyActionVO = new StoryActionRoleCreateVO();
					break;
				case StoryActionTypeEnum.REMOVE_ROLE:
					storyActionVO = new StoryActionRoleRemoveVO();
					break;
				case StoryActionTypeEnum.ROLE_WALK:
					storyActionVO = new StoryActionRoleWalkVO();
					break;
				case StoryActionTypeEnum.ROLE_DO_ACTION:
					storyActionVO = new StoryActionRoleDoActionVO();
					break;
				case StoryActionTypeEnum.ROLE_FACE_TO:
					storyActionVO = new StoryActionRoleFaceToVO();
					break;
				case StoryActionTypeEnum.ROLE_ZOOM:
					storyActionVO = new StoryActionRoleZoomVO();
					break;
				case StoryActionTypeEnum.TEXT_1:
					storyActionVO = new StoryActionTextVO();
					break;
				case StoryActionTypeEnum.EFFECT_CREATE:
					storyActionVO = new StoryActionEffectCreateVO();
					break;
				case StoryActionTypeEnum.EFFECT_REMOVE:
					storyActionVO = new StoryActionEffectRemoveVO();
					break;
				case StoryActionTypeEnum.END:
					storyActionVO = new StoryActionEndVO;
					break;
				case StoryActionTypeEnum.ADD_SOUND:
					storyActionVO = new StoryActionSoundVO();
					break;
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					storyActionVO = new StoryActionCameraRoleVO();
					break;
				case StoryActionTypeEnum.ADD_ROLE_INFO:
					storyActionVO = new StoryActionRoleInfoVO();
					break;
				case StoryActionTypeEnum.ROLE_CONTROL:
					storyActionVO = new StoryActionRoleControlVO();
					break;
				case StoryActionTypeEnum.HIDE_ROLE:
					storyActionVO = new StoryActionRoleHideVO();
					break;
				
			}
			return storyActionVO;
		}
		
	}
}