package app.cmd {

    public class MazeModuleMessages {

        /**
         * 迷宫即将开启
         *
         * varint64 开启时间
         * varint64 结束时间
         *
         * varint32 召唤id 客户端在召唤结束之前,可以发送该召唤id到服务器进行传送,玩家必须开放功能FUNC_MAZE
         * varint64 召唤结束时间
         */
        public static const S2C_MAZE_WILL_START : String = "35_0";

        /**
         * 进入副本成功
         */
        public static const S2C_TRY_ENTER_DUNGEON : String = "35_1";

        /**
         * 请求进入副本失败,返回varint32错误码
         *
         * 1.但是英雄不在普通场景中
         * 2.你已经死了
         * 3.功能没开启(你等级过低,还没有开启该功能)
         * 4.当前没在活动时间
         *
         * 100.服务器bug
         *
         * 其他条件以后再加
         */
        public static const S2C_TRY_ENTER_DUNGEON_FAIL : String = "35_2";

        /**
         * 迷宫信息
         *
         * varint64 开启时间
         * varint64 结束时间
         */
        public static const S2C_DUNGEON_TIME_INFO : String = "35_3";

        /**
         * 请求上次排行数据
         */
        public static const C2S_GET_LAST_RANK : String = "35_10";

        /**
         * 返回上次排行数据
         *
         * 已压缩
         *
         * bytes MazeAllRankProto
         */
        public static const S2C_GET_LAST_RANK : String = "35_11";

        /**
         * 副本信息
         *
         * bytes MazeHeroInfoProto
         */
        public static const S2C_DUNGEON_INFO : String = "35_15";

        /**
         * 排行广播
         *
         * 已经压缩
         *
         * bytes MazeAllRankProto
         */
        public static const S2C_RANK_BROADCAST : String = "35_20";

        /**
         * 请求传送
         *
         * varint32 传送门的下标,就是我发给你的配置中的第几个传送门
         */
        public static const C2S_TRY_TRANSPORT : String = "35_30";

        /**
         * 请求传送成功,等待切换场景
         */
        public static const S2C_TRY_TRANSPORT : String = "35_31";

        /**
         * 传送失败,返回varint32错误码
         *
         * 1.当前已经死亡
         * 2.击晕状态中
         * 3.当前不在活动期间
         * 4.没在迷宫副本中
         * 5.未知的迷宫传送门
         * 6.距离传送门过远
         * 7.请先领取奖励
         *
         * 100.服务器bug
         */
        public static const S2C_TRY_TRANSPORT_FAIL : String = "35_32";

        /**
         * 领取迷宫奖励
         *
         * varint32 领取的npc的配置id
         */
        public static const S2C_COLLECT_FLOOR_PRIZE : String = "35_40";

        /**
         * 领取层级奖励失败,返回varint32错误码
         *
         * 1.没在迷宫副本中
         * 2.当前不在活动期间
         * 3.已经领取奖励了
         * 4.背包已满
         *
         * 100. 服务器bug
         */
        public static const S2C_COLLECT_FLOOR_PRIZE_FAIL : String = "35_41";

        /**
         * 领取迷宫奖励并且进入下一层,同时算是完成了
         *
         * varint32 领取的npc的配置id
         */
        public static const S2C_COLLECT_FLOOR_PRIZE_AND_ENTER_NEXT : String = "35_50";

        /**
         * 领取层级奖励并进入下一层失败,返回varint32错误码
         *
         * 1.没在迷宫副本中
         * 2.当前不在活动期间
         * 3.已经领取奖励了
         * 4.背包已满
         *
         * 100. 服务器bug
         */
        public static const S2C_COLLECT_FLOOR_PRIZE_AND_ENTER_NEXT_FAIL : String = "35_51";

        /**
         * 迷宫副本结束了
         *
         * bytes MazeRankProto
         */
        public static const S2C_MAZE_END : String = "35_60";

        /**
         * 通关排名
         *
         * varint32 国家
         * varint32 排名
         * bytes 玩家名字
         */
        public static const S2C_MAZE_FINISH_RANK : String = "35_70";

        /**
         * boss被击杀了
         *
         * varint32 玩家所属国家
         * bytes 玩家名字
         */
        public static const S2C_MAZE_BOSS_BEEN_KILLED : String = "35_71";

        /**
         * 某国某人在某一层拿了个某国第一名
         *
         * varint32 玩家所属国家
         * varint32 层数
         * varint32 排名
         * bytes 玩家名字
         */
        public static const S2C_MAZE_FLOOR_COUNTRY_TOP_BROADCAT : String = "35_72";

        /**
         * 某国某人在某一层拿了个第一名
         *
         * varint32 玩家所属国家
         * varint32 层数
         * varint32 排名
         * bytes 玩家名字
         */
        public static const S2C_MAZE_FLOOR_TOP_BROADCAT : String = "35_73";

        /**
         * 有玩家层数变化了
         *
         * varint32 玩家所在国家
         * bool 上升还是下降
         * varint32 变化层数,正值,如果下降,客户端自己改变为负值
         * bytes 玩家名字
         */
        public static const S2C_MAZE_SB_FLOOR_CHANGE_BROADCAT : String = "35_74";

    }
}