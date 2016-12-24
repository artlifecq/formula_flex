package com.editor.story.view
{
	import com.editor.events.AvatarPreviewEvent;
	import com.editor.events.StorySoundEvent;
	import com.editor.manager.AvatarPreviewManager;
	import com.editor.manager.SoundManager;
	import com.editor.manager.StoryManager;
	import com.editor.story.controller.StoryController;
	import com.editor.story.controller.StoryPreviewController;
	import com.editor.story.data.StoryProxy;
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
	import com.editor.story.enum.StoryActionTimeType;
	import com.editor.story.enum.StoryActionTypeEnum;
	import com.editor.story.enum.StoryTargetTypeEnum;
	import com.editor.story.event.StoryEvent;
	import com.editor.story.view.component.CreateStoryActionPanel;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.enum.CameraModeEnum;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.vo.BaseObj3D;
	
	import flash.events.MouseEvent;
	import flash.geom.Vector3D;
	
	import spark.events.IndexChangeEvent;
	
	import away3d.events.MouseEvent3D;
	
	import org.client.mainCore.manager.EventManager;

	public class CreateStoryActionMediator
	{
		private var _view:CreateStoryActionPanel;
		private var _editing:Boolean;
		private var _createRoleID:int;
		private var _createEffectID:int;
		
		public function get view():CreateStoryActionPanel
		{
			return _view;
		}

		
		public function CreateStoryActionMediator($view:CreateStoryActionPanel)
		{
			_view = $view;
		}
		
		private function btnCancelClickHandler(event:MouseEvent):void
		{
			StoryController.closeCreateStoryActionPanel();
		}
		
		private function btnSureClickHandler(event:MouseEvent):void
		{
			var startTimeStr:String = _view.startTimeText.text;
			if(startTimeStr == null || startTimeStr == "")
			{
				return;
			}
			var startTime:int = parseInt(startTimeStr);
			if(startTime.toString() != startTimeStr)
			{
				return;
			}
			var totalTimeStr:String = _view.totalTimeText.text;
			if(totalTimeStr == null || totalTimeStr == "")
			{
				return;
			}
			var totalTime:int = parseInt(totalTimeStr);
			if(totalTime.toString() != totalTimeStr)
			{
				return;
			}
			if(_view.actionTypeList.selectedIndex < 0)
			{
				return;
			}
			var type:int = _view.actionTypeList.selectedItem.type;
			var valueStr:String = _view.valueText.text;
			if((valueStr == null || valueStr == "") && type != StoryActionTypeEnum.END)
			{
				return;
			}
			var desc:String = _view.descText.text;
			if(_editing)
			{
				StoryProxy.editStoryAction(startTime,totalTime,type,valueStr,desc);
			}
			else
			{
				StoryProxy.createStoryAction(startTime,totalTime,type,valueStr,desc);
			}
			StoryController.closeCreateStoryActionPanel();
		}
		
		private function updateActionList(editing:Boolean):void
		{
			_view.datas.removeAll();
			var typeArr:Array = StoryProxy.getAllActionType();
			var len:int = typeArr.length;
			for(var i:int = 0; i < len; i++)
			{
				var type:int = typeArr[i];
				var typeName:String = StoryProxy.getActionTypeName(type);
				var item:Object = {label: typeName,type:type};
				_view.datas.addItem(item);
				if(editing)
				{
					var storyActionVO:StoryActionVO = StoryProxy.currentEditingActionVO;
					if(storyActionVO.actionType == type)
					{
						_view.actionTypeList.selectedItem = item; 
					}
				}
			}
		}
		
		private function updateTime(editing:Boolean):void
		{
			_view.startTimeText.text = "";
			_view.totalTimeText.text = "";
			var storyActionVO:StoryActionVO = StoryProxy.currentEditingActionVO;
			if(editing)
			{
				_view.startTimeText.text = storyActionVO.startTime.toString();
				_view.totalTimeText.text = storyActionVO.totalTime.toString();
			}
			else
			{
				_view.startTimeText.text = StoryProxy.timelineTime.toString();
				_view.totalTimeText.text = "1000";
			}
			if(_view.actionTypeList.selectedIndex >= 0)
			{
				if(StoryProxy.getTimeTypeByActionType(_view.actionTypeList.selectedItem.type) == StoryActionTimeType.NONE)
				{
					_view.totalTimeText.text = "0";
				}
			}
		}
		
		private function updateDesc(editing:Boolean = false):void
		{
			_view.descText.text = "";
			if(editing)
			{
				var storyActionVO:StoryActionVO = StoryProxy.currentEditingActionVO;
				_view.descText.text = storyActionVO.desc;
			}
		}
		
		//===========================================================================================================================
		private function updateValue(editing:Boolean = false,fromStart:Boolean = false):void
		{
			var actionType:int;
			_view.valueText.text = "";
			if(editing)
			{
				var storyActionVO:StoryActionVO = StoryProxy.currentEditingActionVO;
				_view.valueText.text = storyActionVO.actionValue.toString();
				actionType = storyActionVO.actionType;
				_view.descText.text = storyActionVO.desc;
				var roleTypeVO:StoryActionRoleTypeVO = storyActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_createRoleID = roleTypeVO.roleID;
				}
				else
				{
					var effectTypeVO:StoryActionEffectTypeVO = storyActionVO as StoryActionEffectTypeVO;
					if(effectTypeVO)
					{
						_createEffectID = effectTypeVO.effectID;
					}
				}
				switch(storyActionVO.actionType)
				{
					case StoryActionTypeEnum.CAMERA:
						break;
					case StoryActionTypeEnum.CREATE_ROLE:
						StoryPreviewController.showCreateRoleAction(storyActionVO as StoryActionRoleCreateVO);
						break;
					case StoryActionTypeEnum.REMOVE_ROLE:
						StoryPreviewController.showRemoveRoleAction(storyActionVO as StoryActionRoleRemoveVO);
						break;
					case StoryActionTypeEnum.ROLE_WALK:
						StoryPreviewController.showRoleWalkAction(storyActionVO as StoryActionRoleWalkVO);
						break;
					case StoryActionTypeEnum.ROLE_DO_ACTION:
						StoryPreviewController.showRoleDoActionAction(storyActionVO as StoryActionRoleDoActionVO);
						break;
					case StoryActionTypeEnum.ROLE_FACE_TO:
						StoryPreviewController.showRoleFaceToAction(storyActionVO as StoryActionRoleFaceToVO);
						break;
					case StoryActionTypeEnum.ROLE_ZOOM:
						StoryPreviewController.showRoleZoomAction(storyActionVO as StoryActionRoleZoomVO);
						break;
					case StoryActionTypeEnum.TEXT_1:
						StoryPreviewController.showTextValue(storyActionVO as StoryActionTextVO);
						break;
					case StoryActionTypeEnum.EFFECT_CREATE:
						StoryPreviewController.showEffectCreateAction(storyActionVO as StoryActionEffectCreateVO);
						break;
					case StoryActionTypeEnum.EFFECT_REMOVE:
						StoryPreviewController.showEffectRemoveAction(storyActionVO as StoryActionEffectRemoveVO);
						break;
					case StoryActionTypeEnum.END:
						break;
				}
			}
			else
			{
				if(fromStart)
				{
					_createRoleID = StoryProxy.newRoleID;
					_createEffectID = StoryProxy.newEffectID;
				}
				if(_view.actionTypeList.selectedIndex >= 0)
				{
					actionType = _view.actionTypeList.selectedItem.type;
					switch(_view.actionTypeList.selectedItem.type)
					{
						case StoryActionTypeEnum.CAMERA:
							updateNewCameraValue();
							break;
						case StoryActionTypeEnum.CREATE_ROLE:
							updateNewCreateRoleValue();
							break;
						case StoryActionTypeEnum.REMOVE_ROLE:
							updateNewRemoveRoleValue();
							break;
						case StoryActionTypeEnum.ROLE_WALK:
							updateRoleWalkValue();
							break;
						case StoryActionTypeEnum.ROLE_DO_ACTION:
							updateRoleDoActionValue();
							break;
						case StoryActionTypeEnum.ROLE_FACE_TO:
							updateRoleFaceToValue();
							break;
						case StoryActionTypeEnum.ROLE_ZOOM:
							updateRoleZoomValue();
							break;
						case StoryActionTypeEnum.EFFECT_CREATE:
							updateCreateEffectValue();
							break;
						case StoryActionTypeEnum.EFFECT_REMOVE:
							updateRemoveEffectValue();
							break;
						case StoryActionTypeEnum.TEXT_1:
							updateText1Value();
							break;
						case StoryActionTypeEnum.END:
							updateEndValue();
							break;
						case StoryActionTypeEnum.ADD_SOUND:
							updateSoundValue();
							break;
						case StoryActionTypeEnum.ADD_CAMERA_ROLE:
							updateCameraRoleValue();
							break;
						case StoryActionTypeEnum.ROLE_CONTROL:
							updateRoleControlValue();
							break;
						case StoryActionTypeEnum.HIDE_ROLE:
							updateHideRoleValue();
							break;
					}
				}
			}
			if(actionType == StoryActionTypeEnum.CAMERA)
			{
				_view.cameraUpdateBtn.visible  = true;
			}
			else
			{
				var targetType:int = StoryProxy.getTargetTypeByActionType(actionType); 
				if(targetType == StoryTargetTypeEnum.ROLE)
				{
					StoryPreviewController.updateSelectedRole(_createRoleID);
				}
				else if(targetType == StoryTargetTypeEnum.EFFECT)
				{
					StoryPreviewController.updateSelectedEffect(_createEffectID);
				}
				_view.cameraUpdateBtn.visible  = false;
			}
		}
		
		private function updateNewCameraValue():void
		{
			if(CameraController.mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				_view.valueText.text =  "m" + CameraModeEnum.LOCK_ON_TARGET + ","
					+ int(CameraController.lockedOnPlayerController.lookAtObject.x).toString() + ","
					+ int(CameraController.lockedOnPlayerController.lookAtObject.y).toString() + ","
					+ int(CameraController.lockedOnPlayerController.lookAtObject.z).toString() + ","
					+ int(CameraController.lockedOnPlayerController.distance).toString() + ","
					+ int(CameraController.lockedOnPlayerController.xDeg).toString() + ","
					+ int(CameraController.lockedOnPlayerController.yDeg).toString();
			}
			else if(CameraController.mode == CameraModeEnum.DIRECT_CAMERA)
			{
				_view.valueText.text =  "m" + CameraModeEnum.DIRECT_CAMERA + ","
					+ int(CameraController.directController.targetObject.x).toString() + ","
					+ int(CameraController.directController.targetObject.y).toString() + ","
					+ int(CameraController.directController.targetObject.z).toString() + ","
					+ int(CameraController.directController.xDeg).toString() + ","
					+ int(CameraController.directController.yDeg).toString();
			}
			else if(CameraController.mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT || CameraController.mode == CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET)
			{
				_view.valueText.text =  "m" + CameraModeEnum.FIXED_CAMERA_LOOK_AT + ","
					+ int(CameraController.lookAtController.lookAtObject.x).toString() + ","
					+ int(CameraController.lookAtController.lookAtObject.y).toString() + ","
					+ int(CameraController.lookAtController.lookAtObject.z).toString() + ","
					+ int(CameraController.lookAtController.targetObject.x).toString() + ","
					+ int(CameraController.lookAtController.targetObject.y).toString() + ","
					+ int(CameraController.lookAtController.targetObject.z).toString();
			}
		}
		
		private function updateNewCreateRoleValue():void
		{
			_view.valueText.text = _createRoleID.toString() + ","
				+ AvatarPreviewManager.bodyRes + ","
				+ int(StoryPreviewController._roleX) + ","
				+ int(StoryPreviewController._roleZ) + ","
				+ AvatarPreviewManager.action + ","
				+ int(AvatarPreviewManager.rotationY) + ","
				+ AvatarPreviewManager.scale;
		}
		
		private function updateNewRemoveRoleValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleTypeVO = StoryProxy.currentEditingActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString();
				}
			}
		}
		
		private function updateRoleWalkValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleTypeVO = StoryProxy.currentEditingActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString() + ","
						+ StoryPreviewController._roleX + ","
						+ StoryPreviewController._roleZ + ","
						+ AvatarPreviewManager.action;
				}
			}
		}
		
		private function updateRoleDoActionValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleTypeVO = StoryProxy.currentEditingActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString() + ","
						+ AvatarPreviewManager.action + ","
						+ 1;
				}
			}
		}
		
		private function updateRoleFaceToValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleTypeVO = StoryProxy.currentEditingActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString() + ","
						+ AvatarPreviewManager.rotationY;
				}
			}
		}
		
		private function updateRoleZoomValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleTypeVO = StoryProxy.currentEditingActionVO as StoryActionRoleTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString() + ","
						+ AvatarPreviewManager.scale;
				}
			}
		}
		
		private function updateRemoveEffectValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionEffectTypeVO = StoryProxy.currentEditingActionVO as StoryActionEffectTypeVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.effectID.toString();
				}
			}
		}
		
		private function updateCreateEffectValue():void
		{
			_view.valueText.text = _createEffectID.toString() + ","
				+ AvatarPreviewManager.effectRes + ","
				+ int(StoryPreviewController._roleX) + ","
				+ int(StoryPreviewController._roleZ) + ","
				+ int(AvatarPreviewManager.rotationY) + ","
				+ AvatarPreviewManager.scale;
		}
		
		private function updateText1Value():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var textVO:StoryActionTextVO = StoryProxy.currentEditingActionVO as StoryActionTextVO;
				if(textVO)
				{
					_view.valueText.text = textVO.actionValue;
				}
			}
		}
		
		private function updateEndValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var endVO:StoryActionEndVO = StoryProxy.currentEditingActionVO as StoryActionEndVO;
				if(endVO)
				{
					_view.valueText.text = endVO.actionValue;
				}
			}
		}
		
		
		/**
		 * 更新音效文本显示
		 * @author 杨剑明	  2015-11-4
		 */
		private function updateSoundValue():void
		{
			_view.valueText.text = SoundManager.getInstance().soundPath + ",0";
			if(StoryProxy.currentEditingActionVO)
			{
				var vo:StoryActionSoundVO = StoryProxy.currentEditingActionVO as StoryActionSoundVO;
				if(vo)
				{
					_view.valueText.text = SoundManager.getInstance().soundPath + ","
				 	+ vo.channel;
					
				}
			}
		}
		
		
		/**
		 * 更新镜头文本显示
		 * @author 杨剑明	  2015-11-6
		 */
		private function updateCameraRoleValue():void
		{
			_view.valueText.text = AvatarPreviewManager.bodyRes + ","
				+ StoryPreviewController._roleX + ","
				+ StoryPreviewController._roleZ + ","
				+ AvatarPreviewManager.action + ","
				+_createRoleID.toString();
		}
		
		/**
		 * 更新机关控制文本显示
		 * @author 杨剑明	  2015-11-4
		 */
		private function updateRoleControlValue():void
		{
			_view.valueText.text = StoryPreviewController._roleX + ","
				+ StoryPreviewController._roleZ + ","
			 	+ AvatarPreviewManager.bodyRes + ","
				+ AvatarPreviewManager.action + ","
				+ _createRoleID + ",0";
			if(StoryProxy.currentEditingActionVO)
			{
				var vo:StoryActionRoleControlVO = StoryProxy.currentEditingActionVO as StoryActionRoleControlVO;
				if(vo)
				{
					_view.valueText.text = StoryPreviewController._roleX + ","
						+ StoryPreviewController._roleZ + ","
						+ AvatarPreviewManager.bodyRes + ","
						+ AvatarPreviewManager.action + ","
						+ _createRoleID + ","
						+ vo.areaID;
				}
			}
		}
		
		private function updateHideRoleValue():void
		{
			_view.valueText.text = "";
			if(StoryProxy.currentEditingActionVO)
			{
				var roleTypeVO:StoryActionRoleHideVO = StoryProxy.currentEditingActionVO as StoryActionRoleHideVO;
				if(roleTypeVO)
				{
					_view.valueText.text = roleTypeVO.roleID.toString();
				}
			}
		}
		
		//===========================================================================================================================
		private function btnCameraUpdateClickHandler(event:MouseEvent):void
		{
			updateValue();
		}
		
		private function actionTypeChangedHandler(event:IndexChangeEvent):void
		{
			updateValue(false,true);
			updateTime(false);
		}
		
		private function avatarPreviewChanged(...args):void
		{
			updateValue();
		}
		
		private function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			switch (action)
			{
				case SceneEventAction3D.SCENE_MAP_MOUSE_DOWN: //点击场景
					StoryPreviewController._roleX = position.x;
					StoryPreviewController._roleZ = position.z;
					updateValue();
					break;
			}
		}
		
		
		/**
		 * 选择剧情音效 
		 * @param eventID
		 * @param path
		 * @author 杨剑明	  2015-11-4
		 */
		private function onStorySoundSel(path:String):void
		{
			updateValue();
		}
		
		private function actionCreatedHandler(actionVO:StoryActionVO):void
		{
			switch(actionVO.actionType)
			{
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					//添加镜头
				break;
				case StoryActionTypeEnum.ADD_ROLE_INFO:
					StoryManager.get().addRoleInfo(actionVO as StoryActionRoleInfoVO);
				break;
			}
		}
		
		public function start($editing:Boolean):void
		{
			_editing = $editing;
			if(_editing)
			{
				_view.title = "编辑行为";
			}
			else
			{
				_view.title = "添加行为";
			}
			_view.btn_cancel.addEventListener(MouseEvent.CLICK,btnCancelClickHandler);
			_view.btn_sure.addEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.actionTypeList.addEventListener(IndexChangeEvent.CHANGE,actionTypeChangedHandler);
			_view.cameraUpdateBtn.addEventListener(MouseEvent.CLICK,btnCameraUpdateClickHandler);
			EventManager.addEvent(AvatarPreviewEvent.SELECTED_ACTION,avatarPreviewChanged);
			EventManager.addEvent(AvatarPreviewEvent.SELECTED_ROTATION_Y,avatarPreviewChanged);
			EventManager.addEvent(AvatarPreviewEvent.SELECTED_SCALE,avatarPreviewChanged);
			//EventManager.addEvent(AvatarPreviewEvent.SELECTED_FILE,avatarPreviewChanged);
			EventManager.addEvent(SceneEvent.INTERACTIVE, onSceneInteractive);
			EventManager.addEvent(StorySoundEvent.SELECT_SOUND, onStorySoundSel);
			EventManager.addEvent(StoryEvent.STORY_ACTION_CREATED, actionCreatedHandler);
			EventManager.addEvent(StoryEvent.STORY_ACTION_EDITED, actionCreatedHandler);
			updateActionList($editing);
			updateTime($editing);
			updateValue($editing,true);
			updateDesc($editing);
		}
		
		public function stop():void
		{
			_view.btn_cancel.removeEventListener(MouseEvent.CLICK,btnCancelClickHandler);
			_view.btn_sure.removeEventListener(MouseEvent.CLICK,btnSureClickHandler);
			_view.actionTypeList.removeEventListener(IndexChangeEvent.CHANGE,actionTypeChangedHandler);
			_view.cameraUpdateBtn.removeEventListener(MouseEvent.CLICK,btnCameraUpdateClickHandler);
			EventManager.removeEvent(AvatarPreviewEvent.SELECTED_ACTION,avatarPreviewChanged);
			EventManager.removeEvent(AvatarPreviewEvent.SELECTED_ROTATION_Y,avatarPreviewChanged);
			EventManager.removeEvent(AvatarPreviewEvent.SELECTED_SCALE,avatarPreviewChanged);
			//EventManager.removeEvent(AvatarPreviewEvent.SELECTED_FILE,avatarPreviewChanged);
			EventManager.removeEvent(SceneEvent.INTERACTIVE, onSceneInteractive);
			EventManager.removeEvent(StorySoundEvent.SELECT_SOUND, onStorySoundSel);
			EventManager.removeEvent(StoryEvent.STORY_ACTION_CREATED, actionCreatedHandler);
			EventManager.removeEvent(StoryEvent.STORY_ACTION_EDITED, actionCreatedHandler);
		}
		
		public function dispose():void
		{
			
		}
	}
}