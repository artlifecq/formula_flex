package app.cmd {

    public class BloodLineModuleMessages {

        /**
         * 血纹强化
         * varint32 multiple强化多少次
         * UpgradeProto strengthUpgradeData消耗物品的proto
         */
        public static const C2S_BLOOD_STRENGTH : String = "113_0";

        /**
         * 注意：客户端收到返回消息才能更新血纹的信息
         * 血纹强化成功   --可能会有技能条目数的增加 客户端自己判断血纹id  新增一条空的  登录的时候也要这样做
         * varint32 血纹id
         * varint32 当前进度
         */
        public static const S2C_BLOOD_STRENGTH_SUCCESS : String = "113_1";

        /**
         * 血纹洗练
         * UpgradeProto  washUpgradeData洗练消耗
         */
        public static const C2S_BLOOD_WASH : String = "113_2";

        /**
         * 血纹洗练成功
         * bytes RandomBloodSkillObjProto --包含新的技能列表
         */
        public static const S2C_BLOOD_WASH_SUCCESS : String = "113_3";

        /**
         * 血纹洗练保存结果
         * varint32 方案索引 （从0开始）
         */
        public static const C2S_BLOOD_WASH_SAVE : String = "113_5";

        /**
         * 血纹洗练保存结果成功
         * varint32 方案索引 （从0开始）
         *
         * 客户端收到成功消息 将洗练的结果替换当前的结果
         */
        public static const C2S_BLOOD_WASH_SAVE_SUCCESS : String = "113_6";

        /**
         * 血纹开启新的方案
         */
        public static const C2S_BLOOD_SKILS_TYPE_OPEN : String = "113_7";

        /**
         * 血纹开启新的方案成功
         * 客户端收到成功消息 将方案索引+1 既为新的方案同时将上一个方案的属性赋值过去
         */
        public static const S2C_BLOOD_SKILS_TYPE_OPEN_SUCCESS : String = "113_8";

        /**
         * 血纹开选择应用新的方案
         * varint32 方案索引 （从0开始）
         */
        public static const C2S_BLOOD_SKILS_TYPE_SELECT : String = "113_9";

        /**
         * 血纹开选择应用新的方案成功
         * varint32 方案索引 （从0开始）
         */
        public static const S2C_BLOOD_SKILS_TYPE_SELECT_SUCCESS : String = "113_10";

        /**
         * 血纹方案改名
         *  varint32 方案索引 （从0开始）
         *  utf 方案名
         */
        public static const C2S_BLOOD_SKILS_TYPE_ALTER_NAME : String = "113_11";

        /**
         * 血纹方案改名成功
         *  varint32 方案索引 （从0开始）
         *  utf 方案名
         */
        public static const S2C_BLOOD_SKILS_TYPE_ALTER_NAME_SUCCESS : String = "113_12";

        /**
         * 功能开启获得了血纹
         *  BloodModuleClientObjProto 血纹bloodModuleClientObjProto
         */
        public static const S2C_BLOOD_OPEN : String = "113_13";

        /**
         * 失败，附带varint32错误码
         * 有以下几种失败情况，
         * 1、血纹未开启
         * 2、血纹强化到了上限
         * 3、物品不足
         * 4、物品位置非法
         * 5、银两不足
         * 6、血纹强化 角色等级不足
         * 7、服务器血纹未知错误 稍后再试
         * 8、血纹方案索引错误
         * 9、改名长度非法（服务器限制最多10个字节）
         * 10、没有可以开启的新方案了
         * 11、没有未保存的洗练结果
         * 12、强化次数错误
         */
        public static const S2C_COMMON_ERROR : String = "113_100";

    }
}