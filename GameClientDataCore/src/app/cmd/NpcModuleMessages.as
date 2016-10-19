package app.cmd {

    public class NpcModuleMessages {

        /**
         * 请求点击npc某个功能，加锁
         *
         * varint64 npc在场景中的Id
         * varint32 npc第几个dialog
         *
         * 其他数据根据不同功能带不同数据
         *
         * dialog类型是：
         *
         * ACCEPT_BIAO{
         *  附带：
         *      bool 使用增镖令
         *      UpgradeProto 使用增镖令，带增镖令的消耗/不使用带不使用增镖令的消耗
         * }
         * ACCEPT_INVINCIBLE_BIAO{
         *  附带：
         *      UpgradeProto 无敌镖车的消耗
         * }
         * TRANSPORT{
         *  附带:
         *      varint32 传送下标
         * }
         * MOUNT_IDENTIFY = 20; // 坐骑鉴定{
         *  附带
         *      varint32 坐骑槽(第几个坐骑)
         * }
         * MOUNT_TRANS = 21; // 坐骑转化{
         *  附带
         *      varint32 坐骑槽(第几个坐骑)
         *      varint32 转化后，物品放到背包的第几个空位
         * }
         * MOUNT_BREED = 22; // 坐骑繁育{
         *  附带
         *      varint32 坐骑槽
         *      bool 我是不是被邀请的
         * }
         * MOUNT_INHERIT = 23; // 坐骑继承{
         *  附带
         *      bool 是否继承根骨经验
         *      bool 是否继承技能(是否继承根骨经验以及是否继承技能不能够同时为false)
         *      varint32 要继承根骨经验或者技能的坐骑槽
         *      bool 被继承的坐骑是来自背包中的兽牌还是坐骑槽中
         *      if(来自背包){
         *          varint32 要被继承根骨经验或者技能的兽牌在背包中的位置
         *      } else {
         *          varint32 要被继承根骨经验或者技能的坐骑槽
         *      }
         * }
         * GUILD_CREATE = 50; // 创建帮派{
         *  附带
         *      varint32 要扣除的物品在背包的位置
         *      varint32 底纹
         *      varint32 底框
         *      utf 旗号(策划说只能够是一个汉字)
         *      bytes 帮派名字
         * }
         */
        public static const C2S_ON_CLICK_NPC : String = "109_0";

        /**
         * 请求npc功能成功，解锁
         */
        public static const S2C_ON_CLICK_NPC : String = "109_1";

        /**
         * 请求npc失败，返回varint32错误码，解锁
         *
         * 1. npc没找到
         * 2. 距离npc过远
         * 3. npc该有该功能
         * 4. 你已经死了
         * 5. 飞行中
         * 6. 你不可以使用该npc
         */
        public static const S2C_ON_CLICK_NPC_FAIL : String = "109_2";

        /**
         * 只是让客户端辨识出这是npc，数据跟加怪物的消息S2C_ADD_MONSTER一样的
         */
        public static const S2C_ADD_NPC : String = "109_3";

        /**
         * 请求NPC传送
         */
        public static const S2C_SCENE_REQUEST_NPC_TRANSPORT : String = "109_10";

        /**
         * NPC传送失败，附带byte失败原因
         *
         * 1：npcId无效
         * 2：传送列表索引无效
         * 3：等级不够
         * 4：钱不够
         * 5：英雄与NPC距离太远
         * 6：战斗状态，不能换线
         * 7：攻城战期间，不能传送
         * 8：你已经死了，不能够NPC传送了
         * 9：你在他国
         * 10：不为其他国家的人提供传送服务
         * 11：目标国家是弱国，且在国运中，无法传送
         * 12：当前状态下，无法传送
         */
        public static const S2C_SCENE_REQUEST_NPC_TRANSPORT_FAIL : String = "109_11";

        /**
         * 场景中有英雄/怪物/宠物啥的 搭乘固定路线载具了, 包含每个节点和到达这个节点的时间
         *
         * varint64 移动的对象的id
         * varint32 载具配置id
         * varint64 飞行开始的时间
         */
        public static const S2C_VEHICLE_PLAYER : String = "109_12";

        /**
         * 搭乘固定路线载具失败，返回varint32错误码
         *
         * 1. 战斗中
         * 2. 英雄当前无法乘坐
         * 3. 已经死了
         * 4. 被击晕/不可移动
         * 5. 当前已经有搭乘固定路线载具
         */
        public static const S2C_VEHICLE_PLAYER_FAIL : String = "109_13";

    }
}