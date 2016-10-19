package app.cmd {

    public class ShowGirlModuleMessages {

        /**
         * 英雄登陆，或者热更新后，服务器会主动推送此消息，收到消息后，展示超级会员图标
         * 如果收到的消息中，没有附带任何数据，则将当前的超级会员图标移除
         *
         * varint32 recharge，充值额度，单位元
         * UTF image，美女图片
         * bool false表示QQ号或者YY号，true表示跳转链接
         * UTF QQ号，YY号或者跳转链接
         */
        public static const S2C_SHOW_GIRL_INFO : String = "96_1";

        /**
         * 获取玩家是否充够钱，看MM
         */
        public static const C2S_TRY_PLAY_SHOW_GIRL : String = "96_2";

        /**
         * 获取玩家是否充够钱，看MM
         * boolean result, true表示给他看，false表示没充够钱
         *
         * 每当玩家的总充值数变化时，重新请求一次
         */
        public static const S2C_TRY_PLAY_SHOW_GIRL : String = "96_3";

    }
}