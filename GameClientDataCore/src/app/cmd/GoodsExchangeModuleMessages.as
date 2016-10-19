package app.cmd {

    public class GoodsExchangeModuleMessages {

        /**
         * 在登录时, 服务器会主动推送当前的 免费兑豪礼
         *
         * 如果没有收到这条消息, 则表示当前没有这个活动, 在福利大厅里不要显示
         *
         * 在热更新时, 服务器会再广播这条消息. 客户端需要把奖励更新成新的消息里附带的
         *
         * 客户端根据GoodsExchangeRuleConfigProto 里面的type字段，知道是什么类型的兑换活动，展示不同的面板
         *
         * 活动时间结束时, 服务器会广播消息. 客户端不用自己消失
         *
         * 附带
         *
         * GoodsExchangeRuleConfigProto 里面附带了活动开始结束时间, 以及每一条兑换的规则
         */
        public static const S2C_PUSHU_GOODS_EXCHANGE_CONF : String = "65_1";

        /**
         *
         * 活动时间结束时, 服务器会广播这条消息. 客户端根据附带的消息类型，消失对应的活动面板
         *
         * 附带
         * varint32 活动类型 ：0-免费兑豪礼 1-轮询兑礼包活动  2-类似五一活动这种一次性活动 3-每日活动
         *
         */
        public static const S2C_PUSHU_GOODS_EXCHANGE_OFF : String = "65_2";

        /**
         * 打开面板时请求
         * 如果是类似五一活动这种需要展示可兑换数量角标，则在收到 S2C_PUSHU_GOODS_EXCHANGE_CONF 后主动请求请求一次
         *
         * 获取自己已兑换次数
         *
         * 只有在当前有活动时才能请求, 只能请求一次, 得到后缓存.
         * 收到S2C_PUSHU_GOODS_EXCHANGE_CONF更新了活动, 且有活动 (不能是把活动关闭), 才能再请求
         *
         * 附带信息
         * varint32 活动类型
         */
        public static const C2S_GET_GOODS_EXCHANGE_INFO : String = "65_1";

        /**
         * 获取失败：
         * 附带varint32 错误码
         * 1.活动类型错误,只能是0、1、2、3
         * 2.当前 无兑换活动
         *
         */
        public static const S2C_GET_GOODS_EXCHANGE_INFO_ERROR : String = "65_3";

        public static const S2C_GET_GOODS_EXCHANGE_INFO_SUCCESS : String = "65_4";

        /**
         * 尝试物品兑换
         *
         * 必须等待服务器返回
         *
         * 客户端需要检查
         * 1. 在活动期间
         * 2. 没超过次数限制
         * 3. 背包中有足够的兑换物品，注意不能使用有过期时间的物品
         * 4. 有足够的背包空间 (给多少个物品, 就需要有多少个空格)
         *
         * 必须等待服务器返回
         *
         * 附带
         * varint32 活动类型
         * varint32 要兑换的物品在proto中的index (从0开始)
         * while(availiable)
         *      GoodsExchangeRuleProto.cost_goods，具体参考[物品消耗文档]({% post_url 2014-11-28-物品消耗 %})
         *
         */
        public static const C2S_TRY_GOODS_EXCHANGE : String = "65_2";

        /**
         * 兑换失败, 附带varint32 错误码
         *
         * 1. 不在活动期间
         * 2. index非法
         * 3. 超过次数限制
         * 4. 下发的背包物品错误(位置非法、物品时有过期时间、背包锁定、配置了不允许使用绑定但是下方的物品时绑定等各类错误)
         * 5. 背包中没有足够的兑换物品
         * 6. 背包满了
         * 7. 活动类型非法
         * 8. Vip等级不足
         */
        public static const S2C_TRY_EXCHANGE_FAIL : String = "65_5";

        /**
         * 兑换成功, 飞物品, 会另外有加物品、扣物品消息
         *
         * 对应活动的对应的兑换规则  的  已经领取的次数 加1
         *
         * varint32 活动类型
         * varint32 领取奖励的下标index
         */
        public static const S2C_TRY_GOODS_EXCHANGE_SUCCESS : String = "65_6";

    }
}