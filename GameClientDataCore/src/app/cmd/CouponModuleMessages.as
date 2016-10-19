package app.cmd {

    public class CouponModuleMessages {

        /**
         * 激活码兑换
         * UTF 激活码
         */
        public static const C2S_EXCHANGE_COUPON : String = "27_1";

        /**
         * 激活码兑换成功
         * bytes 图标资源名
         */
        public static const S2C_EXCHANGE_COUPON : String = "27_2";

        /**
         * 激活码兑换失败，附带byte错误码
         * 1、激活码无效
         * 2、激活码已被使用过
         * 3、已领取了此类型礼包，无法再次领取
         * 4、您的包裹已满，请先清理包裹
         * 5、英雄当前正在兑换中，稍后再试
         * 6、可重复兑换的激活码兑换次数已达上限
         * 7、激活码已过期
         * 8、激活码验证服务器连接失败，请稍后再试
         * 9、操作太频繁!
         */
        public static const S2C_EXCHANGE_COUPON_FAIL : String = "27_3";

    }
}