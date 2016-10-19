package app.cmd {

    public class VipModuleMessages {

        /**
         * vip 经验有改变时, 服务器主动推送. 客户端需要更新经验和vip等级(如果有变化的话)
         *
         * 附带
         *
         * varint32 最新的vip经验
         */
        public static const S2C_CHANGE_VIP_EXP : String = "20_1";

        /**
         * 视野里有人从不是vip变为vip了, 名字前要加vip标志. 不会发给自己
         *
         * 附带
         *
         * varint64 此人id
         * varint32 vip等级
         * utf      此人名字
         */
        public static const S2C_SCENE_BECOME_VIP_BROADCAST : String = "20_2";

        /**
         * 领取Vip一次性奖励
         * varint32 Vip等级
         */
        public static const C2S_COLLECT_VIP_PRIZE : String = "20_3";

        /**
         * 领取Vip一次性奖励成功，附带领取的Vip等级
         * varint32 Vip等级
         */
        public static const S2C_COLLECT_VIP_PRIZE : String = "20_4";

        /**
         * 领取Vip一次性奖励失败，附带byte错误码
         * 1、英雄不是Vip
         * 2、客户端发送的Vip等级无效
         * 3、英雄的Vip等级不足
         * 4、背包已满
         * 5、英雄已经领取过这个等级的奖励了
         * 6.此等级的VIP没有奖励
         */
        public static const S2C_COLLECT_VIP_PRIZE_FAIL : String = "20_5";

        /**
         * 领取Vip周礼包
         */
        public static const C2S_COLLECT_VIP_WEEKLY_PRIZE : String = "20_6";

        /**
         * 领取Vip周礼包成功
         * varint64 下次领取的时间
         *
         * 根据返回的时间显示倒计时
         */
        public static const S2C_COLLECT_VIP_WEEKLY_PRIZE : String = "20_7";

        /**
         * 领取Vip礼包失败，附带byte错误码
         * 1、英雄不是VIP
         * 2、下次领取时间未到（本周已经领取过了）
         * 3、背包已满
         */
        public static const S2C_COLLECT_VIP_WEEKLY_PRIZE_FAIL : String = "20_8";

        /**
         * 某玩家VIP升级,客户端接收到此消息在世界频道显示"恭喜XX玩家开通VIP x，低调卓越，小有所成！我也要成为VIP",在公告栏显示“"恭喜XX玩家开通VIP x，低调卓越，小有所成！”
         * varint32 vipLevel
         * bytes  玩家名字
         */
        public static const S2C_PLAYER_VIP_LEVEL_UP : String = "20_9";

    }
}