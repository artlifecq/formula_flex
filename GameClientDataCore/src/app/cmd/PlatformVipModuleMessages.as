package app.cmd {

    public class PlatformVipModuleMessages {

        /**
         * 平台Vip礼包数据
         * bytes PlatformVipConfig
         */
        public static const S2C_PLATFORM_VIP_CONFIG : String = "95_1";

        /**
         * 平台Vip更新
         * varint32 vipType
         * varint32 vip等级，从1开始，1表示1级vip
         * varint32 vip付费类型，1-月费 2-季费 3-年费
         */
        public static const S2C_PLATFORM_VIP_UPDATE : String = "95_2";

        /**
         * 英雄平台Vip礼包领取状态
         * varint32 id, PlatformVipConfig里面的id字段
         * varint32 prize
         *
         * boolean isCollect = (prize >>> level) & 1 > 0; // true 表示这个等级的礼包领取过
         */
        public static const S2C_HERO_COLLECT_PRIZE : String = "95_3";

        /**
         * 领取平台Vip奖励，（每日都可以领取的礼包，只能领取其中一个，所以，每日礼包领取最高级的那个）
         * varint32 id, PlatformVipConfig里面的id字段
         * varint32 level, PlatformVipConfig里面的level字段
         */
        public static const C2S_COLLECT_PRIZE : String = "95_4";

        /**
         * 领取平台Vip奖励成功
         * varint32 id, PlatformVipConfig里面的id字段
         * varint32 level, PlatformVipConfig里面的level字段
         */
        public static const S2C_COLLECT_PRIZE : String = "95_5";

        /**
         * 领取平台Vip奖励失败，附带byte错误码
         * 1、奖励不存在
         * 2、vip等级不足（包括不是年费会员，领取年费会员奖励）
         * 3、已经领取过了
         * 4、背包空间不足
         */
        public static const S2C_COLLECT_PRIZE_FAIL : String = "95_6";

        /**
         * 人物等级礼包数据，收到这个消息，显示页签面板
         * varint32 vip类型，2301-百度金钻
         * while(byteArray.available) // 循环读取所有等级的奖励数据
         *     varint32 level
         *     UTFBytes PrizeProto（读一个short长度，再根据长度读取后面数据）
         */
        public static const S2C_HERO_LEVEL_PRIZE : String = "95_7";

        /**
         * 领取人物等级礼包
         * varint32 vip类型
         * varint32 level
         */
        public static const C2S_COLLECT_HERO_LEVEL_PRIZE : String = "95_8";

        /**
         * 领取人物等级礼包成功
         * varint32 vip类型
         * varint32 level
         */
        public static const S2C_COLLECT_HERO_LEVEL_PRIZE : String = "95_9";

        /**
         * 领取人物等级礼包失败，附带byte错误码
         * 1、人物等级不足
         * 2、你不是vip
         * 3、已经领取过了
         * 4、参数错误（客户端bug，包含vip类型不存在，或者level不存在）
         */
        public static const S2C_COLLECT_HERO_LEVEL_PRIZE_FAIL : String = "95_10";

        /**
         * 设置平台Vip，该消息没有返回
         * varint32 vip类型，19901-TGP
         *
         * 该消息提供给由客户端决定平台Vip的需求
         */
        public static const C2S_SET_PVIP : String = "95_11";

    }
}