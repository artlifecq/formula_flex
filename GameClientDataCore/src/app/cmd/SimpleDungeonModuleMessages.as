package app.cmd {

    public class SimpleDungeonModuleMessages {

        /**
         * 在副本中要求离开副本, 回到进入副本前的场景/坐标.
         *
         * 必须在副本中才能请求, 请求后必须等返回
         *
         * 此消息不只是在剧情副本中才能用, 任何副本都用这条来主动离开副本
         *
         * 死亡时候发送也可以, 会满血回到进入副本前的位置
         *
         * 没有附带信息
         */
        public static const C2S_LEAVE_DUNGEON : String = "21_2";

        /**
         * 离开副本失败, 附带varint32 错误码
         *
         * 1. 你不在副本中 (可能不在副本或者在加载中还没进入场景)
         */
        public static const S2C_LEAVE_DUNGEON_FAIL : String = "21_4";

        /**
         * 离开副本成功, 紧接着会收到切场景消息. 解锁
         *
         * 没有附带信息
         */
        public static const S2C_LEAVE_DUNGEON_SUCCESS : String = "21_5";

    }
}