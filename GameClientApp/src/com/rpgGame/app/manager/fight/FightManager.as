package com.rpgGame.app.manager.fight
{
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.ZhanCheData;
	import com.rpgGame.coreData.type.PKModeType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.SpellTargetType;
	
	/**
	 *
	 * 战斗管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-27 下午2:22:13
	 *
	 */
	public class FightManager
	{
		/**
		 * 不能攻击
		 */
		public static const FIGHT_ROLE_STATE_CAN_NOT_FIGHT : int = 0;
		/**
		 * 可攻击敌方
		 */
		public static const FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY : int = 1;
		/**
		 * 可攻击友方
		 */
		public static const FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND : int = 2;

		public function FightManager()
		{
		}

		/**
		 * 阵营，PK模式判断写这里
		 * @param role
		 * @return
		 *
		 */
		public static function getFightRoleState(role : SceneRole, spellData : Q_skill_model = null) : int
		{
			var modeState : int = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			var heroData:HeroData = MainRoleManager.actorInfo;
			if (role == null || !role.usable || role.isMainChar || role.stateMachine.isDeadState)
			{
				return modeState;
			}
			if (role.type == SceneCharType.PLAYER)
			{
				if (MainRoleManager.actorInfo.pkMode == PKModeType.ALL) //全体模式就可以攻击
				{
					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
				}
				else if (MainRoleManager.actorInfo.pkMode == PKModeType.COUNTRY)
				{
					if (MainRoleManager.actorInfo.countryId != (role.data as RoleData).countryId) //国家模式不同国可以攻击
					{
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					}
				}
				else if (MainRoleManager.actorInfo.pkMode == PKModeType.ALLIANCE)
				{
//					if (MainRoleManager.actorInfo.countryId != (role.data as RoleData).countryId && CountryManager.unionCountry != (role.data as RoleData).countryId) //国家模式不是盟国可以攻击
//					{
//						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
//					}
				}
				else if (MainRoleManager.actorInfo.pkMode == PKModeType.FAMILY)
				{
					if (MainRoleManager.actorInfo.societyName != (role.data as HeroData).societyName)
					{
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					}
				}
				else if (MainRoleManager.actorInfo.pkMode == PKModeType.KIND_OR_EVIL)
				{
					if ((role.data as HeroData).nameColor >= PKModeType.AMOUNT_GRAY)
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
				}
				else if (MainRoleManager.actorInfo.pkMode == PKModeType.TEAM)
				{
					if (!TeamManager.isMyTeamMember((role.data as HeroData).id))
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
				}
				if (modeState == FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY && spellData)
				{
					switch (spellData.q_target)
					{
						case SpellTargetType.FRIEND:
							//todo好友系统要判断是否好友
							if (FriendManager.checkIsFriend((role.data as HeroData).id))
								modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
							break;
						case SpellTargetType.TEAM:
							//todo组队系统要判断是否队友
							if (TeamManager.isMyTeamMember((role.data as HeroData).id))
								modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
							break;
					}
//					if ((modeState == FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY || modeState == FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND) && (spellData.affect_target & 1) != 0) //不影响玩家
//					{
//						modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
//					}
				}
				return modeState;
			}
			else if (role.type == SceneCharType.MONSTER || role.type == SceneCharType.LIANG_CANG)
			{
				if (MainRoleManager.actorInfo.countryId != (role.data as MonsterData).countryId) //判断国战敌方己方怪物
				{
					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
				}
				if ((role.data as MonsterData).ownerName != "" && (role.data as MonsterData).ownerName == MainRoleManager.actorInfo.societyName)
				{
					modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
				}
				if (modeState == FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY && spellData)
				{
					switch (spellData.q_target)
					{
						case SpellTargetType.ENEMY:
							modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
							break;
						default:
							modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
							break;
					}
					if (modeState == FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
					{
						//暂时没有这个属性，后面可以考虑开启
//						if ((role.data as MonsterData).isNormal && (spellData.affect_target & 2) != 0) //不影响普通怪
//						{
//							modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
//						}
//						else if ((role.data as MonsterData).isElite && (spellData.affect_target & 4) != 0) //不影响精英怪
//						{
//							modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
//						}
//						else if ((role.data as MonsterData).isBoss && (spellData.affect_target & 8) != 0) //不影响Boss怪
//						{
//							modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
//						}
					}
				}
				return modeState;
			}
//			else if (role.type == SceneCharType.PET)
//			{
//				if (BiaoCheData(role.data).ownerID != MainRoleManager.actorID)
//				{
//					canMode = true;
//				}
//				if (canMode && (spellData.affectType & 16) != 0) //不影响宠物
//				{
//					canMode = false;
//				}
//				return canMode;
//			}
			else if (role.type == SceneCharType.BIAO_CHE)
			{
				//本国的镖车不能够攻击
//				if ((role.data as BiaoCheData).ownerID != MainRoleManager.actorID && !CountryManager.isAtMyCountry() )
//				{
//					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
//				}
//				if (modeState == FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY && spellData != null && (spellData.affect_target & 32) != 0) //不影响镖车
//				{
//					modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
//				}
//				return modeState;
			}
			else if(role.type == SceneCharType.ZHAN_CHE)
			{
				var zhancheData:ZhanCheData = role.data as ZhanCheData;
				if(zhancheData)
				{
					if(MainRoleManager.isDriveZhanChe)
					{
//						if(CountryManager.isMyEnemyCountry(zhancheData.ownerCountry))
//						{
//							modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
//						}
					}
				}
			}
			return modeState;
		}
	}
}
