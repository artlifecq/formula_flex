package app.cmd {

    public class GMModuleMessages {

        /**
         * 发送gm指令
         *
         * 附带个utf, 前后去掉空格. 全部是小写
         */
        public static const C2S_GM_QUERY : String = "9_1";

        /**
         * 显示在gm面板上的话
         *
         * 附带个utf. 需支持html格式符
         */
        public static const S2C_GM_REPLY : String = "9_1";

    }
}