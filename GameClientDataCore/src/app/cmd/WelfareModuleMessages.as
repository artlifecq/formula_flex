package app.cmd {

    public class WelfareModuleMessages {

        /**
         * 祭拜女娲
         * varint32 类型 0-银两 1-经验
         */
        public static const C2S_PHOENIX_REFINE : String = "80_19";

        /**
         * 祭拜女娲成功
         * varint32 类型 0-银两 1-经验
         * varint32 暴击倍率
         * 收到成功消息，客户端将那种类型的祭拜女娲次数+1
         */
        public static const S2C_PHOENIX_REFINE : String = "80_20";

        /**
         * 祭拜女娲失败，附带byte错误码
         * 1、系统还未开启（还没有做到那个任务）
         * 2、今天炼制次数已满
         * 3、钱不够（银两、绑金、金子）
         * 4、发送的类型无效（0-银两 1-真气 2-经验 3-古剑经验）
         * 5、英雄已经满级，不能祭拜经验
         */
        public static const S2C_PHOENIX_REFINE_FAIL : String = "80_21";

        /**
         * 请求登陆奖励数据
         */
        public static const C2S_FIRST_LOGIN_PRIZE_DATA : String = "80_39";

        /**
         * 登陆奖励数据
         * while (byteArray.available)
         *     varint32 奖励数据长度
         *     bytes PrizeProto 奖励数据
         *
         * 循环读取，第一个数据时第一天登陆奖励，以此类推
         */
        public static const S2C_FIRST_LOGIN_PRIZE_DATA : String = "80_40";

        /**
         * 领取登陆奖励
         * varint32 index，第一天奖励的发0
         */
        public static const C2S_COLLECT_FIRST_LOGIN_PRIZE : String = "80_41";

        /**
         * 领取奖励成功
         * varint32 index，第一天奖励的发0
         */
        public static const S2C_COLLECT_FIRST_LOGIN_PRIZE : String = "80_42";

        /**
         * 领取奖励错误
         * 1、登陆天数不足
         * 2、奖励已经领取过了
         * 3、背包空位不够
         * 4、无效的奖励索引
         */
        public static const S2C_COLLECT_FIRST_LOGIN_PRIZE_FAIL : String = "80_43";

        /**
         * 请求首冲奖励状态
         */
        public static const C2S_FIRST_RECHARGE_INFO : String = "80_44";

        /**
         * 首冲奖励更新
         * varint32 firstRechargeCurrentIndex
         * varint64 firstRechargeUpdateTime
         * boolean firstRechargeUpdateTime这一天的充值额度是否足够领取奖励
         *
         * 收到这个消息，更新currentIndex和updateTime，重新计算一下图标状态
         */
        public static const S2C_FIRST_RECHARGE_INFO : String = "80_45";

        /**
         * 请求首冲数据
         * varint32 firstRechargeCurrentIndex
         */
        public static const C2S_FIRST_RECHARGE_DATA : String = "80_46";

        /**
         * 首冲数据
         * if (byteArray.available)
         *     bytes PrizeProto 奖励数据
         *
         * 特别的，如果发现这条消息没有内容，说明客户端发的天数有问题（此时不要展示那个图标了）
         */
        public static const S2C_FIRST_RECHARGE_DATA : String = "80_47";

        /**
         * 领取最近一次的首冲奖励
         */
        public static const C2S_COLLECT_FIRST_RECHARGE_PRIZE : String = "80_48";

        /**
         * 领取奖励成功
         * varint32 firstRechargeCollectIndex
         *
         * 如果发现接下来还有奖励可以领取，则请求下一天的奖励数据，展示面板，否则关闭面板
         * 等到12点更新时，客户端看下是否需要展示新的接口
         */
        public static const S2C_COLLECT_FIRST_RECHARGE_PRIZE : String = "80_49";

        /**
         * 领取奖励错误
         * 1、还没有充值
         * 2、没有奖励可以领（总共4个首冲奖励，你想领取第5个，开什么玩笑）
         * 3、背包空位不够
         */
        public static const S2C_COLLECT_FIRST_RECHARGE_PRIZE_FAIL : String = "80_50";

        /**
         * 展示平台奖励
         * varint32 index
         * bytes PrizeProto
         */
        public static const S2C_SHOW_PLATFORM_PRIZE : String = "80_51";

        /**
         * 领取平台奖励
         * varint32 index
         */
        public static const C2S_COLLECT_PLATFORM_PRIZE : String = "80_52";

        /**
         * 领取平台奖励成功
         * varint32 index
         */
        public static const S2C_COLLECT_PLATFORM_PRIZE : String = "80_53";

        /**
         * 领取奖励错误，附带byte错误码
         * 1、奖励不存在
         * 2、已经领取过了
         * 3、背包已满
         */
        public static const S2C_COLLECT_PLATFORM_PRIZE_FAIL : String = "80_54";

        /**
         * 微信礼包推送
         * UTF 微信号图片资源
         * bytes PrizeProto
         */
        public static const S2C_PUSH_WEIXIN_PACKAGE : String = "80_55";

        /**
         * 领取微信礼包
         * UTF 暗号
         */
        public static const C2S_COLLECT_WEIXIN_PACKAGE : String = "80_56";

        /**
         * 领取微信礼包
         */
        public static const S2C_COLLECT_WEIXIN_PACKAGE : String = "80_57";

        /**
         * 领取奖励错误，附带byte错误码
         * 1、当前没有微信礼包获得（客户端BUG）
         * 2、你已经领取过了
         * 3、暗号不对
         * 4、背包已满
         */
        public static const S2C_COLLECT_WEIXIN_PACKAGE_FAIL : String = "80_58";

        /**
         * 请求领取在线奖励
         */
        public static const C2S_GET_ONLINE_PRIZE : String = "80_68";

        /**
         * 请求领取在线奖励成功
         */
        public static const S2C_GET_ONLINE_PRIZE_SUCCESS : String = "80_69";

        /**
         * 领取在线奖励失败，附带Byte错误码
         * 1、时间还没到!
         * 2、你已领取过奖励了!
         */
        public static const S2C_GET_ONLINE_PRIZE_FAIL : String = "80_70";

        /**
         * 服务端发送在线奖励相关数据
         * var32 可以领取奖励的时间 (long/1000)
         * if(buffer.available){
         *      PirzeProto
         * }
         */
        public static const S2C_SEND_ONLINE_PRIZE_INFO : String = "80_72";

        /**
         * varint32 type  首充按钮:1  月卡按钮:2,  每日首充按钮:3      首充图标:4  月卡图标:5,  每日首充图标:6 活动大厅图标:7
         */
        public static const C2S_COLLECT_INFO : String = "80_73";

        /**
         * 获得祭拜女娲记录,数据比较大，不要每次打开都询问，缓存个15秒
         */
        public static const C2S_PHOENIX_REFINE_GET_RECORDS : String = "80_74";

        /**
         * 获得祭拜女娲记录成功附带：
         * PhoenixRefineRecordProtos proto
         */
        public static const S2C_PHOENIX_REFINE_GET_RECORDS_SUCCEED : String = "80_75";

    }
}