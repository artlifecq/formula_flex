package com.editor.story.controller
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.enum.SceneCharType;
	import com.editor.manager.AvatarManager;
	import com.editor.manager.AvatarPreviewManager;
	import com.editor.manager.SceneManager;
	import com.editor.manager.SceneRoleManager;
	import com.editor.manager.StoryManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.PlayActionStateReference;
	import com.editor.story.data.StoryProxy;
	import com.editor.story.data.vo.StoryActionCameraRoleVO;
	import com.editor.story.data.vo.StoryActionCameraVO;
	import com.editor.story.data.vo.StoryActionEffectCreateVO;
	import com.editor.story.data.vo.StoryActionEffectRemoveVO;
	import com.editor.story.data.vo.StoryActionEndVO;
	import com.editor.story.data.vo.StoryActionRoleControlVO;
	import com.editor.story.data.vo.StoryActionRoleCreateVO;
	import com.editor.story.data.vo.StoryActionRoleDoActionVO;
	import com.editor.story.data.vo.StoryActionRoleFaceToVO;
	import com.editor.story.data.vo.StoryActionRoleHideVO;
	import com.editor.story.data.vo.StoryActionRoleInfoVO;
	import com.editor.story.data.vo.StoryActionRoleRemoveVO;
	import com.editor.story.data.vo.StoryActionRoleWalkVO;
	import com.editor.story.data.vo.StoryActionRoleZoomVO;
	import com.editor.story.data.vo.StoryActionSoundVO;
	import com.editor.story.data.vo.StoryActionTextVO;
	import com.editor.story.data.vo.StoryActionVO;
	import com.editor.story.enum.StoryActionTypeEnum;
	import com.editor.story.event.StoryEvent;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.enum.CameraModeEnum;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.game.engine3D.vo.BaseRole;
	import com.game.mainCore.core.manager.SoundManager;

	import flash.events.Event;
	import flash.geom.Matrix3D;
	import flash.utils.getTimer;

	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;
	import away3d.containers.SkeletonBone;
	import away3d.entities.Mesh;

	import gs.TweenLite;
	import gs.easing.Linear;

	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	import starling.text.TextField;

	public class StoryPreviewController
	{
		public static var isPreviewing : Boolean;
		private static var _tweenVec : Vector.<TweenLite> = new Vector.<TweenLite>();
		private static var _roleHash : HashMap = new HashMap();
		private static var _effectHash : HashMap = new HashMap();
		public static var _roleX : int;
		public static var _roleZ : int;
		private static var _selectedRu : RenderParamData = new RenderParamData(RenderUnitID.SELECTED_RING, RenderUnitType.SELECTED_RING, GlobalConfig.getEffectFilePath("ring/quanlv"));
		private static var _selectedRole : SceneRole;
		private static var _mode : int;
		private static var _textLabel : TextField;

		private static var _cameraLastTime : int;
		private static var _objContainer3D : ObjectContainer3D;
		private static var _curCameraVO : StoryActionCameraRoleVO;
		private static var _isPreview : Boolean = false;
		private static var _isPause : Boolean = false;
		private static var _startTime : int = 0;
		private static var _pauseTime : int;

		private static function selected(role : SceneRole) : void
		{
			if (_selectedRole == role)
			{
				return;
			}
			if (_selectedRole != null)
			{
				_selectedRole.avatar.removeRenderUnitByID(RenderUnitType.SELECTED_RING, RenderUnitID.SELECTED_RING);
			}
			_selectedRole = role;
			var effectRu : RenderUnit3D = role.avatar.addRenderUnit(_selectedRu);
			effectRu.repeat = 0;
			effectRu.play(0);
		}

		public static function updateSelectedRole(roleID : int) : void
		{
			if (_selectedRole != null && _selectedRole.id == roleID)
			{
				var data : RoleData = _selectedRole.data as RoleData;
				data.avatarInfo.setBodyResID(AvatarPreviewManager.bodyRes, null);
				AvatarManager.callEquipmentChange(_selectedRole);
				_selectedRole.setScale(AvatarPreviewManager.scale);
				_selectedRole.rotationY = AvatarPreviewManager.rotationY;
				var ref : PlayActionStateReference = _selectedRole.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
				ref.setParams(AvatarPreviewManager.action);
				_selectedRole.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
				_selectedRole.setGroundXY(StoryPreviewController._roleX, StoryPreviewController._roleZ);
			}
		}

		public static function updateSelectedEffect(effectID : int) : void
		{
			if (_selectedRole != null && _selectedRole.id == effectID)
			{
				var data : RoleData = _selectedRole.data as RoleData;
				data.avatarInfo.effectResID = AvatarPreviewManager.effectRes;
				AvatarManager.callEquipmentChange(_selectedRole);
				var ref : PlayActionStateReference = _selectedRole.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
				ref.setParams(RoleActionType.IDLE);
				_selectedRole.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
				_selectedRole.setScale(AvatarPreviewManager.scale);
				_selectedRole.rotationY = AvatarPreviewManager.rotationY;
				_selectedRole.setGroundXY(StoryPreviewController._roleX, StoryPreviewController._roleZ);
			}
		}

		public static function showCameraAction(actionVO : StoryActionCameraVO) : void
		{
			var mode : int = CameraController.mode;
			if (actionVO.mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				CameraController.switchToLockOnControl();
				SceneRoleManager.getInstance().targetPlayer.x = actionVO.tx;
				SceneRoleManager.getInstance().targetPlayer.y = actionVO.ty;
				SceneRoleManager.getInstance().targetPlayer.z = actionVO.tz;
				CameraController.lockedOnPlayerController.distance = actionVO.distance;
				CameraController.lockedOnPlayerController.xDeg = actionVO.xDeg;
				CameraController.lockedOnPlayerController.yDeg = actionVO.yDeg;
			}
			else if (actionVO.mode == CameraModeEnum.DIRECT_CAMERA)
			{
				CameraController.switchToDirectControl();
				CameraController.directController.targetObject.x = actionVO.cx;
				CameraController.directController.targetObject.y = actionVO.cy;
				CameraController.directController.targetObject.z = actionVO.cz;
				CameraController.directController.xDeg = actionVO.xDeg;
				CameraController.directController.yDeg = actionVO.yDeg;
			}
			else if (actionVO.mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
				CameraController.switchToFixedCameraLookAtControl();
				SceneRoleManager.getInstance().targetPlayer.x = actionVO.tx;
				SceneRoleManager.getInstance().targetPlayer.y = actionVO.ty;
				SceneRoleManager.getInstance().targetPlayer.z = actionVO.tz;
				CameraController.lookAtController.targetObject.x = actionVO.cx;
				CameraController.lookAtController.targetObject.y = actionVO.cy;
				CameraController.lookAtController.targetObject.z = actionVO.cz;
			}
			if (mode != actionVO.mode)
			{
				CameraController.mode = mode;
			}
		}

		public static function showCreateRoleAction(vo : StoryActionRoleCreateVO, value : String = null) : void
		{
			if (vo == null)
			{
				vo = new StoryActionRoleCreateVO();
				vo.actionValue = value;
			}
			AvatarPreviewManager.setRes(vo.bodyRes);
			AvatarPreviewManager.setAction(vo.action);
			AvatarPreviewManager.setRotationY(vo.rotationY);
			AvatarPreviewManager.setScale(vo.scale);
			_roleX = vo.tx;
			_roleZ = vo.tz;
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role == null)
			{
				role = previewActionCreateRole(vo);
			}
			role.setScale(vo.scale);
			role.rotationY = vo.rotationY;
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(vo.action);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			role.setGroundXY(vo.tx, vo.tz);
			selected(role);
		}

		public static function showRemoveRoleAction(vo : StoryActionRoleRemoveVO) : void
		{
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role != null)
			{
				removeRole(role, vo.roleID);
			}
		}

		public static function showRoleWalkAction(vo : StoryActionRoleWalkVO, value : String = null, roleID : int = 0) : void
		{
			if (vo == null)
			{
				vo = new StoryActionRoleWalkVO();
				vo.actionValue = value;
			}
			else
			{
				roleID = vo.roleID;
			}
			var createRoleVO : StoryActionRoleCreateVO = StoryProxy.getCrrentEdingActionRoleCreateVO(roleID);
			if (createRoleVO)
			{
				AvatarPreviewManager.setRes(createRoleVO.bodyRes);
				AvatarPreviewManager.setRotationY(createRoleVO.rotationY);
				AvatarPreviewManager.setScale(1);
			}
			AvatarPreviewManager.setAction(RoleActionType.WALK);
			_roleX = vo.tx;
			_roleZ = vo.tz;
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role == null)
			{
				role = previewActionCreateRole(createRoleVO);
			}
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(vo.action);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			role.setGroundXY(vo.tx, vo.tz);
			selected(role);
		}

		public static function showRoleDoActionAction(vo : StoryActionRoleDoActionVO, value : String = null, roleID : int = 0) : void
		{
			if (vo == null)
			{
				vo = new StoryActionRoleDoActionVO();
				vo.actionValue = value;
			}
			else
			{
				roleID = vo.roleID;
			}
			var createRoleVO : StoryActionRoleCreateVO = StoryProxy.getCrrentEdingActionRoleCreateVO(roleID);
			if (createRoleVO)
			{
				AvatarPreviewManager.setRes(createRoleVO.bodyRes);
				AvatarPreviewManager.setRotationY(createRoleVO.rotationY);
				AvatarPreviewManager.setScale(1);
			}
			AvatarPreviewManager.setAction(vo.action);
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role == null)
			{
				role = previewActionCreateRole(createRoleVO);
			}
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(vo.action);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			selected(role);
		}

		public static function showRoleFaceToAction(vo : StoryActionRoleFaceToVO, value : String = null, roleID : int = 0) : void
		{
			if (vo == null)
			{
				vo = new StoryActionRoleFaceToVO();
				vo.actionValue = value;
			}
			else
			{
				roleID = vo.roleID;
			}
			var createRoleVO : StoryActionRoleCreateVO = StoryProxy.getCrrentEdingActionRoleCreateVO(roleID);
			if (createRoleVO)
			{
				AvatarPreviewManager.setRes(createRoleVO.bodyRes);
				AvatarPreviewManager.setAction(createRoleVO.action);
				AvatarPreviewManager.setScale(1);
			}
			AvatarPreviewManager.setRotationY(vo.rotationY);
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role == null)
			{
				role = previewActionCreateRole(createRoleVO);
			}
			role.rotationY = vo.rotationY;
			selected(role);
		}

		public static function showRoleZoomAction(vo : StoryActionRoleZoomVO, value : String = null, roleID : int = 0) : void
		{
			if (vo == null)
			{
				vo = new StoryActionRoleZoomVO();
				vo.actionValue = value;
			}
			else
			{
				roleID = vo.roleID;
			}
			var createRoleVO : StoryActionRoleCreateVO = StoryProxy.getCrrentEdingActionRoleCreateVO(roleID);
			if (createRoleVO)
			{
				AvatarPreviewManager.setRes(createRoleVO.bodyRes);
				AvatarPreviewManager.setAction(createRoleVO.action);
				AvatarPreviewManager.setRotationY(createRoleVO.rotationY);
			}
			AvatarPreviewManager.setScale(vo.scale);
			var role : SceneRole = _roleHash.getValue(vo.roleID);
			if (role == null)
			{
				role = previewActionCreateRole(createRoleVO);
			}
			role.setScale(vo.scale);
			selected(role);
		}

		public static function showEffectCreateAction(vo : StoryActionEffectCreateVO) : void
		{
			AvatarPreviewManager.setRes(null, null, null, vo.res);
			AvatarPreviewManager.setRotationY(vo.rotationY);
			AvatarPreviewManager.setScale(vo.scale);
			_roleX = vo.tx;
			_roleZ = vo.tz;
			var role : SceneRole = _effectHash.getValue(vo.effectID);
			if (role == null)
			{
				role = previewActionEffectCreate(vo);
			}
			role.setScale(vo.scale);
			role.rotationY = vo.rotationY;
			role.setGroundXY(vo.tx, vo.tz);
			selected(role);
		}

		public static function showEffectRemoveAction(vo : StoryActionEffectRemoveVO) : void
		{
			previewActionEffectRemove(vo);
		}

		public static function showTextValue(vo : StoryActionTextVO) : void
		{
			EventManager.dispatchEvent(StoryEvent.STORY_ACTION_TEXT_SHOW, vo.actionValue);
		}

		public static function preview() : void
		{
			clear();
			_mode = CameraController.mode;
			var endTime : int = 100;
			var actionArr : Array = StoryProxy.currentEditingActionArr;
			var len : int = actionArr.length;
			for (var i : int = 0; i < len; i++)
			{
				var actionVO : StoryActionVO = actionArr[i];
				initAction(actionVO);
				endTime = Math.max(endTime, actionVO.startTime + actionVO.totalTime);
			}
			endTime += 500;
			var tween : TweenLite = TweenLite.delayedCall(endTime / 1000, quit);
			_tweenVec.push(tween);

			Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, updateTime);
			_startTime = getTimer();
			_pauseTime = 0;

		}

		/**
		 * 退出
		 */
		public static function esc() : void
		{
			if (_isPreview)
			{
				quit();
			}
		}

		/**
		 * 暂停
		 */
		public static function pause() : void
		{
			if (_isPreview)
			{
				if (_isPause)
				{
					_isPause = false;
					_roleHash.forEach(function(roleID : int, role : SceneRole) : void
					{
						role.stateMachine.actionResume();
					});

					_effectHash.forEach(function(roleID : int, role : SceneRole) : void
					{
						role.stateMachine.actionResume();
					});
					if (_objContainer3D)
					{
						Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, cameraUpdate);
					}
					Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, updateTime);
					_pauseTime = getTimer() - _pauseTime;
				}
				else
				{
					_isPause = true;
					_roleHash.forEach(function(roleID : int, role : SceneRole) : void
					{
						role.stateMachine.actionPause();
					});

					_effectHash.forEach(function(roleID : int, role : SceneRole) : void
					{
						role.stateMachine.actionPause();
					});
					Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, cameraUpdate);
					Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, updateTime);
					_pauseTime = getTimer();
				}
			}
		}

		private static function quit() : void
		{
			clear();
			CameraController.mode = _mode;
			StoryController.openStoryActionListWindow();
			_cameraLastTime = 0;
			Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, updateTime);
			Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, cameraUpdate);
			_isPreview = false;
			_isPause = false;
			SoundManager.removeAllSounds();
		}


		/**
		 * 更新当前时间
		 */
		private static function updateTime(event : Event) : void
		{
			var curTime : int = getTimer();
			EventManager.dispatchEvent(StoryEvent.STORY_UPDATE_TIME, curTime - _startTime);
		}

		private static function clear() : void
		{
			var len : int = _tweenVec.length;
			for (var i : int = 0; i < len; i++)
			{
				var tween : TweenLite = _tweenVec[i];
				tween.kill();
			}
			_tweenVec.length = 0;
			_selectedRole = null;
			SceneManager.getInstance().mainScene.removeAllSceneObj();
			_roleHash.clear();
			_effectHash.clear();
		}

		private static function initAction(actionVO : StoryActionVO) : void
		{
			if (actionVO.startTime)
			{
				var delay : Number = actionVO.startTime / 1000;
				var tween : TweenLite = TweenLite.delayedCall(delay, previewAction, [actionVO]);
				_tweenVec.push(tween);
			}
			else
			{
				previewAction(actionVO);
			}
		}

		private static function previewAction(actionVO : StoryActionVO) : void
		{
			_isPreview = true;
			switch (actionVO.actionType)
			{
				case StoryActionTypeEnum.CAMERA:
					previewActionCamera(actionVO as StoryActionCameraVO);
					break;
				case StoryActionTypeEnum.CREATE_ROLE:
					previewActionCreateRole(actionVO as StoryActionRoleCreateVO);
					break;
				case StoryActionTypeEnum.REMOVE_ROLE:
					previewActionRemoveRole(actionVO as StoryActionRoleRemoveVO);
					break;
				case StoryActionTypeEnum.ROLE_WALK:
					previewActionRoleWalk(actionVO as StoryActionRoleWalkVO);
					break;
				case StoryActionTypeEnum.ROLE_DO_ACTION:
					previewActionRoleDoAction(actionVO as StoryActionRoleDoActionVO);
					break;
				case StoryActionTypeEnum.ROLE_FACE_TO:
					previewActionRoleFaceTo(actionVO as StoryActionRoleFaceToVO);
					break;
				case StoryActionTypeEnum.ROLE_ZOOM:
					previewActionRoleZoom(actionVO as StoryActionRoleZoomVO);
					break;
				case StoryActionTypeEnum.TEXT_1:
					previewActionText(actionVO as StoryActionTextVO);
					break;
				case StoryActionTypeEnum.EFFECT_CREATE:
					previewActionEffectCreate(actionVO as StoryActionEffectCreateVO);
					break;
				case StoryActionTypeEnum.EFFECT_REMOVE:
					previewActionEffectRemove(actionVO as StoryActionEffectRemoveVO);
					break;
				case StoryActionTypeEnum.END:
					previewActionEnd(actionVO as StoryActionEndVO);
					break;
				case StoryActionTypeEnum.ADD_SOUND:
					previewActionAddSound(actionVO as StoryActionSoundVO);
					break;
				case StoryActionTypeEnum.ADD_CAMERA_ROLE:
					previewCameraRole(actionVO as StoryActionCameraRoleVO);
					break;
				case StoryActionTypeEnum.ADD_ROLE_INFO:
					previewRoleInfo(actionVO as StoryActionRoleInfoVO);
					break;
				case StoryActionTypeEnum.ROLE_CONTROL:
					previewRoleControl(actionVO as StoryActionRoleControlVO);
					break;
				case StoryActionTypeEnum.HIDE_ROLE:
					previewHideRole(actionVO as StoryActionRoleHideVO);
					break;
			}
		}


		/**
		 * 隐藏角色
		 * @author 杨剑明	  2015-11-26
		 */
		private static function previewHideRole(actionVO : StoryActionRoleHideVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
				role.visible = false;
				var tween : TweenLite = TweenLite.delayedCall(actionVO.totalTime / 1000, function(role : SceneRole) : void
				{
					role.visible = true;
				}, [role]);
			}
		}

		/**
		 * 机关控制
		 * @author 杨剑明	  2015-11-19
		 */
		private static function previewRoleControl(actionVO : StoryActionRoleControlVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role == null)
			{
				role = SceneRole.create(SceneCharType.DUMMY, actionVO.roleID);
				var data : RoleData = new RoleData();
				data.id = actionVO.roleID;
				data.name = "";
				data.avatarInfo.setBodyResID(actionVO.resRole, null);
				data.sizeScale = 1;

				//设置VO
				role.data = data;
				role.name = data.name;
				role.setGroundXY(actionVO.tx, actionVO.tz);
				role.offsetY = 0;
				role.startRender();
				//执行主换装更新
				AvatarManager.callEquipmentChange(role);
				role.setScale(data.sizeScale);
				role.rotationY = 0;
				SceneManager.getInstance().addSceneObjToMainScene(role, true);
				_roleHash.add(actionVO.roleID, role);
			}
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(actionVO.actionID.toString());
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);

		}

		private static function previewActionCamera(actionVO : StoryActionCameraVO) : void
		{
			var tween : TweenLite;
			if (actionVO.totalTime)
			{
				var delay : Number = actionVO.totalTime / 1000;
				if (actionVO.mode == CameraModeEnum.LOCK_ON_TARGET)
				{
					CameraController.switchToLockOnControl();
					tween = TweenLite.to(SceneRoleManager.getInstance().targetPlayer, delay, {x: actionVO.tx, y: actionVO.ty, z: actionVO.tz, ease: Linear.easeNone});
					_tweenVec.push(tween);
					tween = TweenLite.to(CameraController.lockedOnPlayerController, delay, {distance: actionVO.distance, xDeg: actionVO.xDeg, yDeg: actionVO.yDeg, ease: Linear.easeNone});
					_tweenVec.push(tween);
				}
				else if (actionVO.mode == CameraModeEnum.DIRECT_CAMERA)
				{
					CameraController.switchToDirectControl();
					tween = TweenLite.to(CameraController.directController.targetObject, delay, {x: actionVO.cx, y: actionVO.cy, z: actionVO.cz, ease: Linear.easeNone});
					_tweenVec.push(tween);
					tween = TweenLite.to(CameraController.directController, delay, {xDeg: actionVO.xDeg, yDeg: actionVO.yDeg, ease: Linear.easeNone});
					_tweenVec.push(tween);
				}
				else if (actionVO.mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
				{
					CameraController.switchToFixedCameraLookAtControl();
					tween = TweenLite.to(SceneRoleManager.getInstance().targetPlayer, delay, {x: actionVO.tx, y: actionVO.ty, z: actionVO.tz, ease: Linear.easeNone});
					_tweenVec.push(tween);
					tween = TweenLite.to(CameraController.lookAtController.targetObject, delay, {x: actionVO.cx, y: actionVO.cy, z: actionVO.cz, ease: Linear.easeNone});
					_tweenVec.push(tween);
				}
			}
			else
			{
				showCameraAction(actionVO);
			}
		}

		private static function previewActionText(actionVO : StoryActionTextVO) : void
		{
			var totalTime : Number = Math.max(1, actionVO.totalTime / 1000);
			showTextValue(actionVO);
			var tween : TweenLite = TweenLite.delayedCall(totalTime, removeText1);
			_tweenVec.push(tween);
		}

		private static function previewActionEffectCreate(actionVO : StoryActionEffectCreateVO) : SceneRole
		{
			var role : SceneRole = SceneRole.create(SceneCharType.STORY_EFFECT, actionVO.effectID);
			var data : RoleData = new RoleData();
			data.id = actionVO.effectID;
			data.name = "";
			data.avatarInfo.effectResID = actionVO.res;
			data.sizeScale = actionVO.scale;

			//设置VO
			role.data = data;
			role.name = data.name;
			role.setGroundXY(actionVO.tx, actionVO.tz);
			role.offsetY = 0;
			role.startRender();
			//执行主换装更新
			AvatarManager.callEquipmentChange(role);
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.IDLE);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			role.setScale(data.sizeScale);
			role.rotationY = actionVO.rotationY;
			SceneManager.getInstance().addSceneObjToMainScene(role, true);
			_effectHash.add(actionVO.effectID, role);
			return role;
		}

		private static function previewActionEffectRemove(actionVO : StoryActionEffectRemoveVO) : void
		{
			var role : SceneRole = _effectHash.getValue(actionVO.effectID);
			if (role)
			{
				removeEffect(role, actionVO.effectID);
			}
		}

		private static function previewActionEnd(actionVO : StoryActionEndVO) : void
		{
			quit();
		}

		/**
		 * 播放声音
		 * @author 杨剑明	  2015-11-4
		 */
		private static function previewActionAddSound(actionVO : StoryActionSoundVO) : void
		{
			var path : String = GlobalConfig.soundPath + "/" + actionVO.voicePath + ".mp3";
			path = path.replace(/\\/g, "/");
			SoundManager.playSound(path, 0, 1);
		}


		/**
		 * 人物介绍
		 * @author 杨剑明	  2015-11-11
		 */
		private static function previewRoleInfo(actionVO : StoryActionRoleInfoVO) : void
		{
			StoryManager.get().addRoleInfo(actionVO);
		}

		/**
		 * 镜头
		 * @author 杨剑明	  2015-11-9
		 */
		private static function previewCameraRole(actionVO : StoryActionCameraRoleVO) : void
		{
			createCamera(actionVO);
		}

		/**
		 * 添加一个镜头
		 * @author 杨剑明	  2015-11-4
		 */
		private static function createCamera(actionVO : StoryActionCameraRoleVO) : void
		{
			_curCameraVO = actionVO;
			var role : SceneRole = SceneRole.create(SceneCharType.DUMMY_CAMERA, actionVO.roleID);
			var data : RoleData = new RoleData();
			data.name = "";
			data.avatarInfo.setBodyResID(actionVO.bodyRes, null);

			//设置VO
			role.data = data;
			role.setGroundXY(actionVO.tx, actionVO.tz);
			role.offsetY = 0;
			role.startRender();
			//执行主换装更新
			AvatarManager.callEquipmentChange(role);
			role.forEachRenderUnit(eachSetBingDongTexture);
			role.setScale(data.sizeScale);
			role.rotationY = actionVO.rotationY;
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(actionVO.action);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			SceneManager.getInstance().addSceneObjToMainScene(role, true);
			_roleHash.add(actionVO.roleID, role);
			_cameraLastTime = 0;
		}

		private static function eachSetBingDongTexture(role : BaseRole, render : RenderUnit3D) : void
		{
			render.setIndependentColor(1, 1, 1, 0);
			render.setAddedCallBack(getCameraInfo);
		}

		//镜头信息
		private static function getCameraInfo(renderUint : RenderUnit3D) : void
		{
			var bone : SkeletonBone = renderUint.getBoneByName("CameraPoint") as SkeletonBone;
			if (bone != null)
			{
				previewCamer(bone);
			}
		}

		/**
		 * @author 杨剑明	  2015-11-9
		 */
		private static function previewCamer(skeltonBone : SkeletonBone) : void
		{
			_objContainer3D = skeltonBone.getChildAt(0) as ObjectContainer3D;
			var mesh : Mesh = _objContainer3D.parent.parent as Mesh;
			_curCameraVO.totalTime = mesh.animator.duration;
			Stage3DLayerManager.stage3DProxy.addEventListener(Event.ENTER_FRAME, cameraUpdate);
		}

		private static function cameraUpdate(event : Event) : void
		{
			var curTime : int = getTimer();
			var time : int = curTime - _cameraLastTime;
			//30帧频
			if (time < 30)
			{
				return;
			}
			_cameraLastTime = curTime;
			var mesh : Mesh = _objContainer3D.parent.parent as Mesh;
			if (mesh.animator.time == mesh.animator.duration)
			{
				_cameraLastTime = 0;
				Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, cameraUpdate);
			}
			else
			{
				var tr : Matrix3D = _objContainer3D.sceneTransform;
				var camera : Camera3D = SceneManager.getInstance().mainScene.camera;
				camera.transform = tr.clone();
			}

		}


		private static function previewActionCreateRole(actionVO : StoryActionRoleCreateVO) : SceneRole
		{
			var role : SceneRole = SceneRole.create(SceneCharType.STORY_ROLE, actionVO.roleID);
			var data : RoleData = new RoleData();
			data.id = actionVO.roleID;
			data.name = "";
			data.avatarInfo.setBodyResID(actionVO.bodyRes, null);
			data.sizeScale = actionVO.scale;

			//设置VO
			role.data = data;
			role.name = data.name;
			role.setGroundXY(actionVO.tx, actionVO.tz);
			role.offsetY = 0;
			role.startRender();
			//执行主换装更新
			AvatarManager.callEquipmentChange(role);
			role.setScale(data.sizeScale);
			role.rotationY = actionVO.rotationY;
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(actionVO.action);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			SceneManager.getInstance().addSceneObjToMainScene(role, true);
			_roleHash.add(actionVO.roleID, role);
			return role;
		}

		private static function previewActionRemoveRole(actionVO : StoryActionRoleRemoveVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
				removeRole(role, actionVO.roleID);
			}
		}

		private static function previewActionRoleWalk(actionVO : StoryActionRoleWalkVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
//				var vec:Vector.<Vector3D> = PathFinderUtil.findPath();
				var tween : TweenLite = TweenLite.to(role, actionVO.totalTime / 1000, {x: actionVO.tx, z: actionVO.tz, onComplete: onWalkCompleteHandler, onCompleteParams: [role], ease: Linear.easeNone});
				_tweenVec.push(tween);
				var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
				ref.setParams(actionVO.action);
				role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
			}
		}

		private static function onWalkCompleteHandler(role : SceneRole) : void
		{
			var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
			ref.setParams(RoleActionType.IDLE);
			role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
		}

		private static function previewActionRoleDoAction(actionVO : StoryActionRoleDoActionVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
				var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
				ref.setParams(actionVO.action);
				role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
//				var tween:TweenLite = TweenLite.delayedCall(actionVO.totalTime/1000,AvatarManager.getInstance().playAction,[role,RoleActionType.IDLE]);
//				_tweenVec.push(tween);
			}
		}

		private static function previewActionRoleFaceTo(actionVO : StoryActionRoleFaceToVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
				if (actionVO.totalTime)
				{
					var tween : TweenLite = TweenLite.to(role, actionVO.totalTime / 1000, {rotationY: actionVO.rotationY, ease: Linear.easeNone});
					_tweenVec.push(tween);
				}
				else
				{
					role.rotationY = actionVO.rotationY;
				}
			}
		}

		private static function previewActionRoleZoom(actionVO : StoryActionRoleZoomVO) : void
		{
			var role : SceneRole = _roleHash.getValue(actionVO.roleID);
			if (role)
			{
				if (actionVO.totalTime)
				{
					var tween : TweenLite = TweenLite.to(role, actionVO.totalTime / 1000, {scaleX: actionVO.scale, scaleY: actionVO.scale, scaleZ: actionVO.scale, ease: Linear.easeNone});
					_tweenVec.push(tween);
				}
				else
				{
					role.setScale(actionVO.scale);
				}
			}
		}

		private static function removeText1() : void
		{

			EventManager.dispatchEvent(StoryEvent.STORY_ACTION_TEXT_HIDE);
		}

		private static function removeRole(role : SceneRole, roleID : int) : void
		{
			if (role == _selectedRole)
			{
				_selectedRole = null;
			}
			SceneManager.getInstance().removeSceneObjFromMainScene(role);
			_roleHash.remove(roleID);
		}

		private static function removeEffect(role : SceneRole, roleID : int) : void
		{
			if (role == _selectedRole)
			{
				_selectedRole = null;
			}
			SceneManager.getInstance().removeSceneObjFromMainScene(role);
			_effectHash.remove(roleID);
		}

	}
}
