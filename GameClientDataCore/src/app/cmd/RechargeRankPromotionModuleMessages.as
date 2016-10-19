package app.cmd {

    public class RechargeRankPromotionModuleMessages {

        /**
         * 登录时, 如果当前有充值排行榜类活动，推送此消息
         *
         * 如果有热更新, 服务器还会重新广播这条消息, 把面板更新成最新的
         *
         * 附带
         *
         * 先把消息解压, 里面是个
         *
         * RankPromotionProto
         *
         * 如果是个空的, 则表示当前没有任何排行榜类活动
         */
        public static const S2C_PUSH_DATA : String = "103_1";

        /**
         * 尝试领取当前排行榜的普及奖
         *
         * 必须全服总充值达到, 且未领取过, 且背包空格子数 >= 奖励的物品数
         *
         * 没有附带信息
         */
        public static const C2S_COLLECT_NORMAL_PRIZE : String = "103_2";

        /**
         * 领取成功, 飞奖励. 把这个榜的奖励设置为已领取过 (以榜的结束时间为key)
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_NORMAL_PRIZE_SUCCESS : String = "103_3";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 当前没有活动
         * 2. 你等级不够
         * 3. 已领取过
         * 4. 背包满
         */
        public static const S2C_COLLECT_NORMAL_PRIZE_FAIL : String = "103_4";

        /**
         * 推送当前活动的累计充值
         * varint64 金子数
         *
         * 当有变更时，主动推送
         */
        public static const S2C_PUSH_TOTAL_RECHARGE : String = "103_5";

        /**
         * 推送当前充值活动的第一名
         * if (byteArray.available)
         *     varint64 英雄id
         *     bool 男女 true: 男， false: 女
         *     varint32 职业
         *     bytes 英雄名称
         *
         * 当有变更时，主动推送
         */
        public static const S2C_PUSH_RECHARGE_TOP_ONE : String = "103_6";

    }
}