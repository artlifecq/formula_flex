package app.cmd {

    public class MountModuleMessages {

        /**
         * 上线的时候发送当前的繁育信息
         * <p>
         * bytes StablesBreedProto
         */
        public static const S2C_MOUNT_BREED_STATUS_WHEN_ONLINE : String = "81_0";

        /**
         * 坐骑鉴定成功
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         * <p>
         * bytes MountProto 坐骑数据
         */
        public static const S2C_MOUNT_IDENTIFY : String = "81_1";

        /**
         * 鉴定失败，返回varint32错误码
         * <p>
         * 1. npc没找到
         * 2. 距离npc过远
         * 3. 没有找到坐骑
         * 4. 坐骑已经被鉴定了
         * 5. 鉴定费不够
         */
        public static const S2C_MOUNT_IDENTIFY_FAIL : String = "81_2";

        /**
         * 坐骑转化成功
         * <p>
         * varint32 被移除的坐骑
         * <p>
         * varint32 背包中的位置
         * <p>
         * bytes GoodsProto 兽牌的proto
         */
        public static const S2C_MOUNT_TRANS : String = "81_3";

        /**
         * 坐骑槽数据变更了
         * varint32 坐骑槽(第几个坐骑)
         * <p>
         * if(buffer.readable()){
         * bytes MountProto
         * }
         */
        public static const S2C_MOUNT_SLOT_CHANGED : String = "81_4";

        /**
         * 转化失败，返回varint32错误码
         * <p>
         * 3. 没有找到坐骑
         * 4. 坐骑未被鉴定了
         * 5. 玩家等级低于携带等级
         * 6. 无效的物品放置位置
         * 7. 服务器bug
         * 8. 坐骑不能穿装备
         */
        public static const S2C_MOUNT_TRANS_FAIL : String = "81_5";

        /**
         * 坐骑状态设置
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         * varint32 状态 MountStatus(0，不出战，不训练，1 训练， 2 出战)
         */
        public static const C2S_MOUNT_STATUS : String = "81_6";

        /**
         * 设置成功
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         * varint32 状态 MountStatus(0，不出战，不训练，1 训练， 2 出战)
         * <p>
         * 如果此前有出战坐骑，客户端调整此前出战的坐骑的状态为0，不出战，不训练
         * <p>
         * 将该坐骑槽上的坐骑设置为新的状态
         */
        public static const S2C_MOUNT_STATUS : String = "81_7";

        /**
         * 设置坐骑状态失败，返回varint32错误码
         * <p>
         * 1. 槽位上面竟然没有坐骑
         * 2. 坐骑没有鉴定
         * 3. 等级不够，无法操作
         * 4. 未知的状态
         * 5. 要设置的状态跟当前状态是一致的
         * 6. 当前能够训练的坐骑数量已满
         * 7. 坐骑等级过低，无法操作
         * 8. 当前坐骑处于上马状态,请先下马
         */
        public static const S2C_MOUNT_STATUS_FAIL : String = "81_8";

        /**
         * 上马/下马
         * <p>
         * bool true(上马)/false(下马)
         */
        public static const C2S_MOUNT_RIDE : String = "81_12";

        /**
         * 上马/下马成功
         * <p>
         * bool true(上马)/false(下马)
         */
        public static const S2C_MOUNT_RIDE : String = "81_13";

        /**
         * 上下马失败，返回 varint32 错误码
         * <p>
         * 1. 施法中，无法上下马
         * 2. 击晕或者定身
         * 3. 没有出战坐骑
         * 4. 该场景不能上马
         * 5. 上下马cd没到
         * 6. 坐骑太饿了
         * 7. 当前状态无法上马
         */
        public static const S2C_MOUNT_RIDE_FAIL : String = "81_14";

        /**
         * 坐骑放生
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         */
        public static const C2S_MOUNT_RELEASE : String = "81_15";

        /**
         * 放生成功
         */
        public static const S2C_MOUNT_RELEASE : String = "81_16";

        /**
         * 放生失败，返回varint32错误码
         * <p>
         * 1. 要放生的坐骑非法
         * 2. 该坐骑正在骑乘中，请先下马
         * 3. 服务器bug
         */
        public static const S2C_MOUNT_RELEASE_FAIL : String = "81_17";

        /**
         * 坐骑喂养
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         * <p>
         * varint32 背包中的位置
         * varint32 喂养个数
         * varint32 物品的id，防止喂错了
         */
        public static const C2S_MOUNT_FEED : String = "81_18";

        /**
         * 喂养成功
         */
        public static const S2C_MOUNT_FEED : String = "81_19";

        /**
         * 喂养失败，返回varint32错误码
         * <p>
         * 1. 没有找到坐骑
         * 2. 没有鉴定
         * 3. 玩家等级低于坐骑携带等级
         * 4. 无效的喂养物品的位置
         * 5. 物品正在交易中
         * 6. 物品没找到
         * 7. 物品已经过期了
         * 8. 物品不够
         * 9. 要喂养的物品跟你想喂养的物品不同
         * 10. 不饿
         * 11. 当前等级已经达到能够达到的上限了
         * 12. 服务器bug
         * 13. 该装备无法喂食
         */
        public static const S2C_MOUNT_FEED_FAIL : String = "81_20";

        /**
         * 坐骑饥饿度变化了
         * <p>
         * varint32 坐骑槽(第几个坐骑)
         * varint32 新的饥饿度
         */
        public static const S2C_MOUNT_HUNGER_DEGREE_CHANGED : String = "81_21";

        /**
         * 坐骑强化
         * <p>
         * varint32 哪个坐骑
         * bool 使用背包中的物品
         * if(使用背包中的物品){
         * varint32 背包中的位置
         * } else {
         * varint32 目标坐骑
         * }
         */
        public static const C2S_MOUNT_REFINE : String = "81_23";

        /**
         * 坐骑强化完了
         * <p>
         * varint32 哪个坐骑
         * varint32 vitality 新的根骨
         * varint64 新的根骨经验
         */
        public static const S2C_MOUNT_REFINE : String = "81_24";

        /**
         * 坐骑强化失败，返回varint32错误码
         * <p>
         * 1. 要强化的坐骑没找到
         * 2. 要强化的坐骑没有鉴定
         * 3. 玩家等级低于坐骑携带等级
         * 4. 没有找到坐骑强化的配置数据
         * 5. 强化非法
         * 6. 目标坐骑没有找到
         * 7. 目标坐骑未鉴定
         * 8. 玩家等级低于目标坐骑携带等级
         * 9. 目标坐骑根骨条件不满足
         * 10. 目标坐骑不能是出战坐骑
         * 11. 服务器bug
         * 12. 物品没有找到
         * 13. 兽牌根骨条件不满足
         * 14. 锻骨丹根骨条件不满足
         * 15. 该物品不能用来强化坐骑
         * 16. 银两不足
         * 17. 成年马不能强化
         */
        public static const S2C_MOUNT_REFINE_FAIL : String = "81_25";

        /**
         * 坐骑技能学习
         * <p>
         * varint32 哪个坐骑
         * <p>
         * varint32 背包中的位置
         */
        public static const C2S_MOUNT_LEARN_SPELL : String = "81_26";

        /**
         * 学习技能成功
         * <p>
         * varint32 哪个坐骑
         * varint32 技能槽
         * varint32 技能书在背包中的位置下标,客户端将该位置的物品数量减1,如果当前剩余数量<=0,将物品从背包删除
         * varint32 技能书id
         */
        public static const S2C_MOUNT_LEARN_SPELL : String = "81_27";

        /**
         * 学习技能书失败，返回varint32错误码
         * <p>
         * 1. 坐骑没找到
         * 2. 坐骑没鉴定
         * 3. 玩家等级低于坐骑携带等级
         * 4. 技能书没找到
         * 5. 技能书学满了/或者技能书等级过低
         */
        public static const S2C_MOUNT_LEARN_SPELL_FAIL : String = "81_28";

        /**
         * 交给npc成功
         */
        public static const S2C_MOUNT_BREED_TO_NPC : String = "81_29";

        /**
         * 发送邀请者将坐骑交给了npc
         * <p>
         * bytes 解析成MountProto
         */
        public static const S2C_SEND_MOUNT_BREED_TO_NPC_TO_TARGET : String = "81_30";

        /**
         * 交给npc失败，返回varint32错误码
         * <p>
         * 1. 坐骑有装备,无法繁育
         * 2. 坐骑没找到
         * 3. 坐骑未鉴定
         * 4. 玩家等级过低
         * 5. 坐骑出战中
         * 6. 当前有繁育或者邀请
         * 7. 坐骑已经繁育过了
         * 8. 坐骑饱食度不够
         * 9. 没有任何邀请
         * 10. 邀请过期了
         * 11. 相同性别无法繁育
         * 12. 不是宝宝马,无法繁育
         * 13. 物种不同,无法繁育
         */
        public static const S2C_MOUNT_BREED_TO_NPC_FAIL : String = "81_31";

        /**
         * 邀请别人繁育
         * <p>
         * varint64 目标的id
         */
        public static const C2S_MOUNT_INVITE_OTHER_BREED : String = "81_32";

        /**
         * 邀请别人成功，等待别人回复
         */
        public static const S2C_MOUNT_INVITE_OTHER_BREED : String = "81_33";

        /**
         * 邀请失败，返回varint32错误码
         * <p>
         * 1. 你无法邀请他人
         * 2. 目标不在线
         * 3. 目标不是本国的
         * 4. 目标不能是本人
         * 5. 当前已经被邀请了或者当前自己在繁育
         * 6. 服务器bug
         * 7. 上次邀请没过期，请等待对方回应
         * 8. 当前已经无法在设置邀请对象了
         * 9. 当前没有繁育
         */
        public static const S2C_MOUNT_INVITE_OTHER_BREED_FAIL : String = "81_34";

        /**
         * 其他人邀请你繁育了
         * <p>
         * varint64 过期时间
         * varint64 邀请者的id
         * bytes 邀请者的名字
         */
        public static const S2C_MOUNT_OTHER_INVITE_YOU : String = "81_35";

        /**
         * 拒绝邀请
         * <p>
         * varint64 邀请者的id
         */
        public static const C2S_MOUNT_REFUSE_OTHER_INVITE_YOU : String = "81_36";

        /**
         * 拒绝成功
         */
        public static const S2C_MOUNT_REFUSE_OTHER_INVITE_YOU : String = "81_37";

        /**
         * 拒绝失败，返回varint32错误码
         * <p>
         * 1. 没有被邀请
         * 2. 当前情况下，无法拒绝
         * 3. 服务器bug
         */
        public static const S2C_MOUNT_REFUSE_OTHER_INVITE_YOU_FAIL : String = "81_38";

        /**
         * 邀请被拒绝
         * <p>
         * varint64 目标的id，用于区分
         * bytes 目标的名字
         */
        public static const S2C_MOUNT_TARGET_REFUSE_YOU : String = "81_39";

        /**
         * 锁定
         */
        public static const C2S_MOUNT_BREED_LOCK : String = "81_40";

        /**
         * 锁定成功
         * <p>
         * varint64 id
         */
        public static const S2C_MOUNT_BREED_LOCK : String = "81_41";

        /**
         * 锁定失败，返回varint32错误码
         * <p>
         * 1. 当前没有繁育
         * 2. 当前无法锁定
         * 3. 当前已经锁定了
         */
        public static const S2C_MOUNT_BREED_LOCK_FAIL : String = "81_42";

        /**
         * 坐骑繁育进入到生宝宝阶段了，客户端将该繁育设置为当前正在生宝宝,将繁育马设置为已繁育
         * <p>
         * varint64 可以领取宝宝的时间
         */
        public static const S2C_MOUNT_BREED_MAKE_LOVE : String = "81_43";

        /**
         * 请求我当前繁育出来的宝宝
         */
        public static const C2S_MOUNT_GET_BREED_BABY_MOUNT : String = "81_44";

        /**
         * 返回我繁育出来的宝宝
         * <p>
         * bytes MountProto
         */
        public static const S2C_MOUNT_GET_BREED_BABY_MOUNT : String = "81_45";

        /**
         * 请求我当前的宝宝失败，返回varint32错误码
         * <p>
         * 1. 没有繁育
         * 2. 当前没有宝宝产生
         * 3. 服务器bug
         * 4. 请求过于频繁
         */
        public static const S2C_MOUNT_GET_BREED_BABY_MOUNT_FAIL : String = "81_46";

        /**
         * 取消繁育，当前状态必须不是MAKE_LOVE，其他的都行，同时领取坐骑回去
         * <p>
         * varint32 空槽位
         */
        public static const C2S_MOUNT_BREED_CANCEL : String = "81_47";

        /**
         * 取消繁育成功
         * <p>
         * varint32 槽位
         * bytes EquipedMountProto 坐骑
         */
        public static const S2C_MOUNT_BREED_CANCEL : String = "81_48";

        /**
         * 取消繁育失败，返回varint32错误码
         * <p>
         * 1. 当前没有繁育
         * 2. 没有空位置放置你的坐骑
         * 3. 已经取回去了啊
         * 4. 当前已经在繁育了，无法取消
         * 5. 服务器bug
         */
        public static const S2C_MOUNT_BREED_CANCEL_FAIL : String = "81_49";

        /**
         * 他人取消繁育了，将本次繁育设置为已经取消，你自己只能够把坐骑领回去了
         */
        public static const S2C_MOUNT_OTHER_BREED_CANCEL : String = "81_50";

        /**
         * 领取宝宝坐骑，当前状态必须是MAKE_LOVE，且当前时间必须>=坐骑出生时间
         * <p>
         * varint32 繁育马槽位
         * varint32 宝宝马槽位
         */
        public static const C2S_COLLECT_BABY_MOUNT : String = "81_51";

        /**
         * 领取坐骑成功
         * <p>
         * varint32 繁育马槽位
         * varint32 繁育马数据长度
         * bytes EquipedMountProto 繁育马
         * varint32 宝宝马槽位
         * bytes MountProto 宝宝马
         */
        public static const S2C_COLLECT_BABY_MOUNT : String = "81_52";

        /**
         * 领取宝宝马失败，返回varint32错误码
         * <p>
         * 1. 没有繁育
         * 2. 已经领取了
         * 3. 没有空位放置你的繁育马
         * 4. 没有空位放置你的宝宝马
         * 5. 服务器bug
         * 6. 还没有繁育出宝宝马
         */
        public static const S2C_COLLECT_BABY_MOUNT_FAIL : String = "81_53";

        /**
         * 经验变化
         * <p>
         * varint32 坐骑槽位
         * varint32 当前等级
         * varint64 当前经验
         */
        public static const S2C_MOUNT_ADD_EXP : String = "81_54";

        /**
         * 坐骑采集物出现了
         * <p>
         * varint64 id
         * varint32 x
         * varint32 y
         * varint64 保护结束时间(这个时间以后就可以采集了)
         * varint32 坐骑物种
         */
        public static const S2C_DROP_MOUNT_COLLECT_OBJ : String = "81_55";

        /**
         * 内容同S2C_DROP_MOUNT_COLLECT_OBJ
         */
        public static const S2C_SEE_MOUNT_COLLECT_OBJ : String = "81_56";

        /**
         * 开始收集采集物，如果没有发送S2C_COLLECT_MOUNT_COLLECT_OBJ_FAIL，会发送给客户端一个进入读条的消息，
         * 读条结束，会发送S2C_COLLECT_MOUNT_COLLECT_OBJ
         * <p>
         * varint64 id
         */
        public static const C2S_COLLECT_MOUNT_COLLECT_OBJ : String = "81_57";

        /**
         * 采集成功，不附带其他任何参数
         */
        public static const S2C_COLLECT_MOUNT_COLLECT_OBJ : String = "81_58";

        /**
         * 采集失败，返回varint32错误码
         * <p>
         * 1. 没找到可以采集的坐骑
         * 2. 空位不够
         * 3. 已经被别人采集了
         * 4. 当前无法采集
         * 5. 距离过远
         */
        public static const S2C_COLLECT_MOUNT_COLLECT_OBJ_FAIL : String = "81_59";

        /**
         * 坐骑继承成功
         *
         * varint32 继承的坐骑
         * varint32 继承的坐骑新的根骨
         * varint64 继承的坐骑新的根骨经验
         * bool 是否继承根骨经验
         * bool 是否继承技能
         *
         * bool 坐骑是来自背包还是坐骑槽
         *
         * if(坐骑是来自背包){
         *      varint32 背包中的哪个格子
         * } else {
         *      varint32 坐骑槽下标
         * }
         */
        public static const S2C_MOUNT_INHERIT : String = "81_61";

        /**
         * 坐骑继承失败,返回varint32错误码
         * <p>
         * 1. 要强化的坐骑没找到
         * 2. 要强化的坐骑没有鉴定
         * 3. 玩家等级低于坐骑携带等级
         * 4. 要么继承经验,要么继承技能
         * 5. 坐骑根骨已满
         * 6. 目标坐骑没有找到
         * 7. 目标坐骑未鉴定
         * 8. 玩家等级低于目标坐骑携带等级
         * 10. 目标坐骑不能是出战坐骑
         * 11. 服务器bug
         * 12. 物品没有找到
         * 15. 该物品不能用来强化坐骑
         * 16. 绑银不足
         */
        public static const S2C_MOUNT_INHERIT_FAIL : String = "81_62";

    }
}