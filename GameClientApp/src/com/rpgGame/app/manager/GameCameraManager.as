package com.rpgGame.app.manager
{
	import com.game.engine2D.controller.CameraFrontController;
	import com.game.engine2D.scene.CameraOrthographicLens;
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.vo.AreaMapData;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.ClientMapCameraBokehDepth;
	import com.game.engine3D.vo.map.ClientMapCameraPropertyData;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
	import com.rpgGame.coreData.clientConfig.GlobalSetting;
	import com.rpgGame.coreData.configEnum.EnumGlobalSetting;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	
	import away3d.cameras.lenses.OrthographicLens;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.ObjectContainer3D;
	import away3d.filters.RingDepthOfFieldFilter3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 游戏层镜头管理
	 @author Guodong.Zhang
	 * 创建时间：2015-8-17 上午11:46:34
	 */
	public class GameCameraManager
	{
		private static var orthographicLens:OrthographicLens = new CameraOrthographicLens(1000);
		private static var perspectiveLens:PerspectiveLens = new PerspectiveLens();
		
		private static var _playerModeDistance : int;
		private static var _playerMode : Boolean;

		/**
		 * 设置镜头控制为玩家模式
		 * @target  是虚拟的镜头焦点对象，跟主角实时同步的
		 */
		public static function startPlayerMode(target : ObjectContainer3D) : void
		{
			if(GlobalConfig.use2DMap)
			{
				CameraFrontController.initcontroller(SceneManager.scene.view3d.camera, target);
				CameraFrontController.LOCK_DISTANCE = 100000;
				////测试代码////
				CameraFrontController.startControl(Stage3DLayerManager.stage);
				CameraFrontController.sceneCamera = SceneManager.scene.sceneCamera;
				CameraFrontController.sceneCamera.updateScale(1.15);
			}
			else
			{
				_playerMode = true;
				CameraController.initcontroller(SceneManager.getScene().camera, target);
				var setting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
				if (!setting)
				{
					//setting.cameraOffsetY
					CameraController.initLockOnControl(setting.cameraOffsetY, setting.cameraXDeg, setting.cameraYDeg, setting.cameraDistance, true, true, true, setting.cameraMinDistance, setting.cameraMaxDistance, setting.cameraMinTiltAngle, setting.cameraMaxTiltAngle, true, setting.cameraBlockMinDistance);
					CameraController.lockedOnPlayerController.mouseRightSpeed = setting.cameraMouseDragSpeed;
					CameraController.lockedOnPlayerController.mouseWheelSpeed = setting.cameraMouseWheelSpeed;
				}
				else
				{
					CameraController.initLockOnControl(135, 0, 40, 1800, false, true, false, 500, 20000, 0, 80, true, 200);
					CameraController.lockedOnPlayerController.mouseRightSpeed = 0.2;
					CameraController.lockedOnPlayerController.mouseWheelSpeed = 30;
				}
				CameraController.switchToLockOnControl();
				//			CameraController.lockedOnPlayerController.distTweenDuration = 0.3;
				//			if (!_playerMode)
				//			{
				//				CameraController.lockedOnPlayerController.distance = _playerModeDistance;
				//			}
				
				
				EventManager.addEvent(SceneEvent.CAMERA_DISTANCE_CHANGE, onCameraDistanceChange);
			}
		}

		/**
		 * 设置镜头控制为动画模式
		 *
		 */
		public static function startAnimationMode(target : ObjectContainer3D) : void
		{
			if (_playerMode)
			{
				_playerModeDistance = CameraController.lockedOnPlayerController.distance;
			}
			_playerMode = false;
			CameraController.initcontroller(SceneManager.getScene().camera, target);
			CameraController.initLockOnControl(0, 53, 45, _playerModeDistance, false, false, false, 200, 15000, -89, 89, true, 200);
//			CameraController.lockedOnPlayerController.distTweenDuration = 0;
//			CameraController.lockedOnPlayerController.degTweenDuration = 0;
		}

		public static function tryUseCameraProperty() : void
		{
			var actor : SceneRole = MainRoleManager.actor;
			var cameraAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.CAMERA_AREA);
			var areaMapData : AreaMapData = cameraAreaMap.getFlag(actor.x, actor.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is ClientMapAreaData)
			{
				var mapAreaData : ClientMapAreaData = flagObj as ClientMapAreaData;
				if (mapAreaData.type == MapAreaTypeEnum.CAMERA_PROPERTY)
				{
					CameraController.lockedOnPlayerController.xDeg = mapAreaData.cameraXDeg;
					CameraController.lockedOnPlayerController.yDeg = mapAreaData.cameraYDeg;
					CameraController.lockedOnPlayerController.distance = mapAreaData.cameraDistance;
				}
			}
		}

		public static function updateProperty() : void
		{
			var cameraPropertyData : ClientMapCameraPropertyData = null;
			var mapData : ClientMapData = SceneManager.clientMapData;
			if (mapData)
			{
				cameraPropertyData = mapData.cameraPropertyData;
			}
			if (cameraPropertyData)
			{
				var setting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
				if (cameraPropertyData.cameraMinDistance > 0)
					CameraController.lockedOnPlayerController.minDist = cameraPropertyData.cameraMinDistance;
				else if (setting)
					CameraController.lockedOnPlayerController.minDist = setting.cameraMinDistance;

				if (cameraPropertyData.cameraMaxDistance > 0)
					CameraController.lockedOnPlayerController.maxDist = cameraPropertyData.cameraMaxDistance;
				else if (setting)
					CameraController.lockedOnPlayerController.maxDist = setting.cameraMaxDistance;

				if (cameraPropertyData.cameraMinTiltAngle > 0)
					CameraController.lockedOnPlayerController.minTiltAngle = cameraPropertyData.cameraMinTiltAngle;
				else if (setting)
					CameraController.lockedOnPlayerController.minTiltAngle = setting.cameraMinTiltAngle;

				if (cameraPropertyData.cameraMaxTiltAngle > 0)
					CameraController.lockedOnPlayerController.maxTiltAngle = cameraPropertyData.cameraMaxTiltAngle;
				else if (setting)
					CameraController.lockedOnPlayerController.maxTiltAngle = setting.cameraMaxTiltAngle;
			}
			/*var scene : GameScene3D = SceneManager.getScene();
			if (cameraPropertyData && cameraPropertyData.cameraFar > 0)
				scene.cameraFar = cameraPropertyData.cameraFar;
			else if (setting && setting.cameraFar > 0)
				scene.cameraFar = setting.cameraFar;
			else
				scene.cameraFar = 12000;*/
			updateCameraState();
		}

		private static function updateCameraBokehDepth() : void
		{
			var cameraPropertyData : ClientMapCameraPropertyData = null;
			var mapData : ClientMapData = SceneManager.clientMapData;
			if (mapData)
			{
				cameraPropertyData = mapData.cameraPropertyData;
			}
			if (cameraPropertyData && cameraPropertyData.useDynamicBokehDepth)
			{
				var scene : GameScene3D = SceneManager.getScene();
				var ratio : Number = 0;
				var minDist : int = CameraController.lockedOnPlayerController.minDist;
				var maxDist : int = CameraController.lockedOnPlayerController.maxDist;
				if (cameraPropertyData.minDepthChangeDistance > 0 && cameraPropertyData.maxDepthChangeDistance > 0)
				{
					minDist = cameraPropertyData.minDepthChangeDistance;
					if (minDist < CameraController.lockedOnPlayerController.minDist)
						minDist = CameraController.lockedOnPlayerController.minDist;
					maxDist = cameraPropertyData.maxDepthChangeDistance;
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

				if (cameraPropertyData.useDepthMinDistance == 0 || CameraController.lockedOnPlayerController.distance < cameraPropertyData.useDepthMinDistance)
				{
					scene.useRingDepthOfFieldFilter = GameSetting.useRingDepthOfFieldFilter;
				}
				else
				{
					scene.useRingDepthOfFieldFilter = false;
				}

				var minBokehDepth : ClientMapCameraBokehDepth = cameraPropertyData.minBokehDepth;
				var maxBokehDepth : ClientMapCameraBokehDepth = cameraPropertyData.maxBokehDepth;

				var depthFilter3D : RingDepthOfFieldFilter3D = scene.ringDepthOfFieldFilter3D;
				if(depthFilter3D)
				{
					depthFilter3D.focalDepth = minBokehDepth.focalDepth + (maxBokehDepth.focalDepth - minBokehDepth.focalDepth) * ratio;
					depthFilter3D.focalLength = minBokehDepth.focalLegth + (maxBokehDepth.focalLegth - minBokehDepth.focalLegth) * ratio;
					depthFilter3D.blurSharpness = minBokehDepth.blurSharpness + (maxBokehDepth.blurSharpness - minBokehDepth.blurSharpness) * ratio;
					depthFilter3D.threshold = minBokehDepth.bokehBloomThreshold + (maxBokehDepth.bokehBloomThreshold - minBokehDepth.bokehBloomThreshold) * ratio;
					depthFilter3D.gain = minBokehDepth.bokehBloomGain + (maxBokehDepth.bokehBloomGain - minBokehDepth.bokehBloomGain) * ratio;
				}
			}
		}

		public static function updateCameraState() : void
		{
			updateCameraBokehDepth();
			var scene : GameScene3D = SceneManager.getScene();
			scene.lightFarPlane = CameraController.lockedOnPlayerController.distance;
		}

		private static function onCameraDistanceChange() : void
		{
			updateCameraState();
		}
	}
}
