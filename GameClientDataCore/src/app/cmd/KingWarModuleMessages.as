package app.cmd {

    public class KingWarModuleMessages {

        /**
         * proto:
         *
         *      king_war_config.proto
         *      king_war_client.proto
         *
         * ----------------------------------------
         *
         * 家族战状态，已压缩，上线时，会推送一次，去锁
         *
         * varint64 本次王城战开始时间
         * 根据这个，客户端计算本次王城战开始报名时间，本次王城战结束时间
         * varint64 本次竞标结束时间
         *
         * varint64 本次竞标底价
         *
         * bool 竞标结束了
         *
         * if(竞标结束了){
         *      上次竞标前几名
         *      while(buffer.readable()){
         *          UTF8 帮派名
         *      }
         *
         *      读取帮派名以后，加入列表
         *
         *      列表长度为1，进攻帮派是该帮派，防守帮派是国王所在帮派
         *      列表长度为2，进攻帮派是第二个，防守帮派是第一个
         *      其他，进攻帮派无，防守帮派是国王所在帮派
         * }
         *
         */
        public static const S2C_KING_WAR_STATUS : String = "107_1";

        /**
         * 竞标
         *
         * varint64 加价
         */
        public static const C2S_KING_WAR_BID : String = "107_2";

        /**
         * 竞标成功
         *
         * varint64 新的总共出价
         * varint32 新的排名
         *
         * if(buffer.readable()){
         *      varint64 新的本次竞标结束时间
         * }
         */
        public static const S2C_KING_WAR_BID : String = "107_3";

        /**
         * 竞标失败，返回varint32错误码
         *
         * 1. 没有加入家族
         * 2. 没有权限
         * 3. 当前无法竞标
         * 4. 竞标的建设令牌一次太少了
         * 5. 帮派建设令牌不够
         * 6. 帮主等级不够
         * 7. 王帮无法竞标
         * 8. 没有帮派
         */
        public static const S2C_KING_WAR_BID_FAIL : String = "107_4";

        /**
         * 竞标成功导致竞标结束时间变更的广播，如果需要提示，就提示，不需要，修改S2C_KING_WAR_STATUS返回的数据
         *
         * varint64 新的本次竞标结束时间
         */
        public static const S2C_KING_WAR_BID_END_TIME_CHANGED_BROADCAST : String = "107_5";

        /**
         * 竞标结束广播
         *
         * varint64 下次竞标的起始价格
         *
         * 竞标前几名
         * while(buffer.readable()){
         *     UTF8 帮派名
         * }
         *
         * 读取帮派名以后，加入列表
         *
         * 列表长度为1，进攻帮派是该帮派，防守帮派是国王所在帮派
         * 列表长度为2，进攻帮派是第二个，防守帮派是第一个
         * 其他，进攻帮派无，防守帮派是国王所在帮派
         *
         */
        public static const S2C_KING_WAR_BID_END_BROADCAST : String = "107_6";

        /**
         * 请求竞价排名，需要的时候才来
         */
        public static const C2S_KING_WAR_BID_RANK : String = "107_7";

        /**
         * 返回竞价排名，已经压缩，第一个就是第一名，第二个就是第二名
         *
         * while(buffer.readable()){
         *      UTF8 帮派名
         *      varint64 出价
         * }
         */
        public static const S2C_KING_WAR_BID_RANK : String = "107_8";

        /**
         * 请求竞价排名失败，返回varint32错误码
         *
         * 1. 没有加入家族
         * 2. 没有权限
         * 3. 当前没在竞标阶段
         * 4. 没有加入帮派
         */
        public static const S2C_KING_WAR_BID_RANK_FAIL : String = "107_9";

        /**
         * 请求进入副本
         */
        public static const C2S_TRY_ENTER_KING_WAR_DUNGEON : String = "107_21";

        /**
         * 进入副本成功
         */
        public static const S2C_TRY_ENTER_KING_WAR_DUNGEON : String = "107_22";

        /**
         * 进入失败，返回varint32错误码
         *
         * 1. 不属于进攻方/防守方
         * 2. 当前未开启
         * 3. 当前已经死亡了
         * 4. 没在普通场景中
         * 5. 战斗状态中
         * 6. 当前没到复活时间
         * 7. 当前状态不可以进入副本
         */
        public static const S2C_TRY_ENTER_KING_WAR_DUNGEON_FAIL : String = "107_23";

        /**
         * 副本信息，进入副本就会发送
         *
         * varint64 战斗开始时间，在此之前不可以移动，不可以放技能
         * varint64 战斗结束时间
         *
         * UTF8 进攻方帮派名
         * bytes 防守方帮派名
         */
        public static const S2C_DUNGEON_INFO : String = "107_24";

        /**
         * 请求家族战副本排行，只有在圣旨那里才需要来请求，别的时候服务器都会主动推送的
         */
        public static const C2S_KING_WAR_DUNGEON_RANK : String = "107_25";

        /**
         * 杀人排行榜，已经压缩，附带排行榜数据
         *
         * while(buffer.readable()){
         *      varint64 英雄id，用来判断是不是自己
         *      UTF8 英雄名称
         *      varint64 杀人数
         *      UTF8 所属帮派名
         *      varint32 连杀人数
         *      varint32 击杀塔的数量
         * }
         */
        public static const S2C_KING_WAR_DUNGEON_RANK : String = "107_26";

        /**
         * 家族战副本排行错误码
         *
         * 1. 没有帮派
         * 2. 当前没有排行榜可以请求
         */
        public static const S2C_KING_WAR_DUNGEON_RANK_FAIL : String = "107_27";

        /**
         * 副本状态
         *
         * varint64 进攻方积分
         * varint64 防守方积分
         *
         * while(buffer.readable()){
         *      varint64 怪物场景id
         *      varint32 怪物配置id
         *      UTF8 怪物所属帮派名，为空表示中立
         *      varint32 怪物血量百分比
         * }
         */
        public static const S2C_KING_WAR_DUNGEON_STATUS : String = "107_28";

        /**
         * 请求战场广播
         */
        public static const C2S_KING_WAR_BROADCAST : String = "107_29";

        /**
         * 战场广播返回，压缩
         *
         * while(buffer.readable()){
         *      varint32 后面数据的长度
         *      bytes KingWarBroadcastProto
         * }
         */
        public static const S2C_KING_WAR_SCENE : String = "107_30";

        /**
         * 战场广播，压缩
         *
         * bytes KingWarBroadcastProto
         */
        public static const S2C_KING_WAR_SCENE_BROADCAST : String = "107_31";

        /**
         * 世界广播
         * 需要先解压
         *
         * bytes 解析成 KingWarBroadcastProto
         */
        public static const S2C_KING_WAR_WORLD_BROADCAST : String = "107_32";

        /**
         * 请求战场广播返回varint32错误码
         *
         * 1. 没有帮派
         * 2. 当前没有广播可以请求
         */
        public static const S2C_KING_WAR_BROADCAST_FAIL : String = "107_33";

        /**
         * 家族战结束
         *
         * varint32 国家
         *
         * varint64 下次比赛开始时间，该时间可以计算出竞标开始时间、下次竞标结束时间、王城战下次结束时间
         *
         * UTF8 进攻方帮派名，可能长度为0，根据这个名字显示玩家是不是可以来查看战报什么的
         * UTF8 防守方帮派名，可能长度为0，根据这个名字显示玩家是不是可以来查看战报什么的
         *
         * UTF8 胜利的帮派名，可能长度为0
         * bytes 胜利的帮派帮主，可能长度为0
         */
        public static const S2C_KING_WAR_DUNGEON_END : String = "107_34";

        /**
         * 复活时间变更了
         *
         * varint64 复活cd结束时间，当当前时间<该事件时，客户端倒计时
         */
        public static const S2C_KING_WAR_CAN_RELIVE_TIME_CHANGED : String = "107_35";

        /**
         * 自己本人击杀人数变更
         *
         * varint64 新的击杀人数
         */
        public static const S2C_SELF_KILL_COUNT_CHANGED : String = "107_36";

        /**
         * 领取王帮奖励
         */
        public static const C2S_COLLECT_COUNTRY_KING_GUILD_PRIZE : String = "107_40";

        /**
         * 领取成功
         */
        public static const S2C_COLLECT_COUNTRY_KING_GUILD_PRIZE : String = "107_41";

        /**
         * 领取失败，返回varint32 错误码
         *
         * 1. 不是王帮成员
         * 2. 已经领取过了
         * 3. 背包空间不够
         */
        public static const S2C_COLLECT_COUNTRY_KING_GUILD_PRIZE_FAIL : String = "107_42";

    }
}