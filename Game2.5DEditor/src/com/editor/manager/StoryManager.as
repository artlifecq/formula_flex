package com.editor.manager
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.story.data.vo.StoryActionCameraRoleVO;
	import com.editor.story.data.vo.StoryActionRoleInfoVO;
	import com.editor.story.view.roleInfo.RoleInfoPanle;

	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.geom.Matrix3D;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;

	import mx.core.UIComponent;

	import away3d.cameras.Camera3D;
	import away3d.containers.ObjectContainer3D;

	import gs.TweenLite;
	import gs.easing.Linear;

	public class StoryManager
	{
		private var _objContainer3D : ObjectContainer3D;
		private var _lastX : Number;
		private var _lastY : Number;
		private var _lastZ : Number;
		private var _lastRx : Number;
		private var _lastRy : Number;
		private var _lastRz : Number;

		private var _curCameraVO : StoryActionCameraRoleVO;

		private var _uiLayer : UIComponent;

		private var _cameraLastTime : int;

		private static var _instance : StoryManager;

		public static function get() : StoryManager
		{
			return _instance == null ? _instance = new StoryManager : _instance;
		}

		public function StoryManager()
		{
		}

		/**
		 * @author 杨剑明	  2015-11-11
		 */
		public function set uiLayer(uiLayer : UIComponent) : void
		{
			_uiLayer = uiLayer;
		}

		/**
		 * @author 杨剑明	  2015-11-11
		 */
		public function get uiLayer() : UIComponent
		{
			return _uiLayer;
		}

		/**
		 * 角色介绍
		 * @author 杨剑明	  2015-11-11
		 */
		public function addRoleInfo(actionVO : StoryActionRoleInfoVO) : void
		{
			var roleInfoPanle : RoleInfoPanle = new RoleInfoPanle(actionVO);
			roleInfoPanle.alpha = 0;
			StoryManager.get().uiLayer.addChild(roleInfoPanle);
			tweenRoleInfoPanle(roleInfoPanle, actionVO);
		}

		/**
		 * @author 杨剑明	  2015-11-11
		 */
		private function tweenRoleInfoPanle(roleInfoPanle : RoleInfoPanle, actionVO : StoryActionRoleInfoVO) : void
		{
			TweenLite.to(roleInfoPanle, actionVO.totalTime / 3000, {alpha: 1, onComplete: tweenRoleCmp, onCompleteParams: [roleInfoPanle, actionVO], ease: Linear.easeNone});
		}

		/**
		 * @author 杨剑明	  2015-11-11
		 */
		private function tweenRoleCmp(roleInfoPanle : RoleInfoPanle, actionVO : StoryActionRoleInfoVO) : void
		{
			TweenLite.delayedCall(actionVO.totalTime / 3000, function(roleInfoPanle : RoleInfoPanle, actionVO : StoryActionRoleInfoVO) : void
			{
				TweenLite.to(roleInfoPanle, actionVO.totalTime / 3000, {alpha: 0, onComplete: removeRolePanle, onCompleteParams: [roleInfoPanle], ease: Linear.easeNone});
			}, [roleInfoPanle, actionVO]);
		}

		/**
		 * @author 杨剑明	  2015-11-11
		 */
		private function removeRolePanle(roleInfoPanle : RoleInfoPanle) : void
		{
			StoryManager.get().uiLayer.removeChild(roleInfoPanle);
		}



		protected function createCameraInfo(event : Event) : void
		{
			if (_objContainer3D == null)
			{
				return;
			}

			var curTime : int = getTimer();
			var time : int = curTime - _cameraLastTime;
			//30帧频
			if (time < 30)
			{
				return;
			}
			_cameraLastTime = curTime;
			var tr : Matrix3D = _objContainer3D.sceneTransform;
			var camera : Camera3D = SceneManager.getInstance().mainScene.camera;
			camera.transform = tr.clone();

//			var mesh:Mesh = _objContainer3D.parent.parent as Mesh;
////			tr.prependRotation(90,Vector3D.X_AXIS);
//			var matrix3dVec:Vector.<Vector3D> = tr.clone().decompose();
//			var pos:Vector3D = matrix3dVec[0];
//			var radian:Vector3D = matrix3dVec[1];
//			var curRx:Number = radian.x;
//			var curRy:Number = radian.y;
//			var curRz:Number = radian.z;
//			if(_lastX != pos.x || _lastY != pos.y || _lastZ != pos.z
//			|| _lastRx != radian.x || _lastRy != radian.y || _lastRz != radian.z)
//			{
//				_curCameraVO.posData.writeInt(mesh.animator.time);
//				_curCameraVO.posData.writeFloat(pos.x);
//				_curCameraVO.posData.writeFloat(pos.y);
//				_curCameraVO.posData.writeFloat(pos.z);
//				_curCameraVO.posData.writeFloat(radian.x);
//				_curCameraVO.posData.writeFloat(radian.y);
//				_curCameraVO.posData.writeFloat(radian.z);
//				
////				_curCameraVO.posStr += mesh.animator.time + "," + pos.x + "," + pos.y
////					+ "," + pos.z + "," + radian.x + "," + radian.y + "," + radian.z + ";"
//			}
//			if(mesh.animator.time == mesh.animator.duration)
//			{
//				_curCameraVO.totalTime = mesh.animator.duration;
//				Stage3DLayerManager.stage3DProxy.removeEventListener(Event.ENTER_FRAME, createCameraInfo);
//				saveCameraData(_curCameraVO.storyID,_curCameraVO.posData);
//				_curCameraVO.cameraName = _curCameraVO.storyID;
//				_curCameraVO = null;
//				Alert.show("创建镜头完成");
//			}
//			trace(mesh.animator.isPlaying,mesh.animator.time,mesh.animator.duration);
//			trace(tr.clone().decompose());
		}

		/**
		 * 保存镜头数据
		 * @author 杨剑明	  2015-11-10
		 */
		private function saveCameraData(storyID : int, byteArr : ByteArray) : void
		{
			byteArr.position = 0;
			byteArr.compress();
			//路径
			var path : String = GlobalConfig.getCameraConfigPath(storyID);
			path = path.replace(/\\/g, "/");
			var file : File = new File(path);
			if (file.exists)
			{
				file.deleteFile();
			}
			var stream : FileStream = new FileStream();
			stream.open(file, FileMode.WRITE);
			stream.writeBytes(byteArr, 0, byteArr.length);
			stream.close();
		}

	}
}
