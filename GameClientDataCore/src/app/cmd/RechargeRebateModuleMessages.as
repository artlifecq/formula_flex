package app.cmd {

    public class RechargeRebateModuleMessages {

        /**
         * 在登录时, 服务器会主动推送当前的充值送好礼活动
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
         * RechargeRebateProto 里面附带了活动开始结束时间, 以及每一条可领取的奖励的需求和内容
         */
        public static const S2C_PUSH_DATA : String = "33_1";

        /**
         * 客户端在打开充值送好礼标签时, 请求自己的奖励领取状态, 以及自己的已充值金额
         * (如果策划要做不打开面板, 已要展示可领取的奖励数量, 则登录时, 收到当前有充值送好礼活动时, 就请求一次)
         *
         * 请求一次后, 就缓存着信息.
         *
         * 当服务器重新广播更新了当前活动时, 或收到了充值总额变化消息时(8号模块S2C_CHANGE_TOTAL_RECHARGE_JINZI消息), 清掉缓存. 如果服务器重新广播时, 面板开着, 则重新请求
         *
         * 请求过后, 必须等待服务器返回. 就算收到了更新活动消息, 之前请求的没返回前不能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_COLLECT_STATE : String = "33_1";

        /**
         * 请求领取状态失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动 搞毛
         * 2. 之前请求的还没返回
         * 3. 服务器内部错误, 提示玩家, 不要自动请求
         */
        public static const S2C_ERROR_GET_COLLECT_STATE : String = "33_2";

        /**
         * 返回领取状态
         *
         * 附带
         *
         * varint32 已充值的金子数
         *
         * while(byteArray.available){
         *  varint32 此档, 已领取的次数. 没领过就是0
         * } // 奖励有多少条, 这里就循环多少次.
         *
         */
        public static const S2C_REPLY_COLLECT_STATE : String = "33_3";

        /**
         * 领取奖励.
         * 必须达到领取条件才能领取, 且背包有足够格子能放得下奖励 (奖励有几个, 就要几个空格)
         * 必须等待服务器返回
         *
         * 附带
         *
         * varint32 领取的奖励的index (根据RechargeRebateProto中的奖励的位置, 从0开始)
         */
        public static const C2S_COLLECT_PRIZE : String = "33_2";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动
         * 2. 领取的奖励index无效
         * 3. 没有剩余可领取次数了
         * 4. 背包不够
         * 5. 充值额不够
         * 6. 内部错误
         */
        public static const S2C_ERROR_COLLECT_PRIZE : String = "33_4";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标, 并且把这次领取的奖励领取次数+1 (不要发消息来重新请求领取状态)
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_PRIZE_SUCCESS : String = "33_5";

        /**
         * 在登录时, 服务器会主动推送当前的单笔充值送好礼活动
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
         * RechargeRebateProto 里面附带了活动开始结束时间, 以及每一条可领取的奖励的需求和内容
         */
        public static const S2C_PUSH_SINGLE_DATA : String = "33_101";

        /**
         * 客户端在打开充值送好礼标签时, 请求自己的奖励领取状态, 以及自己的单笔已充值金额
         * (如果策划要做不打开面板, 已要展示可领取的奖励数量, 则登录时, 收到当前有充值送好礼活动时, 就请求一次)
         *
         * 请求一次后, 就缓存着信息.
         *
         * 当服务器重新广播更新了当前活动时, 或收到了充值总额变化消息时(8号模块S2C_CHANGE_TOTAL_RECHARGE_JINZI消息), 清掉缓存. 如果服务器重新广播时, 面板开着, 则重新请求
         *
         * 请求过后, 必须等待服务器返回. 就算收到了更新活动消息, 之前请求的没返回前不能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_COLLECT_SINGLE_STATE : String = "33_101";

        /**
         * 请求领取状态失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动 搞毛
         * 2. 之前请求的还没返回
         * 3. 服务器内部错误, 提示玩家, 不要自动请求
         */
        public static const S2C_ERROR_GET_COLLECT_SINGLE_STATE : String = "33_102";

        /**
         * 返回领取状态
         *
         * 附带
         *
         * varint32 单笔最大充值金子数
         *
         * while(byteArray.available){
         *  varint32 此档, 已领取的次数. 没领过就是0
         * } // 奖励有多少条, 这里就循环多少次.
         *
         */
        public static const S2C_REPLY_COLLECT_SINGLE_STATE : String = "33_103";

        /**
         * 领取奖励.
         * 必须达到领取条件才能领取, 且背包有足够格子能放得下奖励 (奖励有几个, 就要几个空格)
         * 必须等待服务器返回
         *
         * 附带
         *
         * varint32 领取的奖励的index (根据RechargeRebateProto中的奖励的位置, 从0开始)
         */
        public static const C2S_COLLECT_SINGLE_PRIZE : String = "33_102";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动
         * 2. 领取的奖励index无效
         * 3. 没有剩余可领取次数了
         * 4. 背包不够
         * 5. 充值额不够
         * 6. 内部错误
         */
        public static const S2C_ERROR_COLLECT_SINGLE_PRIZE : String = "33_104";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标, 并且把这次领取的奖励领取次数+1 (不要发消息来重新请求领取状态)
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_SINGLE_PRIZE_SUCCESS : String = "33_105";

        /**
         * 在登录时, 服务器会主动推送当前的累计充值送好礼活动
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
         * RechargeRebateProto 里面附带了活动开始结束时间, 以及每一条可领取的奖励的需求和内容
         */
        public static const S2C_PUSH_TOTAL_DATA : String = "33_201";

        /**
         * 客户端在打开充值送好礼标签时, 请求自己的奖励领取状态, 以及自己的已充值金额
         * (如果策划要做不打开面板, 已要展示可领取的奖励数量, 则登录时, 收到当前有充值送好礼活动时, 就请求一次)
         *
         * 请求一次后, 就缓存着信息.
         *
         * 当服务器重新广播更新了当前活动时, 或收到了充值总额变化消息时(8号模块S2C_CHANGE_TOTAL_RECHARGE_JINZI消息), 清掉缓存. 如果服务器重新广播时, 面板开着, 则重新请求
         *
         * 请求过后, 必须等待服务器返回. 就算收到了更新活动消息, 之前请求的没返回前不能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_COLLECT_TOTAL_STATE : String = "33_201";

        /**
         * 请求领取状态失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动 搞毛
         * 2. 之前请求的还没返回
         * 3. 服务器内部错误, 提示玩家, 不要自动请求
         */
        public static const S2C_ERROR_GET_COLLECT_TOTAL_STATE : String = "33_202";

        /**
         * 领取奖励.
         * 必须达到领取条件才能领取, 且背包有足够格子能放得下奖励 (奖励有几个, 就要几个空格)
         * 必须等待服务器返回
         *
         * 附带
         *
         * varint32 领取的奖励的index (根据RechargeRebateProto中的奖励的位置, 从0开始)
         */
        public static const C2S_COLLECT_TOTAL_PRIZE : String = "33_202";

        /**
         * 返回领取状态
         *
         * 附带
         *
         * varint32 已充值的金子数
         *
         * while(byteArray.available){
         *  varint32 此档, 已领取的次数. 没领过就是0
         * } // 奖励有多少条, 这里就循环多少次.
         *
         */
        public static const S2C_REPLY_COLLECT_TOTAL_STATE : String = "33_203";

        /**
         * 领取失败, 附带varint32 错误码
         *
         * 1. 当前没有充值送好礼活动
         * 2. 领取的奖励index无效
         * 3. 没有剩余可领取次数了
         * 4. 背包不够
         * 5. 充值额不够
         * 6. 内部错误
         */
        public static const S2C_ERROR_COLLECT_TOTAL_PRIZE : String = "33_204";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标, 并且把这次领取的奖励领取次数+1 (不要发消息来重新请求领取状态)
         *
         * 没有附带信息
         */
        public static const S2C_COLLECT_TOTAL_PRIZE_SUCCESS : String = "33_205";

    }
}