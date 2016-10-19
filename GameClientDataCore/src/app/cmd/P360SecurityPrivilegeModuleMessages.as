package app.cmd {

    public class P360SecurityPrivilegeModuleMessages {

        /**
         *
         * 服务器任何时候都可能推送这条消息，客户端收到这条消息后，展示360特权卫士的ICON，玩家点击ICON后，根据附带信息进行领奖面板的展示，
         *
         * 附带
         * var64  每个等级是否领取成功的标志位,最高位为1表示64级对应的特权奖励领取完毕，最低为1表示1级对应的特权奖励领取完毕,
         *        依次类推
         * var64  本次特权活动过期时间,Unix 时间戳,面板展示用
         *
         * UTF  "特权领取说明"的链接,是utf8编码格式完整的URL
         *          如果等级不足领取失败或者特权活动还没开始而领取失败，客户端直接跳转这个URL即可，不需要再拼接其他字段
         * P360SecurityPrivilegePrizeConfigProto 360卫士特权奖励配置信息
         */
        public static const S2C_PUSH_P360_SECURITY_PRIVILEGE_ON : String = "40_1";

        /**
         *
         * 服务器任何时候都可能推送这条消息，客户端收到这条消息后，立即将 360卫士特权的ICON消失
         * 附带
         * 无
         */
        public static const S2C_PUSH_P360_SECURITY_PRIVILEGE_OFF : String = "40_2";

        /**
         * 领取 单个奖励.
         * 客户端先判断背包是否有足够格子能放得下奖励 (奖励有几个, 就要几个空格)，或者是否已经领取过奖励，如果放不下或者已经领取过就不要下发了
         * 必须等待服务器返回
         *
         * 附带数据
         * varint32 某个特权奖励里面配置的领取条件,只有大于等于这个等级才可以领奖励
         *
         */
        public static const C2S_COLLECT_P360_SECURITY_PRIVILEGE_PRIZE : String = "40_3";

        /**
         * 领取失败, 附带varint32 错误码
         * 1. 找不到这个奖励配置，客户端下发的  “可以领取这条奖励的最低等级” 错误
         * 2. 该等级的奖励已经领过1次了
         * 3. 背包不够
         * 4. 特权活动已经上线，但当前用户尚未登陆安全卫士，未成功领取本游戏的特权
         * 5. 特权活动已经上线，用户已经在卫士尝试领取了特权， 但是当前等级低于所领取道具的卫士等级要求
         * 6. 本期特权活动还未上线
         * 7. 本期特权特权活动已经结束
         * 8. 内部错误
         */
        public static const S2C_ERROR_COLLECT_PRIZE : String = "40_4";

        /**
         * 领取成功. 会另外发送添加物品消息, 飞奖励图标
         *
         * 没有附带信息
         */
        public static const S2C_P360_SECURITY_PRIVILEGE_PRIZE : String = "40_5";

    }
}