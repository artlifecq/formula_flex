package app.cmd {

    public class GMDoingModuleMessages {

        /**
         * GM账号设置/解除
         * bool true表示英雄被设置为GM，false表示英雄被取消GM
         */
        public static const S2C_SET_GM : String = "97_0";

        /**
         * GM操作，禁言/解除禁言/封号
         * varint64 英雄id
         * varint32 操作类型，1-禁言 2-解禁 3-封号
         */
        public static const C2S_GM_DOING : String = "97_1";

        /**
         * GM操作，禁言/解除禁言/封号成功
         * varint32 操作类型，1-禁言 2-解禁 3-封号
         * varint64 英雄id
         * bytes 英雄名字
         */
        public static const S2C_GM_DOING : String = "97_2";

        /**
         * GM操作失败，附带byte错误码
         * 1、你操作的对象是你自己，或者是别的GM
         * 2、目标当前不在线
         * 3、无效的操作类型
         */
        public static const S2C_GM_DOING_FAIL : String = "97_3";

    }
}