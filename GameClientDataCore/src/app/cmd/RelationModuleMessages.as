package app.cmd {

    public class RelationModuleMessages {

        /**
         * 基本的关系数据
         *
         * bytes ClientRelation
         */
        public static const S2C_BASIC_RELATION : String = "11_1";

        /**
         * 请求好友数据. 只请求一次. 后面不需要附带数据.
         */
        public static const C2S_GET_RELATIONS : String = "11_2";

        /**
         * 返回所有关系中每个人的具体信息. 每个人只会存在一次. 附带个AllClientRelationDetail的proto
         *
         * 消息内容已经压缩
         *
         * bytes 压缩后的AllClientRelationDetail
         *
         * 解压方式：
         *  data = readBytes();
         *  data = data.uncomplre();
         *  AllClientRelationDetail clientRelation = AllClientRelationDetail.parseFrom(data);
         */
        public static const S2C_REPLY_RELATION_DETAIL : String = "11_3";

        /**
         * 获取好友关系出错, 附带varint32的错误码
         *
         * 1. 服务器错误, 过会再试
         * 2. 已经获取过一次好友关系了
         */
        public static const S2C_REPLY_RELATIONS_ERROR : String = "11_4";

        /**
         * 请求添加好友, 附带varint64的目标id
         *
         * varint64 目标id
         *
         *  无论后续是否添加好友成功   只要客户端发了这条消息 如果这个Id在你的黑名单中或者仇人中 都要将他从黑名单中或者仇人中 移除掉
         */
        public static const C2S_ADD_FRIEND : String = "11_5";

        /**
         * 发送添加好友成功，等待对方回复，不附带任何别的参数
         */
        public static const S2C_SEND_ADD_FRIEND_SUCCESS : String = "11_6";

        /**
         * 你被别人添加好友了，等待你回复，该请求30秒后过期
         *
         * varint64 加我的人的id
         * varint32 level
         * varint32 country
         * bytes 加我的人的名字
         */
        public static const S2C_ADD_FRIEND_WAIT_REPLY : String = "11_7";

        /**
         * 添加好友失败, 附带varint32的错误码
         *
         * 1. id不存在
         * 2. 好友满
         * 3. 已经是你的好友了
         * 4. 不能加自己
         * 5. 不能加这个人 (跨服啥的)
         * 6. 服务器出错, 稍后再试
         * 7. 在你黑名单中, 无法添加
         * 8. 对方设置了禁止被加好友
         * 9. 目标不在线
         * 10. 在目标的黑名单中， 无法添加
         * 11. 你刚刚才加了对方
         * 12. 目标好友满
         */
        public static const S2C_FRIEND_ADD_FAIL : String = "11_8";

        /**
         * 回复加好友
         *
         * varint64 回复谁的加好友请求
         * bool 是否同意[true 同意， false 不同意]
         *
         * 无论后续是否添加好友成功   只要客户端发了这条消息 并且bool=true  如果这个Id在你的黑名单中或者仇人中 都要将他从黑名单中或者仇人中 移除掉
         */
        public static const C2S_REPLY_ADD_FRIEND : String = "11_9";

        /**
         * 回复加好友请求失败，附带varint32错误码
         *
         * 1. 服务器内部错误
         * 2. 目标不存在
         * 3. 目标已经是你的好友了
         * 4. 目标在我的黑名单
         * 5. 好友列表已满
         * 6. 你被目标屏蔽了
         * 7. 目标好友列表已满
         * 8. 目标的邀请已经过期
         */
        public static const S2C_REPLY_ADD_FRIEND_FAIL : String = "11_10";

        /**
         * 拒绝添加好友成功，不附带其他参数
         */
        public static const S2C_REFUSE_ADD_FRIEND_SUCCESS : String = "11_11";

        /**
         * 回复加好友成功，返回目标的数据
         *
         * bool 是否在线
         * bytes SingleRelation
         */
        public static const S2C_AGREE_ADD_FRIEND_SUCCESS : String = "11_12";

        /**
         * 他人拒绝加你好友
         *
         * varint64 别人的id
         * bytes 别人的名字
         */
        public static const S2C_OTHER_REFUSE_ADD_FRIEND : String = "11_13";

        /**
         * 他人同意加好友，此时该人在线
         *
         * bool 是否在线
         * bytes SingleRelation
         */
        public static const S2C_OTHER_AGREE_ADD_FRIEND : String = "11_14";

        /**
         * 删除好友
         *
         * 附带varint64 的好友id
         */
        public static const C2S_REMOVE_FRIEND : String = "11_15";

        /**
         * 删除好友成功
         *
         * 附带varint64 的好友id
         */
        public static const S2C_FRIEND_REMOVED : String = "11_16";

        /**
         * 有人删除把你从他的好友列表里删除了, 如果已经收到好友信息, 则移除该好友
         *
         * varint64 移除你的人，你顺便把他也移除了
         */
        public static const S2C_OTHER_REMOVED_YOU_AS_FRIEND : String = "11_17";

        /**
         * 删除好友错误. 附带个varint32 的错误码
         *
         * 1. 这个id不在你的黑名单列表中
         * 2. 服务器内部错误
         */
        public static const S2C_FRIEND_REMOVE_FAIL : String = "11_18";

        /**
         * 添加黑名单
         *
         * 附带varint64 的角色id
         */
        public static const C2S_ADD_BLACK : String = "11_19";

        /**
         * 添加黑名单成功
         *
         * bool 是否在线
         * bytes SingleRelation
         *
         * 注意 ：客户端需要判断 如果这个人之前是你的好友 则要把他从好友列表中移除掉
         */
        public static const S2C_BLACK_ADDED : String = "11_20";

        /**
         * 添加黑名单失败, 附带varint32的失败原因
         *
         * 1. id不存在
         * 2. 已经在黑名单里了
         * 3. 不能加自己
         * 4. 不能加这个人 (跨服啥的)
         * 5. 服务器出错, 稍后再试
         * 6. 屏蔽名单已满
         * 7. 是你好友
         */
        public static const S2C_BLACK_ADD_FAIL : String = "11_21";

        /**
         * 移除黑名单
         *
         * varint64 移除的英雄id
         */
        public static const C2S_REMOVE_BLACK : String = "11_22";

        /**
         * 删除黑名单错误
         *
         * 1. id不存在
         * 2. 服务器内部错误
         */
        public static const S2C_BLACK_REMOVE_FAIL : String = "11_23";

        /**
         * 移除黑名单成功
         *
         * varint64 id
         */
        public static const S2C_BLACK_REMOVED : String = "11_24";

        /**
         * 关系列表中某人的状态发生改变.
         *
         * 如果没有收到过好友列表详细信息, 则不需要保存此条信息中附带的状态.
         *
         * 如果有收到过：
         *  如果此人之前不在线, 那在把对方的信息改成消息中附带的信息的同时, 需要弹出提示, 说xxx上线了.
         *  如果策划有需要弹出提示说好友xxx上线了，客户端自己进行判断提示
         *
         * 附带SingleRelation的proto
         */
        public static const S2C_RELATION_DETAIL_CHANGED : String = "11_25";

        /**
         * 不过是否请求过好友面板信息
         *
         * 如果没收到好友列表详细信息，不处理
         *
         * 如果已经收到了好友列表详细信息(收到, 不是请求), 则需要把此人的状态设为不在线
         *
         * 如果关系列表中有人下线, 客户端都会收到这条消息. 需要根据策划需求弹出相应的提示.
         *
         * 附带
         *
         * varint64 id
         * bytes 名字
         */
        public static const S2C_RELATION_OFFLINE : String = "11_26";

        /**
         * 设置 禁止被加为好友，服务器没有回应
         *
         * 设置 禁止被加为好友后，已经加我为好友的，不受任何影响
         *
         * bool 是否禁止 (true 禁止被加为好友)
         */
        public static const C2S_SET_FORBID_BEEN_ADDED_AS_FRIEND : String = "11_27";

        /**
         *  编辑心情
         *
         * utf 心情
         *
         */
        public static const C2S_EDITOR_MOOD : String = "11_28";

        /**
         *  编辑心情
         *
         * 成功
         */
        public static const S2C_EDITOR_MOOD : String = "11_29";

        /**
         *  编辑心情失败
         *  1  服务器内部错误 稍后再试
         *  2  长度非法（服务器限制最多100个字节）
         *
         */
        public static const S2C_EDITOR_MOOD_FAIL : String = "11_30";

        /**
         * 送花给好友
         *
         * varint64 的好友id
         * varint32 鲜花ID
         * varint32 送花个数
         * UpgradeProto 送花物品的proto
         */
        public static const C2S_SEND_FLOWERS : String = "11_31";

        /**
         * 送花给好友成功
         *
         */
        public static const S2C_SEND_FLOWERS : String = "11_32";

        /**
         * 送花给好友失败
         * 附带varint32的错误码
         *
         * 1. id不存在
         * 2. 服务器出错, 稍后再试
         * 3. 不是你好友
         * 4. 道具非法
         * 5. 好友不在线
         * 6. 道具不足
         * 7. 好友度满了
         */
        public static const S2C_SEND_FLOWERS_FAILS : String = "11_33";

        /**
         *  好友度更新
         * varint64 的好友id
         * varint32 最新好友度
         */
        public static const S2C_DEGREE_UPDAE : String = "11_34";

        /**
         * 删除仇人
         *
         * 附带varint64 的好友id
         */
        public static const S2C_ENEMY_REMOVED : String = "11_35";

        /**
         * 添加仇人
         * boolean targetIsOnline
         * varint32 singleRelation的长度
         * SingleRelation singleRelation
         * 附带EnemyProto
         */
        public static const S2C_ENEMY_ADD : String = "11_36";

        /**
         * 更新仇人信息
         *
         * 附带EnemyProto
         */
        public static const S2C_ENEMY_UPDATE : String = "11_37";

    }
}