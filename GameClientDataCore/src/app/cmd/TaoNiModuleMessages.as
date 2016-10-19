package app.cmd {

    public class TaoNiModuleMessages {

        /**
         * 讨逆活动开始了
         */
        public static const S2C_TAO_NI_START : String = "111_0";

        /**
         * 进入副本成功，用于回复点击npc的
         */
        public static const S2C_ENTER_DUNGEON : String = "111_1";

        /**
         * 请求进入副本失败
         *
         * 1. 没在自己国家的场景
         * 2. 你已经死了
         * 3. 该npc别人已经进去了
         * 4. 不是队长
         * 5. 有人不在线
         * 6. 有人死了
         * 7. 有人距离过远
         * 8. 有人不在普通场景
         * 9. 你当前状态不允许进入讨逆副本
         * 10. 有人当前状态不允许进入讨逆副本
         * 11. 当前没有讨逆活动
         */
        public static const S2C_ENTER_DUNGEON_FAIL : String = "111_2";

        /**
         * 场景信息
         *
         * varint64 副本结束时间
         * varint64 当前阶段的结束时间
         * varint32 当前阶段
         * varint32 当前阶段第几波
         * varint64 下一波的时间，如果为0表示没有下一波
         *
         * while(buffer.readable()){
         *      varint32 怪物配置id
         *      varint32 怪物击杀数量
         * }
         */
        public static const S2C_DUNGEON_INFO : String = "111_10";

        /**
         * 添加粮仓，后面数据跟场景中加怪物一毛一样的
         */
        public static const S2C_ADD_LIANG_CANG : String = "111_11";

        /**
         * 阶段变更了
         *
         * varint32 阶段
         * varint64 该阶段结束时间
         * varint64 第一波的时间
         */
        public static const S2C_STAGE_CHANGED : String = "111_12";

        /**
         * 下一波信息
         *
         * varint32 当前波数
         * varint64 下一波的时间，如果下一波的时间为0，表示该阶段没有下一波了
         */
        public static const S2C_NEW_WAVE : String = "111_13";

        /**
         * 击杀怪物信息变更
         *
         * varint32 monsterConfigId，该怪物可能不是本阶段的，客户端自己根据情况去做处理
         * varint32 击杀个数
         */
        public static const S2C_KILL_MONSTER_CHANGED : String = "111_14";

        /**
         * 副本结束了
         *
         * bool true(通关)/false(失败)
         *
         * while(buffer.readable()){
         *      varint64 成员id
         *      utf 成员名字
         *
         *      varint32 复活次数
         *
         *      varint32 击杀怪物数量
         *      for(i->击杀怪物数量){
         *          varint32 怪物配置id
         *          varint32 击杀数量
         *      }
         * }
         */
        public static const S2C_FINISH : String = "111_30";

        /**
         * 讨逆的情况
         *
         * varint64 活动开启时间
         * varint32 讨逆活动的场景
         * varint32 刷出来的npc的数量
         * varint32 已经进入的npc数量
         * varint32 剩余npc数量
         */
        public static const S2C_TAO_NI_STATUS : String = "111_35";

        /**
         * 讨逆活动结束了
         */
        public static const S2C_TAO_NI_END : String = "111_40";

    }
}