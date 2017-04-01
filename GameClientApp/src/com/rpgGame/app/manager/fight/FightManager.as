package com.rpgGame.app.manager.fight
{
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.RelationCfgData;
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
		public static function getFightRoleState(role : SceneRole, spellData : Q_skill_model = null, isDie : Boolean = false) : int
		{
			var modeState : int = FIGHT_ROLE_STATE_CAN_NOT_FIGHT;
			var heroData:HeroData = MainRoleManager.actorInfo;
            do {
                if (null == role || !role.usable || role.isMainChar || (isDie != role.stateMachine.isDeadState)) {
                    // 不存在或者已经死亡 不可攻击
                    break;
                }
                var roleInfo : RoleData = role.data as RoleData;
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
                        modeState = FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND;
                    }
                    break;
                }
                if (SceneCharType.PLAYER == role.type) {
                    // 是玩家
                    checkPlayer:switch (MainRoleManager.actorInfo.pkMode) {
                        case PKModeType.ALL:
                            // 全体
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
                            break;
                        case PKModeType.TEAM:
                            // 队伍
                            // TODO 现在没有队伍故可攻击
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
                            break;
                        case PKModeType.GUILD:
                            // 帮派
                            // TODO 现在没有帮派故可攻击
                            modeState = FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY;
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
	}
}
