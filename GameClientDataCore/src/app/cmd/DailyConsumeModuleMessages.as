package app.cmd {

    public class DailyConsumeModuleMessages {

        /**
         * 在登录时, 服务器会主动推送当前的活动
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
         * DailyConsumeProto 里面附带了活动开始结束时间, 以及每一条可领取的奖励的需求和内容
         */
        public static const S2C_PUSH_DATA : String = "102_1";

        /**
         * 客户端在打开活动标签时, 请求自己的奖励领取状态, 以及自己的已进入消费金额
         * (如果策划要做不打开面板, 就要展示可领取的奖励数量, 则登录时, 收到当前有活动时, 就请求一次)
         *
         * 请求一次后, 就缓存着信息.
         *
         * 当服务器重新广播更新了当前活动时, 清掉缓存. 如果服务器重新广播时, 面板开着, 则重新请求
         *
         * 请求过后, 必须等待服务器返回. 就算收到了更新活动消息, 之前请求的没返回前不能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_COLLECT_STATE : String = "102_1";

        /**
         * 请求领取状态失败, 附带varint32 错误码
         *
         * 1. 当前没有每日消费活动，客户端bug
         * 2. 之前请求的还没返回
         * 3. 服务器内部错误, 提示玩家, 不要自动请求
         */
        public static const S2C_ERROR_GET_COLLECT_STATE : String = "102_2";

        /**
         * 返回领取状态
         *
         * 附带
         *
         * if(buffer.readable()){
         *      bytes 解析成PerHeroDailyConsumeInfoProto
         * }
         *
         */
        public static const S2C_REPLY_COLLECT_STATE : String = "102_3";

        /**
         * 领取奖励.
         * 必须达到领取条件才能领取, 且背包有足够格子能放得下奖励 (奖励有几个, 就要几个空格)
         * 必须等待服务器返回
         *
         * 附带
         *
         * varint32 领取的奖励的index (根据DailyConsumeProto中的奖励的位置, 从0开始)
         */
        public static const C2S_COLLECT_PRIZE : String = "102_2";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 当前没有每日消费活动
         * 2. 领取的奖励index无效
         * 3. 没有剩余可领取次数了
         * 4. 背包不够
         * 5. 消费额不够
         * 6. 内部错误
         * 7. Vip等级不足
         */
        public static const S2C_ERROR_COLLECT_PRIZE : String = "102_4";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标, 并且把这次领取的奖励领取次数+1 (不要发消息来重新请求领取状态)
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_PRIZE_SUCCESS : String = "102_5";

    }
}