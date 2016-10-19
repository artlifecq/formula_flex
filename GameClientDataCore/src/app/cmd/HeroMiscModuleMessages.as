package app.cmd {

    public class HeroMiscModuleMessages {

        /**
         * 换装资源改变，附带以下信息
         * varint64 英雄Id
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         */
        public static const S2C_EQUIPMENT_RESOURCES_CHANGED : String = "8_3";

        /**
         * 属性值变化收到此消息，附带以下信息
         *  varint32 战斗值
         *  bytes SpriteStatProto
         */
        public static const S2C_CHANGE_STAT : String = "8_6";

        /**
         * 等级变化收到此消息(此消息英雄自己收到)，附带以下信息
         * bytes ChangeLevelProto
         */
        public static const S2C_CHANGE_LEVEL : String = "8_8";

        /**
         * 等级变化广播此消息(英雄自己除外)，附带以下信息
         * varint64 heroId
         * varint32 最新等级
         */
        public static const S2C_CHANGE_LEVEL_TO_OTHERS : String = "8_9";

        /**
         * 更新英雄总战斗力，附带以下信息
         * varint64 总战斗力
         */
        public static const S2C_CHANGE_HERO_FIGHTING_AMOUNT : String = "8_11";

        /**
         * PK模式切换消息
         * varint32 pkMode 1-和平 2-队伍 3-家族 4-善恶 5-全体
         */
        public static const C2S_CHANGE_PK_MODE : String = "8_14";

        /**
         * PK模式切换消息
         * varint32 pkMode 1-和平 2-队伍 3-家族 4-善恶 5-全体
         */
        public static const S2C_CHANGE_PK_MODE : String = "8_15";

        /**
         * PK模式切换失败，附带Byte错误码
         * 1、场景是固定PK模式场景
         * 2、客户端发送的PK模式无效
         * 3、英雄不在场景中，不允许切换PK模式
         */
        public static const S2C_CHANGE_PK_MODE_FAIL : String = "8_16";

        /**
         * 进入跟玩家的战斗状态
         */
        public static const S2C_INTO_COMBAT : String = "8_18";

        /**
         * 脱离战斗，收到此消息后，客户端清空反击列表
         */
        public static const S2C_LEAVE_COMBAT : String = "8_20";

        /**
         * 添加反击列表成员
         * varint64 英雄ID
         */
        public static const S2C_ADD_COUNTERATTACK : String = "8_21";

        /**
         * 被某个家伙打了，进入反击模式
         * utf 英雄名字
         */
        public static const S2C_ENTER_COUNTERATTACK : String = "8_24";

        /**
         * 你把不是仇人的英雄杀了
         * utf 英雄名字
         */
        public static const S2C_KILL_NOT_YOUR_ENEMY : String = "8_25";

        /**
         * 领取离线经验, 只有可领取时才能发送, 且发送完必须等返回
         *
         * 附带
         *
         * byte 领取类型  1 单倍普通领取 2 vip双倍领取 3 vip金子三倍领取
         */
        public static const C2S_COLLECT_OFFLINE_EXP : String = "8_26";

        /**
         * 领取离线经验失败, 附带varint32 错误码
         *
         * 1. 没有可领的离线经验
         * 2. vip等级不够领双倍或三倍
         * 3. 金子不够
         * 4. 你已经满级了
         * 5. 发来的类型错误, 只能是1/2/3. 客户端bug
         */
        public static const S2C_COLLECT_OFFLINE_EXP_FAIL : String = "8_27";

        /**
         * 领取离线经验成功, 清空可领取的离线经验
         *
         * 附带
         *
         * varint32 此次领取的经验数, 仅供展示信息, 服务器会另外发送经验变化消息
         */
        public static const S2C_COLLECT_OFFLINE_EXP_SUCCESS : String = "8_28";

        /**
         * 家族贡献变化收到此消息，附带以下信息
         * varint32 最新值
         */
        public static const S2C_CHANGE_FAMILY_CONTRIBUTION : String = "8_30";

        /**
         * 总累计充值金子数额改变时收到此消息，附带以下信息
         * varint64 当前值
         */
        public static const S2C_CHANGE_TOTAL_RECHARGE_JINZI : String = "8_31";

        /**
         * 怒气值增加消息
         *
         * 收到这个消息，客户端自己加一点怒气
         */
        public static const S2C_RAGE_INCREMENT : String = "8_32";

        /**
         * 怒气已满消息
         *
         * 收到这个消息后，将怒气设置为最大值，可以释放怒气技能
         */
        public static const S2C_MAX_RAGE : String = "8_33";

        /**
         * 请求升级
         */
        public static const C2S_UPGRADE_LEVEL : String = "8_34";

        /**
         * 升级失败，返回varint32错误码
         *
         * 1. 经验不够
         * 2. 已经达到最高等级了
         * 3. 当前无法手动升级
         */
        public static const S2C_UPGRADE_LEVEL_FAIL : String = "8_35";

        /**
         * 升级成功
         */
        public static const S2C_UPGRADE_LEVEL : String = "8_36";

        /**
         * 更新潜能丹，幻化丹,淬剑丹个数
         * varint32 类型     1-龙灵丹 2-龙魂丹 11-天劫潜能丹 12-天劫幻化丹 21-淬剑丹
         * varint32 已使用个数
         */
        public static const S2C_UPDATE_REFINED_GOODS_COUNT : String = "8_49";

        /**
         * 今日消费变化消息
         * varint32 消费的数量
         * varint32 变化后总共消费的数量
         */
        public static const S2C_UPDATE_DAILY_CONSUME_JINZI : String = "8_50";

        /**
         * 自己的pk值变化了
         *
         * varint32 当前PK值
         * varint64 下次减少PK值的时间
         */
        public static const S2C_SELF_PK_AMOUNT_CHANGED : String = "8_52";

        /**
         * 返回英雄的进入夜间保护剩余时间，单位毫秒
         *
         * varint64 英雄ID
         * varint64 进入夜间保护生育时间，单位毫秒
         */
        public static const S2C_NIGHT_PROTECT_COUNT_DOWN_TIME : String = "8_53";

        /**
         * 进入跟怪物的战斗状态
         */
        public static const S2C_INTO_MONSTER_COMBAT : String = "8_56";

        /**
         * 更新脱离跟怪物的战斗时间
         */
        public static const S2C_CHANGE_LEAVE_MONSTER_COMBAT_TIME : String = "8_57";

        /**
         * 新功能开启
         * varint32 新功能ID（参考FunctionType）
         */
        public static const S2C_NEW_FUNCTION : String = "8_59";

        /**
         * 推荐挂机的怪物
         */
        public static const C2S_RECOMMEND_AUTO_MONSTER : String = "8_65";

        /**
         * 返回挂机推荐的怪物，可能会返回好几个，客户端 这样来随机[英雄id % 怪物的数量]，用该值来作为下标
         *
         * while(buffer.readable()){
         *      varint32 monsterId
         * }
         */
        public static const S2C_RECOMMEND_AUTO_MONSTER : String = "8_66";

        /**
         * 数额改变时收到此消息，附带以下信息
         * varint32 类型
         * varint64 当前值
         *
         * bool 增加(true)还是减少(false)
         * if(增加){
         *      varint64 增加的量
         * } else {
         *      varint64 减少的量
         * }
         */
        public static const S2C_CHANGE_AMOUNT : String = "8_68";

        /**
         * 在线1小时
         */
        public static const S2C_FANG_CHEN_MI_1_HOUR : String = "8_100";

        /**
         * 在线2小时
         */
        public static const S2C_FANG_CHEN_MI_2_HOUR : String = "8_101";

        /**
         * 在线3小时
         */
        public static const S2C_FANG_CHEN_MI_3_HOUR : String = "8_102";

        /**
         * 在线3.5小时
         */
        public static const S2C_FANG_CHEN_MI_3_5_HOUR : String = "8_103";

        /**
         * 在线4小时
         */
        public static const S2C_FANG_CHEN_MI_4_HOUR : String = "8_104";

        /**
         * 在线4.5小时
         */
        public static const S2C_FANG_CHEN_MI_4_5_HOUR : String = "8_105";

        /**
         * 在线5小时
         */
        public static const S2C_FANG_CHEN_MI_5_HOUR : String = "8_106";

        /**
         * 刚上线时, 还未疲劳
         * 提示用户“由于您是未成年人，将被纳入防沉迷系统，3小时内收益经验正常，3-5小时内收益经验减半，5小时后收益经验为零。”
         */
        public static const S2C_FANG_CHEN_MI_ONLINE_OK : String = "8_107";

        /**
         * 刚上线时, 已经疲劳
         *
         * 提示“您当前已经进入疲劳游戏时间，游戏收益变成正常的50%，请您合理安排游戏时间。”
         */
        public static const S2C_FANG_CHEN_MI_ONLINE_WEAK : String = "8_108";

        /**
         * 刚上线时, 已经不健康
         *
         * 提示用户“您已累计在线5小时，您已进入不健康游戏时间，游戏收益变为0，请下线休息。”
         */
        public static const S2C_FANG_CHEN_MI_ONLINE_STRONG : String = "8_109";

        /**
         * 月常清理完成
         */
        public static const S2C_HERO_MONTHLY_CLEARED : String = "8_126";

        /**
         * 日常清理完成
         * bytes HeroClearedProto
         */
        public static const S2C_HERO_DAILY_CLEARED : String = "8_127";

        /**
         * 杀人没有功勋
         */
        public static const S2C_KILL_HERO_DO_NOT_HAVE_GONG_XUN : String = "8_130";

        /**
         * 设置头像，附带：
         * varin32 头像id
         */
        public static const C2S_SET_HEAD : String = "8_132";

        /**
         * 设置头像失败，附带varint32错误码
         * 1.你没有该古剑
         */
        public static const S2C_SET_HEAD_FAIL : String = "8_133";

        /**
         * 设置头像成功
         * varint32 head
         */
        public static const S2C_SET_HEAD_SUCCEED : String = "8_134";

        /**
         * boss红包领取个数变更
         * varint32 已领取红包个数
         */
        public static const S2C_COLLECT_BOSS_HONG_BAO_COUNT : String = "8_137";

        /**
         * 角色登陆后收到此消息(此消息英雄自己收到)，附带以下信息
         * bytes ChangeLevelProto
         */
        public static const S2C_INIT_LEVEL_INFO : String = "8_140";

    }
}