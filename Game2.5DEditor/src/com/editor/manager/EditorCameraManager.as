package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.data.map.ClientMapCameraBokehDepth;
	import com.editor.data.map.ClientMapCameraPropertyData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.enum.FeaturesType;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.enum.CameraModeEnum;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.OrthographicLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.filters.RingDepthOfFieldFilter3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 编辑器镜头管理器
	 @author Guodong.Zhang
	 * 创建时间：2015-8-17 下午2:27:09
	 */
	public class EditorCameraManager
	{
		public static var cameraMode : int = 0;
		private static var _isFreeMode : Boolean = false;
		private static var _mouseRightSpeed : Number = 0.8;
		private static var _mouseWheelSpeed : Number = 5;
		private static var camera:Camera3D;
		
		public static function zoomFunction(x:Number):Number
		{
			return Math.pow(2, 8-x);
		}
		
		private static var proHeight:Number=500;
		private static function onMouseWheelFunc(event : MouseEvent):void
		{
			var lens:OrthographicLens = EditorCameraManager.camera.lens as OrthographicLens;
			proHeight = lens.projectionHeight;
			var dis:Number = mouseWheelSpeed * event.delta;
			
			proHeight += dis;
			
			if(proHeight > 15000)
			{
				proHeight = 15000;
			}
			else if(proHeight < 500)
			{
				proHeight = 500;
			}
			
			lens.projectionHeight = proHeight;
		}

		public static function initCamera(camera : Camera3D, target : ObjectContainer3D) : void
		{
			EditorCameraManager.camera = camera;
			
			cameraMode = CameraModeEnum.LOCK_ON_TARGET;

			CameraController.initcontroller(camera, target, SceneRoleManager.getInstance().targetPlayer);
			CameraController.initLockOnControl(0, 0, 0, 5000, true, true, true, 100, 15000, -89, 89, true, 100,onMouseWheelFunc);
			CameraController.switchToLockOnControl();
			
			///以下是针对2d地图特殊处理，暂时写到这里
            CameraController.lockedOnPlayerController.mouseLeftControlable = false;
			CameraController.lockedOnPlayerController.mouseRightControlable = false;
			CameraController.lockedOnPlayerController.offsetY = -4000;
			CameraController.lockedOnPlayerController.xDeg = 0;
			CameraController.lockedOnPlayerController.yDeg = 0;
			
			Stage3DLayerManager.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			
			Stage3DLayerManager.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			Stage3DLayerManager.stage.addEventListener(Event.ENTER_FRAME, loop);
			

			EventManager.addEvent(SceneEvent.CAMERA_DISTANCE_CHANGE, onCameraDistanceChange);
		}
		
		// common variables	
		public static var dragging:Boolean = false;
		public static var hasMoved:Boolean = false;
		private static var click:Point = new Point();
		
		private static function loop(e:Event) : void
		{
			if (dragging)
			{
				var dx:Number = (Stage3DLayerManager.stage.mouseX - click.x) * (proHeight/1000);
				var dy:Number = (Stage3DLayerManager.stage.mouseY - click.y) * (proHeight/1000);
				
				if (dx != 0 || dy != 0)
				{
					hasMoved = true;
					EditorCameraManager.camera.moveUp(dy);
					EditorCameraManager.camera.moveLeft(dx);
				}
				
				click.x = Stage3DLayerManager.stage.mouseX;
				click.y = Stage3DLayerManager.stage.mouseY;			
			}
		}
		
		private static function onMouseDown(event : MouseEvent) : void
		{			
			click.x = Stage3DLayerManager.stage.mouseX;
			click.y = Stage3DLayerManager.stage.mouseY;				
			
			dragging = true;				
			hasMoved = false;
		}
		
		private static function onMouseUp(event : MouseEvent) : void
		{
			dragging = false;
			hasMoved = false;
		}

		public static function get isFreeMode() : Boolean
		{
			return _isFreeMode;
		}

		public static function set isFreeMode(value : Boolean) : void
		{
			_isFreeMode = value;
			updateProperty();
		}

		public static function updateProperty() : void
		{
			if(EditorCameraManager.camera && EditorCameraManager.camera.lens is OrthographicLens)
				(EditorCameraManager.camera.lens as OrthographicLens).projectionHeight = 5000;
			var info : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			if (_isFreeMode || info.featureType == FeaturesType.TRAIL_TYPE)
			{
				if (TrailManager.getInstance().currIsClingGround)
				{
					if (SceneManager.getInstance().mainScene)
						SceneRoleManager.getInstance().targetPlayer.clingGroundCalculate = SceneManager.getInstance().mainScene.clingGround;
				}
				else
				{
					SceneRoleManager.getInstance().targetPlayer.clingGroundCalculate = null;
				}
				CameraController.lockedOnPlayerController.checkBlock = false;
			}
			else
			{
				if (SceneManager.getInstance().mainScene)
				{
					SceneRoleManager.getInstance().targetPlayer.clingGroundCalculate = SceneManager.getInstance().mainScene.clingGround;
					if (!SceneManager.getInstance().mainScene.isLoading)
					{
						CameraController.lockedOnPlayerController.checkBlock = false;
					}
				}
			}

			var cameraPropertyData : ClientMapCameraPropertyData = null;
			var mapData : EditorClientMapData = SceneManager.getInstance().mapData;
			if (mapData)
			{
				cameraPropertyData = mapData.cameraPropertyData;
			}
			var setting : GlobalSettingConfig = null;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
			if (tabel)
			{
				var desc : ConfigDesc = tabel.getConfigDesc();
				var datas : Array = ConfigData.getCfgByFieldValue(desc, "key", "DEFAULT_SETTING");
				if (datas.length > 0)
				{
					setting = datas[0];
				}
			}
			if (_isFreeMode || info.featureType == FeaturesType.TRAIL_TYPE)
			{
				CameraController.lockedOnPlayerController.offsetY = 0;
				CameraController.lockedOnPlayerController.minDist = 100;
				CameraController.lockedOnPlayerController.maxDist = 15000;
				CameraController.lockedOnPlayerController.minTiltAngle = -89;
				CameraController.lockedOnPlayerController.maxTiltAngle = 89;
				CameraController.lockedOnPlayerController.mouseRightSpeed = _mouseRightSpeed;
				CameraController.lockedOnPlayerController.mouseWheelSpeed = _mouseWheelSpeed;
				CameraController.lockedOnPlayerController.minDistance = 100;
			}
			else
			{
//				if (cameraPropertyData && cameraPropertyData.mCameraMinDistance > 0)
//					CameraController.lockedOnPlayerController.minDist = cameraPropertyData.mCameraMinDistance;
//				else if (setting)
//					CameraController.lockedOnPlayerController.minDist = setting.mCameraMinDistance;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraMaxDistance > 0)
//					CameraController.lockedOnPlayerController.maxDist = cameraPropertyData.mCameraMaxDistance;
//				else if (setting)
//					CameraController.lockedOnPlayerController.maxDist = setting.mCameraMaxDistance;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraDistance > 0)
//					CameraController.lockedOnPlayerController.distance = cameraPropertyData.mCameraDistance;
//				else if (setting)
//					CameraController.lockedOnPlayerController.distance = setting.mCameraDistance;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraXDeg > 0)
//					CameraController.lockedOnPlayerController.xDeg = cameraPropertyData.mCameraXDeg;
//				else if (setting)
//					CameraController.lockedOnPlayerController.xDeg = setting.mCameraXDeg;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraYDeg > 0)
//					CameraController.lockedOnPlayerController.yDeg = cameraPropertyData.mCameraYDeg;
//				else if (setting)
//					CameraController.lockedOnPlayerController.yDeg = setting.mCameraYDeg;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraMinTiltAngle > 0)
//					CameraController.lockedOnPlayerController.minTiltAngle = cameraPropertyData.mCameraMinTiltAngle;
//				else if (setting)
//					CameraController.lockedOnPlayerController.minTiltAngle = setting.mCameraMinTiltAngle;
//
//				if (cameraPropertyData && cameraPropertyData.mCameraMaxTiltAngle > 0)
//					CameraController.lockedOnPlayerController.maxTiltAngle = cameraPropertyData.mCameraMaxTiltAngle;
//				else if (setting)
//					CameraController.lockedOnPlayerController.maxTiltAngle = setting.mCameraMaxTiltAngle;
//
//				if (setting)
//				{
//					CameraController.lockedOnPlayerController.minDistance = setting.mCameraBlockMinDistance;
//					CameraController.lockedOnPlayerController.mouseRightSpeed = setting.mCameraMouseDragSpeed;
//					CameraController.lockedOnPlayerController.mouseWheelSpeed = setting.mCameraMouseWheelSpeed;
//					CameraController.lockedOnPlayerController.offsetY = setting.mCameraOffsetY;
//				}
			}
			var scene : GameScene3D = SceneManager.getInstance().mainScene;
			if (scene)
			{
				if (SceneManager.getInstance().mapId == 0)
				{
					scene.cameraNear = scene.sceneMapLayer.cameraNear;
					scene.cameraFar = scene.sceneMapLayer.cameraFar;
				}
				else
				{
					scene.cameraNear = 100;
					scene.cameraFar = 10000000;
				}
			}
			updateCameraBokehDepth();
		}

		public static function updateCameraBokehDepth() : void
		{
            return;
			var cameraPropertyData : ClientMapCameraPropertyData = null;
			var mapData : EditorClientMapData = SceneManager.getInstance().mapData;
			if (mapData)
			{
				cameraPropertyData = mapData.cameraPropertyData;
			}
			if (cameraPropertyData && cameraPropertyData.mUseDynamicBokehDepth)
			{
				var ratio : Number = 0;
				var minDist : int = CameraController.lockedOnPlayerController.minDist;
				var maxDist : int = CameraController.lockedOnPlayerController.maxDist;
				if (cameraPropertyData.mMinDepthChangeDistance > 0 && cameraPropertyData.mMaxDepthChangeDistance > 0)
				{
					minDist = cameraPropertyData.mMinDepthChangeDistance;
					if (minDist < CameraController.lockedOnPlayerController.minDist)
						minDist = CameraController.lockedOnPlayerController.minDist;
					maxDist = cameraPropertyData.mMaxDepthChangeDistance;
					if (maxDist > CameraController.lockedOnPlayerController.maxDist)
						maxDist = CameraController.lockedOnPlayerController.maxDist;
				}
				ratio = (CameraController.lockedOnPlayerController.distance - minDist) / (maxDist - minDist);
				if (ratio < 0)
				{
					ratio = 0;
				}
				else if (ratio > 1)
				{
					ratio = 1;
				}

				if (cameraPropertyData.mUseDepthMinDistance == 0 || CameraController.lockedOnPlayerController.distance < cameraPropertyData.mUseDepthMinDistance)
				{
					SceneManager.getInstance().mainScene.useRingDepthOfFieldFilter = false/*true*/;
				}
				else
				{
					SceneManager.getInstance().mainScene.useRingDepthOfFieldFilter = false;
				}

				var minBokehDepth : ClientMapCameraBokehDepth = cameraPropertyData.mMinBokehDepth;
				var maxBokehDepth : ClientMapCameraBokehDepth = cameraPropertyData.mMaxBokehDepth;

				var depthFilter3D : RingDepthOfFieldFilter3D = SceneManager.getInstance().mainScene.ringDepthOfFieldFilter3D;
				if (depthFilter3D)
				{
					depthFilter3D.focalDepth = minBokehDepth.mFocalDepth + (maxBokehDepth.mFocalDepth - minBokehDepth.mFocalDepth) * ratio;
					depthFilter3D.focalLength = minBokehDepth.mFocalLegth + (maxBokehDepth.mFocalLegth - minBokehDepth.mFocalLegth) * ratio;
					depthFilter3D.blurSharpness = minBokehDepth.mBlurSharpness + (maxBokehDepth.mBlurSharpness - minBokehDepth.mBlurSharpness) * ratio;
					depthFilter3D.threshold = minBokehDepth.mBokehBloomThreshold + (maxBokehDepth.mBokehBloomThreshold - minBokehDepth.mBokehBloomThreshold) * ratio;
					depthFilter3D.gain = minBokehDepth.mBokehBloomGain + (maxBokehDepth.mBokehBloomGain - minBokehDepth.mBokehBloomGain) * ratio;
				}
			}
		}

		private static function onCameraDistanceChange() : void
		{
			updateCameraBokehDepth();
		}

		public static function get mouseWheelSpeed() : Number
		{
			return _mouseWheelSpeed;
		}

		public static function set mouseWheelSpeed(value : Number) : void
		{
			_mouseWheelSpeed = value;
			updateProperty();
		}

		public static function get mouseRightSpeed() : Number
		{
			return _mouseRightSpeed;
		}

		public static function set mouseRightSpeed(value : Number) : void
		{
			_mouseRightSpeed = value;
			updateProperty();
		}
	}
}
