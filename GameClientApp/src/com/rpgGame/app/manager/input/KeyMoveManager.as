package com.rpgGame.app.manager.input
{
	import com.game.engine3D.utils.PathFinderUtil;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.manager.RollManager;
	import com.rpgGame.app.manager.TrailManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.JumpStateReference;
	import com.rpgGame.app.state.role.action.RunStateReference;
	import com.rpgGame.coreData.info.key.KeyInfo;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
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

		private static const KEY_WALK_DELAY : int = 1000;
		private static const KEY_JUMP_DELAY : int = 300;

		/** 控制上下移动 **/
		private var _forwardWalk : Boolean;
		private var _backwardWalk : Boolean;
		/** 控制左右移动 **/
		private var _rightWalk : Boolean;
		private var _leftWalk : Boolean;
		private var _moveDist : int;
		private var _keyMoving : Boolean;
		private var _changed : Boolean;
		private var _lastKeyWalkTime : int;
		private var _lastKeyJumpTime : int;
		private var _offsetPos : Vector3D = new Vector3D();

		public function KeyMoveManager()
		{
			_keyMoving = false;
			_changed = false;
			_lastKeyWalkTime = 0;
			_lastKeyJumpTime = 0;
			//暂时一开始就启动
			Tick.addCallback(onTick);
		}

		public function setKeyStatus(info : KeyInfo, isDown : Boolean = true) : void
		{
			if (info.funcID == 225) //SPACE
			{
                roll(isDown);
			}

			if (info.funcID == 1 || info.funcID == 5) //W,UP
			{
				walkForward(isDown);
			}
			else if (info.funcID == 2 || info.funcID == 7) //A,LEFT
			{
				walkLeft(isDown);
			}
			else if (info.funcID == 3 || info.funcID == 6) //S,DOWN
			{
				walkBackward(isDown);
			}
			else if (info.funcID == 4 || info.funcID == 8) //D,RIGHT
			{
				walkRight(isDown);
			}
		}
        
        private function roll(bool : Boolean) : void {
            if (!bool) {
                return;
            }
            var canRoll : Boolean = RollManager.INSTANCE.canUseRoll();
            if (canRoll)
			{
                if (1 == MainRoleManager.actorInfo.job)
				{
                    CastSpellHelper.shortcutsTryCaseSpell(1, true);
                }
				else if (2 == MainRoleManager.actorInfo.job)
				{
                    CastSpellHelper.shortcutsTryCaseSpell(2, true);
                } 
				else if (3 == MainRoleManager.actorInfo.job) 
				{
                    CastSpellHelper.shortcutsTryCaseSpell(3, true);
                }
				else
				{
					CastSpellHelper.shortcutsTryCaseSpell(3, true);
				}
             } 
			else 
			{
                 NoticeManager.showNotify(LangQ_NoticeInfo.RollInCd);
            }
        }

		private function jump(bool : Boolean) : void
		{
			if (MainRoleManager.actor.getCamouflageEntity()) //目前伪装者都不要跳跃
			{
				return;
			}
			if (bool)
			{
				var nowTime : int = getTimer();
				if (nowTime - _lastKeyJumpTime > KEY_JUMP_DELAY)
				{
					_lastKeyJumpTime = nowTime;
					var jumpRole : SceneRole = MainRoleManager.actor;
					var ref : JumpStateReference = jumpRole.stateMachine.getReference(JumpStateReference) as JumpStateReference;
					ref.setParams(0);
					var isJumping : Boolean = jumpRole.stateMachine.transition(RoleStateType.ACTION_JUMP, ref);
					if (isJumping)
					{
						SceneSender.sceneHeroJump(ref.jumpAction);
					}
					TrusteeshipManager.getInstance().broken();
					TrusteeshipManager.getInstance().stopFightTarget();
				}
			}
		}

		/**
		 * 向上移动
		 * @param bool
		 */
		private function walkForward(bool : Boolean) : void
		{
			if (_forwardWalk != bool)
				_changed = true;
			_forwardWalk = bool;
		}

		/**
		 * 向下移动
		 * @param bool
		 */
		private function walkBackward(bool : Boolean) : void
		{
			if (_backwardWalk != bool)
				_changed = true;
			_backwardWalk = bool;
		}

		/**
		 * 向左移动
		 * @param bool
		 */
		private function walkLeft(bool : Boolean) : void
		{
			if (_leftWalk != bool)
				_changed = true;
			_leftWalk = bool;
		}

		/**
		 * 向右移动
		 * @param bool
		 */
		private function walkRight(bool : Boolean) : void
		{
			if (_rightWalk != bool)
				_changed = true;
			_rightWalk = bool;
		}

		public function get keyMoving() : Boolean
		{
			return _keyMoving;
		}

		/**
		 * 是否响应了键盘上、下、左、右事件
		 * @return
		 *
		 */
		public function isResponseKeyboardEvent() : Boolean
		{
			if (_forwardWalk || _backwardWalk || _leftWalk || _rightWalk)
				return true;
			return false;
		}

		public function clear() : void
		{
			_forwardWalk = false;
			_backwardWalk = false;
			_leftWalk = false;
			_rightWalk = false;
			_keyMoving = false;
			_changed = false;
			_lastKeyWalkTime = 0;
			_lastKeyJumpTime = 0;
		}

		private function onTick(inv : uint = 0) : void
		{
			if (!_forwardWalk && !_backwardWalk && !_leftWalk && !_rightWalk)
			{
				if (_keyMoving)
				{
					_keyMoving = false;
					var stopRole : SceneRole = MainRoleManager.actor.getCamouflageEntity() as SceneRole;
					if (stopRole)
					{
						stopRole.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
						if (stopRole.stateMachine.isPrewarWaiting)
							stopRole.stateMachine.transition(RoleStateType.ACTION_PREWAR);
						else
							stopRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
					}
					else
					{
						stopRole = MainRoleManager.actor;
						stopRole.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
						if (stopRole.stateMachine.isPrewarWaiting)
							stopRole.stateMachine.transition(RoleStateType.ACTION_PREWAR);
						else
							stopRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
					}
				}
				return;
			}
			if (MainRoleManager.isTakeZhanChe) //乘坐他人战车时不能移动
			{
				return;
			}
			if (StallManager.isOnStall) //摆摊不能移动
				return;
			var camera : Camera3D = SceneManager.getScene().camera;
			if (!camera)
				return;

			if (TrailManager.getInstance().isSelfPlaying)
			{
				return;
			}

			var nowTime : int = getTimer();
			if (nowTime - RoleStateUtil.lastWalkTime > RoleStateUtil.WALK_DELAY)
			{
				if (nowTime - _lastKeyWalkTime > KEY_WALK_DELAY)
				{
					_changed = true;
				}
				if (_changed)
				{
					_lastKeyWalkTime = nowTime;
					var walkRole : SceneRole = MainRoleManager.actor;
					var reallyRole : SceneRole = MainRoleManager.actor.getCamouflageEntity() as SceneRole || walkRole;
					var moveSpeed : int = (reallyRole.data as RoleData).totalStat.moveSpeed;
					var isHunLuan : Boolean = reallyRole.stateMachine.isHunLuan;
					_moveDist = (KEY_WALK_DELAY + RoleStateUtil.WALK_DELAY * 2) * (moveSpeed * 0.001);
					var directionPosX : int = 0;
					var directionPosZ : int = 0;

					if (_forwardWalk)
						directionPosZ = 1;
					else if (_backwardWalk)
						directionPosZ = -1;
					if (_rightWalk)
						directionPosX = 1;
					else if (_leftWalk)
						directionPosX = -1;

					_offsetPos.setTo(0, 0, 0);

					var tempVec : Vector3D;
					if (directionPosX != 0)
					{
						if (isHunLuan)
							directionPosX = -directionPosX;
						tempVec = camera.rightVector;
						tempVec.normalize();
						tempVec.scaleBy(directionPosX);
						_offsetPos.incrementBy(tempVec);
					}

					if (directionPosZ != 0)
					{
						if (isHunLuan)
							directionPosZ = -directionPosZ;
						tempVec = camera.rightVector.crossProduct(Vector3D.Y_AXIS);
						tempVec.normalize();
						tempVec.scaleBy(directionPosZ);
						_offsetPos.incrementBy(tempVec);
					}

					TrusteeshipManager.getInstance().broken();
					TrusteeshipManager.getInstance().stopFightTarget();

					_keyMoving = true;
					var pos : Vector3D = PathFinderUtil.getWalkablePosByOffset(SceneManager.getDistrict(), reallyRole.position, _offsetPos, _moveDist);
					RoleStateUtil.walkToPos(walkRole, pos);
					if (!reallyRole.stateMachine.isWalkMoving)
					{
						reallyRole.faceToGround(reallyRole.position.x + _offsetPos.x, reallyRole.position.z + _offsetPos.z);
						var runRef : RunStateReference = reallyRole.stateMachine.getReference(RunStateReference) as RunStateReference;
						runRef.setParams(0, 0);
						reallyRole.stateMachine.transition(RoleStateType.ACTION_RUN, runRef);
					}
					_changed = false;
				}
				RoleStateUtil.lastWalkTime = nowTime;
			}
		}
	}
}
