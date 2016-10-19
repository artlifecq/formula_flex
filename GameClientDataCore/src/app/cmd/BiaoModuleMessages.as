package app.cmd {

    public class BiaoModuleMessages {

        /**
         * 解锁个人镖车功能：
         * <p>
         * FunctionType
         * <p>
         * ...
         * FUNC_PERSONAL_BIAO = 24; // 个人镖车
         * ...
         * <p>
         * 镖车配置数据，请参考
         * biao_config.proto
         * <p>
         * 镖车客户端其他数据，请参考
         * biao_client.proto
         * <p>
         * 镖车数据重置
         * <p>
         * BiaoModuleObjClientProto，将todayAcessPersonalBiaoTimes重置为空
         * <p>
         * ====================================
         * <p>
         * 上线的时候会给你发送你的镖车的信息，收到这条消息说明有镖车
         * <p>
         * varint32 场景id
         * varint32 场景所属国家
         * varint64 过期时间
         * varint32 镖车品质
         * varint32 x
         * varint32 y
         * <p>
         * varint64 生命值
         * varint64 最大生命值
         * varint64 移动速度
         * <p>
         * varint32 镖车类型 即 BiaoType
         * <p>
         * if(镖车类型 == BiaoType.PERSONAL){
         *      bool 镖车是否是损毁，客户端显示损毁的镖车
         *      varint32 下一个要验镖的npc的下标, check_biao_npcs中的下标,当越界了,就是可以交镖了
         *
         *      while(buffer.readable()){
         *          varint32 刷新的npc的配置id
         *          varint32 刷新的次数
         *      }
         * }
         */
        public static const S2C_BIAO_STATUS_WHEN_ONLINE : String = "108_0";

        /**
         * 镖车被摧毁的次数，上线会推送一次，后面还是会有推送，完成一次运镖，客户端重置为0
         * <p>
         * varint32 镖车被摧毁的次数
         */
        public static const S2C_BIAO_DESTROY_TIMES : String = "108_1";

        /**
         * 请求运镖成功
         * <p>
         * varint32 新的运镖次数
         * varint64 移动速度
         */
        public static const S2C_REQUEST_PERSONAL_BIAO : String = "108_2";

        /**
         * 请求运镖失败，返回varint32错误码
         * <p>
         * 1. 不在本国普通场景
         * 2. 不在1线
         * 3. 已经接取了
         * 4. 没找到npc
         * 5. 距离npc过远
         * 6. 功能没开放
         * 7. 服务器bug
         * 8. 当前没次数了
         * 9. 银两不够
         * 10. 绑银不够
         * 11. 物品不够
         * 12. npc无法接取个人镖车
         */
        public static const S2C_REQUEST_PERSONAL_BIAO_FAIL : String = "108_3";

        /**
         * 你的镖车停止了
         * <p>
         * varint32 场景id
         * varint32 所有线
         * varint32 场景所属国家
         * varint32 x
         * varint32 y
         */
        public static const S2C_BIAO_STOP : String = "108_4";

        /**
         * 你的镖车更随了，在你视野里面
         */
        public static const S2C_BIAO_FOLLOW : String = "108_5";

        /**
         * 你的镖车消失了(时间到了)
         */
        public static const S2C_BIAO_DISAPPEAR : String = "108_6";

        /**
         * 镖车被伤害了
         * <p>
         * varint64 当前血量
         * varint64 最大血量
         */
        public static const S2C_BIAO_BEEN_HURT : String = "108_7";

        /**
         * 镖车挂了
         */
        public static const S2C_BIAO_DEAD : String = "108_8";

        /**
         * 镖车破损了，新的镖车要刷出来了，准备好啊
         * <p>
         * varint64 场景id
         * varint32 场景所属国家
         * varint32 x
         * varint32 y
         * <p>
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 移动速度
         */
        public static const S2C_BIAO_BROKEN : String = "108_9";

        /**
         * 刷新成功
         * <p>
         * varint32 刷新的npcId，客户端标记该npc被刷新的次数+1
         * varint64 下次刷新时间
         */
        public static const S2C_REFRESH_BIAO : String = "108_10";

        /**
         * 刷新失败
         * <p>
         * 1. 不在本国普通场景
         * 2. npc没找到
         * 3. 玩家距离npc过远
         * 4. 没有镖车
         * 5. npc不可以刷新镖车
         * 6. 该npc刷新次数已经很多了
         * 7. 服务器bug
         * 8. 镖车距离npc过远
         */
        public static const S2C_REFRESH_BIAO_FAIL : String = "108_11";

        /**
         * 品质变更了，客户端收到该消息，变更场景中对象的外观
         * <p>
         * varint64 场景中的id
         * varint32 品质
         */
        public static const S2C_CHANGE_QUALITY : String = "108_12";

        /**
         * 完成运镖成功
         * <p>
         * 不带任何其他参数
         */
        public static const S2C_COMPLETE_BIAO : String = "108_13";

        /**
         * 完成运镖失败，返回varint32错误码
         * <p>
         * 1. 不在本国普通场景
         * 2. npc没找到
         * 3. 玩家距离npc过远
         * 4. 没有镖车
         * 5. 镖车距离npc过远
         * 6. 不能托运破损的镖车
         * 7. 不是王帮成员不可以托运
         * 8. 每日托运次数达到了上限了
         * 9. 还没有验完所有镖
         */
        public static const S2C_COMPLETE_BIAO_FAIL : String = "108_14";

        /**
         * 视野中添加一台镖车
         * <p>
         * varint64 镖车id
         * utf 镖车名字
         * varint32 等级
         * varint32 镖车品质
         * varint64 主人id
         * utf 主人名字
         * bool 是否是无敌镖车
         * bool 是否破损
         * bool 是否是国运期间接的镖车
         * varint32 接受时花费了多少数值型的钱,用于计算投保时候的显示
         * bool 是否投保
         * <p>
         * 后面数据是个通用方法
         * varint32 x点
         * varint32 y点
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 当前魔法值
         * varint64 最大魔法值
         * <p>
         * while(buffer.readable()){
         * stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
         * currentStackCount = byteArray.readVarInt32() // 这个状态的层数
         * disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         * }
         */
        public static const S2C_ADD_BIAO : String = "108_15";

        /**
         * 传送到镖车
         */
        public static const S2C_TRANSPORT_TO_BIAO : String = "108_16";

        /**
         * 放弃镖车
         */
        public static const C2S_GIVE_UP_PERSONAL_BIAO : String = "108_17";

        /**
         * 放弃成功
         */
        public static const S2C_GIVE_UP_PERSONAL_BIAO : String = "108_18";

        /**
         * 放弃失败，返回varint32错误码
         * <p>
         * 1. 没有镖车
         */
        public static const S2C_GIVE_UP_PERSONAL_BIAO_FAIL : String = "108_19";

        /**
         * 获得增镖令
         */
        public static const S2C_GOT_ADD_BIAO_GOODS : String = "108_20";

        /**
         * 请求传送到自己镖车旁边
         */
        public static const C2S_TRANSPORT_TO_SELF_BIAO : String = "108_21";

        /**
         * 传送成功
         */
        public static const S2C_TRANSPORT_TO_SELF_BIAO : String = "108_22";

        /**
         * 传送失败，返回varint32错误码
         */
        public static const S2C_TRANSPORT_TO_SELF_BIAO_FAIL : String = "108_23";

        /**
         * 投保成功
         */
        public static const S2C_TOU_BAO : String = "108_30";

        /**
         * 投保失败,返回varint32错误码
         * <p>
         * 1. 镖局没有开启,无法投保
         * 2. 没有镖车,怎么投保
         * 3. 破损镖车无法投保
         * 4. 镖车投保了
         * 5. 钱不够,无法投保
         * 6. 镖车已经死亡,无法投保
         * 7. 没有足够的运营资金去投保
         * 9. 该镖车当前无法投保
         * <p>
         * 100. 服务器bug
         */
        public static const S2C_TOU_BAO_FAIL : String = "108_31";

        /**
         * 场景中某一台镖车投保了,如果该镖车在你视野里面,则将该镖车设置特效
         * <p>
         * varint64 镖车id
         */
        public static const S2C_BIAO_TOU_BAO : String = "108_32";

        /**
         * 返回本国镖局的开启状态
         * <p>
         * varint64 开始时间 时间为0，表示未开启
         * varint64 结束时间 时间为0，表示未开启
         *
         */
        public static const S2C_BIAO_JU_OPEN_INFO : String = "108_33";

        /**
         * 请求镖局数据,只有帮主才可以请求该消息
         */
        public static const C2S_GET_BIAO_JU_DATA : String = "108_40";

        /**
         * 返回镖局数据,已经压缩
         * <p>
         * 解压缩
         * <p>
         * bytes BiaoJuProto
         */
        public static const S2C_GET_BIAO_JU_DATA : String = "108_41";

        /**
         * 返回镖局数据,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.不是王帮
         */
        public static const S2C_GET_BIAO_JU_DATA_FAIL : String = "108_42";

        /**
         * 充入镖局资金
         * <p>
         * varint32 充入额度
         */
        public static const C2S_RECHARGE_BIAO_JU_MONEY : String = "108_43";

        /**
         * 充值镖局资金成功
         * <p>
         * varint64 当前总的资金
         */
        public static const S2C_RECHARGE_BIAO_JU_MONEY : String = "108_44";

        /**
         * 充入镖局资金失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.不是国王
         * 4.捐的钱数量非法
         * 5.没有足够的钱充入
         * <p>
         * 100.捐的太多了,溢出了
         */
        public static const S2C_RECHARGE_BIAO_JU_MONEY_FAIL : String = "108_45";

        /**
         * 开启镖局
         * <p>
         * boolean true(开启)/false(关闭)
         */
        public static const C2S_OPEN_BIAO_JU : String = "108_46";

        /**
         * 开启镖局失败,返回varint32错误码
         * <p>
         * 1.不是国王
         * 2.镖局已经开启了
         * 3.当前不在开启时间段
         * 4.镖局钱不够
         * 5.当前无法关闭
         */
        public static const S2C_OPEN_BIAO_JU_FAIL : String = "108_47";

        /**
         * 开启镖局广播
         * <p>
         * varint32 国家
         * <p>
         * if(buffer.readable()){
         * 开启了
         * varint64 自动结束时间
         * } else {
         * 关闭了
         * }
         */
        public static const S2C_OPEN_BIAO_JU_BROADCAST : String = "108_48";

        /**
         * 镖局每日重置
         */
        public static const S2C_BIAO_JU_RESET_DAILY : String = "108_49";

        /**
         * 请求镖局日志
         */
        public static const C2S_BIAO_JU_LOG : String = "108_50";

        /**
         * 返回镖局日志
         * <p>
         * 先解压缩压缩
         * <p>
         * bytes AllBiaoJuLogProto
         */
        public static const S2C_BIAO_JU_LOG : String = "108_51";

        /**
         * 请求镖局日志失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.不是王帮
         */
        public static const S2C_BIAO_JU_LOG_FAIL : String = "108_52";

        /**
         * 分配薪水
         * <p>
         * while(buffer.readable()){
         * varint64 玩家id
         * varint32 薪水,该值必须>0
         * }
         */
        public static const C2S_ALLOCATE_SALARY : String = "108_53";

        /**
         * 分配成功,客户端重新来请求一次数据
         */
        public static const S2C_ALLOCATE_SALARY : String = "108_54";

        /**
         * 分配失败,返回varint32错误码
         * <p>
         * 1.今日已经分配了
         * 2.当前无法分配
         * 3.不是国王
         * 4.有人不是官员
         * 5.利润不够,无法分配
         * <p>
         * 100.有人被分配了两次
         */
        public static const S2C_ALLOCATE_SALARY_FAIL : String = "108_55";

        /**
         * 上或者下镖车
         *
         * bool true(上镖车)/false(下镖车)
         *
         * if(下镖车)(
         *      varint32 下镖车的位置x
         *      varint32 下镖车的位置y
         * )
         */
        public static const C2S_UP_OR_DOWN_FROM_BIAO : String = "108_70";

        /**
         * 上下镖车成功
         *
         * bool true(上镖车)/false(下镖车)
         */
        public static const S2C_UP_OR_DOWN_FROM_BIAO : String = "108_71";

        /**
         * 上下镖车失败,返回varint32错误码
         *
         * 1.挂了无法上下车
         * 2.没有在镖车上面,无法下车
         * 3.已经在镖车上面,无法上车
         * 4.当前没有镖车
         * 5.镖车已经死了
         * 6.距离镖车过远
         * 7.当前状态无法上镖车
         * 8.距离下车地点过远
         */
        public static const S2C_UP_OR_DOWN_FROM_BIAO_FAIL : String = "108_72";

        /**
         * 上下镖车广播
         *
         * varint64 玩家id
         * bool true(上镖车)/false(下镖车)
         * if(下车){
         *      varint32 x
         *      varint32 y
         * }
         */
        public static const S2C_UP_OR_DOWN_FROM_BIAO_BROADCAST : String = "108_73";

        /**
         * 验镖成功
         *
         * varint32 下一个需要验镖的npc的下标
         */
        public static const S2C_CHECK_BIAO : String = "108_80";

        /**
         * 验镖失败,返回varint32错误码
         *
         * 1. 当前没有镖车,无法验镖
         * 2. 验镖，镖车距离npc过远
         * 3. 当前不需要验镖
         * 4. 验镖必须一步一步来
         */
        public static const S2C_CHECK_BIAO_FAIL : String = "108_81";

        /**
         * 无敌镖车回血了
         *
         * varint64 无敌镖车id
         */
        public static const S2C_INVICINBLE_BIAO_RECOVERY_LIFE : String = "108_82";

        /**
         * 弄出了个最高品质的镖车
         *
         * varint32 品质
         * varint32 玩家所属国家
         * bytes 玩家名字
         */
        public static const S2C_MAX_QUALITY_BIAO_BROADCAST : String = "108_83";

    }
}