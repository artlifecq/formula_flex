package app.cmd {

    public class BaZhenTuModuleMessages {

        /**
         * 说明：
         *
         *  判断八阵图功能是否开启，通过判断类型
         *
         *  FunctionType
         *      FUNC_BA_ZHEN_TU = 25; // 八阵图
         *
         * 收到
         *      ModuleId = HERO_MISC_MODULE_ID = 8
         *      MsgId = S2C_HERO_DAILY_CLEARED = 127
         *      即8-127，将BaZhenTuModuleObj.today_enter_times设置为0
         *
         * -------------------------------------------
         *
         * 尝试开始，成功，其他队员会收到别的信息，自己提示
         */
        public static const S2C_TRY_START : String = "110_1";

        /**
         * 尝试开始，失败，返回varint32错误码
         *
         * 1. 但是英雄不在普通场景中
         * 2. 但是英雄死了
         * 3. 但是等级不够没开启
         * 4. 已经在开启中了
         * 5. 次数不够
         * 6. 不是队长
         * 7. 战斗中，无法申请
         * 8. 有人不在线
         * 9. 有人死了
         * 10. 有人距离过远
         * 11. 有人已经在申请中了
         * 12. 有人在战斗中了
         * 13. 有人次数不够
         *
         * if(buffer.readable()){
         *      bytes 某人，比如某人不在线，某人死了，某人距离过远，某人申请中了
         * }
         */
        public static const S2C_TRY_START_FAIL : String = "110_2";

        /**
         * 开启了副本
         *
         * varint64 过期时间，过期时间到了，客户端自动关闭掉
         * varint64 开启的人的id
         * bytes 开启的人的名字
         */
        public static const S2C_LEADER_START_DUNGEON : String = "110_3";

        /**
         * 拒绝
         */
        public static const C2S_REFRUSE : String = "110_5";

        /**
         * 拒绝成功，不附带其他数据
         */
        public static const S2C_REFRUSE : String = "110_6";

        /**
         * 拒绝失败，返回varint32错误码
         *
         * 1. 当前没有队伍
         * 2. 当前无法拒绝
         */
        public static const S2C_REFRUSE_FAIL : String = "110_7";

        /**
         * 同意
         */
        public static const C2S_AGREE : String = "110_8";

        /**
         * 同意成功，不附带其他数据
         */
        public static const S2C_AGREE : String = "110_9";

        /**
         * 同意失败，返回varint32
         *
         * 1. 当前没有队伍
         * 2. 当前无法同意
         */
        public static const S2C_AGREE_FAIL : String = "110_10";

        /**
         * 有人同意了
         *
         * bytes 同意的人的名字
         */
        public static const S2C_OTHER_AGREE : String = "110_11";

        /**
         * 进入副本取消了，客户端可能同时收到多条
         *
         * bytes 取消的人的名字
         */
        public static const S2C_CANCEL : String = "110_12";

        /**
         * 战斗即将打响，等待进入副本
         */
        public static const S2C_WAIT_ENTER_DUNGEON : String = "110_13";

        /**
         * 能够进入八阵图的次数变更了
         *
         * varint32 新的次数
         */
        public static const S2C_ENTER_TIMES_CHANGED : String = "110_14";

        /**
         * 副本信息
         *
         * varint64 副本结束时间
         *
         * varint32 当前是第几波
         * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
         *
         * while(buffer.readable()){
         *      varint32 导致buf不生效的怪物类型，即八卦类型
         *      varint64 导致buf不生效结束时间
         * }
         */
        public static const S2C_DUNGEON_INFO : String = "110_20";

        /**
         * 新的一波刷新了
         *
         * varint32 当前波数
         * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
         */
        public static const S2C_NEW_WAVE : String = "110_21";

        /**
         * 石碑状态变更了，这是一条广播
         *
         * varint32 石碑类型，即八卦类型
         * bool 是否激活了，就是可以攻击了
         */
        public static const S2C_STELE_ACTIVATE : String = "110_22";

        /**
         * 石碑导致怪物buf不生效
         *
         * varint32 导致buf不生效的怪物类型，即八卦类型
         * varint64 导致buf不生效结束时间
         */
        public static const S2C_BUFFER_INVALID : String = "110_23";

        /**
         * 副本结束了
         *
         * bool true(成功)/false(失败)
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
        public static const S2C_FINISH : String = "110_24";

        /**
         * 场景中出现了一只八阵图的普通小怪物，需要带上怪物的八卦类型
         *
         * varint32 八卦类型
         *
         * varint32 技能id，即BaZhenTuDungeonProto.monster_spells中的id，后面的数据同3-4, S2C_ADD_MONSTER
         *
         * varint64 怪物在场景中的id // 注意是int64
         * varint32 怪物的配置id
         *
         * // 接下来是和怪物共用的
         * varint32 x点
         * varint32 y点
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 当前魔法值
         * varint64 最大魔法值
         *
         * // 加载身上附带的状态
         * while(byteArray.available){ // 以下每个循环就是一个不同的状态
         *     stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
         *     currentStackCount = byteArray.readVarInt32() // 这个状态的层数
         *     disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         * }
         */
        public static const S2C_ADD_MONSTER : String = "110_25";

        /**
         * 场景中出现了一只八阵图石碑，需要带上怪物的八卦类型
         *
         * varint32 八卦石碑类型
         * bool 是否被激活，后面的数据同3-4, S2C_ADD_MONSTER
         *
         * varint64 怪物在场景中的id // 注意是int64
         * varint32 怪物的配置id
         *
         * // 接下来是和怪物共用的
         * varint32 x点
         * varint32 y点
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 当前魔法值
         * varint64 最大魔法值
         *
         * // 加载身上附带的状态
         * while(byteArray.available){ // 以下每个循环就是一个不同的状态
         *     stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
         *     currentStackCount = byteArray.readVarInt32() // 这个状态的层数
         *     disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         * }
         */
        public static const S2C_ADD_STELE_MONSTER : String = "110_26";

    }
}