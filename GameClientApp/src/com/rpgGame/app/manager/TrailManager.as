package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.TrailStateReference;
	import com.rpgGame.app.state.role.control.TrailMoveStateReference;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.model.MountModelCfgData;
	import com.rpgGame.coreData.clientConfig.MountModel;
	import com.rpgGame.coreData.info.move.TrailPathPoint;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleStateType;

	import flash.utils.getTimer;

	import app.message.RaceId;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 轨迹管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-20 下午2:03:17
	 *
	 */
	public class TrailManager
	{
		private static var _instance : TrailManager;

		public static function getInstance() : TrailManager
		{
			if (!_instance)
			{
				_instance = new TrailManager();
			}
			return _instance;
		}

		public function TrailManager()
		{
		}

		public function play(role : SceneRole, trailPathPoints : Vector.<TrailPathPoint>, isClingGround : Boolean, startTime : Number, mountRes : String, mountModelId : int) : void
		{
			var roleData : HeroData = role.data as HeroData;
			var mountModel : MountModel = MountModelCfgData.getInfo(mountModelId);
			var mountAnimatRes : String = null;
			if (mountModel)
			{
				mountAnimatRes = mountModel.animatRes;
//				switch (roleData.weaponRace)
//				{
//					case RaceId.ZHONG_JIAN:
//						mountAnimatRes = mountModel.animatRes_zhongJian;
//						break;
//					case RaceId.BA_DAO:
//						mountAnimatRes = mountModel.animatRes_baDao;
//						break;
//					case RaceId.YIN_QIANG:
//						mountAnimatRes = mountModel.animatRes_yinQiang;
//						break;
//					case RaceId.YU_SHAN:
//						mountAnimatRes = mountModel.animatRes_yuShan;
//						break;
//					case RaceId.FA_ZHANG:
//						mountAnimatRes = mountModel.animatRes_faZhang;
//						break;
//					case RaceId.SHEN_GONG:
//						mountAnimatRes = mountModel.animatRes_shenGong;
//						break;
//					case RaceId.KUANG_FU:
//						mountAnimatRes = mountModel.animatRes_kuangFu;
//						break;
//					default:
//						mountAnimatRes = mountModel.animatRes_unarmed;
//				}
			}

			if (isClingGround)
			{
				role.clingGroundCalculate = SceneManager.getScene().clingGround;
			}
			else
			{
				role.clingGroundCalculate = null;
			}
			(role.data as HeroData).trailMount = mountRes;
			(role.data as HeroData).trailMountAnimat = mountAnimatRes;
//			AvatarManager.callEquipmentChange(role);
			AvatarManager.updateAvatar(role);
			doTrailToPos(role, trailPathPoints, isClingGround, startTime, null, onTrailToComplete);
		}

		private function onTrailToComplete(ref : TrailMoveStateReference) : void
		{
			var role : SceneRole = ref.owner as SceneRole;
			role.clingGroundCalculate = SceneManager.getScene().clingGround;
			(role.data as HeroData).trailMount = null;
			(role.data as HeroData).trailMountAnimat = null;
//			AvatarManager.callEquipmentChange(role);
			AvatarManager.updateAvatar(role);
		}

		public static function doTrailToPos(role : SceneRole, trailPathPoints : Vector.<TrailPathPoint>, isClingGround : Boolean, startTime : Number, data : Object = null, onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : Boolean
		{
			if (!role || !role.usable)
				return false;
			if (role.isMainChar)
			{
				var nowTime : int = getTimer();
				RoleStateUtil.lastWalkTime = nowTime;
			}
			var trailMoveRef : TrailMoveStateReference = role.stateMachine.getReference(TrailMoveStateReference) as TrailMoveStateReference;
			trailMoveRef.setParams(trailPathPoints, isClingGround, startTime);
			trailMoveRef.data = data;
			trailMoveRef.onMove(onWalkMove);
			trailMoveRef.onUpdate(onUpdate);
			trailMoveRef.onThrough(onWalkThrough, onThrough);
			trailMoveRef.onArrive(onWalkArrivefunction, onArrive);
			trailMoveRef.onReady(onWalkReady);
			trailMoveRef.onStop(onWalkStop);
			trailMoveRef.onEnd(onWalkEnd);
			role.stateMachine.transition(RoleStateType.CONTROL_TRAIL_MOVE, trailMoveRef);
			return role.stateMachine.isTrailMoving;
		}

		private static function onWalkMove(ref : TrailMoveStateReference) : void
		{
			var trailRef : TrailStateReference = (ref.owner as SceneRole).stateMachine.getReference(TrailStateReference) as TrailStateReference;
			trailRef.setParams(ref.statusType, ref.speed, ref.baseActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_TRAIL, trailRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_ENTER);
			}
		}

		private static function onWalkThrough(onThrough : Function, ref : TrailMoveStateReference) : void
		{
			var trailRef : TrailStateReference = (ref.owner as SceneRole).stateMachine.getReference(TrailStateReference) as TrailStateReference;
			trailRef.setParams(ref.statusType, ref.speed, ref.baseActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_TRAIL, trailRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_THROUGH);
			}
			else
			{
				EventManager.dispatchEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, ref.owner);
			}
			if (onThrough != null)
				onThrough(ref);
		}

		private static function onWalkArrivefunction(onArrive : Function, ref : TrailMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
				//派发行走到达事件
			}
			if (onArrive != null)
				onArrive(ref);
		}

		private static function onWalkReady(ref : TrailMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_START);
			}
		}

		private static function onWalkStop(ref : TrailMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkEnd(ref : TrailMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar)
			{
				EventManager.dispatchEvent(UserMoveEvent.MOVE_END);
			}
		}

		public function get isSelfPlaying() : Boolean
		{
			var role : SceneRole = MainRoleManager.actor;
			return role.stateMachine.isTrailMoving;
		}
	}
}
