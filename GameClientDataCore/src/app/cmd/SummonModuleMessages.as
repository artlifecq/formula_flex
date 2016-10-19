package app.cmd {

    public class SummonModuleMessages {

        /**
         * 回应官员召唤
         *
         * varint32 召唤id
         */
        public static const C2S_COUNTRY_OFFICER_SUMMON : String = "106_109";

        /**
         * 召唤成功
         *
         * varint32 召唤id
         */
        public static const S2C_COUNTRY_OFFICER_SUMMON : String = "106_110";

        /**
         * 回应召唤失败，返回varint32错误码
         *
         * 1. 没有人召唤过你
         * 2. 条件不满足
         */
        public static const S2C_COUNTRY_OFFICER_SUMMON_FAIL : String = "106_111";

        /**
         * 国王令/虎符/禁卫军 召唤，同一个人可能会收到两条相同id的数据
         *
         * varint32 TokenType令牌类型
         *
         * varint32 召唤的id
         * varint32 CountryOfficerPos 职位
         * utfbytes 官员名字
         * varint32 场景
         * varint32 x
         * varint32 y
         * varint32 CountryType 场景所属国家，0表示中立区
         * varint64 召唤过期时间
         * bytes 召唤文本
         */
        public static const S2C_OFFICER_SUMMON : String = "106_108";

        /**
         * 帮主召唤
         *
         * varint32 TokenType令牌类型
         *
         * varint32 召唤的id
         * utfbytes 官员名字
         * varint32 场景
         * varint32 x
         * varint32 y
         * varint32 CountryType 场景所属国家，0表示中立区
         * varint64 召唤过期时间
         * bytes 召唤文本
         */
        public static const S2C_FAMILY_LEADER_SUMMON : String = "106_47";

    }
}