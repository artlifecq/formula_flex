package app.cmd {

    public class UpgradePromotionModuleMessages {

        /**
         * 在登录时, 服务器会主动推送当前的xx进阶日活动
         *
         * 如果没有收到这条消息, 则表示当前没有这个活动, 在福利大厅里不要显示
         *
         * 在热更新时, 服务器会再广播这条消息. 客户端需要把奖励更新成新的消息里附带的
         *
         * 如果后面没有附带的内容, 则表示 之前有这个活动, 现在没有了(热更新导致活动关闭, 或者活动时间结束了且没有新的活动了)
         *
         * 活动时间结束时, 服务器会广播消息. 客户端不用自己消失
         *
         * 附带
         *
         * UpgradePromotionProto 里面附带了活动开始结束时间, 以及每一条可领取的奖励的需求和内o容
         */
        public static const S2C_SET_UPGRADE_PROMOTION : String = "34_1";

        /**
         * 如果当前有xx进阶日活动, 自动请求, 有可领取的奖励时, 可以在福利大厅上展示个数字icon
         *
         * 获取自己已领取的奖励, 以及如果有全服总领取数限制的话, 全服已领取的数量
         *
         * 只有在当前有活动时才能请求, 只能请求一次, 得到后缓存.
         * 收到S2C_SET_UPGRADE_PROMOTION更新了活动, 且有活动 (不能是把活动关闭), 才能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_COLLECTED_PRIZE : String = "34_1";

        /**
         * 获取失败, 附带varint32 错误码
         *
         * 1. 当前没有xx进阶日活动, 搞毛
         */
        public static const S2C_GET_COLLECTED_ERROR : String = "34_2";

        /**
         * 返回自己在本次活动中已领取的奖励, 自己展示 已领取/可领取/不能领取
         *
         * 附带
         *
         * while (byteArray.available){
         *      varint32 已领取过的奖励的index
         * }
         */
        public static const S2C_REPLY_COLLECTED_PRIZE : String = "34_3";

        /**
         * 推送有总领取限制的奖励的已被领取个数. 当活动更新时, 即客户端收到S2C_SET_UPGRADE_PROMOTION时,
         * 所有的都设为0
         *
         * 如果有多条奖励都有领取限制, 则会发送多条这个消息
         *
         * 附带
         *
         * varint32 奖励的index
         * varint32 已被领取的个数
         */
        public static const S2C_UPDATE_GLOBAL_LIMIT : String = "34_4";

        /**
         * 尝试领取奖励
         *
         * 必须等待服务器返回
         *
         * 客户端需要检查
         * 1. 活动期间
         * 2. 符合目标奖励的要求
         * 3. 没领过
         * 4. 如果是全服限制数量的, 必须还有剩余
         * 5. 有足够的背包空间 (给多少个物品, 就需要有多少个空格)
         *
         * 必须等待服务器返回
         *
         * 附带
         *
         * varint32 要领的礼包在proto中的index (从0开始)
         */
        public static const C2S_COLLECT_PRIZE : String = "34_2";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 不在活动期间
         * 2. index非法
         * 3. 不符合目标奖励的要求
         * 4. 已经领过了目标奖励
         * 5. 全服限制了数量, 没法领
         * 6. 背包满了
         */
        public static const S2C_COLLECT_PRIZE_FAIL : String = "34_5";

        /**
         * 领取成功, 飞物品, 会另外有加物品消息
         *
         * 自己把领的礼包设为已领取
         * 如果是全服限购的, 会另外广播S2C_UPDATE_GLOBAL_LIMIT消息
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_PRIZE_SUCCESS : String = "34_6";

    }
}