package app.cmd {

    public class TeamModuleMessages {

        /**
         * 请求创建个自己一个人的队伍, 没有附带信息
         *
         * 客户端需判断自己当前没有队伍, 才能发送. 有队伍的话自己本地处理了
         */
        public static const C2S_CREATE_OWN_TEAM : String = "15_1";

        /**
         * 创建队伍成功, 没有附带信息
         *
         * 分配模式：
         *
         * 经验：平均分配
         * 掉落：轮流拾取
         */
        public static const S2C_CREATE_OWN_TEAM_SUCCESS : String = "15_1";

        /**
         * 创建队伍失败, 附带varint32 失败原因
         *
         * 1. 你已经有队伍了
         */
        public static const S2C_CREATE_OWN_TEAM_FAIL : String = "15_2";

        /**
         * 请求离开队伍, 没有附带信息
         *
         * 客户端需判断自己当前有队伍, 才能发送
         */
        public static const C2S_LEAVE_TEAM : String = "15_2";

        /**
         * 离开队伍成功, 没有附带信息
         */
        public static const S2C_LEAVE_TEAM_SUCCESS : String = "15_3";

        /**
         * 离开队伍失败, 附带varint32 失败原因
         *
         * 1. 你没有队伍
         */
        public static const S2C_LEAVE_TEAM_FAIL : String = "15_4";

        /**
         * 队伍里其他人离开了队伍
         *
         * 附带
         *
         * varint64 其他人id
         */
        public static const S2C_OTHER_LEAVE_TEAM : String = "15_5";

        /**
         * 队伍解散了, 服务器主动推送, 没有附带的信息
         *
         * 客户端自动把生成其他人离队的历史记录, 并在最后加上队伍解散历史记录
         */
        public static const S2C_TEAM_DISMISS : String = "15_6";

        /**
         * 邀请一个人加入我的队伍, 此时必须没有队伍, 或者是当前队伍的队长, 而且队伍人数<5人
         *
         * 等待服务器返回再发其他队伍相关消息
         *
         * 附带
         *
         * varint64 对方的id
         */
        public static const C2S_SEND_INVITE : String = "15_3";

        /**
         * 邀请入队成功, 对方设为了自动接受邀请, 即将加入本队, 收到这条后, 解除因为发送C2S_SEND_INVITE加的锁. 后面接着会收到S2C_OTHER_JOIN_TEAM对方加入队伍消息
         *
         * 后面没有附带的信息
         */
        public static const S2C_SEND_INVITE_SUCCESS_OTHER_JOIN_TEAM : String = "15_7";

        /**
         * 邀请入队成功, 对方不是自动接受邀请的, 等待对方回应. 解除C2S_SEND_INVITE的锁
         *
         * 后面没有附带的信息
         */
        public static const S2C_SEND_INVITE_SUCCESS_WAIT_OTHER_REPLY : String = "15_8";

        /**
         * 邀请入队失败, 附带varint32错误码
         *
         * 1. 你不是队长
         * 2. 你队伍满了
         * 3. 对方不在线
         * 4. 对方有队伍
         * 5. 你已经邀请过对方了
         * 6. 对方设置了 禁止被邀请加入队伍
         * 7. 不同国家的玩家不能组队
         */
        public static const S2C_SEND_INVITE_FAIL : String = "15_9";

        /**
         * 收到了别人发送的组队邀请. 收到此消息2分钟后, 客户端自己删除此邀请.
         *
         * 如果自己加入了一个队伍, 不论是自己建队/别人入队/自己入别人队, 则马上清除所有的组队邀请, 不需要一个个发拒绝
         *
         * 附带
         *
         * varint64 对方id
         * varint32 对方等级
         * UTFBytes 对方名字
         */
        public static const S2C_RECEIVE_INVITE : String = "15_10";

        /**
         * 有人加入了我们队伍. 如果收到此消息时, 自己没有队伍, 则创建个队伍, 将自己设为队长
         *
         * 附带(队员.writeTo). 以后还有别的消息使用(队员.writeTo), 写成个方法. 以下为队员的writeTo的内容
         * varint64 id
         * varint32 国家
         * UTF 对方名字
         *
         * varint32 场景id
         * varint32 线数 (如果场景id对应的场景是个副本, 不管这里是个什么数字, 都忽略)
         *
         * varint32 等级
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         *
         * var isOnline = readBoolean(); // 是否在线
         *
         * var offlineTime:Number = byteArray.readVarInt64(); // 如果此人不在线, 则是他离队的时间点
         *
         * varint32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-5表示某个国家]
         */
        public static const S2C_OTHER_JOIN_TEAM : String = "15_11";

        /**
         * 你加入了一个队伍
         *
         * 附带
         *
         * varint64 队长id
         * bool 经验分配方式(true[伤害分配]/false(平均))
         * varint32 物品分配方式TeamDropAllocateType
         * while(bytes.available){
         *  队员.writeTo读出每个人的信息
         * }
         */
        public static const S2C_YOU_ENTERED_TEAM : String = "15_12";

        /**
         * 回复别人的组队邀请, 只需要回复客户端自己手点的. 如果发送的是不接受, 则服务器没有返回. 客户端直接自己删除这条邀请, 可以继续发送.
         *
         * 如果回复接受, 则需要等待服务器之后的返回
         *
         * 如果自己加入了一个队伍, 不论是自己建队/别人入队/自己入别人队, 则马上清除所有的组队邀请, 不需要一个个发拒绝
         *
         * 附带
         * varint64 对方id
         * bool 是否接受
         */
        public static const C2S_REPLY_INVITE : String = "15_4";

        /**
         * 回复邀请成功, 只有回复接受才会收到这条消息. 之后会跟着收到S2C_YOU_ENTERED_TEAM
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_INVITE_SUCCESS : String = "15_13";

        /**
         * 回复别人组队邀请失败, 只有在同意别人邀请时才会收到.
         *
         * 附带varint32的错误码
         *
         * 1. 别人队伍满了
         * 2. 别人不是队长了
         * 3. 别人不在线了
         * 4. 邀请过期了
         * 5. 你有队伍了
         * 6. 不同的国家
         */
        public static const S2C_REPLY_INVITE_FAIL : String = "15_14";

        /**
         * 别人拒绝了你的组队邀请. 流程是你先发了C2S_SEND_INVITE, 服务器返回了S2C_SEND_INVITE_SUCCESS_WAIT_OTHER_REPLY
         * 然后别人返回了C2S_REPLY_INVITE, 表示拒绝组队邀请, 然后邀请人就收到了S2C_OTHER_REJECTED_YOUR_INVITE
         *
         * 根据消息中附带的id, 删除客户端缓存着的, 自己发出过的邀请. 可能在对方回复前, 自己下线又上线了, 附带的id缓存中没有
         *
         * 如果没有缓存, 则以消息中附带的名字提醒.
         *
         * 附带
         * varint64 对方id
         * UTFBytes 对方名字
         */
        public static const S2C_OTHER_REJECTED_YOUR_INVITE : String = "15_15";

        /**
         * 将 是否无队伍时自动接受别人邀请 设为 true
         *
         * 后面没有参数, 服务器没有返回
         */
        public static const C2S_SET_AUTO_ACCEPT_INVITE : String = "15_5";

        /**
         * 将 是否无队伍时自动接受别人邀请 设为 false
         */
        public static const C2S_SET_NOT_AUTO_ACCEPT_INVITE : String = "15_6";

        /**
         * 将 是否是队长时自动接受别人的入队申请 设为 true
         */
        public static const C2S_SET_AUTO_ACCEPT_REQUEST : String = "15_7";

        /**
         * 将 是否是队长时自动接受别人的入队申请 设为 false
         */
        public static const C2S_SET_NOT_AUTO_ACCEPT_REQUEST : String = "15_8";

        /**
         * 发送请求加入别人队伍申请. 此时必须是没有队伍的. 必须等待服务器返回, 才能发送别的队伍消息
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_SEND_REQUEST : String = "15_9";

        /**
         * 申请加入别人队伍成功, 别人队伍有空位, 而且设置了自动接受申请. 接下来会收到S2C_YOU_ENTERED_TEAM消息
         *
         * 没有附带信息, 解锁就行
         */
        public static const S2C_SEND_REQUEST_SUCCESS_YOU_JOIN_TEAM : String = "15_16";

        /**
         * 申请加入别人队伍成功, 别人队伍有空位, 但是不是自动接受申请.
         *
         * 客户端需要自己保存自己的申请, 保留2分钟, 在收到入队/对方拒绝之前, 不能发送针对同一个人的申请
         *
         * 2分钟后自动删除申请, 需要提示则客户端自己提示, 服务器不会有消息通知
         *
         * 没有附带信息, 解锁
         */
        public static const S2C_SEND_REQUEST_SUCCESS_WAIT_OTHER_REPLY : String = "15_17";

        /**
         * 申请入队失败, 附带varint32 错误码
         *
         * 1. 你已经有队伍
         * 2. 对方没有队伍
         * 3. 对方队伍已满
         * 4. 你已经在申请中了, 别重复申请
         * 5. 对方不在线
         * 6. 不同国家的玩家不能组队
         */
        public static const S2C_SEND_REQUEST_FAIL : String = "15_18";

        /**
         * 收到别人的入队申请. 客户端自己保留2分钟, 2分钟后删除, 不要自动发拒绝消息
         *
         * 如果退队, 或者队长换人, 或者退伍解散, 则自动删除所有申请, 不要发拒绝消息
         *
         * 附带
         *
         * varint64 对方id
         * varint32 对方等级
         * UTFBytes 对方名字
         */
        public static const S2C_RECEIVE_REQUEST : String = "15_19";

        /**
         * 回复别人的入队申请, 只需要回复客户端自己手点的. 如果发送的是不接受, 则服务器没有返回. 客户端直接自己删除这条邀请, 可以继续发送.
         *
         * 如果回复接受, 则需要等待服务器之后的返回
         *
         * 如果不在队伍中, 或者不是队长了, 自动删除所有申请
         *
         * 附带
         *
         * varint64 对方id
         * bool 是否接受
         *
         */
        public static const C2S_REPLY_REQUEST : String = "15_10";

        /**
         * 回复申请成功, 解锁. 只有回复接受才会收到这条消息. 之后会跟着收到S2C_OTHER_JOIN_TEAM
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_REQUEST_SUCCESS : String = "15_20";

        /**
         * 回复申请失败, 解锁. 只有回复接受才会收到这条消息
         *
         * 附带varint32 错误码
         *
         * 1. 你不是队长
         * 2. 你没有队伍
         * 3. 对方不在线
         * 4. 对方加入了别的队伍
         * 5. 你的队伍满了
         * 6. 申请过期了
         * 7. 对方不是我们国家的
         */
        public static const S2C_REPLY_REQUEST_FAIL : String = "15_21";

        /**
         * 别人拒绝了你的入队申请
         *
         * 根据消息中附带的id, 删除客户端缓存着的, 自己发出过的邀请. 可能在对方回复前, 自己下线又上线了, 附带的id缓存中没有
         *
         * 如果没有缓存, 则以消息中附带的名字提醒.
         *
         * 附带
         * varint64 对方id
         * UTFBytes 对方名字
         */
        public static const S2C_OTHER_REJECTED_YOUR_REQUEST : String = "15_22";

        /**
         * 踢出队伍中的人, 只有队长才能执行这操作, 而且目标不能是自己
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_KICK : String = "15_11";

        /**
         * 踢人成功, 解锁. 后面跟着会收到相应的消息.
         *
         * 被踢的会收到S2C_YOU_ARE_KICKED
         *
         * 如果队伍中还有其他人, 队中其他人会收到S2C_OTHER_LEAVE_TEAM
         * 如果队伍中没有其他人, 会收到S2C_TEAM_DISMISS
         *
         * 没有附带信息
         */
        public static const S2C_KICK_SUCCESS : String = "15_23";

        /**
         * 踢人失败, 附带varint32错误码
         *
         * 1. 你不是队长
         * 2. 不能踢自己
         * 3. 你要踢的id不在你队伍里
         * 4. 你根本就没队伍
         */
        public static const S2C_KICK_FAIL : String = "15_24";

        /**
         * 你被踢出队伍了
         *
         * 没有附带的信息
         */
        public static const S2C_YOU_ARE_KICKED : String = "15_25";

        /**
         * 请求转移队长. 只有队长才能发送, 且目标不能是自己, 且不能是离线的人
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_TRANSFER_LEADER : String = "15_12";

        /**
         * 请求失败, 附带varint32 失败原因
         *
         * 1. 你没有队伍
         * 2. 你不是队长
         * 3. 你发的id不在队伍里
         * 4. 对方不在线
         */
        public static const S2C_TRANSFER_LEADER_FAIL : String = "15_27";

        /**
         * 队长改变
         *
         * 附带
         * varint64 新的队长id
         */
        public static const S2C_LEADER_CHANGED : String = "15_31";

        /**
         * 队伍中有人下线了. 隐藏对方在线时间, 并且开始显示他自动退队倒计时, 为收到此消息5分钟以后
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const S2C_OTHER_OFFLINE : String = "15_33";

        /**
         * 队伍中之前下线的人, 现在又重新上线了. 隐藏退队倒计时, 把他所在的场景设为消息中附带的场景
         *
         * 附带
         *
         * varint64 id
         * varint32 场景id
         * varint32 线数 (如果上面的场景id代表的是个副本, 无视这个数字)
         * varint32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-3表示在三个国家]
         */
        public static const S2C_OTHER_ONLINE : String = "15_34";

        /**
         * 英雄上线时, 如果下线前有队伍, 队伍未解散且保留时间未过, 上线时会收到服务器推送的这条入队消息
         *
         * 有别于普通的S2C_YOU_ENTERED_TEAM, 这条应该不需要动画, 然后自己在队伍中所在的位置也不是最后一个
         *
         * 附带
         *
         * varint64 队长id
         * bool 经验分配方式(true[伤害分配]/false(平均))
         * varint32 物品分配方式TeamDropAllocateType
         * while(byteArray.available){
         *  var isSelf:Boolean = byteArray.readBoolean();
         *
         *  if (isSelf){
         *      // 把自己插在这个位置
         *  } else{
         *      // 不是自己, 读取个队友
         *
         *      队员的writeTo
         *  }
         * }
         */
        public static const S2C_YOU_HAVE_TEAM_BEFORE_OFFLINE : String = "15_35";

        /**
         * 队友改变了等级, 服务器主动推送
         *
         * 附带
         *
         * varint64 id
         * varint32 最新等级
         */
        public static const S2C_OTHER_CHANGE_LEVEL : String = "15_36";

        /**
         * 队友改变了场景, 服务器主动推送
         *
         * 附带
         * varint64 id
         * varint32 场景id
         * varint32 线数 (场景id是个副本时, 无视)
         * varitn32 所在场景属于哪个国家[0表示在一个副本或者中立区，1-3表示在三个国家]
         */
        public static const S2C_OTHER_CHANGE_SCENE : String = "15_37";

        /**
         * 队友被杀了. 和好友/仇人被杀的优先级关系是 好友 > 队友 > 仇人
         *
         * 队友死后, 不管怎么样, 都会收到这条消息. 先缓存1秒钟, 如果1秒后没有收到好友被杀消息(一定是同一个人, 别的好友被杀和这个人无关), 则显示这条队友被杀消息
         * 如果1秒内, 收到了这个人的好友被杀消息, 则马上显示好友被杀消息, 并立刻删除队友被杀缓存
         * 如果收到了这个人的仇人被杀消息, 则马上显示队友被杀消息 (因为一定不会是好友了), 不需要显示仇人被杀消息
         *
         *  附带
         *
         *  varint64 队友id // 如果收到这条消息的时候, 这个id已经不在队伍中了, 则忽略这条消息
         *  varint32 地图id
         *  varint32 坐标x
         *  varint32 坐标y
         *  varint64 杀手id
         *  varint32 杀手所属国家[0-1-2]
         *  UTF 杀手家族名
         *  UTF 杀手名字
         *  if(buffer.readable()) {
         *      varint32 场景所属国家[0-1-2]
         *  }
         */
        public static const S2C_TEAMMATE_DEAD : String = "15_38";

        /**
         * 每隔1秒询问下队伍中和我同场景, 同一条线的人的坐标.
         *
         * 打开小地图时, 如果队伍中有人和我场景id相同, 线数相同, 则请求. 如果没有, 则不管
         *
         * 没有附带信息
         */
        public static const C2S_GET_TEAMMATE_POS : String = "15_14";

        /**
         * 获取队友id错误, 附带varint32 错误码
         *
         * 收到这条消息后, 不要再无脑请求队友位置了, 等个3秒先
         *
         * 1. 你没有队伍
         * 2. 队伍中没有人和你在同一个场景
         */
        public static const S2C_GET_TEAMMATE_POS_FAIL : String = "15_39";

        /**
         * 回复队友坐标
         *
         * 附带
         *
         * while(byteArray.available){
         *  // 每个循环是队伍中和我在同一个场景的人的坐标. 没有附带在里面的, 就算你认为他和我在同一个场景, 也不显示坐标
         *
         *  varint64 队友id
         *  varint32 x
         *  varint32 y
         * }
         */
        public static const S2C_REPLY_TEAMMATE_POS : String = "15_40";

        /**
         * 拒绝所有邀请我入队的请求. 服务器没有返回. 客户端发完直接清掉所有的邀请并关闭窗口
         *
         * 没有附带信息
         */
        public static const C2S_REJECT_ALL_INVITATIONS : String = "15_15";

        /**
         * 拒绝所有申请加入我队伍的申请, 服务器没有返回. 客户端发完直接清掉所有的申请并关闭窗口
         *
         * 没有附带信息
         */
        public static const C2S_REJECT_ALL_REQUESTS : String = "15_16";

        /**
         * 队友换装通知. 换 坐骑/套装/神兵等等各种
         *
         * 换装的英雄自己不会收到通知, 自己把组队界面里自己的形象变了. 坐骑永远显示最高阶的坐骑
         *
         * 附带
         *
         * varint64 换装的队友id
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         */
        public static const S2C_TEAMMATE_CHANGE_RES : String = "15_41";

        /**
         * 将 是否禁止别人邀请我加入队伍 设为 true
         *
         * 后面没有参数, 服务器没有返回
         */
        public static const C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_TEAM : String = "15_17";

        /**
         * 将 是否禁止别人邀请我加入队伍 设为 false
         */
        public static const C2S_SET_NOT_FORBID_OTHER_INVITE_ME_JOIN_TEAM : String = "15_18";

        /**
         * 请求队友位置，用于寻路到队友位置时请求
         * varint64 英雄id
         */
        public static const C2S_GET_TEAM_MEMBER_POS : String = "15_42";

        /**
         * 请求队友位置成功
         * varint32 场景id
         * varint32 场景线路
         * varint32 x坐标
         * varint32 y坐标
         */
        public static const S2C_GET_TEAM_MEMBER_POS : String = "15_43";

        /**
         * 请求队友位置失败，附带byte错误码
         * 2、发送的英雄id是你自己
         * 3、发送的英雄id不是你的队友
         * 4、发送的英雄id当前不在线
         * 5、队友不在普通场景（比如在副本中）
         * 6、英雄等级不足，还不能进入队友所在的场景
         */
        public static const S2C_GET_TEAM_MEMBER_POS_FAIL : String = "15_44";

        /**
         * 请求传送到队友位置
         * varint64 英雄id
         * if(非Vip或VIP等级不足){
         *      要附带数据具体参考[这里]({% post_url 2014-11-08-物品消耗 %})
         * }
         */
        public static const C2S_TEAM_MEMBER_TRANSPORT : String = "15_45";

        /**
         * 请求传送到队友位置成功，不附带任何消息，之后会收到切场景的消息
         */
        public static const S2C_TEAM_MEMBER_TRANSPORT : String = "15_46";

        /**
         * 请求传送到队友位置失败，附带byte错误码
         * 1、英雄不在普通场景中
         * 2、发送的英雄id是你自己
         * 3、发送的英雄id不是你的队友
         * 4、发送的英雄id当前不在线
         * 5、队友不在普通场景（比如在副本中）
         * 6、英雄等级不足，还不能进入队友所在的场景
         * 7、当前是攻城战期间，不能传送
         * 8、传送物品不足
         * 9、自己不在自己国家，无法队友传送
         * 10、队友不在自己国家，无法队友传送
         * 11、pk中
         * 12、金子不够
         */
        public static const S2C_TEAM_MEMBER_TRANSPORT_FAIL : String = "15_47";

        /**
         * 队长广播请跟随，限定频率，最多1S一次
         *
         * bool true(大家跟我走啊)/false(大家别跟我走啊)
         */
        public static const C2S_TEAM_BROADCAST_FOLLOW : String = "15_48";

        /**
         * 广播成功
         *
         * bool true(大家跟我走啊)/false(大家别跟我走啊)
         */
        public static const S2C_TEAM_BROADCAST_FOLLOW : String = "15_49";

        /**
         * 跟随失败
         *
         * 1. 你已经死了
         * 2. 你不是队长
         */
        public static const S2C_TEAM_BROADCAST_FOLLOW_FAIL : String = "15_50";

        /**
         * 队长邀请跟随
         *
         * bool true(大家跟我走啊)/false(大家别跟我走啊)
         */
        public static const S2C_TEAM_LEADER_INVITE_FOLLOW : String = "15_51";

        /**
         * 队长传送门传送
         *
         * varint32 传送门id
         */
        public static const S2C_TEAM_LEADER_DOOR_TRANSPORT : String = "15_52";

        /**
         * 队员跟随，限定频率，最多1S一次
         *
         * bool true(跟党走)/false(滚一边去)
         */
        public static const C2S_TEAM_MEMBER_FOLLOW : String = "15_53";

        /**
         * 队员跟随成功
         *
         * bool true(跟党走)/false(滚一边去)
         */
        public static const S2C_TEAM_MEMBER_FOLLOW : String = "15_54";

        /**
         * 队员跟随失败，返回varint32错误码
         *
         * 1. 你已经死了
         * 2. 你是队长
         * 3. 没有队伍
         */
        public static const S2C_TEAM_MEMBER_FOLLOW_FAIL : String = "15_55";

        /**
         * 队长收到队员跟随了
         *
         * bool true(跟党走)/false(滚一边去)
         *
         * bytes 队员名字
         */
        public static const S2C_TEAM_LEADER_MEMBER_FOLLOW : String = "15_56";

        /**
         * 设置队伍经验分配方式
         *
         * bool true(伤害分配模式)/false(平均分配模式)
         */
        public static const C2S_SET_TEAM_EXP_ALLOCATE : String = "15_57";

        /**
         * 队伍经验分配成功
         *
         * bool true(伤害分配模式)/false(平均分配模式)
         */
        public static const S2C_SET_TEAM_EXP_ALLOCATE_BROADCAST : String = "15_58";

        /**
         * 队伍经验分配模式失败，返回varint32错误码
         *
         * 1. 你不是队长
         */
        public static const S2C_SET_TEAM_EXP_ALLOCATE_FAIL : String = "15_59";

        /**
         * 设置队伍掉落分配方式
         *
         * varint32 TeamDropAllocateType
         */
        public static const C2S_SET_TEAM_DROP_ALLOCATE : String = "15_60";

        /**
         * 队伍经验分配成功
         *
         * varint32 TeamDropAllocateType
         */
        public static const S2C_SET_TEAM_DROP_ALLOCATE_BROADCAST : String = "15_61";

        /**
         * 队伍经验分配模式失败，返回varint32错误码
         *
         * 1. 你不是队长
         * 2. 未知的经验分配模式
         */
        public static const S2C_SET_TEAM_DROP_ALLOCATE_FAIL : String = "15_62";

    }
}