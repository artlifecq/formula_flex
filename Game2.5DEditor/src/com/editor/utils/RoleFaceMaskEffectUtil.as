package com.editor.utils
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.data.RenderUnitType;
	import com.editor.scene.SceneRole;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.FadeAlphaRectData;

	/**
	 *
	 * 角色渐变遮罩效果工具
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-23 上午10:03:17
	 *
	 */
	public class RoleFaceMaskEffectUtil
	{
		public function RoleFaceMaskEffectUtil()
		{
		}
		public static const fixAreaShapeX : int = 100;
		public static const fixAreaShapeY : int = 200;
		public static var currAreaShapeX : int = fixAreaShapeX;
		public static var currAreaShapeY : int = fixAreaShapeY;

		public static var faceMaskEffectType : int = 0;

		public static function removeFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.removeFadeAlpha();
						break;
				}
			});
		}

		public static function addDialogFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(GlobalConfig.getDynTextureFilePath("dialogFaceMask"),0);
						break;
				}
			});
		}

		public static function addHeadFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(GlobalConfig.getDynTextureFilePath("headFaceMask"),0);
						break;
				}
			});
		}

		public static function addBossHeadFaceMaskEffect(role : SceneRole) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.addFadeAlpha(GlobalConfig.getDynTextureFilePath("bossHeadFaceMask"),0);
						break;
				}
			});
		}

		public static function updateFadeAlphaRectPos(role : SceneRole, x : int, y : int) : void
		{
			role.avatar.forEachRenderUnit(function(render : RenderUnit3D) : void
			{
				switch (render.type)
				{
					case RenderUnitType.BODY:
					case RenderUnitType.HAIR:
					case RenderUnitType.WEAPON:
					case RenderUnitType.DEPUTY_WEAPON:
					case RenderUnitType.MOUNT:
						render.setFadeAlphaRect(new FadeAlphaRectData(x, y, 0, 0));
						break;
				}
			});
		}
	}
}
