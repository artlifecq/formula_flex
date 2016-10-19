package app.cmd {

    public class ViewOtherHeroModuleMessages {

        /**
         * 要求查看其他玩家信息, 注意如果用户要查看的用户id是自己的id, 不要来请求, 直接打开自己的角色面板.
         * 一定要等待服务器返回, 才能发下一个观察请求. 且第二次请求必须是在服务器返回S2C_VIEW_OTHER_HERO_ONLINE或S2C_VIEW_OTHER_HERO_OFFLINE之后1秒后. 期间忽略掉玩家所有的观察请求
         *
         * 附带
         *
         * varint64 要查看的英雄id
         * bool 是否要告诉目标当前有人在查看你
         */
        public static const C2S_VIEW_OTHER_HERO : String = "10_1";

        /**
         * 要查看的用户当前在线, 后面附带压缩过的OtherHeroProto
         */
        public static const S2C_VIEW_OTHER_HERO_ONLINE : String = "10_1";

        /**
         * 要查看的用户当前不在线, 后面附带压缩过的OtherHeroProto. 灰掉组队之类不适合用在离线玩家身上的按钮
         */
        public static const S2C_VIEW_OTHER_HERO_OFFLINE : String = "10_2";

        /**
         * 请求失败, 附带varint32的失败原因
         *
         * 1. id 不存在
         * 2. 内部错误, 稍后再试
         * 3. 对方服务器维护中
         */
        public static const S2C_VIEW_OTHER_HERO_FAIL : String = "10_3";

        /**
         * 附近有人正在上下打量你
         *
         * varint32 服务器id
         * varint32 平台id
         * bytes 观察你的人的名字
         */
        public static const S2C_BEEN_VIEWED : String = "10_4";

    }
}