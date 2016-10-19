package app.cmd {

    public class PhoneCheckModuleMessages {

        /**
         * 登入的时候可能会推送这条消息，如果客户端收到这条消息就展示ICON,否则就不要展示了
         *
         * 附带
         * PhoneCheckPrizeProto 里面附带了ICON、奖励物品列表
         *
         */
        public static const S2C_PUSH_PHONE_CHECK_PRIZE_INFO : String = "37_1";

        /**
         * 玩家完成手机验证后，会推送这条消息，如果客户端收到这条消息就让ICON消失
         *
         * 无附带消息
         *
         */
        public static const S2C_FINISH_PHONE_CHECK : String = "37_2";

        /**
         * 玩家点击ICON后，客户端下方这条消息，尝试获取进行手机验证的的URL
         *
         * 必须等待服务器返回
         *
         * 无附带消息
         *
         */
        public static const C2S_GET_PHONE_CHECK_URL : String = "37_1";

        /**
         * 获取URL失败, 附带varint32 错误码
         * 客户端收到消息后让ICON消失
         *
         * 1. 已经完成过手机验证了
         * 2. 不存在这个运营商的手机验证奖励
         * 3. 内部错误
         */
        public static const S2C_ERROR_GET_PHONE_CHECK_URL : String = "37_3";

        /**
         * 获取手机检验的URL成功.客户端收到这条消息后跳转到该URL代表的页面 ，让玩家进行手机验证
         *
         * 附带
         * UTFBytes  utf8编码格式的url，是完整的URL，客户端直接跳转这个URL即可，不需要再拼接其他字段
         */
        public static const S2C_GET_PHONE_CHECK_URL_SUCCESS : String = "37_4";

    }
}