package app.cmd {

    public class AddSpriteStatModuleMessages {

        /**
         * 加属性点
         *
         * varint32 属性id[StatType]
         * varint32 加的属性点数量
         */
        public static const C2S_ADD_SPRITE_STAT : String = "105_1";

        /**
         * 加属性点失败,返回varint32错误码
         *
         * 1. 属性类型非法
         * 2. 属性不是一级属性
         * 3. 属性点不够
         * 4. 添加的属性点非法
         */
        public static const S2C_ADD_SPRITE_STAT_FAIL : String = "105_2";

        /**
         * 加属性点成功
         *
         * varint32 属性id[StatType]
         * varint32 加的属性点数量
         */
        public static const S2C_ADD_SPRITE_STAT : String = "105_3";

        /**
         * 自动加属性点
         */
        public static const C2S_AUTO_ADD_SPRITE_STAT : String = "105_4";

        /**
         * 自动加属性点失败，返回varint32错误码
         *
         * 1. 属性点不够
         * 2. 没有武器
         * 3. 没有学习任何职业的技能
         */
        public static const S2C_AUTO_ADD_SPRITE_STAT_FAIL : String = "105_5";

        /**
         * 自动加属性点成功
         *
         * varint32 使用的总的属性点
         * bytes SpriteStatProto 加点以后的属性
         */
        public static const S2C_AUTO_ADD_SPRITE_STAT : String = "105_6";

        /**
         * 清空属性点
         *
         * if(level < 免费洗点等级){
         * } else {
         *      洗点消耗UpgradeProto
         * }
         */
        public static const C2S_CLEAR_SPRITE_STAT : String = "105_7";

        /**
         * 清空属性点失败,返回varint32错误码
         *
         * 1. 没有属性点可以洗
         * 2. 洗点物品位置非法
         * 3. 洗点物品不够
         */
        public static const S2C_CLEAR_SPRITE_STAT_FAIL : String = "105_8";

        /**
         * 清空属性点成功
         *
         * 将加成的属性设置为空
         */
        public static const S2C_CLEAR_SPRITE_STAT : String = "105_9";

    }
}