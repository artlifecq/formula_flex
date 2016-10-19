package app.cmd {

    public class SpellModuleMessages {

        /**
         * 学习或升级某spellType的主动技能
         *
         * 发送要学习技能的spellType varint32
         *
         * UpgradeProto SpellProto.learn_cost
         */
        public static const C2S_LEARN_OR_UPGRADE_ACTIVE_SPELL : String = "4_1";

        /**
         * 学习或升级主动技能成功, 后面附带技能的proto SpellProto
         */
        public static const S2C_LEARNED_OR_UPGRADED_ACTIVE_SPELL : String = "4_2";

        /**
         * 学习或升级技能失败, 后面附带varint32 的错误码
         *
         * 1. 发送的spellType不存在
         * 2. 技能已经升到满级
         * 3. 学习的等级不够
         * 4. 银两不够
         * 5. 经验不够
         * 6. 物品不够
         * 7. 不是你这职业能学的
         * 8. 技能点不够
         * 9. 前置技能没学会
         * 10. 学习的前置技能消耗的技能点不够
         * 11. 绑银不够
         * 12. 已经学习了其他系的技能，不能学习该系
         */
        public static const S2C_LEARN_OR_UPGRADE_SPELL_FAIL : String = "4_3";

        /**
         * 请求洗点
         *
         * if(玩家当前等级>=洗点免费等级){
         *      UpgradeProto 洗点的UpgradeProto
         * }
         */
        public static const C2S_CLEAR_SPELLS : String = "4_10";

        /**
         * 请求洗点失败，返回varint32错误码
         *
         * 1.当前没有学习过任何一个职业的技能，无法洗点
         * 2.物品不够
         */
        public static const S2C_CLEAR_SPELLS_FAILURE : String = "4_11";

        /**
         * 请求洗点成功
         *
         * 客户端将当前使用的技能点点数重置为0
         */
        public static const S2C_CLEAR_SPELLS_SUCCESS : String = "4_12";

        /**
         * 获得新的技能点
         *
         * varint32 新的总的获得的技能点数
         */
        public static const S2C_OBTAIN_SPELL_POINT : String = "4_13";

    }
}