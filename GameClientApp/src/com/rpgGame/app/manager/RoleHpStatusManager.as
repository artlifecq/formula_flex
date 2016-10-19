package com.rpgGame.app.manager
{
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.SceneCharType;

	/**
	 * 角色血条状态管理
	 @author Administrator
	 * 创建时间：2015-10-30 下午6:13:59
	 */
	public class RoleHpStatusManager
	{
		public static function checkShowHpBarWhenAttack(role : SceneRole, target : SceneRole) : Boolean
		{
			if (role && role.type == SceneCharType.MONSTER)
			{
				if (target && target.isMainChar)
				{
					return true;
				}
			}
			return false;
		}

		public static function checkShowHpBarWhenHurt(role : SceneRole, atkor : SceneRole) : Boolean
		{
			if (role && role.type == SceneCharType.MONSTER)
			{
				if (atkor && atkor.isMainChar)
				{
					return true;
				}
			}
			return false;
		}

		public static function checkShowHpBarWhenMouseOver(role : SceneRole) : Boolean
		{
			if (role.type == SceneCharType.MONSTER || role.type == SceneCharType.LIANG_CANG || role.type == SceneCharType.PROTECT_NPC)
			{
				var roleData : MonsterData = role.data as MonsterData;
				if (roleData.id <= 0)
				{
					return false;
				}
			}
			return false;
		}
	}
}
