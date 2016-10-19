package app.cmd {

    public class PlatformEverydayPrizeModuleMessages {

        /**
         *
         * 服务器任何时候都可能推送这条消息，客户端收到这条消息后，如果附带的PlatformPrizeProto字段非空，
         * 则按PlatformPrizeProto 描述的信息刷新显示ICON
         *
         * 如果PlatformPrizeProto字段为空，则让ICON消失
         *
         * 附带
         *
         * PlatformPrizeProto 里面附带了主界面显示的ICON、奖励描述、奖励物品列表
         */
        public static const S2C_PUSH_PLATFORM_PRIZE_DATA : String = "36_1";

        /**
         * 领取平台加速奖励.
         * 客户端先判断背包是否有足够格子能放得下奖励 (奖励有几个, 就要几个空格)，如果放不下就不要下发了
         * 必须等待服务器返回
         *
         * 无附带数据
         *
         */
        public static const C2S_COLLECT_PLATFORM_PRIZE : String = "36_1";

        /**
         * 领取失败, 附带varint32 错误码
         * 客户端收到1或者2，让ICON从界面消失
         * 1. 当前没有该平台的加速活动
         * 2. 已经领过1次了
         * 3. 背包不够
         * 4. 内部错误
         */
        public static const S2C_ERROR_COLLECT_PRIZE : String = "36_2";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标, 并且平台加速活动的ICON消失
         *
         * 在没收到下一条带PlatformPrizeProto的S2C_PUSH_DATA之前，不要再显示ICON
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_PLATFORM_PRIZE : String = "36_3";

    }
}