package app.cmd {

    public class YuMaQiShouModuleMessages {

        /**
         * 御马场弼马温活动开启时，全服广播
         */
        public static const S2C_BI_MA_WEN_ACTIVITY_BEGIN : String = "112_1";

        /**
         * 用于寻路到弼马温位置时请求
         */
        public static const C2S_GET_BI_MA_WEN_POS : String = "112_1";

        /**
         * 寻找弼马温位置成功
         * varint32 x坐标
         * varint32 y坐标
         */
        public static const S2C_GET_BI_MA_WEN_POS : String = "112_2";

        /**
         * 寻找弼马温位置失败，附带byte错误码
         * 1.玩家当前不在御马场
         * 2.弼马温活动已经结束了
         */
        public static const S2C_GET_BI_MA_WEN_POS_FAIL : String = "112_3";

        /**
         * 御马场弼马温活动结束，关闭ui
         */
        public static const S2C_BI_MA_WEN_ACTIVITY_END : String = "112_4";

        /**
         * 弼马温活动进行中
         */
        public static const S2C_BI_MA_WEN_ACTIVITY_IS_UNDERWAY : String = "112_5";

    }
}