package app.cmd {

    public class CountryWarModuleMessages {

        /**
         * 国家模块错误,返回varint32错误码
         *
         * 1. 权限不够，无法宣战
         * 2. 已经有国战了，无法宣战
         * 3. 宣战的国家非法，无法宣战
         * 4. 无法对盟国宣战
         * 5. 目标已经被宣战了
         * 6. 钱不够，无法国战
         * 7. 国战CD中，无法国战
         * 8. 目标在国战CD中，无法国战
         * 9. 当前未开启国战功能
         * 10. 当前时间不可以宣战
         * 11. 不是国战双方
         * 12. 当前没有国战
         * 13. 国战没开始
         * 15. 绑银不够
         * 16. 物品不够
         *
         * 17. 当前时间,无法参拜
         * 18. 不在参拜区域内
         * 19. 当前没有国家可以参拜
         * 20. 参拜要去上次失败的国家才能够参拜
         * 21. 当前没有奖励可以领取,无法参拜
         * 22. 背包已满
         *
         * 23. 当前时间,无法进入国战参拜区域
         * 24. 没在本国,无法进入国战参拜区域
         *
         * 25. 当前没在观战中
         *
         * 26. 弹幕长度非法
         * 27. 弹幕CD中
         *
         * 28. 已经支持过了
         * 29. 未知的要支持的国家
         * 30. 要支持的国家,当前没有国战
         *
         * 31. 当前所在场景不是国战场景
         * 32. 当前场景限制战车通行
         * 33. 玩家已经死亡
         * 34. 当前在击晕状态中
         * 35. 非国战双方以及其盟国
         * 36. 当前状态无法执行该操作
         *
         * 37. 当前没有在战车上
         * 38. 没有进入游戏场景,无法下车
         *
         * 39. 当前已经在车上了
         * 40. 距离战车过远,无法上车
         * 41. 没有找到目标司机
         * 42. 目标已经死亡,无法上车
         * 43. 没有找到战车
         * 44. 战车已经被摧毁了,无法上车
         * 45. 跟目标不是盟友,无法上车
         * 46. 目标战车没有空位了,无法上车
         * 47. 当前没有乘车,无法下车
         *
         * 48. 没在本国场景
         * 49. 当前没有可以观战的国战
         *
         * 50. 当前没有进入观战场景
         * 51. 切换观战位置太频繁了
         * 52. 目标没有找到
         * 53. 目标没有进入场景
         * 54. 目标不是官员
         * 55. 目标不是国战双方
         * 56. 目标点不可以行走
         * 57. 移动位置非法
         * 58. 当前不可以领取战车
         * 59. 当前无法请求国战官员信息
         *
         * 100. 服务器bug
         */
        public static const S2C_COUNTRY_WAR_FAIL : String = "98_0";

        /**
         * 登录的时候的国战信息，什么时候开始，那个国家跟哪个国家打
         *
         * 已经压缩了
         *
         * bytes 解压缩以后，解析成 CountryWarDataProto
         */
        public static const S2C_COUNTRY_WAR_INFO : String = "98_1";

        /**
         * 国战宣战
         *
         * varint32 宣战的国家
         */
        public static const C2S_COUNTRY_WAR_DECLARE_WAR : String = "98_2";

        /**
         * 国战宣战成功，接下来会受到国战的广播
         */
        public static const S2C_COUNTRY_WAR_DECLARE_WAR : String = "98_4";

        /**
         * 宣战成功，客户端把该国战加入国战列表
         *
         * varint32 0-国战，1-复仇战
         * varint32 攻击国
         * varint32 防御国
         * varint64 开始时间
         */
        public static const S2C_COUNTRY_WAR_DECLARE_WAR_BROADCAST : String = "98_5";

        /**
         * 国战开始，客户端标识当前国战为正在进行时
         *
         * varint32 0-国战，1-复仇战
         * varint32 攻击国
         * varint32 防御国
         */
        public static const S2C_COUNTRY_WAR_START : String = "98_6";

        /**
         *
         * 国战结束，客户端删除当前国战
         *
         * 已压缩
         *
         * bytes CountryWarEndProto
         *
         * 如果是国战:
         *
         *      获胜方的胜利次数++
         *      防守方的失败次数++
         *
         */
        public static const S2C_COUNTRY_WAR_END : String = "98_7";

        /**
         * 其他服的人收到国战结束的信息
         *
         * bytes OtherCountryWarEndProto
         *
         * 如果是国战:
         *
         *      获胜方的胜利次数++
         *      防守方的失败次数++
         * }
         */
        public static const S2C_OTHER_COUNTRY_WAR_END : String = "98_8";

        /**
         * 国战怪物信息
         *
         * varint32 国战类型 0-普通国战，1-复仇战
         * varint32 进攻国家
         * varint32 防守国家
         *
         * varint32 进攻方支持的人数
         * varint32 防守方支持的人数
         * varint32 观战的人数
         *
         * 读取麒麟数据
         * varint32 怪物配置id
         * varint32 怪物所属国家
         * bool 怪物是否还活着
         * if(活着){
         *      varint32 怪物血量百分比,血量百分比是0也是没有死亡的
         * }
         *
         * 四圣兽
         * varint32 圣兽数量
         * for(i -> 圣兽数量){
         *      varint32 怪物配置id
         *      varint32 怪物所属国家
         *      bool 怪物是否还活着
         *      if(活着){
         *          varint32 怪物血量百分比,血量百分比是0也是没有死亡的
         *      }
         * }
         *
         * 携带复活点的怪物，如阳平关守将，金甲将军
         * varint32 携带复活点的怪物的数量
         * for(i -> 携带复活点的怪物的数量){
         *      varint32 怪物配置id
         *      varint32 怪物所属国家
         *      bool 怪物是否还活着
         *      if(活着){
         *          varint32 怪物血量百分比,血量百分比是0也是没有死亡的
         *      }
         * }
         */
        public static const S2C_COUNTRY_WAR_STAUS : String = "98_9";

        /**
         * 我方国战杀人排行榜
         *
         * varint32 排行榜人数数量
         *
         * for(i->排行榜人数数量){
         *     varint64 heroId
         *     UTF8 英雄名称
         *     varint64 杀人数
         *     varint32 英雄国家
         * }
         */
        public static const S2C_COUNTRY_WAR_RANK_LIST : String = "98_10";

        /**
         * 个人国战击杀人数
         *
         * varint64 击杀人数
         */
        public static const S2C_RESPONSE_COUNTRY_WAR_SELF_RANK : String = "98_11";

        /**
         * 复仇战宣战
         *
         * bool true(国库钱够，提示)/false(国库钱不够，提示)
         */
        public static const C2S_REVENGE_WAR_DECLARE_WAR : String = "98_12";

        /**
         * 复仇战宣战成功，接下来会受到国战的广播
         */
        public static const S2C_REVENGE_WAR_DECLARE_WAR : String = "98_14";

        /**
         * 场景中添加国战怪物
         *
         * varint64 怪物在场景中的id // 注意是int64
         * varint32 怪物的配置id
         *
         * varint32 怪物所属国家
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
        public static const S2C_ADD_COUNTRY_WAR_MONSTER : String = "98_15";

        /**
         * 国战怪物死亡了
         *
         * varint32 进攻方的国家
         * varint32 防守方的国家
         * varint32 怪物配置id
         * varint32 怪物所属国家
         *
         * if(buffre.readable()){
         *      varint32 击杀者所属的国家
         *      bytes 击杀者的名字
         * }
         */
        public static const S2C_COUNTRY_WAR_MONSTER_DEAD : String = "98_16";

        /**
         * 请求获得国战详细信息，每次登录只能够请求一次，不带参数
         */
        public static const C2S_GET_COUNTRY_WAR_DETAIL : String = "98_17";

        /**
         * 返回国战历史记录，已经压缩了
         *
         * 解压缩
         *
         * while(buffer.readable()){
         *      bytes CountryWarRecordProto 自己根据时间排序
         * }
         */
        public static const S2C_GET_COUNTRY_WAR_DETAIL : String = "98_18";

        /**
         * 参战,要求玩家必须开启功能FunctionType.FUNC_COUNTRY_WAR
         *
         * UpgradeProto CountryWarMiscData.joinCountryWarCost
         */
        public static const C2S_JOIN_COUNTRY_WAR : String = "98_19";

        /**
         * 参战成功,等待切场景消息
         */
        public static const S2C_JOIN_COUNTRY_WAR : String = "98_20";

        /**
         * 进入参拜区域成功,后面会发送切场景或者位移的消息
         */
        public static const S2C_ENTER_ADMIRE_AREA : String = "98_30";

        /**
         * 参拜成功
         */
        public static const S2C_ADMIRE_COUNTRY_KING : String = "98_32";

        /**
         * 失败国家的官员参拜
         *
         * varint32 失败国家
         * varint32 官职(CountryOfficerPos)
         * bytes 参拜的人的名字
         */
        public static const S2C_FAIL_COUNTRY_OFFICE_ADMIRE : String = "98_33";

        /**
         * 失败的国家的人连续参拜
         *
         * varint32 参拜的人数
         */
        public static const S2C_FAIL_COUNTRY_MEMBER_ADMIRE : String = "98_34";

        /**
         * 自己在国战的信息
         *
         * bytes SelfCountryWarInfoProto
         */
        public static const S2C_SELF_WAR_INFO : String = "98_40";

        /**
         * 连续杀人
         *
         * varint64 连续杀人数
         *
         * varint64 杀人的玩家的id
         * bytes 杀人的玩家名字
         */
        public static const S2C_CONTINUE_KILL_HERO : String = "98_41";

        /**
         * 中断连续杀人
         *
         * varint64 被中断的连续杀人数
         *
         * utf 被中断的人的名字
         *
         * varint64 击杀者的id
         * bytes 击杀者,即中断的人
         */
        public static const S2C_INTERRUPT_CONTINUE_KILL_HERO : String = "98_42";

        /**
         * 连续被击杀,但是被连续击杀期间没有杀其他人
         *
         * varint64 连续被击杀的次数
         *
         * bytes 是谁
         */
        public static const S2C_CONTINUE_BEEN_KILLED_WHEN_NOT_KILL_OTHER : String = "98_43";

        /**
         * 国战官员被杀
         *
         * varint32 被杀的官员的官职
         * varint32 被杀的官员的国家
         * utf 被杀的官员的名字
         * varint32 杀人的人所属国家
         * bytes 杀人的人的名字
         */
        public static const S2C_COUNTRY_OFFICER_BEEN_KILLED : String = "98_44";

        /**
         * 场景中出现了一台战车
         * <p>
         * varint64 战车主人id
         * utf 战车主人名字
         * varint32 战车主人所属国家
         * <p>
         * varint64 战车在场景中的id // 注意是int64
         * varint32 战车里的配置id,里面可以读取到怪物id用来显示外观
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
        public static const S2C_ADD_ZHAN_CHE : String = "98_70";

        /**
         * 领取到了战车
         *
         * varint64 战车移动速度
         */
        public static const S2C_ACCEPT_ZHAN_CHE : String = "98_71";

        /**
         * 上战车广播,该处的处理同视野里面看到玩家的处理方式
         *
         * varint64 玩家id
         * bool true(上战车)/false(下战车)
         */
        public static const S2C_UP_OR_DOWN_FROM_ZHAN_CHE_BROADCAST : String = "98_72";

        /**
         * 请求下本人的战车
         */
        public static const C2S_DOWN_FROM_ZHAN_CHE : String = "98_73";

        /**
         * 从本人的战车下去了,客户端提示,后面会收到S2C_UP_OR_DOWN_FROM_ZHAN_CHE_BROADCAST
         */
        public static const S2C_DOWN_FROM_ZHAN_CHE : String = "98_74";

        /**
         * 老司机带带我,乘车
         *
         * varint64 老司机的id
         */
        public static const C2S_OLD_DRIVER_TAKE_ME : String = "98_75";

        /**
         * 老司机带上我了
         */
        public static const S2C_OLD_DRIVER_TAKE_ME : String = "98_76";

        /**
         * 老司机,我要下车
         */
        public static const C2S_OLD_DRIVER_LET_ME_LEAVE : String = "98_77";

        /**
         * 跟老司机886,玩家自己主动下车导致跟老司机88
         */
        public static const S2C_OLD_DRIVER_BYE : String = "98_78";

        /**
         * A乘坐B的战车了,处理,同视野里面看到玩家,该消息玩家自己也会收到
         *
         * varint64 A
         * varint64 B
         *
         */
        public static const S2C_TAKE_ZHAN_CHE : String = "98_79";

        /**
         * 某人下车了,这是一条广播,客户端处理视野里面玩家的数据
         *
         * varint64 某人的id
         */
        public static const S2C_GET_OFF_ZHAN_CHE : String = "98_80";

        /**
         * 战车切换场景了,如果玩家已经收到下车了,玩家已经收到下车的消息,不管该消息
         *
         * varint32 新的场景的id
         * varint32 切换场景时,战车的版本号
         */
        public static const S2C_ZHAN_CHE_CHANGE_SCENE : String = "98_81";

        /**
         * 战车进入场景了
         *
         * varint32 新的场景的id,如果当前加载出来的场景不是该场景,重新加载
         * varint32 战车进入新的场景时,战车的版本号
         *
         * 如果没有加载完成,接着玩家收到视野里面的数据,比如收到观看的玩家的信息,自动把玩家当前位置更新到那个位置上面去
         * 如果加载完成了,还没收到视野里面的数据,没看到那个玩家则不可以移动
         */
        public static const S2C_ZHAN_CHE_SCENE_LOADED : String = "98_82";

        /**
         * 战车上人数变了,老司机才会收到
         *
         * bool true(增加一人)/false(减少一人)
         */
        public static const S2C_ZHAN_CHE_MEMBER_CHANGED : String = "98_83";

        /**
         * 国战积分变化了
         *
         * varint64 积分
         */
        public static const S2C_POINT_CHANGED : String = "98_85";

        /**
         * 国战支持
         *
         * varint32 支持的国家
         */
        public static const C2S_SUPPORT : String = "98_86";

        /**
         * 支持了
         *
         * varint32 进攻方
         * varint32 进攻方的支持人数
         * varint32 防守方
         * varint32 防守方的支持人数
         */
        public static const S2C_SUPPORT : String = "98_87";

        /**
         * 进入观战模式成功
         *
         * 记录玩家当前所在场景,后面玩家脱离观战模式时,重新加载该场景
         *
         * 玩家要退出国战模式,就重新发送进入SCENE_LOADED进入游戏就好了
         */
        public static const S2C_ENTER_WATCH_MODE : String = "98_90";

        /**
         * 进入观战的场景
         *
         *  如果此前该玩家不在该场景,服务器会先把该玩家踢出该场景,再加入新的场景
         *  如果此前该玩家在该场景,服务器会根据后面带的参数来决定玩家会进入自己控制模式还是观战模式
         *
         * varint32 普通场景id
         * varint32 国家
         *
         * if(buffer.readable()){
         *      varint64 要观战的人,如果这个人不在这个场景,会在你进入场景以后会发送一条其他的消息,告诉你要看的人在哪个场景
         *
         *      如果玩家不在你想要进入的这个场景,服务器会返回失败
         * }
         */
        public static const C2S_ENTER_WATCH_SCENE : String = "98_91";

        /**
         * 进入场景成功
         *
         * varint32 普通场景id
         * varint32 国家
         * varint32 x
         * varint32 y
         *
         * if(buffer.readable()){
         *      varint64 要观战的人,如果这个人在这个场景,如果这个人在你视野里面,视野中心挪到该玩家身上,如果这个玩家没找到,客户端可以来请求玩家信息,然后离开该场景,然后再进入
         * }
         */
        public static const S2C_ENTER_WATCH_SCENE : String = "98_92";

        /**
         * 玩家观战某个玩家但是进入失败
         *
         * varint64 玩家的id,客户端可以再请求玩家的位置,再申请进入场景
         *
         * 1.该玩家不在该场景,客户端可以来请求该玩家在哪个位置
         * 2.该玩家没有进入该场景,客户端可以每2秒来请求一次该玩家的位置,然后再发送观战消息
         * 3.该玩家已经离线了,客户端可以跳转到下一个玩家
         */
        public static const S2C_ENTER_WATCH_SCENE_FAIL_AND_RETURN_TARGET_INFO : String = "98_93";

        /**
         * 玩家进入失败,需要重新选择
         *
         * varint32 错误类型
         *
         * 1. 当前没在观战模式
         * 2. 要进入的目标场景没有找到
         * 3. 要进入的场景不是国战场景
         * 4. 发送了一个未知的国家
         * 5. 当前没在国战中
         * 6. 当前国战没开始
         * 7. 请先离开原来的观战场景
         *
         * 100. 服务器bug
         */
        public static const S2C_ENTER_WATCH_SCENE_FAIL : String = "98_194";

        /**
         * 请求离开观战场景,客户端想要切场景,先要发送离开,否则离不开,如果玩家想离开观战模式,也要先发送离开观战场景,然后再进入此前的场景
         */
        public static const C2S_LEAVE_WATCH_SCENE : String = "98_94";

        /**
         * 离开观战成功,然后干你想干的
         */
        public static const S2C_LEAVE_WATCH_SCENE : String = "98_95";

        /**
         * 变更观战位置以及观战的人,该功能操作有MiscDataProto.change_pos_cd秒的cd
         *
         * varint64 要观战的目标
         *
         * if(要观战的目标的位置 == 0){
         *      varint32 x
         *      varint32 y
         * }
         */
        public static const C2S_CHANGE_WATCH_POS : String = "98_96";

        /**
         * 变更观战位置以及观战的人成功,默认加一个MiscDataProto.change_pos_cd
         *
         * varint64 要观战的目标
         * varint32 当前的位置x
         * varint32 当前的位置y
         */
        public static const S2C_CHANGE_WATCH_POS : String = "98_97";

        /**
         * 我想知道某个官员人在哪个位置
         *
         * varint64 想要看玩家的id
         */
        public static const C2S_GET_HERO_POSITION : String = "98_100";

        /**
         * 你想看的人在某个位置
         *
         * varint64 玩家id
         *
         * bool 是否离线了(true[离线了]/false[没有离线])
         *
         * if(!没有离线){
         *      varint32 玩家所在场景id
         *      varint32 场景所属国家
         *      bool 当前是否有进入场景,如果没有进入场景,且客户端有需要,玩家需要可以定时来请求
         * }
         */
        public static const S2C_GET_HERO_POSITION : String = "98_101";

        /**
         * 开启或者关闭弹幕
         *
         * bool true(开启)/false(关闭)
         */
        public static const C2S_TRY_OPEN_OR_CLOSE_DAN_MU : String = "98_102";

        /**
         * 开启或者关闭弹幕
         *
         * bool true(开启)/false(关闭)
         */
        public static const S2C_TRY_OPEN_OR_CLOSE_DAN_MU : String = "98_103";

        /**
         * 尝试发送弹幕
         *
         * bytes 要发送的数据,长度不能够超过50个字节同时按照策划文档限制字节长度
         */
        public static const C2S_SEND_DAN_MU : String = "98_104";

        /**
         * 发送弹幕成功,客户端给该玩家加上cd,设置下次能够发送弹幕的时间
         */
        public static const S2C_SEND_DAN_MU : String = "98_105";

        /**
         * 弹幕类容
         *
         * bytes 弹幕内容
         */
        public static const S2C_SEND_DAN_MU_BROADCAST : String = "98_106";

        /**
         * 当前有参拜
         *
         * varint64 参拜结束时间
         */
        public static const S2C_HAS_ADMIRE : String = "98_107";

        /**
         * 请求被观战的国家的官员,请求不要过于频繁,cd5秒
         */
        public static const C2S_GET_WATCH_WAR_COUNTRY_OFFICE : String = "98_110";

        /**
         * 返回国战官员
         *
         * 解压缩
         *
         * bytes WatchWarCountryOfficeProto
         */
        public static const S2C_GET_WATCH_WAR_COUNTRY_OFFICE : String = "98_111";

    }
}