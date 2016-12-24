package com.editor.manager
{
	import com.editor.data.RenderUnitID;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleStateType;
	import com.editor.events.AvatarPreviewEvent;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.PlayActionStateReference;
	import com.game.engine3D.scene.render.RenderUnit3D;

	import org.client.mainCore.manager.EventManager;

	/**
	 * 预览区数据管理
	 * @author zgd
	 *
	 */
	public class AvatarPreviewManager
	{
		private static var _bodyRes : String;

		public static function get bodyRes() : String
		{
			return _bodyRes;
		}

		private static var _hairRes : String;

		public static function get hairRes() : String
		{
			return _hairRes;
		}

		private static var _weaponRes : String;

		public static function get weaponRes() : String
		{
			return _weaponRes;
		}

		private static var _mountRes : String;

		public static function get mountRes() : String
		{
			return _mountRes;
		}

		private static var _effectRes : String;

		public static function get effectRes() : String
		{
			return _effectRes;
		}

		private static var _animatRes : String;

		public static function get animatRes() : String
		{
			return _animatRes;
		}

		private static var _action : String = RoleActionType.IDLE;

		public static function get action() : String
		{
			return _action;
		}

		private static var _rotationY : int;

		public static function get rotationY() : int
		{
			return _rotationY;
		}

		private static var _scale : Number = 1;

		public static function get scale() : Number
		{
			return _scale;
		}

		private static var _animationSpeed : Number = 1;

		public static function get animationSpeed() : Number
		{
			return _animationSpeed;
		}

		public static function setRes($bodyRes : String, $hair : String = null, $weaponRes : String = null, mountRes : String = null, effectRes : String = null, weaponEffectResIDs : Array = null, weaponEffectBindBones : Array = null, animatRes : String = null, bodyEffectResIDs : Array = null, bodyEffectBindBones : Array = null, bodyMethodTypeEffectResID : String = null) : void
		{
			_bodyRes = $bodyRes;
			_hairRes = $hair;
			_weaponRes = $weaponRes;
			_mountRes = mountRes;
			_effectRes = effectRes;
			_animatRes = animatRes;
			SceneRoleManager.getInstance().setPreviewAvatar($bodyRes, _hairRes, $weaponRes, _mountRes, _effectRes, //
				weaponEffectResIDs, weaponEffectBindBones, _animatRes, bodyEffectResIDs, bodyEffectBindBones, bodyMethodTypeEffectResID);
//			if (fromPreviewUI)
//			{
//				EventManager.dispatchEvent(AvatarPreviewEvent.SELECTED_FILE, $bodyRes, _hairRes, $weaponRes, _mountRes, _effectRes);
//			}
//			else
//			{
			EventManager.dispatchEvent(AvatarPreviewEvent.SELECTED_RES, $bodyRes);
//			}
		}

		public static function setAction(value : String, fromPreviewUI : Boolean = false) : void
		{
			_action = value;
			if (fromPreviewUI)
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SELECTED_ACTION, value);
			}
			else
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SET_ACTION, value);
				var role : SceneRole = SceneRoleManager.getInstance().previewEntity;
				if (role)
				{
					var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
					ref.setParams(_action);
					role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
				}
			}
		}

		public static function setRotationY(value : int, fromPreviewUI : Boolean = false) : void
		{
			_rotationY = value;
			SceneRoleManager.getInstance().scenePreviewEntity.rotationY = _rotationY;
			SceneRoleManager.getInstance().previewEntity.rotationY = _rotationY;
			if (fromPreviewUI)
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SELECTED_ROTATION_Y, value);
			}
			else
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SET_ROTATION_Y, value);
			}
		}

		public static function setScale(value : Number, fromPreviewUI : Boolean = false) : void
		{
			_scale = value;
			SceneRoleManager.getInstance().previewEntity.setScale(_scale);
			if (fromPreviewUI)
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SELECTED_SCALE, value);
			}
			else
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SET_SCALE, value);
			}
		}

		public static function setAnimationSpeed(value : Number, fromPreviewUI : Boolean = false) : void
		{
			_animationSpeed = value;
			var bodyRender : RenderUnit3D = SceneRoleManager.getInstance().previewEntity.avatar.getRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			if (bodyRender)
				bodyRender.animateSpeed = _animationSpeed;
			if (fromPreviewUI)
			{
			}
			else
			{
				EventManager.dispatchEvent(AvatarPreviewEvent.SET_ANIMATION_SPEED, value);
			}
		}
	}
}
