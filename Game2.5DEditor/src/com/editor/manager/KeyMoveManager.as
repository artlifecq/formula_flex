package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.GlobalSettingConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.editor.state.role.action.JumpStateReference;
	import com.editor.state.role.action.PlayActionStateReference;
	import com.editor.state.role.action.RunStateReference;
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.enum.CameraModeEnum;
	import com.game.engine3D.utils.PathFinderUtil;
	
	import flash.geom.Vector3D;
	
	import away3d.cameras.Camera3D;
	
	import org.client.mainCore.utils.Tick;

	/**
	 *
	 * 键盘按键移动管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class KeyMoveManager
	{
		private static var _instance : KeyMoveManager;

		public static function getInstance() : KeyMoveManager
		{
			if (!_instance)
			{
				_instance = new KeyMoveManager();
			}
			return _instance;
		}

		public var speed : int = 50; //速度
		/** 控制上下移动 **/
		private var _forwardWalk : Boolean;
		private var _backwardWalk : Boolean;
		/** 控制左右移动 **/
		private var _rightWalk : Boolean;
		private var _leftWalk : Boolean;
		private var _up : Boolean;
		private var _down : Boolean;
		private var _keyMoving : Boolean;

		private var _offsetPos : Vector3D = new Vector3D();

		public function KeyMoveManager()
		{
			_keyMoving = false;
			//暂时一开始就启动
			Tick.addCallback(onTick);
		}

		public function jump(ctrlKey : Boolean) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.GlobalSettingConfigName);
			if (tabel)
			{
				var desc : ConfigDesc = tabel.getConfigDesc();
				var datas : Array = ConfigData.getCfgByFieldValue(desc, "key", "DEFAULT_SETTING");
				if (datas.length > 0)
				{
					var isSecondJump : Boolean = ctrlKey;
					var setting : GlobalSettingConfig = datas[0];
					var ref : JumpStateReference = SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.getReference(JumpStateReference) as JumpStateReference;
					if (SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.isRiding)
					{
						ref.setParams(isSecondJump ? 2 : 1, setting.mMountJumpSpeedRatio, setting.mMountSecondJumpSpeedRatio, //
							setting.mMountJumpStartTime, setting.mMountSecondJumpStartTime, setting.mMountJumpEndTime, setting.mMountSecondJumpEndTime, //
							setting.mMountJumpBreakTime, setting.mMountSecondJumpBreakTime, setting.mSecondJumpProbability, setting.mMountJumpHeight, setting.mMountSecondJumpHeight);
					}
					else
					{
						ref.setParams(isSecondJump ? 2 : 1, setting.mJumpSpeedRatio, setting.mSecondJumpSpeedRatio, //
							setting.mJumpStartTime, setting.mSecondJumpStartTime, setting.mJumpEndTime, setting.mSecondJumpEndTime, //
							setting.mJumpBreakTime, setting.mSecondJumpBreakTime, setting.mSecondJumpProbability, setting.mJumpHeight, setting.mSecondJumpHeight);
					}
					SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.transition(RoleStateType.ACTION_JUMP, ref);
				}
			}
		}

		/**
		 * 向上移动
		 * @param bool
		 */
		public function walkForward(bool : Boolean) : void
		{
			_forwardWalk = bool;
		}

		/**
		 * 向下移动
		 * @param bool
		 */
		public function walkBackward(bool : Boolean) : void
		{
			_backwardWalk = bool;
		}

		/**
		 * 向左移动
		 * @param bool
		 */
		public function walkLeft(bool : Boolean) : void
		{
			_leftWalk = bool;
		}

		/**
		 * 向右移动
		 * @param bool
		 */
		public function walkRight(bool : Boolean) : void
		{
			_rightWalk = bool;
		}

		public function walkUp(bool : Boolean) : void
		{
			_up = bool;
		}

		public function walkDown(bool : Boolean) : void
		{
			_down = bool;
		}

		private function onTick(inv : uint = 0) : void
		{
			if (!_forwardWalk && !_backwardWalk && !_leftWalk && !_rightWalk && !_up && !_down)
			{
				if (_keyMoving)
				{
					var idleActRef : PlayActionStateReference = SceneRoleManager.getInstance().targetPlayer.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
					idleActRef.setParams("idle");
					SceneRoleManager.getInstance().targetPlayer.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, idleActRef);
					_keyMoving = false;
				}
				return;
			}
			var camera : Camera3D = SceneManager.getInstance().mainScene.camera;
			if (!camera)
				return;

			if (TrailManager.getInstance().isPlaying)
			{
				return;
			}
            
            var object : SceneRole = SceneRoleManager.getInstance().targetPlayer;
            var walkRole : SceneRole = SceneRoleManager.getInstance().targetPlayer;
            var reallyRole : SceneRole = SceneRoleManager.getInstance().targetPlayer.getCamouflageEntity() as SceneRole || walkRole;
            var moveSpeed : int = speed;
            var moveDist : int = (1000 + RoleStateUtil.WALK_DELAY * 2) * (moveSpeed * 0.001);
            
			var directionPosX : int = 0;
			var directionPosZ : int = 0;
			var directionPosY : int = 0;
			if (CameraController.mode == CameraModeEnum.DIRECT_CAMERA || CameraController.mode == CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET)
			{
//				object = SceneManager.getInstance().mainScene.camera;
			}

			if (_forwardWalk)
			{
				directionPosZ = 1;
			}
			else if (_backwardWalk)
			{
				directionPosZ = -1;
			}

			if (_rightWalk)
			{
				directionPosX = 1;
			}
			else if (_leftWalk)
			{
				directionPosX = -1;
			}
			if (_up)
			{
				directionPosY = 1;
			}
			else if (_down)
			{
				directionPosY = -1;
			}
            
			_offsetPos.setTo(0, 0, 0);
			var tempVec : Vector3D;
			if (directionPosX != 0)
			{
				tempVec = camera.rightVector;
				tempVec.normalize();
				tempVec.scaleBy(directionPosX);
				_offsetPos.incrementBy(tempVec);
			}

			if (directionPosZ != 0)
			{
				tempVec = camera.rightVector.crossProduct(Vector3D.Y_AXIS);
				tempVec.normalize();
				tempVec.scaleBy(directionPosZ);
				_offsetPos.incrementBy(tempVec);
			}

            var position : Vector3D = null;
            var runActRef : PlayActionStateReference = null;
            
			if (EditorCameraManager.cameraMode == 0)
			{
				(SceneRoleManager.getInstance().scenePreviewEntity.data as RoleData).moveSpeed = RoleStateUtil.BENCHMARK_MOVE_SPEED * speed;
				var pos : Vector3D = PathFinderUtil.getWalkablePosByOffset(SceneManager.getInstance().mainDistrict, SceneRoleManager.getInstance().scenePreviewEntity.position, _offsetPos, 200, 20);
				RoleStateUtil.walkToPos(SceneRoleManager.getInstance().scenePreviewEntity, pos);
				if (!SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.isWalkMoving)
				{
					var runRef : RunStateReference = SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.getReference(RunStateReference) as RunStateReference;
					runRef.setParams(0, 0);
					SceneRoleManager.getInstance().scenePreviewEntity.stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
				}
			}
			else if (CameraController.mode == CameraModeEnum.LOCK_ON_TARGET || CameraController.mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
                position = object.position.clone();
				position.setTo(position.x + _offsetPos.x * speed, position.y + directionPosY * speed, position.z + _offsetPos.z * speed);

				if (object == SceneRoleManager.getInstance().targetPlayer)
				{
					if (!_keyMoving)
					{
                        runActRef = SceneRoleManager.getInstance().targetPlayer.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
						runActRef.setParams("run");
						SceneRoleManager.getInstance().targetPlayer.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, runActRef);
					}
					SceneRoleManager.getInstance().targetPlayer.faceToGround(position.x, position.z, 0);
				}

				object.x = position.x;
				object.y = position.y;
				object.z = position.z;
				
				var dx : Number = directionPosX * speed;
				var dz : Number = directionPosZ * speed;
				var dy : Number = directionPosY * speed;
				camera.moveRight(dx);
				camera.moveForward(dz);
				camera.moveUp(dy);
			}
			else if (CameraController.mode == CameraModeEnum.FIXED_TARGET_LOOK_AT_TARGET || CameraController.mode == CameraModeEnum.DIRECT_CAMERA)
			{
				var dx : Number = directionPosX * speed;
				var dz : Number = directionPosZ * speed;
				var dy : Number = directionPosY * speed;
				camera.moveRight(dx);
				camera.moveForward(dz);
				camera.moveUp(dy);
			} else {
                // game 2d
                position = object.position.clone();
                position.setTo(position.x + _offsetPos.x * speed, position.y + directionPosY * speed, position.z + _offsetPos.z * speed);
                if (!_keyMoving)
                {
                    runActRef = object.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
                    runActRef.setParams("run");
                    object.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, runActRef);
                    SceneRoleManager.getInstance().targetPlayer.faceToGround(position.x, position.z, 0);
                }
                
                object.x = position.x;
                //object.y = position.y;
                object.z = position.z;
            }
			_keyMoving = true;
		}
	}
}
