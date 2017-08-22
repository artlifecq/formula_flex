package com.rpgGame.app.manager.fight
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.RelationCfgData;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
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
		
		/**
		 *虚拟模型，ui只渲染 
		 * 
		 */		
		public static const FIGHT_ROLE_DUMMY:int=101;
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
			//
			return getFightRoleState2(role,spellData);
			//主玩家自己
			if (role==MainRoleManager.actor) 
			{
				return FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			}
			var modeState : int = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			var heroData:HeroData = MainRoleManager.actorInfo;
            do {
                if (null == role || 
                    !role.usable || 
                    (role.isMainChar && JobEnum.ROLE_4_TYPE != (role.data as HeroData).job) || 
                    ((SceneCharType.MONSTER == role.type) && role.stateMachine.isDeadState)) {
                    // 不存在或者已经死亡 不可攻击
                    break;
                }
                var roleInfo : RoleData = role.data as RoleData;
				if (SceneCharType.DUMMY==role.type) 
				{
					return FIGHT_ROLE_DUMMY;
				}
                if (SceneCharType.MONSTER == role.type) {
                    // 是怪物
                    if (-1 != roleInfo.ownerId) {
                        // 从属怪
                        if (MainRoleManager.actorInfo.id == roleInfo.ownerId) {
                            // 是自己的从属怪
                            modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
                        } else {
                            goto checkPlayer;
                        }
                        break;
                    }
                    modeState = RelationCfgData.isEnemy(MainRoleManager.actorInfo, roleInfo) ?
                        FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY : FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
                    if (FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY == modeState && 
                        null != spellData &&
                        (SpellTargetType.FRIEND == spellData.q_target ||
                         SpellTargetType.TEAM == spellData.q_target)) {
                        modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
                    }
                    break;
                }
                if (SceneCharType.PLAYER == role.type) 
				{
                    // 是玩家
                    checkPlayer:
						var pkMode:int=MainRoleManager.actorInfo.pkMode;
						switch (pkMode) 
						{
                        case PKModeType.ALL:
                            // 全体
                            modeState = role==MainRoleManager.actor?FIGHT_ROLE_STATE_CAN_NOT_FIGHT:FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
                            break;
                        case PKModeType.TEAM:
                            // 队伍,肯定有组队
							if (Mgr.teamMgr.isInMyTeam(roleInfo.serverID)) 
							{
								// TODO 现在没有队伍故可攻击
								modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
							}
							else
							{
								// TODO 现在没有队伍故可攻击
								modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
							}
                           
                            break;
                        case PKModeType.GUILD:
                            // 帮派
							var hd:HeroData=roleInfo as HeroData;
							if (hd&&hd.guildId&&hd.guildId.EqualTo(heroData.guildId)) 
							{
								modeState=FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
							}
							else
							{
								// TODO 现在没有帮派故可攻击
								modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
							}
                          
                            break;
                        case PKModeType.GROUP:
                            // 阵营
                            // TODO 现在没有阵营故可攻击
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
                            break;
                        case PKModeType.KIND_OR_EVIL:
                            break;
                    }
                    if (FIGHT_ROLE_STATE_CAN_NOT_FIGHT == modeState && null != spellData) {
                        if (SpellTargetType.FRIEND == spellData.q_target) {
                            // TODO 现在没有好友故可攻击
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
                        } else if (SpellTargetType.TEAM == spellData.q_target) {
                            // TODO 现在没有队伍故可攻击
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
                        }
                    }
                    break;
                }
            } while (false);
            return modeState;
		}
		private static function checkPlayer(role : SceneRole, spellData : Q_skill_model = null) : int
		{
			var modeState:int;
			var roleInfo : RoleData = role.data as RoleData;
			var pkMode:int=MainRoleManager.actorInfo.pkMode;
			var mainHeroData:HeroData = MainRoleManager.actorInfo;
			switch (pkMode) 
			{
				case PKModeType.ALL:
					// 全体
					modeState = (role==MainRoleManager.actor)?FIGHT_ROLE_STATE_CAN_NOT_FIGHT:FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					break;
				case PKModeType.TEAM:
					// 队伍,肯定有组队
					if (Mgr.teamMgr.isInMyTeam(roleInfo.serverID)) 
					{
						// TODO 现在没有队伍故可攻击
						modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
					}
					else
					{
						// TODO 现在没有队伍故可攻击
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					}
					
					break;
				case PKModeType.GUILD:
					// 帮派
					var hd:HeroData=roleInfo as HeroData;
					if (hd&&hd.guildId&&hd.guildId.EqualTo(mainHeroData.guildId)) 
					{
						modeState=FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
					}
					else
					{
						// TODO 现在没有帮派故可攻击
						modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					}
					
					break;
				case PKModeType.GROUP:
					// 阵营
					// TODO 现在没有阵营故可攻击
					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
					break;
				case PKModeType.KIND_OR_EVIL:
					break;
			}
			if (FIGHT_ROLE_STATE_CAN_NOT_FIGHT == modeState && null != spellData)
			{
				if (SpellTargetType.FRIEND == spellData.q_target) 
				{
					// TODO 现在没有好友故可攻击
					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
				} else if (SpellTargetType.TEAM == spellData.q_target)
				{
					// TODO 现在没有队伍故可攻击
					modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
				}
			}
			return modeState;
		}
		private static function checkMonster(role : SceneRole, spellData : Q_skill_model = null) : int
		{
			var roleInfo : RoleData = role.data as RoleData;
			// 是怪物
			if (-1 != roleInfo.ownerId) 
			{
				// 从属怪
				if (MainRoleManager.actorInfo.id == roleInfo.ownerId) 
				{
					// 是自己的从属怪
					return FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
				}
				else 
				{
					var owner:SceneRole=SceneManager.getSceneObjByID(roleInfo.ownerId) as SceneRole;
					//主人
					if (owner) 
					{
						if (SceneCharType.PLAYER==owner.type) 
						{
							return checkPlayer(owner,spellData);
						}
						else if (SceneCharType.MONSTER==owner.type) 
						{
							return checkMonster(owner,spellData);
						}
					}
				}
			}
			var modeState:int = RelationCfgData.isEnemy(MainRoleManager.actorInfo, roleInfo) ?FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY : FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			//检查技能，只能对友放或者队友的技能就不能释放给敌对
			if (FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY == modeState && null != spellData &&(SpellTargetType.FRIEND == spellData.q_target ||SpellTargetType.TEAM == spellData.q_target)) 
			{
				modeState = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			}
			return modeState;
		}
		/**
		 * 阵营，PK模式判断写这里
		 * @param role
		 * @return
		 *
		 */
		public static function getFightRoleState2(role : SceneRole, spellData : Q_skill_model = null) : int
		{
			//主玩家自己
			if (role==MainRoleManager.actor) 
			{
				return FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			}
			if (null == role || !role.usable || (role.isMainChar && JobEnum.ROLE_4_TYPE != (role.data as HeroData).job) || ((SceneCharType.MONSTER == role.type) && role.stateMachine.isDeadState))
			{
				// 不存在或者已经死亡 不可攻击
				return FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			}
			if (SceneCharType.DUMMY==role.type) 
			{
				return FIGHT_ROLE_DUMMY;
			}
			var modeState : int = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			if (SceneCharType.PLAYER == role.type) 
			{
				modeState=checkPlayer(role,spellData);
			}
			else if (SceneCharType.MONSTER == role.type) 
			{
				modeState=checkMonster(role,spellData);
			}
			return modeState;
		}

	}
}
