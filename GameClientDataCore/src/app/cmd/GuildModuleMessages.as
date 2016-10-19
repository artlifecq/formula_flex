package app.cmd {

    public class GuildModuleMessages {

        /**
         * 创建帮派成功
         * <p>
         * 客户端可以在此时请求帮派基本数据
         * <p>
         * byte[] 新的帮派名字
         */
        public static const S2C_CREATE_GUILD : String = "28_1";

        /**
         * 创建帮派失败,返回varint32错误码
         * <p>
         * 1. 没有家族怎么创建帮派
         * 2. 没有开放帮派功能
         * 3. 当前在帮派创建或者加入帮派cd中
         * 4. 没有创建帮派的权限
         * 5. 银两不够,无法创建帮派
         * 6. 创建帮派的物品位置非法
         * 7. 创建帮派的物品已过期
         * 8. 物品不是创建帮派需要的物品
         * 9. 旗号非法
         * 10. 底纹非法
         * 11. 底框非法
         * 12. 帮派名字非法
         * 13. 该帮派名字已经存在了
         * 14. 该帮派旗号已经存在了
         * 15. 你们家族已经解散
         * 16. 家族已经有帮派了,无法创建
         */
        public static const S2C_CREATE_GUILD_FAIL : String = "28_2";

        /**
         * 帮派创建广播
         * <p>
         * bytes 帮派名字
         */
        public static const S2C_CREATE_GUILD_BROADCAST : String = "28_3";

        /**
         * 帮派变化了
         * <p>
         * bytes 帮派名字,长度为0表示变成没有帮派了
         */
        public static const S2C_GUILD_CHANGED : String = "28_5";

        /**
         * 请求家族加入帮派的列表
         *
         * 只有有权限的官员才可以申请,两次申请间隔必须为15秒
         */
        public static const C2S_GET_FAMILY_REQUEST_JOIN_GUILD_LIST : String = "28_6";

        /**
         * 返回家族申请加入帮派的列表
         *
         * while(buffer.readable()){
         *      utf 帮派的名字
         * }
         */
        public static const S2C_GET_FAMILY_REQUEST_JOIN_GUILD_LIST : String = "28_7";

        /**
         * 请求失败,返回varint32错误码
         *
         * 1. 没有家族
         * 2. 家族有帮派了
         * 3. 没有权限,无法申请
         */
        public static const S2C_GET_FAMILY_REQUEST_JOIN_GUILD_LIST_FAIL : String = "28_8";

        /**
         * 请求本国帮派列表,请求时间间隔15秒
         */
        public static const C2S_GET_GUILD_LIST : String = "28_10";

        /**
         * 返回本国帮派列表
         *
         * 解压缩
         *
         * while(buffer.readable()){
         *      utf 帮派名字
         *      utf 帮主名字
         *      varint32 帮派等级
         *      varint32 家族数量
         *      varint32 家族繁荣度
         *      bool 是否有官员在线
         * }
         */
        public static const S2C_GET_GUILD_LIST : String = "28_11";

        /**
         * 请求加入别的帮派, 返回前不能再请求, 或者回复别的帮派的邀请
         *
         * 请求时必须自己有家族, 且是有权限申请的人, 且要求加入的帮派没满
         *
         * 附带
         *
         * bool true(发送申请)/false(取消申请)
         *
         * bytes 要求加入的帮派名字
         */
        public static const C2S_REQUEST_JOIN : String = "28_20";

        /**
         * 要求加入帮派失败, 附带varint32 错误码
         *
         * 1. 没有家族
         * 2. 你请求加入的帮派不存在
         * 3. 你请求加入的帮派满人了
         * 5. 你已经申请过这个帮派了
         * 6. 你的等级不够
         * 7. 板块战期间, 不能进入
         * 8. 不能加入别的联服的帮派
         * 9. 当前处于加入帮派的cd中
         * 10. 没有发送过申请
         * 11. 有帮派了,无法申请
         * 12. 申请加入帮派过于频繁
         */
        public static const S2C_REQUEST_JOIN_FAIL : String = "28_21";

        /**
         * 请求取消加入帮派申请成功
         *
         * 仅供解锁C2S_REQUEST_JOIN. 根据策划需要展示提示
         *
         * bytes 帮派的名字
         */
        public static const S2C_CANCEL_REQUEST_JOIN : String = "28_22";

        /**
         * 入帮申请已经转发给了相关负责人
         *
         * 客户端需要缓存自己已经申请过且申请结果是S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY的家族, 保存一定时间
         * 一定时间后自动删除, 服务器不会再发消息通知
         * 如果期间收到了对方明确的回复, 不管是同意还是拒绝, 都删掉这个帮派的缓存
         *
         * varint64 申请过期时间
         * byte[] 申请的帮派
         */
        public static const S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY : String = "28_23";

        /**
         * 广播给帮派所有人, 有人入帮了.
         *
         * 仅供展示提醒. 欢迎【XXX家族】加入本帮派，本帮派变的更加强大了
         *
         * 如果打开着帮派成员界面, 则马上重新请求一次成员列表
         *
         * 附带
         *
         * bytes 入帮的的家族名字
         */
        public static const S2C_OTHER_JOIN_GUILD : String = "28_24";

        /**
         * 加入了帮派后 (可能是申请通过, 可能是别人邀请你(可能自动接受邀请, 可能自己手动同意的邀请))
         * 都会收到这条消息
         *
         * 如果此时打开着帮派界面, 请求一次BASIC数据
         *
         * 删掉所有邀请加我入他们帮派的icon
         *
         * 附带
         *
         * bytes 新帮派的名字 (需要在自己在场景中的角色头上加上家族名)
         */
        public static const S2C_YOU_JOIN_GUILD : String = "28_25";

        /**
         * 回复别人的入帮申请, 必须等待服务器返回, 才能再回复其他的入帮申请(包括全部同意)
         *
         * 不管服务器有没有返回, 客户端自己删掉这个申请, 就算服务器返回失败, 也不可能再回复一次
         *
         * 如果是拒绝, 则服务器没有返回,
         *
         * 附带
         *
         * bool 是否同意(true同意,false不同意)
         * bytes 目标家族名字
         */
        public static const C2S_REPLY_JOIN_REQUEST : String = "28_26";

        /**
         * 回复别人的入帮申请失败. 一定是同意才会收到. 失败不会有返回
         *
         * 附带varint32 错误码
         *
         * 1. 没有家族
         * 2. 没有权限
         * 3. 申请已过期
         * 4. 对方已经在你帮派中了 (可能通过其他途径加入)
         * 5. 对方已经在其他帮派中了
         * 6. 目标家族没有找到
         * 7. 自己家族人满了
         * 8. 板块战期间
         * 9. 对方不在自己国家了
         * 10. 退出家族24小时内不能加入其它帮派
         * 11. 你当前没有帮派
         */
        public static const S2C_REPLY_JOIN_REQUEST_FAIL : String = "28_27";

        /**
         * 某个帮派取消了你的申请
         *
         * bytes 帮派名字
         */
        public static const S2C_YOUR_JOIN_REQUEST_CANCEL : String = "28_28";

        /**
         * 同意对方入帮申请成功, 马上就会收到对方入族的广播.
         *
         * 解锁C2S_REPLY_JOIN_REQUEST
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_JOIN_REQUEST_SUCCESS : String = "28_29";

        /**
         * 有权利拒绝了别人的入帮申请后, 申请者会收到这条
         *
         * 收到后删掉对应的帮派的申请缓存, 使自己能再次发出入这个帮的申请
         *
         * 显示提示 很抱歉，XXX帮派拒绝了您的入帮申请
         *
         * 只有自己当前没有帮派时才会收到
         *
         * 附带
         *
         * bytes 帮派名字
         */
        public static const S2C_OTHER_REJECTED_YOUR_JOIN_REQUEST : String = "28_30";

        /**
         * 有权利的官员 同意了别人的入帮申请后, 申请者会收到这条
         *
         * 紧接着会收到S2C_YOU_JOIN_GUILD
         *
         * 提示 恭喜，XXX帮派已同意您的入帮请求
         *
         * 附带
         *
         * bytes 帮派名字
         */
        public static const S2C_OTHER_ACCEPTED_YOUR_JOIN_REQUEST : String = "28_31";

        /**
         * 邀请别人加入帮派, 只有当前有权限时才能发送.
         *
         * 必须要等服务器返回才能再发送别的邀请
         *
         * 附带
         * varint64 玩家id
         */
        public static const C2S_INVITE_JOIN : String = "28_32";

        /**
         * 邀请失败, 附带varint32 错误码
         *
         * 1. 没有家族
         * 2. 没有权限
         * 3. 帮派人已经满了
         * 4. 对方不在线
         * 5. 对方家族已经在你帮派里了
         * 6. 对方家族在别的帮派里
         * 7. 已经邀请过对方了
         * 8. 对方等级不够
         * 10. 板块战期间
         * 11. 对方是别的国家的
         * 12. 对方在入帮cd中
         * 13. 你没有帮派
         * 14. 目标没有家族
         */
        public static const S2C_INVITE_JOIN_FAIL : String = "28_33";

        /**
         * 邀请成功, 等待对方的回复
         *
         * 没有附带信息
         */
        public static const S2C_INVITE_JOIN_SUCCESS_AND_WAIT_OTHER_REPLY : String = "28_34";

        /**
         * 收到别的帮派的入帮邀请
         *
         * 缓存2分钟, 2分钟后删掉
         *
         * 附带
         *
         * varint64 对方id
         * UTF 对方玩家名字
         * bytes 帮派名字
         */
        public static const S2C_RECEIVE_JOIN_INVITE : String = "28_35";

        /**
         * 回复收到的入帮邀请, 在收到返回前不能再回复邀请
         *
         * 不管结果如何, 客户端在本地删掉这个邀请
         *
         * 如果是拒绝, 则没有返回
         *
         * 附带
         *
         * bool 是否同意
         * bytes 对方帮派名字
         */
        public static const C2S_REPLY_JOIN_INVITE : String = "28_36";

        /**
         * 回复入帮邀请失败, 只有同意才会收到
         *
         * 附带varint32 错误码
         *
         * 1. 没有家族
         * 2. 对方帮派已经满了
         * 3. 邀请过期
         * 4. 帮派不存在
         * 5. 板块战期间
         * 6. 你跟目标帮派不是一个国家的
         * 7. 加入帮派cd中
         * 8. 有帮派
         */
        public static const S2C_REPLY_JOIN_INVITE_FAIL : String = "28_37";

        /**
         * 回复同意进入家族成功, 解锁C2S_REPLY_JOIN_INVITE, 紧接着会收到S2C_YOU_JOIN_GUILD
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_JOIN_INVITE_SUCCESS : String = "28_38";

        /**
         * 发给别人的入帮邀请, 被别人回复了. 从本地删除自己发送给他的入帮邀请缓存, 使自己能再次邀请他
         *
         * 附带
         * boolean 回复(true同意,false不同意)
         * varint64 对方id
         * bytes 对方名字
         */
        public static const S2C_OTHER_REPLY_YOUR_JOIN_INVITE : String = "28_39";

        /**
         * 查看所有向我们帮派发送过申请的人
         *
         * 申请间隔，30S
         */
        public static const C2S_GET_REQUEST_JOIN_DETAIL : String = "28_41";

        /**
         * 返回入帮申请
         *
         * while(buffer.readable()){
         *      UTF 家族名字
         *      UTF 家族族长的名字
         *      varint32 家族等级
         *      varint64 总的战斗力
         *      varint32 家族成员数量
         * }
         */
        public static const S2C_GET_REQUEST_JOIN_DETAIL : String = "28_42";

        /**
         * 请求帮派申请失败
         *
         * 1. 没有家族
         * 2. 不是官员
         * 3. 不能够邀请他人
         * 4. 服务器内部错误
         * 5. 没有帮派
         */
        public static const S2C_GET_REQUEST_JOIN_DETAIL_FAIL : String = "28_43";

        /**
         * 帮派申请数量变化了
         *
         * bool true(当前还有申请)/false(当前没有申请了)
         */
        public static const S2C_HAS_REQUEST_JOIN : String = "28_44";

        /**
         * 踢出帮派成员
         *
         * bytes 要踢出的家族名字
         */
        public static const C2S_KICK_GUILD_MEMBER : String = "28_45";

        /**
         * 踢出帮派成员成功,不带其他参数
         */
        public static const S2C_KICK_GUILD_MEMBER : String = "28_46";

        /**
         * 踢出帮派成员失败,返回varint32错误码
         *
         * 1.没有家族,怎么踢人
         * 2.自己不是家族长,没有权限踢人
         * 3.没有帮派
         * 4.不是官员,无法踢出其他帮派成员
         * 5.要踢出去的家族没找到
         * 6.要踢出去的家族是创建该帮派的家族
         * 7.目标没有在本帮派
         * 8.没有权限踢出目标家族
         */
        public static const S2C_KICK_GUILD_MEMBER_FAIL : String = "28_47";

        /**
         * 踢出帮派成员广播
         * <p>
         * bytes 目标家族的名字
         */
        public static const S2C_KICK_GUILD_MEMBER_BROADCAST : String = "28_48";

        /**
         * 被从帮派踢出了
         */
        public static const S2C_BEEN_KICK_OUT_GUILD : String = "28_49";

        /**
         * 请求离开帮派,不附带其他任何参数
         */
        public static const C2S_LEAVE_GUILD : String = "28_50";

        /**
         * 离开成功,不附带其他任何参数
         */
        public static const S2C_LEAVE_GUILD : String = "28_51";

        /**
         * 离开失败,返回varint32错误码
         * <p>
         * 1.权限不够,无法申请离开
         * 2.没有帮派,怎么离开
         * 3.要离开帮派,但是你当前没有家族,如何离开
         * 4.当前帮派变更了
         * 5.不是帮主
         * 6.是帮派创建者,无法离开
         *
         * 100.服务器bug
         */
        public static const S2C_LEAVE_GUILD_FAIL : String = "28_52";

        /**
         * 离开帮派广播
         * <p>
         * bytes 离开的家族名字
         */
        public static const S2C_LEAVE_GUILD_BROADCAST : String = "28_53";

        /**
         * 自己家族离开帮派了
         */
        public static const S2C_SELF_FAMILY_LEAVE_GUILD : String = "28_54";

        /**
         * 帮派解散了,这是一条全场景的广播,任何收到该消息的人,检查视野里面是不是有人是这个帮派名字,将他们的帮派名字取下来
         * 自己是这个帮派的根据策划需求处理一下
         * <p>
         * bytes 帮派名字
         */
        public static const S2C_GUILD_DISMISS : String = "28_55";

        /**
         * 设置公告
         * <p>
         * bytes 公告内容,自己屏蔽屏蔽字,长度不超过100个汉字
         */
        public static const C2S_SET_ANNOUNCEMENT : String = "28_60";

        /**
         * 修改公告成功,玩家可以在需要的时候再次请求
         */
        public static const S2C_SET_ANNOUNCEMENT : String = "28_61";

        /**
         * 修改公告失败,返回varint32错误码
         *
         * 1.你没有家族怎么设置帮派公告
         * 2.你没有帮派怎么设置帮派公告
         * 3.没有权限设置公告
         */
        public static const S2C_SET_ANNOUNCEMENT_FAIL : String = "28_62";

        /**
         * 公告广播,告诉客户端有公告变更了,收到该消息,玩家可以在需要的时候再次请求
         */
        public static const S2C_SET_ANNOUNCEMENT_BROADCAST : String = "28_63";

        /**
         * 请求公告
         * <p>
         * 上线时,标识为可以请求公告,收到S2C_GET_ANNOUCEMENT将是否可以请求设置为false,收到S2C_SET_ANNOUNCEMENT_BROADCAST设置为true
         */
        public static const C2S_GET_ANNOUCEMENT : String = "28_64";

        /**
         * 返回公告内容
         * <p>
         * bytes 长度可能为0,表示没有公告内容
         */
        public static const S2C_GET_ANNOUCEMENT : String = "28_65";

        /**
         * 请求公告失败,返回varint32错误码
         * <p>
         * 1.你没有家族获取帮派公告
         * 2.你没有帮派怎么获取帮派公告
         */
        public static const S2C_GET_ANNOUCEMENT_FAIL : String = "28_66";

        /**
         * 设置官职
         * <p>
         * utf 家族名字
         * bool 上任(true)/卸任(false)
         * varint32 官职(上任的话该官职是上任后的官职/卸任的是该官员卸任前的官职)
         */
        public static const C2S_SET_POS : String = "28_70";

        /**
         * 设置职位成功,广播什么的根据策划的来
         * <p>
         * utf 家族名字
         * bool 上任(true)/卸任(false)
         * varint32 官职(上任的话该官职是上任后的官职/卸任的是该官员卸任前的官职)
         */
        public static const S2C_SET_POS : String = "28_71";

        /**
         * 设置帮派职位失败,返回varint32错误码
         * <p>
         * 1.你没有家族如何上任卸任家族
         * 2.你没有帮派如何上任卸任家族
         * 3.没有权限
         * 4.目标家族没找到
         * 5.不可以操作自己家族的官职
         * 6.目标家族不是我们帮派的,无权设置
         * 7.发送过来的官职非法
         * 8.无法上任或者卸任帮主
         * 9.目标当前就是这个官职啊
         * 10.官员空位不够
         * 11.要卸任选定的目标,但是目标不是该职位
         * 12.自己不是族长
         */
        public static const S2C_SET_POS_FAIL : String = "28_72";

        /**
         * 帮派职位变更了,根据策划需求进行显示
         *
         * utf 家族名字
         * bool 上任(true)/卸任(false)
         * varint32 官职(上任的话该官职是上任后的官职/卸任的是该官员卸任前的官职)
         */
        public static const S2C_POS_CHANGED : String = "28_73";

        /**
         * 请求升级帮派
         */
        public static const C2S_UPGRADE_LEVEL : String = "28_80";

        /**
         * 升级帮派成功
         * <p>
         * varint32 新的等级
         * varint64 剩余的繁荣度
         * varint64 剩余的银两
         */
        public static const S2C_UPGRADE_LEVEL : String = "28_81";

        /**
         * 升级帮派失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.没有权限
         * 4.帮派等级已满
         * 5.升级繁荣度不够
         * 6.升级银两不够
         */
        public static const S2C_UPGRADE_LEVEL_FAIL : String = "28_82";

        /**
         * 升级帮派广播
         * <p>
         * varint32 新的帮派等级,升级的人收不到
         * bool 升级还是降级
         */
        public static const S2C_LEVEL_CHANGED_BROADCAST : String = "28_83";

        /**
         * 领取帮派奖励
         */
        public static const C2S_COLLECT_PRIZE : String = "28_90";

        /**
         * 领取帮派奖励成功,将GuildModuleObj中的is_collect_guild_prize设置为true
         */
        public static const S2C_COLLECT_PRIZE : String = "28_91";

        /**
         * 领取失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.奖励已经领取
         * 4.背包满了
         */
        public static const S2C_COLLECT_PRIZE_FAIL : String = "28_92";

        /**
         * 领取王帮奖励
         */
        public static const C2S_COLLECT_KING_PRIZE : String = "28_100";

        /**
         * 领取王帮奖励成功,将GuildModuleObj中的is_collect_king_guild_prize设置为true
         */
        public static const S2C_COLLECT_KING_PRIZE : String = "28_101";

        /**
         * 领取王帮奖励失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.奖励已经领取
         * 4.不是王帮
         * 5.背包满了
         */
        public static const S2C_COLLECT_KING_PRIZE_FAIL : String = "28_102";

        /**
         * 请求帮派日志,请求间隔30S
         */
        public static const C2S_GUILD_LOG : String = "28_110";

        /**
         * 返回帮派日志
         *
         * 已压缩
         *
         * bytes AllGuildNewsProto
         */
        public static const S2C_GUILD_LOG : String = "28_111";

        /**
         * 请求帮派日志失败,返回varint32错误码
         *
         * 1.没有家族
         * 2.没有帮派
         */
        public static const S2C_GUILD_LOG_FAIL : String = "28_112";

        /**
         * 请求帮派基本信息,请求时间间隔15s,如果收到数据变更的消息,如有需要可以立刻更新
         */
        public static const C2S_GUILD_BASIC : String = "28_120";

        /**
         * 返回帮派基本信息
         *
         * 该消息有压缩
         *
         * bytes GuildProto
         */
        public static const S2C_GUILD_BASIC : String = "28_121";

        /**
         * 请求帮派基本信息失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         */
        public static const S2C_GUILD_BASIC_FAIL : String = "28_122";

        /**
         * 请求帮派中某个家族的信息,请求时间间隔15秒
         *
         * bytes 帮派中的家族名字
         */
        public static const C2S_GUILD_FAMILY_MEMBERS : String = "28_130";

        /**
         * 返回帮派成员数据
         * <p>
         * 已经压缩,先解压
         * <p>
         * varint32 后面官员数据的长度
         * <p>
         * bytes FamilyOfficeProto
         * <p>
         * while(buffer.readable()){
         *      varint64 玩家id
         *      utf 玩家名字
         *      varint64 帮派贡献
         *      varint32 等级
         *      varint64 战斗力
         * }
         */
        public static const S2C_GUILD_FAMILY_MEMBERS : String = "28_131";

        /**
         * 请求帮派家族成员失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.目标家族没有找到
         * 4.目标家族不是我们帮派的
         */
        public static const S2C_GUILD_FAMILY_MEMBERS_FAIL : String = "28_132";

        /**
         * 帮派捐献
         * <p>
         * varint32 捐献基数的倍数,必须>=1
         */
        public static const C2S_DONATE : String = "28_150";

        /**
         * 捐献成功,自己的帮派贡献变化通过另外的消息推送
         * <p>
         * varint64 当前帮派的银两
         */
        public static const S2C_DONATE : String = "28_151";

        /**
         * 捐献失败,返回varint32错误码
         * <p>
         * 1.没有家族
         * 2.没有帮派
         * 3.捐献数量非法
         * 4.捐献太多的银两了
         * 5.银两不足
         * 6.帮派仓库容量不足
         */
        public static const S2C_DONATE_FAIL : String = "28_152";

        /**
         * 捐献成功
         * <p>
         * varint64 捐献基数的倍数,客户端转换成锭/两/文
         * <p>
         * bytes 捐献的人的名字
         */
        public static const S2C_DONATE_BROADCAST : String = "28_153";

    }
}