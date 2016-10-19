package app.cmd {

    public class ChatModuleMessages {

        /**
         * 请求发送世界聊天, 请求后, 不要直接清掉聊天框中的消息把消息放到世界频道中, 而要等待服务器返回
         * 服务器返回前, 需要锁定聊天栏, 不让他继续输入, 按回车忽略, 点击发送忽略(不要把按钮做成不可点击).
         *
         * 客户端发送前就需要检查 等级/频率/长度. 不符合的就本地弹出错误消息.
         *
         * 附带 ChatMessage这个proto
         */
        public static const C2S_WORLD_CHAT : String = "12_1";

        /**
         * 世界聊天发送成功, 后面没有附带的信息. 客户端自己把聊天栏中的话放到世界频道中
         * 发送者只会收到发送成功消息, 别人会收到S2C_WORLD_CHAT_BROADCAST广播消息. 发送者不会收到广播消息
         */
        public static const S2C_WORLD_CHAT_SUCCESS : String = "12_1";

        /**
         * 世界聊天发送失败, 保留聊天框中的信息, 弹出错误提示
         *
         * 附带varint32的错误码
         *
         * 1. 等级不够
         * 2. 发送太频繁
         * 3. 话太长
         * 4. 格式非法. 消息后面解不出ChatMessage
         * 5. 还未联服
         * 6. 你被禁言了
         * 7. 你被天子禁言了
         */
        public static const S2C_WORLD_CHAT_FAIL : String = "12_2";

        /**
         * 别人在世界聊天中说了话
         *
         * 附带ChatMessage这个proto. 从中获取英雄的相关信息
         */
        public static const S2C_WORLD_CHAT_BROADCAST : String = "12_3";

        /**
         * 类似世界聊天, 所有的场景聊天共享发送频率, 即就算换了场景, 还是需要算上之前一段时间内在别的场景所说的话
         *
         * 附带ChatMessage这个proto
         */
        public static const C2S_SCENE_CHAT : String = "12_2";

        /**
         * 场景聊天成功. 不附带信息. 和S2C_WORLD_CHAT_SUCCESS类似
         */
        public static const S2C_SCENE_CHAT_SUCCESS : String = "12_4";

        /**
         * 场景聊天失败
         *
         * 附带varint32的错误码
         *
         * 1. 发送太频繁
         * 2. 话太长
         * 3. 格式非法. 消息后面解不出ChatMessage
         * 4. 你被禁言了
         * 5. 你被天子禁言了
         */
        public static const S2C_SCENE_CHAT_FAIL : String = "12_5";

        /**
         * 别人在当前频道说了话
         *
         * 附带ChatMessage这个proto. 从中获取英雄的相关信息
         */
        public static const S2C_SCENE_CHAT_BROADCAST : String = "12_6";

        /**
         * 喇叭广播
         *
         * 附带
         *
         * varint32 所要消耗的喇叭物品在背包中的位置. 如果将来vip每天可以免费喇叭, 则在免费期间, 发0
         * ChatContentProto proto
         */
        public static const C2S_PAID_CHAT : String = "12_3";

        public static const S2C_PAID_CHAT_SUCCESS : String = "12_7";

        /**
         * 喇叭失败
         *
         * 1. 发送太频繁
         * 2. 话太长
         * 3. 格式非法. 消息后面解不出ChatMessage
         * 4. 物品不够
         * 5. 喇叭cd....
         * 6. 等级不够
         * 7. 你被禁言了
         * 8. 你被天子禁言了
         */
        public static const S2C_PAID_CHAT_FAIL : String = "12_8";

        /**
         * 发喇叭失败, 被禁言. 后面附带解禁时间点. 由客户端自己算出剩余被禁言时间, 显示在错误消息中
         *
         * 附带
         *
         * varint64 解禁时间点
         */
        public static const S2C_PAID_CHAT_FORBIDDEN : String = "12_12";

        public static const S2C_PAID_CHAT_BROADCAST : String = "12_9";

        /**
         * 普通私聊
         *
         * 附带
         * varint64 目标id
         * ChatMessage这个proto
         */
        public static const C2S_NORMAL_PRIVATE_CHAT : String = "12_5";

        public static const S2C_NORMAL_PRIVATE_CHAT_SUCCESS_AND_TARGET_ONLINE : String = "12_13";

        public static const S2C_NORMAL_PRIVATE_CHAT_SUCCESS_AND_TARGET_OFFLINE : String = "12_14";

        /**
         * 私聊失败
         *
         * 附带varint32 失败原因
         *
         * 1. 频率太快
         * 2. 内容太长
         * 3. 格式非法. 后面解不出ChatMessage
         * 4. 对方加你到黑名单了(清掉输入框)
         * 5. 目标不存在
         * 6. 服务器内部错误, 稍后再试
         * 7. 你被禁言了
         * 8. 你被天子禁言了
         */
        public static const S2C_NORMAL_PRIVATE_CHAT_FAIL : String = "12_15";

        /**
         * 收到私聊信息, 来自于左下角的私聊框. 不加入私聊窗口
         *
         * 附带
         *
         * varint64 发送的时间
         * ChatMessage这proto
         */
        public static const S2C_RECEIVED_NORMAL_PRIVATE_CHAT : String = "12_16";

        /**
         * 客户端打开了与某人的私聊窗口, 请求对方的在线状态, 并且注册对方在线事件
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_WINDOW_CHAT_OPEN_AND_GET_MOOD : String = "12_6";

        /**
         * 返回对方心情状态
         *
         * 附带
         * varint64 对方id
         * boolean 是否在线
         * varint32 对方等级
         */
        public static const S2C_WINDOW_CHAT_OPEN_REPLY_MOOD : String = "12_17";

        /**
         * 询问对方心情失败
         *
         * 附带varint32 错误码
         *
         * 1. id不存在
         * 2. 你不是已经注册过了吗? 上次关掉没取消注册? bug? 再这样我断你线哦
         * 3. 对方已经是你的好友, 且你也请求过好友面板的具体数据了, 你应该发只注册不请求心情的消息啊. 不管怎么样, 还是帮你注册了
         * 4. 服务器内部错误, 稍后再试. 不要自动帮他重写发送. 也不要提示他, 忽略就行
         * 5. 同时关注了6个人? bug
         */
        public static const S2C_WINDOW_CHAT_OPEN_ERROR : String = "12_18";

        /**
         * 客户端打开了私聊窗口, 对方在我的关系列表中, 我已经有了他的心情和在线状态, 就注册下
         *
         * 服务器没有返回
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_WINDOW_CHAT_OPEN_AND_MOOD_ALREADY_KNOWN : String = "12_7";

        /**
         * 客户端关闭了和某人的私聊窗口, 不再接收他的心情和在线状态变化. 如果他在关系列表中, 服务器还是会通知的, 别担心
         *
         * 服务器没有返回
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_WINDOW_CHAT_CLOSED : String = "12_8";

        /**
         * 发送窗口聊天, 流程和左下角私聊一样, 仅仅是消息号不同
         *
         * 附带
         * varint64 对方id
         * ChatContentProto 这proto
         */
        public static const C2S_SEND_WINDOW_CHAT : String = "12_9";

        /**
         * 窗口聊天发送成功, 且对方在线
         */
        public static const S2C_SEND_WINDOW_CHAT_SUCCESS_AND_TARGET_ONLINE : String = "12_19";

        /**
         * 窗口聊天发送成功, 且对方不在线
         */
        public static const S2C_SEND_WINDOW_CHAT_SUCCESS_AND_TARGET_OFFLINE : String = "12_20";

        /**
         * 窗口聊天发送失败, 附带varint32 错误码
         *
         * 1. 频率太快
         * 2. 内容太长
         * 3. 格式非法. 后面解不出ChatMessage
         * 4. 对方加你到黑名单了(清掉输入框)
         * 5. 目标不存在
         * 6. 服务器内部错误, 稍后再试
         * 7. 等级不够
         * 8. 你被禁言了
         * 9. 你被天子禁言了
         */
        public static const S2C_SEND_WINDOW_CHAT_FAIL : String = "12_21";

        /**
         * 收到私聊窗口信息, 如果当前打开着和对方的私聊窗口, 则将消息加入私聊窗口.
         *
         * 如果没有打开, 则在界面下弹提示, 并不需要预先创建私聊窗口, 缓存这条消息. 仅加入总私聊缓存就行
         *
         * 附带
         *
         * varint64 消息的时间
         * ChatMessage这proto
         */
        public static const S2C_RECEIVED_WINDOW_CHAT : String = "12_22";

        /**
         * 正在私聊窗口中输入.
         *
         * 附带
         *
         * varint64的对方id
         */
        public static const C2S_I_AM_TYPING : String = "12_10";

        /**
         * 我已停止在私聊窗口中输入. 回车发送私聊不需要发停止输入, 默认已经切为停止输入状态
         *
         * 输入状态下, 2秒不输入, 发送这条
         *
         * 附带
         *
         * varint64的对方id
         */
        public static const C2S_I_STOPPED_TYPING : String = "12_11";

        /**
         * 私聊对象正在输入
         *
         * 附带
         *
         * varint64的对方id
         */
        public static const S2C_OTHER_IS_TYPING : String = "12_23";

        /**
         * 私聊对象停止了输入
         *
         * 附带
         *
         * varint64的对方id
         */
        public static const S2C_OTHER_STOPPED_TYPING : String = "12_24";

        /**
         * 获取和这个聊天对象的聊天记录
         *
         * 附带
         * varint64 对方id
         * varint64 当前已经缓存着的私聊的最大时间 (没有缓存过, 则发0)
         */
        public static const C2S_GET_CHAT_HISTORY : String = "12_12";

        /**
         * 返回私聊聊天记录
         *
         * varint64 对方id
         * boolean 读完这批聊天记录后, 是否还有更多聊天记录
         * 接下来的读取方式
         * while(byteArray.available){
         *     var isMySpeech:Boolean = byteArray.readBoolean(); // 这句话是否是我说的
         *     var time:Number = byteArray.readVarInt64(); // 这条消息的时间
         *     var len :int = byteArray.readVarInt32();
         *     var chatMessageProto : ByteArray = new ByteArray();
         *     byteArray.readBytes(chatMessageProto, 0, len); // 读取ChatMessage的proto
         * }
         */
        public static const S2C_GET_CHAT_HISTORY_RESULT : String = "12_25";

        /**
         * 获取私聊记录失败
         *
         * 附带varint32错误码
         *
         * 1. 获取太频繁, 没有等够cd. 将来当做外挂处理
         * 2. 你之前没有发送和对方窗口私聊的消息. 将来当做外挂处理
         * 3. 服务器内部错误, 稍后再试
         */
        public static const S2C_GET_CHAT_HISTORY_FAIL : String = "12_26";

        /**
         * 刚上线时, 如果不在线时, 有人给你留言, 将会收到提醒
         *
         * 所有留言的人都会在这一条消息中附带
         *
         * 数据读取方法
         *
         * while(byteArray.available){
         *
         *  var id:Number = byteArray.readVarInt64(); // 对方id
         *  var name:String = byteArray.readUTF(); // 对方名字
         *  var level:int = byteArray.readVarInt32(); // 对方等级
         * }
         */
        public static const S2C_THEY_LEFT_MSG_WHEN_YOU_OFFLINE : String = "12_27";

        /**
         * 请求发送队伍聊天, 请求后, 不要直接清掉聊天框中的消息把消息放到队伍频道中, 而要等待服务器返回
         * 服务器返回前, 需要锁定聊天栏, 不让他继续输入, 按回车忽略, 点击发送忽略(不要把按钮做成不可点击)
         *
         * 离开队伍后, 说话频率不清. 保留到加入新队伍
         *
         * 客户端发送前就需要检查 等级/频率/长度. 不符合的就本地弹出错误消息.
         *
         * 附带 ChatMessage这个proto
         */
        public static const C2S_TEAM_CHAT : String = "12_13";

        /**
         * 队伍聊天失败
         *
         * 附带varint32的错误码
         *
         * 1. 发送太频繁
         * 2. 话太长
         * 3. 格式非法. 消息后面解不出ChatMessage
         * 4. 你没有队伍
         * 5. 等级不够
         * 6. 你被禁言了
         * 7. 你被天子禁言了
         */
        public static const S2C_TEAM_CHAT_FAIL : String = "12_28";

        /**
         * 队伍聊天发送成功, 后面没有附带的信息. 客户端自己把聊天栏中的话放到队伍频道中
         * 发送者只会收到发送成功消息, 别人会收到S2C_TEAM_CHAT_BROADCAST广播消息. 发送者不会收到广播消息
         */
        public static const S2C_TEAM_CHAT_SUCCESS : String = "12_29";

        /**
         * 别人在队伍频道说了话
         *
         * 附带ChatMessage这个proto. 从中获取英雄的相关信息
         */
        public static const S2C_TEAM_CHAT_BROADCAST : String = "12_30";

        /**
         * 请求发送家族聊天, 请求后, 不要直接清掉聊天框中的消息把消息放到家族频道中, 而要等待服务器返回
         * 服务器返回前, 需要锁定聊天栏, 不让他继续输入, 按回车忽略, 点击发送忽略(不要把按钮做成不可点击)
         *
         * 离开家族后, 说话频率不清. 保留到加入新家族
         *
         * 客户端发送前就需要检查 等级/频率/长度. 不符合的就本地弹出错误消息.
         *
         * 附带 ChatMessage这个proto
         */
        public static const C2S_FAMILY_CHAT : String = "12_14";

        /**
         * 家族聊天失败
         *
         * 附带varint32的错误码
         *
         * 1. 发送太频繁
         * 2. 话太长
         * 3. 格式非法. 消息后面解不出ChatMessage
         * 4. 你没有家族
         * 5. 你被禁言了
         * 6. 你被天子禁言了
         */
        public static const S2C_FAMILY_CHAT_FAIL : String = "12_31";

        /**
         * 家族聊天发送成功, 后面没有附带的信息. 客户端自己把聊天栏中的话放到家族频道中
         * 发送者只会收到发送成功消息, 别人会收到S2C_FAMILY_CHAT_BROADCAST广播消息. 发送者不会收到广播消息
         */
        public static const S2C_FAMILY_CHAT_SUCCESS : String = "12_32";

        /**
         * 别人在家族频道说了话
         *
         * 附带ChatMessage这个proto. 从中获取英雄的相关信息
         */
        public static const S2C_FAMILY_CHAT_BROADCAST : String = "12_33";

        /**
         * 国家内聊天. 聊天的频率也是15秒2条. 别的和世界聊天一样. 等级限制也是和世界聊天一样20级
         *
         * 客户端发送前就需要检查 等级/频率/长度. 不符合的就本地弹出错误消息.
         *
         * 附带 ChatContentProto这个proto
         */
        public static const C2S_COUNTRY_CHAT : String = "12_15";

        /**
         * 发送失败, 保留聊天框中的信息, 弹出错误提示
         *
         * 附带varint32的错误码
         *
         * 1. 等级不够
         * 2. 发送太频繁
         * 3. 话太长
         * 4. 格式非法. 消息后面解不出ChatMessage
         * 5. 你被禁言了
         * 6. 你被官员禁言了
         */
        public static const S2C_COUNTRY_CHAT_FAIL : String = "12_34";

        /**
         * 发送成功, 客户端自己把聊天栏中的话放到国家聊天频道中
         * 发送者不会收到自己话的S2C_COUNTRY_CHAT_BROADCAST
         *
         * 没有附带信息
         */
        public static const S2C_COUNTRY_CHAT_SUCCESS : String = "12_35";

        /**
         * 别人在本国频道说了话
         *
         * 附带ChatContentProto这proto
         */
        public static const S2C_COUNTRY_CHAT_BROADCAST : String = "12_36";

        /**
         * 临时频道发言. 允许的频率如场景频道, 5秒2条
         *
         * 客户端需要检查自己所在的场景, 必须是以下之一
         *
         * 1. 搜神宫
         * 2. 所有跨服组队副本
         * 3. 剑冢 (dota)
         */
        public static const C2S_TEMP_CHAT : String = "12_37";

        /**
         * 发送失败, 保留聊天框中的信息, 弹出错误提示
         *
         * 附带varint32的错误码
         *
         * 1. 等级不够
         * 2. 发送太频繁
         * 3. 话太长
         * 4. 格式非法. 消息后面解不出ChatMessage
         * 5. 所在的场景不准临时发言 (不需要弹错, 当前的聊天框应该没有这个频道)
         */
        public static const S2C_TEMP_CHAT_FAIL : String = "12_38";

        /**
         * 临时发言成功,客户端自己把聊天栏中的话放到本聊天频道中
         * 发送者不会收到自己话的S2C_TEMP_CHAT_BROADCAST
         *
         * 没有附带信息
         */
        public static const S2C_TEMP_CHAT_SUCCESS : String = "12_39";

        /**
         * 别人在临时频道说了话
         *
         * 如果在剑冢(dota)中, 需要判断发送者的id是否在本队, 如果不在, 则屏蔽, 不显示
         *
         * 附带ChatMessage这proto
         */
        public static const S2C_TEMP_CHAT_BROADCAST : String = "12_40";

        /**
         * 广播心情
         *
         * varint32 心情id
         */
        public static const C2S_BROADCAST_MOOD : String = "12_50";

        /**
         * 心情广播
         *
         * varint64 玩家id
         * varint32 心情id
         */
        public static const S2C_BROADCAST_MOOD : String = "12_51";

        /**
         * 发送心情失败, 请求太过频繁
         */
        public static const S2C_BROADCAST_MOOD_FAIL : String = "12_52";

        /**
         * 屏蔽字库更新，此消息需要先解压一下
         *
         * bytes 以换行符\n分隔的屏蔽字库
         */
        public static const S2C_FONT_BLACKLIST : String = "12_127";

    }
}