package game.rpgGame.login.scene
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.scene.render.vo.RenderParamData;
	import com.game.engine3D.vo.BaseRole;

	import away3d.animators.transitions.CrossfadeTransition;

	/**
	 *
	 * 换装管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-31 上午10:03:17
	 *
	 */
	public class AvatarManager
	{
		public static function updateAvatar(role : SceneRole) : void
		{
			if (role == null || !role.usable)
				return;
			role.avatar.buildSyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
			role.avatar.buildSyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			role.avatar.buildSyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);

			role.avatar.removeRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			role.avatar.removeRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT);

			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
			if (rpd_mount)
			{
				//上“坐骑”
				updateMount(role);
				//穿“主体”
				updateBody(role);
				//穿“武器”
				updateWeapon(role);
			}
			else
			{
				//穿“主体”
				updateBody(role);
				//穿“武器”
				updateWeapon(role);
			}
		}

		private static function updateBody(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_body : RenderParamData = avatarInfo.rpd_body;
			if (rpd_body != null)
			{
				if (!role.avatar.hasSameRenderUnit(rpd_body)) //检测存在性
				{
					var ru : RenderUnit3D;
					if (role.avatar.hasIDRenderUnit(RenderUnitType.MOUNT, RenderUnitID.MOUNT))
						ru = role.avatar.addRenderUnitToBone(RenderUnitType.MOUNT, RenderUnitID.MOUNT, "b_0_saddle_01", rpd_body); //坐骑作为换装主体
					else
						ru = role.avatar.addRenderUnit(rpd_body);
					if (ru)
					{
						ru.defalutStatus = "100";
						ru.setAddedCallBack(partAddedCallBack, role);
						ru.entityGlass = false;
						ru.useLight = true;
						ru.castsShadows = true;
						role.avatar.applySyncInfo(RenderUnitType.BODY, RenderUnitID.BODY);
					}
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.BODY, RenderUnitID.BODY);
			}
		}

		private static function updateWeapon(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_weapon : RenderParamData = avatarInfo.rpd_weapon;
			if (rpd_weapon != null)
			{
				if (!role.avatar.hasSameRenderUnit(rpd_weapon)) //检测存在性
				{
					var ru : RenderUnit3D = role.avatar.addRenderUnitToBone(RenderUnitType.BODY, RenderUnitID.BODY, "b_r_wq_01", rpd_weapon);
					if (ru)
					{
						ru.defalutStatus = "100";
						ru.setAddedCallBack(partAddedCallBack, role);
						ru.entityGlass = false;
						ru.useLight = true;
						ru.castsShadows = true;
						role.avatar.applySyncInfo(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
					}
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.WEAPON, RenderUnitID.WEAPON);
			}
		}

		private static function updateMount(role : SceneRole) : void
		{
			var avatarInfo : AvatarInfo = (role.data as RoleData).avatarInfo;
			var rpd_mount : RenderParamData = avatarInfo.rpd_mount;
			if (rpd_mount != null)
			{
				if (!role.avatar.hasSameRenderUnit(rpd_mount)) //检测存在性
				{
					var ru : RenderUnit3D = role.avatar.addRenderUnit(rpd_mount);
					ru.defalutStatus = "100";
					ru.setAddedCallBack(partAddedCallBack, role);
					ru.entityGlass = false;
					ru.useLight = true;
					ru.castsShadows = true;
					role.avatar.applySyncInfo(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
				}
			}
			else
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.MOUNT, RenderUnitID.MOUNT);
			}
		}

		/**部件添加完成*/
		private static function partAddedCallBack(role : SceneRole, ru : RenderUnit3D) : void
		{
			ru.removeAddedCallBack(partAddedCallBack);
		}

		public static function playAction(role : SceneRole, action : String, startTime : uint = 0, count : int = 0) : void
		{
			role.forEachRenderUnit(function playTo(role : BaseRole, render : RenderUnit3D) : void
			{
				render.setStatus(action, new CrossfadeTransition(0.2), startTime);
			});
		}
	}
}
