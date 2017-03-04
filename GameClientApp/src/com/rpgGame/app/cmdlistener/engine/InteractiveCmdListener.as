package com.rpgGame.app.cmdlistener.engine
{
	import com.game.engine3D.controller.CameraController;
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.graphics.StallHeadFace;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.WalkToRoleManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneCursorHelper;
	import com.rpgGame.app.manager.stall.StallManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.controller.MouseCursorController;
	import com.rpgGame.coreData.cfg.task.TouZhuCfgData;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	
	import away3d.events.MouseEvent3D;
	
	import gameEngine2D.NetDebug;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 交互侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-9 上午10:26:37
	 *
	 */
	public class InteractiveCmdListener extends BaseBean
	{
		private var _isPanningStarted : Boolean = false;
        // 是否左击地图
        private var _isLeftDown : Boolean = false;
        // 上一次选中实体时间
        private var _prevSelectEntityTime : int = 0;

		public function InteractiveCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			//注册场景交互事件
			EventManager.addEvent(SceneEvent.INTERACTIVE, onSceneInteractive);
			EventManager.addEvent(SceneEvent.CAMERA_START_PANNING, onCameraStartPanning);
			EventManager.addEvent(SceneEvent.CAMERA_END_PANNING, onCameraEndPanning);
			//
			finish();
		}

		private function onCameraStartPanning() : void
		{
			if (!SceneRoleSelectManager.mouseOverRole || !CameraController.lockedOnPlayerController.isMouseRightDown)
			{
				SceneRoleSelectManager.mouseOverRole = null;
				MouseCursorController.showMove();
			}
			else if (CameraController.lockedOnPlayerController.isMouseDown)
			{
				SceneRoleSelectManager.mouseOverRole = null;
				MouseCursorController.showMove();
			}
		}

		private function onCameraEndPanning() : void
		{
			SceneRoleSelectManager.updateRoleMouseCursor();
		}

		private function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			switch (action)
			{
				case SceneEventAction3D.SCENE_MAP_MOUSE_DOWN: //点击场景
					sceneMapClick(position);
					break;
                case SceneEventAction3D.SCENE_MAP_MOUSE_UP: // 场景地图弹起
                    sceneMapUp(position);
                    break;
                case SceneEventAction3D.SCENE_MAP_MOUSE_MOVE: // 场景地图滑动
                    sceneMapMove(position);
                    break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_DOWN: //点击实体
					sceneEntityClick(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_RIGHT_UP: //点击实体
					sceneEntityRightClick(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_RIGHT_DOWN: //摄像机视角操作 
					cameraStartPanning(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_OVER: //滑过实体
					sceneEntityOver(position, currTarget, target);
					break;
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_OUT: //移出实体
					sceneEntityOut(position, currTarget, target);
					break;
			}
		}

		/**
		 * 点击场景
		 * @param position
		 *
		 */
		private function sceneMapClick(position : Vector3D) : void
		{
            CONFIG::netDebug {
                NetDebug.LOG("MapDown");
            }
            this._isLeftDown = true;
			if (CameraController.lockedOnPlayerController.ispanning)
				return;
			if (!KeyMoveManager.getInstance().keyMoving)
			{
				TrusteeshipManager.getInstance().broken();
				TrusteeshipManager.getInstance().stopFightTarget();
				var isWalking : Boolean = RoleStateUtil.doWalkToPos(MainRoleManager.actor, position);
				if (isWalking)
				{
					SceneCursorHelper.getInstance().showCursor(position);
				}
			}
		}
        
        private function sceneMapUp(position : Vector3D) : void {
            this._isLeftDown = false;
            CONFIG::netDebug {
                NetDebug.LOG("MapUp");
            }
        }
        
        private function sceneMapMove(position : Vector3D) : void {
            if (CameraController.lockedOnPlayerController.ispanning) {
                return;
            }
            if (!this._isLeftDown) {
                return;
            }
            if (KeyMoveManager.getInstance().keyMoving) {
                return;
            }
            CONFIG::netDebug {
                NetDebug.LOG("MapMove vec:" + position);
            }
            RoleStateUtil.doWalkToPos(MainRoleManager.actor, position);
        }

		private function sceneEntityClick(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			if (CameraController.lockedOnPlayerController.ispanning)
				return;
			if (!currTarget.usable)
				return;
            var curTime : int = getTimer();
            var isDoubleClick : Boolean = false;
            if (curTime - this._prevSelectEntityTime < 300) {
                // 双击
                isDoubleClick = true;
            } else {
                this._prevSelectEntityTime = curTime;
            }
			if (currTarget is SceneRole)
			{
				SceneRoleSelectManager.selectedRole = currTarget as SceneRole;
			}
			if (!KeyMoveManager.getInstance().keyMoving)
			{
				if (currTarget is SceneRole)
				{
                    CONFIG::netDebug {
                        NetDebug.LOG("WalkToRole role[type:" +
                        (currTarget as SceneRole).type + ", usable:" +
                        (currTarget as SceneRole).usable + ", pos:" +
                        (currTarget as SceneRole).position + "] isDoubleClick:" + isDoubleClick);
                    }
                    var role:SceneRole = currTarget as SceneRole;
					var sceneRole : SceneRole = currTarget as SceneRole;
					if (sceneRole.type == SceneCharType.TRANS) //传送门
					{
						if(!MainRoleManager.isTakeZhanChe)//乘坐他人战车时不能点击传送门
						{
							TrusteeshipManager.getInstance().broken();
							TrusteeshipManager.getInstance().stopFightTarget();
							WalkToRoleManager.walkToTranport(currTarget as SceneRole);
						}
					}
					else if(sceneRole.type == SceneCharType.STALL && 
                        (sceneRole.data as StallData).playerId == MainRoleManager.actorID)
					{
						var stallData : StallData = sceneRole.data as StallData;
						if(stallData)
						{
							StallManager.seeStallPlayerId = stallData.playerId;
							AppManager.showAppNoHide(AppConstant.STALL_PANEL);
							if(sceneRole.headFace is StallHeadFace)
								(sceneRole.headFace as StallHeadFace).addAndUpdateStallBg();
						}
					}else if(role.type==SceneCharType.DROP_GOODS){//掉落物
						WalkToRoleManager.walkToRole(role);
					}
					else 
					{
						var modeState : int = FightManager.getFightRoleState(currTarget as SceneRole);
						if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY || 
                            modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
						{
                            // 可攻击
                            if (role.type == SceneCharType.MONSTER) 
							{
                                WalkToRoleManager.walkToRole(currTarget as SceneRole);
                            }
//							if(MainRoleManager.actorInfo.zhanCheOwnerID <= 0)//没在战车上
//							{
//								var hasSpellCanCast : Boolean = CastSpellHelper.hasSpellCanCast();
//								if (hasSpellCanCast)
//								{
//									TrusteeshipManager.getInstance().startFightTarget(Vector.<SceneRole>([currTarget]));
//								}
//								else
//								{
//									NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellHasNoWeapon); //"没有穿戴武器不能释放技能"
//								}
//							}
						}
						else
						{
                            // 不可攻击
							TrusteeshipManager.getInstance().broken();
							TrusteeshipManager.getInstance().stopFightTarget();
							if(role)
							{
								if(role.type == SceneCharType.MONSTER ||
                                   role.type == SceneCharType.NPC)
								{
                                    WalkToRoleManager.walkToRole(currTarget as SceneRole);
								}
								else if (role.type == SceneCharType.PLAYER)
								{
                                    if (isDoubleClick) {
                                        WalkToRoleManager.walkToRole(currTarget as SceneRole);
                                    }
								}
							}
						}
					}
				}
			}
		}

		private function sceneEntityRightClick(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			TweenLite.killDelayedCallsTo(onDelayedPanningStarted);
			if (_isPanningStarted)
				return;
			if (!currTarget.usable)
				return;
			if (currTarget is SceneRole)
			{
				SceneRoleSelectManager.selectedRole = currTarget as SceneRole;
			}
		}

		private function sceneEntityOver(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			if (CameraController.lockedOnPlayerController.ispanning)
				return;
			if (!currTarget.usable)
				return;
			SceneRoleSelectManager.mouseOverRole = currTarget as SceneRole;
		}

		private function sceneEntityOut(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			if (CameraController.lockedOnPlayerController.ispanning)
				return;
			SceneRoleSelectManager.mouseOverRole = null;
		}

		private function cameraStartPanning(position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			_isPanningStarted = false;
			TweenLite.killDelayedCallsTo(onDelayedPanningStarted);
			TweenLite.delayedCall(0.5, onDelayedPanningStarted);
		}

		private function onDelayedPanningStarted() : void
		{
			SceneRoleSelectManager.mouseOverRole = null;
			MouseCursorController.showMove();
			_isPanningStarted = true;
		}
	}
}
