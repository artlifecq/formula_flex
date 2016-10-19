package app.cmd {

    public class StoryModuleMessages {

        /**
         * 通用的剧情副本失败消息
         *
         * 1.当前已经死亡
         * 2.没在普通场景
         * 3.没找到目标npc
         * 4.距离npc过远
         * 5.当前没有该类型的任务
         *
         * 101.事件已经执行了
         * 102.移除对象参数非法
         * 103.场景冻结失败
         * 104.没在剧情副本
         */
        public static const S2C_STORY_FAIL_MSG : String = "29_0";

        /**
         * 请求进入剧情副本
         *
         * varint64 点击的npcid
         */
        public static const C2S_TRY_ENTER_STORY_DUNGEON : String = "29_1";

        /**
         * 进入剧情副本成功,等待切换进入场景
         */
        public static const S2C_TRY_ENTER_STORY_DUNGEON : String = "29_2";

        /**
         * 执行某个事件,该事件没有返回
         *
         * varint32 事件,该事件必须比此前已经发生的事件要大
         */
        public static const C2S_RUN_EVENT : String = "29_4";

        /**
         * 执行某个删除对象的事件,该消息没有返回
         *
         * varint32 后面的目标的id数量,最多为50,超过,不处理
         * while(i->后面的目标的id数量){
         *      varint64 目标在场景中得id
         * }
         */
        public static const C2S_REMOVE_MONSTER_OBJ_EVENT : String = "29_5";

        /**
         * 冻结或者解冻场景
         *
         * bool true(冻结)/false(解除冻结)
         */
        public static const C2S_FROZEN_DUNGEON : String = "29_6";

        /**
         * 解除冻结或者解冻场景
         *
         * bool true(冻结)/false(解除冻结)
         */
        public static const S2C_FROZEN_DUNGEON : String = "29_7";

        /**
         * 副本结束
         *
         * bool true(通关成功)/false(通关失败)
         */
        public static const S2C_DUNGEON_END : String = "29_9";

        /**
         * 场景中添加了一只剧情保护怪物
         *
         * 参数跟添加怪物一毛一样的
         */
        public static const S2C_ADD_STORY_PROTECT_MONSTER : String = "29_10";

        /**
         * 离开剧情副本
         */
        public static const C2S_LEAVE_STORY_DUNGEON : String = "29_20";

        /**
         * 离开剧情副本成功
         */
        public static const S2C_LEAVE_STORY_DUNGEON : String = "29_21";

    }
}