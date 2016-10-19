package app.cmd {

    public class FamilyModuleMessages {

        /**
         * 创建家族. 当前必须没有家族. 客户端需本地判断钱/等级/家族名字合法/家族等级名字合法
         *
         * 附带
         *
         * bool 家族是否自动同意入帮申请
         *
         * varint32 物品在背包中的位置
         *
         * UTF 家族名字.2-7字 (客户端需已经前后去空, 且过滤了关键字, 有关键字就本地弹错, 不要发过来)
         */
        public static const C2S_CREATE_FAMILY : String = "19_1";

        /**
         * 创建家族失败, 附带varint32 失败原因
         *
         * 1. 你有家族
         * 2. 钱不够
         * 3. 家族功能没开启
         * 4. 家族名字字数不对
         * 5. 家族名字已经存在
         * 6. 城战中不能创建家族
         * 7. 退出家族24小时内不能加入其它家族
         * 8. 物品不足
         */
        public static const S2C_CREATE_FAMILY_FAIL : String = "19_2";

        /**
         * 家族创建成功. 将自己家族设为消息发过来的家族. 不会向创建者发送入族消息了
         *
         * 服务器会另外发送扣钱消息, 这条消息不需要处理
         *
         * 附带
         *
         * bytes 家族名字 (和客户端请求的不一样, 前面加上了区服id)
         */
        public static const S2C_CREATE_FAMILY_SUCCESS : String = "19_3";

        /**
         * 大家飘字: 江湖风起云涌，又一个新势力【家族名称】崛起了
         *
         * 附带
         * varint64 族长ID
         * UTF 族长名字
         * UTFBytes 家族名字
         */
        public static const S2C_NEW_FAMILY_CREATED_BROADCAST : String = "19_4";

        /**
         * 请求本国家族列表. 客户端缓存30秒, 关掉界面再打开, 30秒内还是用上次请求时返回的数据.
         * 仅在打开界面时判断缓存是否过期, 开着界面的时候不需要自动刷新
         *
         * 没有附带信息
         */
        public static const C2S_GET_SELF_FAMILY_LIST : String = "19_5";

        /**
         * 回复本国家族列表信息, 已压缩
         *
         * 附带
         *
         * ClientFamilyListProto
         */
        public static const S2C_REPLY_SELF_FAMILY_LIST : String = "19_6";

        /**
         * 请求他国家族列表. 客户端缓存30秒, 关掉界面再打开, 30秒内还是用上次请求时返回的数据.
         * 仅在打开界面时判断缓存是否过期, 开着界面的时候不需要自动刷新
         *
         * 没有附带信息
         */
        public static const C2S_GET_OTHER_FAMILY_LIST : String = "19_7";

        /**
         * 回复他国家族列表信息, 已压缩
         *
         * 附带
         *
         * ClientFamilyListProto
         */
        public static const S2C_REPLY_OTHER_FAMILY_LIST : String = "19_8";

        /**
         * 获取自己的家族详细信息, 包括成员列表, 家族等级, 等级, 已捐献物品数量等等
         *
         * 请求时当前必须在个家族中.
         *
         * 数据缓存10秒, 打开着成员列表这个界面时, 每10秒请求一次
         *
         * 从收到返回开始计时, 不是从请求开始
         * 离开家族后, 计时清零. 防止退出家族/又进入个新的家族后, 打开成员列表没东西. 但在前一个请求没返回前, 不能再请求
         *
         * 没有附带信息
         */
        public static const C2S_GET_SELF_FAMILY_INFO : String = "19_9";

        /**
         * 请求家族信息失败, 附带varint32 错误码
         *
         * 1. 请求太频繁
         * 2. 你当前没有家族
         * 3. 服务器内部错误, 不要自动重试
         */
        public static const S2C_GET_SELF_FAMILY_INFO_FAIL : String = "19_10";

        /**
         * 回复家族详细信息. 消息已压缩
         *
         * 附带
         *
         * FamilyProto
         */
        public static const S2C_REPLY_SELF_FAMILY_INFO : String = "19_11";

        /**
         * 改变家族公告, 必须等待服务器返回才能再更改
         *
         * 客户端需要过滤敏感字, 且需要检查字数在70汉字(140字节)以下
         *
         * 去掉后面的空格, 不需要去前面的
         *
         * 有改变才发过来. 没有不要发
         *
         * 设置频率为上次修改时间+设置公告的周期
         *
         * 附带
         *
         * UTFBytes 新的家族公告
         */
        public static const C2S_CHANGE_ANNOUNCEMENT : String = "19_12";

        /**
         * 改变家族公告失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你不是族长或者副族长
         * 3. 公告长度非法 必须是0-200字符
         * 4. 请求频率过快
         */
        public static const S2C_CHANGE_ANNOUNCEMENT_FAIL : String = "19_13";

        /**
         * 改变公告成功, 把公告内容改成请求的内容.
         *
         * 没有附带信息
         */
        public static const S2C_CHANGE_ANNOUNCEMENT_SUCCESS : String = "19_14";

        /**
         * 家族中其他人收到此广播, 修改者不会收到. 收到后清掉家族信息缓存, 如果当前正打开着家族面板, 则马上刷新
         *
         * 提示 家族公告更新了，欢迎查看
         *
         * 没有附带信息
         */
        public static const S2C_ANNOUNCEMENT_CHANGED_BROADCAST : String = "19_15";

        /**
         * 捐献银两. 需要等服务器返回之后才能再次捐献. 发过来的捐献数必须<=包里有的银两数
         *
         * 附带
         *
         * bool true(捐钱)/false(捐物)
         * if(捐钱){
         *      varint32 捐献多少个基础银两，注意，这个值不是银两，比如100文换10贡献值，这里发送1000，就是花费100000问，获得1000贡献值
         * } else {
         *      varint32 捐献物品的个数
         *      UpgradeProto 捐献物品的proto
         * }
         */
        public static const C2S_DO_DONATE : String = "19_16";

        /**
         * 捐献银两失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你没有这么多钱
         * 3. 家族贡献里的钱满了 比如只差1块, 但你要捐2块. 结果就是完全没捐
         * 4. 发来的银子数量非法
         * 5. 发来的物品数量非法
         * 6. 帮派建设令牌不足
         */
        public static const S2C_DO_DONATE_FAIL : String = "19_17";

        /**
         * 捐献银两成功, 服务器会另外发送扣钱消息
         *
         * 提示 感谢您，捐献了XXX银两，您获得了X点家族贡献和X点江湖历练 (根据自己发的请求自己算)
         *
         * 附带
         */
        public static const S2C_DO_DONATE_SUCCESS : String = "19_18";

        /**
         * 族中其他人捐献了银两
         *
         * 显示 聊天栏帮派频道发送消息：[帮派]玩家名捐献10个建设令牌，个人贡献+100！ 我要捐献
         * 或 [帮派]玩家名捐献银子10锭10两，个人贡献+100！ 我要捐献
         *
         * 如果当前正打开着家族界面, 修改家族帮派银两数量，修改家族帮派建设令牌数量
         *
         * 附带
         *
         * bool true(捐钱)/false(捐物)
         * if(捐钱){
         *      varint32 捐献多少个基础银两，注意，这个值不是银两，比如100文换10贡献值，这里发送1000，就是花费100000问，获得1000贡献值
         *      varint64 当前有多少银两
         * } else {
         *      varint32 捐献物品的个数
         *      varint64 当前有多少个建设令牌
         * }
         *
         * varint64 捐献的人的id
         * bytes 捐献的人名字
         */
        public static const S2C_OTHER_DO_DONATE_BROADCAST : String = "19_19";

        /**
         * 升级家族建筑
         *
         * varint32 建筑类型
         */
        public static const C2S_FAMILY_UPGRADE_BUILDING : String = "19_20";

        /**
         * 家族等级升级失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你不是族长
         * 3. 建筑已经顶级
         * 4. 升级钱不够
         * 5. 升级建设令牌不够
         * 6. 未知的要升级的建筑类型
         * 7. 大厅等级不够，无法升级
         */
        public static const S2C_FAMILY_UPGRADE_BUILDING_FAIL : String = "19_21";

        /**
         * 升级成功, 刷新家族页面
         *
         * varint64 当前的帮派仓库银两
         * varitn64 当前的帮派仓库建设令牌
         */
        public static const S2C_FAMILY_UPGRADE_BUILDING_SUCCESS : String = "19_22";

        /**
         * 家族等级升级成功, 广播给家族里所有人
         *
         * 附带
         *
         * varint32 建筑类型FamilyBuildingType
         * varint32 最新家族等级等级
         */
        public static const S2C_FAMILY_UPGRADE_BUILDING_BROADCAST : String = "19_23";

        /**
         * 请求弹劾帮主，客户端判断帮主离线时长
         *
         * 不需要附带别的信息
         */
        public static const C2S_IMPEACH_FAMILY_LEADER : String = "19_24";

        /**
         * 弹劾成功，接下来会收到帮主变更的通知
         */
        public static const S2C_IMPEACH_FAMILY_LEADER : String = "19_25";

        /**
         * 弹劾失败，返回varint32错误码
         *
         * 1. 没有加入帮派
         * 2. 服务器bug
         * 3. 你自己是帮主，无法弹劾
         * 4. 时间没到，不可以弹劾
         * 5. 没有权限
         */
        public static const S2C_IMPEACH_FAMILY_LEADER_FAIL : String = "19_26";

        /**
         * 请求学习技能，必须等上次的请求返回以后才可以升级
         *
         * varint32 第几个技能
         *
         * UpgradeProto 学习的消耗
         */
        public static const C2S_LEARN_FAMILY_COLLAGE_SPELL : String = "19_27";

        /**
         * 学习技能成功
         *
         * varint32 第几个技能
         * varint32 技能等级
         */
        public static const S2C_LEARN_FAMILY_COLLAGE_SPELL : String = "19_28";

        /**
         * 学习技能失败，返回varint32错误码
         *
         * 1. 没有加入帮派
         * 2. 要学习的技能没找到
         * 3. 要学习的技能已经满级了
         * 4. 书院等级不足
         * 5. 钱不够
         * 6. 帮贡不够
         * 7. 物品数量不够
         */
        public static const S2C_LEARN_FAMILY_COLLAGE_SPELL_FAIL : String = "19_29";

        /**
         * 获取最新家族见闻, 不要自动刷新, 且将数据保存30秒, 30秒内再看家族见闻就用缓存着的数据
         *
         * 离开家族后删除数据. 防止30秒内进到个新家族, 会看到老家族的见闻
         *
         * 没有附带信息
         */
        public static const C2S_GET_NEWS : String = "19_30";

        /**
         * 获取家族见闻出错, 附带varint32 错误码
         *
         * 1. 你没有家族
         */
        public static const S2C_GET_NEWS_FAIL : String = "19_31";

        /**
         * 返回家族见闻, 消息已压缩
         *
         * 附带
         *
         * AllFamilyNewsProto 这个proto 具体proto内容和读法, 客户端做到再说
         */
        public static const S2C_REPLY_NEWS : String = "19_32";

        /**
         * 要离开家族, 没有附带消息
         */
        public static const C2S_LEAVE_FAMILY : String = "19_33";

        /**
         * 离开家族失败, 附带varint32 错误码
         *
         * 1. 你本来就没有家族
         * 2. 你是族长
         * 3. 家族战期间（包括板块战，无双城，皇城）
         * 4. 正在打家族副本
         */
        public static const S2C_LEAVE_FAMILY_FAIL : String = "19_34";

        /**
         * 离开家族成功, 自己把自己的家族设为空
         */
        public static const S2C_LEAVE_FAMILY_SUCCESS : String = "19_35";

        /**
         * 其他人离开了家族, 广播给在家族中的人, 收到后如果当前打开着家族成员列表, 则马上刷新一下
         *
         * 附带
         * UTFBytes
         */
        public static const S2C_OTHER_LEAVE_FAMILY_BROADCAST : String = "19_36";

        /**
         * 将人踢出家族. 客户端需要自己判断权限以及对方的职位. 也不能踢自己
         *
         * 服务器返回前不能再发送踢人请求
         *
         * 附带
         *
         * varint64 要踢的人id
         */
        public static const C2S_KICK_MEMBER : String = "19_37";

        /**
         * 踢人失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你没有权限 (族长或副族长才能踢人) (如果要踢有官职的必须是族长) (不能踢自己)
         * 3. 族中没有你要踢的这个人
         * 4. 家族战期间（包括板块战，无双城，皇城）
         * 5. 这个人在打家族副本
         */
        public static const S2C_KICK_MEMBER_FAIL : String = "19_38";

        /**
         * 踢人成功, 紧接着会收到S2C_SOMEONE_BEEN_KICKED的广播
         *
         * 没有附带信息
         */
        public static const S2C_KICK_MEMBER_SUCCESS : String = "19_39";

        /**
         * 被踢的人, 收到这条. 将自己的家族设为空, 角色名字上面不要有家族. 如果打开着家族页面, 改为创建家族页面
         *
         * 附带
         *
         * UTFBytes 踢你的人的名字
         */
        public static const S2C_YOU_BEEN_KICKED : String = "19_40";

        /**
         * 有人被提出家族了, 家族中所有人收到广播, 被踢的不会收到
         *
         * 收到这条时, 如果正打开着家族成员列表, 则刷新.
         *
         * 附带
         *
         * UTF 主动踢人的人名
         * UTFBytes 被踢的人名
         */
        public static const S2C_SOMEONE_BEEN_KICKED_BROADCAST : String = "19_41";

        /**
         * 将自己的是否自动接受入族邀请
         *
         * bool true(自动接收)/false(不自动接收)
         * 没有返回
         */
        public static const C2S_SET_AUTO_ACCEPT_INVITE : String = "19_42";

        /**
         * 将  自己的是否禁止他人邀请我加入家族设为  是
         *
         * bool true(禁止)/false(不禁止)
         * 没有返回
         */
        public static const C2S_SET_FORBID_OTHER_INVITE_ME_JOIN_FAMILY : String = "19_43";

        /**
         * 设置家族是否自动同意别人的入族申请. 只有族长才能设置
         *
         * 有变化才发过来, 需要等待服务器返回
         *
         * 附带
         *
         * bool true 自动同意, false 不自动同意,需要手动同意
         */
        public static const C2S_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST : String = "19_44";

        /**
         * 设置失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你不是族长
         */
        public static const S2C_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST_FAIL : String = "19_45";

        /**
         * 设置成功
         */
        public static const S2C_SET_FAMILY_AUTO_ACCEPT_JOIN_REQUEST_SUCCESS : String = "19_46";

        /**
         * 广播给全服, 此家族已解散. 把这个家族从自己的盟族和敌对族中删除
         *
         * 视野里如果有这个家族的人, 则把他们的家族设为无
         * 如果解散的家族是自己的族, 把自己的家族设为无. 显示 您所处的家族XXXX，被族长XXX解散了
         *
         * 附带
         * varint64 族长id
         * UTF 族长名字
         * UTFBytes 解散的家族的名字
         */
        public static const S2C_FAMILY_DISMISSED_BROADCAST : String = "19_47";

        /**
         * 广播全服. 因为活跃度不足而解散. 逻辑和上面一样, 只是提示自己家族的人的话不同
         *
         * 您所在的家族XXX因活跃玩家不足而自动解散
         *
         * 附带
         *
         * UTFBytes 解散的家族的名字
         */
        public static const S2C_FAMILY_DISMISSED_LOW_ACTIVITY : String = "19_48";

        /**
         * 上线时, 如果家族活跃度不够, 会收到
         *
         * 您所在的家族每日活跃玩家不足，请多招募成员，并鼓励成员每日上线，否则您的家族将会于 x 日内解散
         *
         * 附带
         *
         * varint32 剩余多少天会被解散
         */
        public static const S2C_LOW_ACTIVITY_WARNING : String = "19_49";

        /**
         * 下次能够加入家族或者创建家族的cd刷新了
         *
         * varint64 下一次能够创建/加入家族的时间
         */
        public static const S2C_JOIN_FAMILY_IN_CD : String = "19_50";

        /**
         * 设置别人的职位, 只有族长才能执行这操作. 必须等待服务器返回才能继续设置
         *
         * 附带
         *
         * varint32 目标职位 FamilyOfficerPos，如果是上任，就是设置将要上任的职位，若要卸任，就是他当前的职位
         * varint64 要设置的人
         * bool true(上任)/false(卸任)
         *
         */
        public static const C2S_SET_POSITION : String = "19_51";

        /**
         * 设置失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你不是族长
         * 3. 对应id的人不在你家族中
         * 4. 职位非法, 必须是0-3
         * 5. 目标已经是那个职位了
         * 6. 不能改自己的职位
         * 7. 自己是无双城主
         * 8. 家族战期间（包括板块战，无双城，皇城）
         * 9. 自己是皇城城主
         * 10. 长老人数已达上限，无法再任命
         * 11. 执事人数已达上限，无法再任命
         */
        public static const S2C_SET_POSITION_FAIL : String = "19_52";

        /**
         * 设置成功, 解锁. 接下来全家族收到S2C_POSITION_CHANGE_BROADCAST
         *
         * 如果给别人的新职位是族长,则提示 您将族长禅让给了：XXXX玩家名
         */
        public static const S2C_SET_POSITION_SUCCESS : String = "19_53";

        /**
         * 族中职位变动, 收到后如果正打开着家族成员列表, 则刷新
         * 需要根据里面的职位, 和被设置职位的人, 显示对应的提醒.
         *
         * 如果职位是族长, 且被设置的人是自己, 显示　恭喜您被提升为【族长】
         * 不然则显示　本家族族长变更，欢迎新族长：XXXXX
         *
         * 其他职位, 如果被设置的人是自己, 则显示 您在族中的职位变更为：XXXX
         * 不然则显示 本家族XXX被任命为XXX职位
         *
         * 附带
         *
         * varint64 被改的人id, 用来和自己的id比对
         * UTFBytes 被改的人名字
         * bool true(设置为上任)/false(设置为卸任)
         * varint32 目标职位 OfficerPos
         *
         */
        public static const S2C_POSITION_CHANGE_BROADCAST : String = "19_54";

        /**
         * 请求加入别的家族, 返回前不能再请求, 或者回复别的家族的邀请
         *
         * 请求时必须自己没有家族, 且要求加入的家族人数没满
         *
         * 附带
         *
         * bool true(发送申请)/false(取消申请)
         *
         * UTFBytes 要求加入的家族名字
         */
        public static const C2S_REQUEST_JOIN : String = "19_56";

        /**
         * 要求加入家族失败, 附带varint32 错误码
         *
         * 1. 你有家族了
         * 2. 你请求加入的家族不存在
         * 3. 你请求加入的家族满人了
         * 4. 家族不是自动接受入族申请, 且负责人都不在线
         * 5. 你已经申请过这个家族了
         * 6. 你的等级不够
         * 7. 板块战期间, 不能进入
         * 8. 不能加入别的联服的家族
         * 9. 你退出家族24小时内不能加入其它家族
         * 10. 该帮派申请达到上限了
         * 11. 没有发送过申请
         */
        public static const S2C_REQUEST_JOIN_FAIL : String = "19_57";

        /**
         * 请求入族成功, 紧接着会收到S2C_YOU_JOIN_FAMILY消息通知你进入了一个家族
         *
         * 仅供解锁C2S_REQUEST_JOIN. 并展示"恭喜，XXX家族已同意您的入族请求"
         *
         * boolean true(申请成功)/false(取消申请成功)
         *
         * bytes 帮派的名字
         */
        public static const S2C_REQUEST_JOIN_SUCCESS : String = "19_58";

        /**
         * 入族申请已经转发给了相关负责人
         *
         * 客户端需要缓存自己已经申请过且申请结果是S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY的家族, 保存2分钟.
         * 2分钟后自动删除, 服务器不会再发消息通知
         * 如果期间收到了对方明确的回复, 不管是同意还是拒绝, 都删掉这个家族的缓存
         *
         * varint64 申请过期时间
         * byte[] 申请的帮派
         */
        public static const S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY : String = "19_59";

        /**
         * 广播给家族所有人, 有人入族了.
         *
         * 仅供展示提醒. 欢迎【XXX玩家名】加入本家族，本家族变的更加强大了
         *
         * 如果打开着家族成员界面, 则马上重新请求一次成员列表
         *
         * 附带
         *
         * varint64 heroId
         * UTFBytes 入族的人的名字
         */
        public static const S2C_OTHER_JOIN_FAMILY : String = "19_60";

        /**
         * 加入了家族后 (可能是申请通过, 可能是别人邀请你(可能自动接受邀请, 可能自己手动同意的邀请))
         * 都会收到这条消息
         *
         * 如果此时打开着家族界面, 请求一次成员列表
         *
         * 删掉所有邀请加我入他们族的icon
         *
         *
         * 附带
         *
         * UTF 新家族的名字 (需要在自己在场景中的角色头上加上家族名)
         */
        public static const S2C_YOU_JOIN_FAMILY : String = "19_61";

        /**
         * 回复别人的入族申请, 必须等待服务器返回, 才能再回复其他的入族申请(包括全部同意)
         *
         * 不管服务器有没有返回, 客户端自己删掉这个申请, 就算服务器返回失败, 也不可能再回复一次
         *
         * 如果是拒绝, 则服务器没有返回,
         *
         * 附带
         *
         * varint64 对方的id
         * bool 是否同意
         */
        public static const C2S_REPLY_JOIN_REQUEST : String = "19_63";

        /**
         * 回复别人的入族申请失败. 一定是同意才会收到. 失败不会有返回
         *
         * 附带varint32 错误码
         *
         * 1. 你当前没有家族
         * 2. 你不是族长或副族长或堂主
         * 3. 申请已过期
         * 4. 对方已经在你家族中了 (可能通过其他途径加入)
         * 5. 对方已经在其他家族中了
         * 6. 对方已经不在线
         * 7. 自己家族人满了
         * 8. 板块战期间
         * 9. 对方不在自己国家了
         * 10. 退出家族24小时内不能加入其它家族
         */
        public static const S2C_REPLY_JOIN_REQUEST_FAIL : String = "19_64";

        /**
         * 某个家族取消了你的申请
         *
         * UTFBytes 家族名字
         */
        public static const S2C_YOUR_JOIN_REQUEST_CANCEL : String = "19_65";

        /**
         * 同意对方入族申请成功, 马上就会收到对方入族的广播.
         *
         * 解锁C2S_REPLY_JOIN_REQUEST
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_JOIN_REQUEST_SUCCESS : String = "19_66";

        /**
         * 族长/副族长 拒绝了别人的入族申请后, 申请者会收到这条
         *
         * 收到后删掉对应的家族的申请缓存, 使自己能再次发出入这个族的申请
         *
         * 显示提示 很抱歉，XXX家族拒绝了您的入族申请
         *
         * 只有自己当前没有家族时才会收到
         *
         * 附带
         *
         * UTFBytes 家族名字
         */
        public static const S2C_OTHER_REJECTED_YOUR_JOIN_REQUEST : String = "19_67";

        /**
         * 族长/副族长 同意了别人的入族申请后, 申请者会收到这条
         *
         * 紧接着会收到S2C_YOU_JOIN_FAMILY
         *
         * 提示 恭喜，XXX家族已同意您的入族请求
         *
         * 附带
         *
         * UTFBytes 家族名字
         */
        public static const S2C_OTHER_ACCEPTED_YOUR_JOIN_REQUEST : String = "19_68";

        /**
         * 邀请别人加入家族, 只有当前有家族且是族长或副族长时才能发送.
         *
         * 必须要等服务器返回才能再发送别的邀请
         *
         * 附带
         * varint64 对方id
         */
        public static const C2S_INVITE_JOIN : String = "19_69";

        /**
         * 邀请失败, 附带varint32 错误码
         *
         * 1. 你没有家族
         * 2. 你不是族长或副族长
         * 3. 家族人已经满了
         * 4. 对方不在线
         * 5. 对方已经在你家族里了
         * 6. 对方在别的家族里
         * 7. 已经邀请过对方了
         * 8. 对方等级不够
         * 9. 对方设置了 禁止被别人邀请加入家族
         * 10. 板块战期间
         * 11. 对方是别的联服的
         * 12. 对方退出家族24小时内不能加入其它家族
         */
        public static const S2C_INVITE_JOIN_FAIL : String = "19_70";

        /**
         * 邀请成功, 对方是自动接受邀请的
         * 紧接着就会收到S2C_OTHER_JOIN_FAMILY对方加入家族的消息
         *
         * 没有附带信息
         */
        public static const S2C_INVITE_JOIN_SUCCESS : String = "19_71";

        /**
         * 邀请成功, 对方不是自动接受邀请的, 需要等待对方的回复
         *
         * 没有附带信息
         */
        public static const S2C_INVITE_JOIN_SUCCESS_AND_WAIT_OTHER_REPLY : String = "19_72";

        /**
         * 收到别的家族的入族邀请
         *
         * 缓存2分钟, 2分钟后删掉
         *
         * 附带
         *
         * varint64 对方id
         * UTF 对方玩家名字
         * varint32 等级
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         *
         * varint32 家族等级等级
         * UTFBytes 家族名字
         */
        public static const S2C_RECEIVE_JOIN_INVITE : String = "19_73";

        /**
         * 回复收到的入族邀请, 在收到返回前不能再回复邀请
         *
         * 不管结果如何, 客户端在本地删掉这个邀请
         *
         * 如果是拒绝, 则没有返回
         *
         * 附带
         *
         * bool 是否同意
         * UTFBytes 对方家族名字
         */
        public static const C2S_REPLY_JOIN_INVITE : String = "19_74";

        /**
         * 回复入族邀请失败, 只有同意才会收到
         *
         * 附带varint32 错误码
         *
         * 1. 你已经有家族了
         * 2. 对方家族已经满了
         * 3. 邀请过期
         * 4. 你返回的家族不存在
         * 5. 板块战期间
         * 6. 你更改国家了
         * 7. 你退出家族24小时内不能加入其它家族
         */
        public static const S2C_REPLY_JOIN_INVITE_FAIL : String = "19_75";

        /**
         * 回复同意进入家族成功, 解锁C2S_REPLY_JOIN_INVITE, 紧接着会收到S2C_YOU_JOIN_FAMILY
         *
         * 没有附带信息
         */
        public static const S2C_REPLY_JOIN_INVITE_SUCCESS : String = "19_76";

        /**
         * 发给别人的入族邀请, 被别人拒绝了. 从本地删除自己发送给他的入族邀请缓存, 使自己能再次邀请他
         *
         * 可能玩家下线再上, 导致没有邀请过的人的缓存, 多发了个对方名字, 供显示被拒绝提示
         *
         * 附带
         * varint64 对方id
         * UTFBytes 对方名字
         */
        public static const S2C_OTHER_REJECTED_YOUR_JOIN_INVITE : String = "19_77";

        /**
         * 拒绝所有邀请我入他们族的邀请, 没有附带信息, 服务器没有返回. 发送后从自己这里删除所有的邀请
         *
         * 如果只有一条邀请, 则转化为针对他们家族的拒绝消息 C2S_REPLY_JOIN_INVITE
         */
        public static const C2S_REJECT_ALL_JOIN_INVITE : String = "19_78";

        /**
         * 别人同意了你的入族邀请. 发送给主动邀请别人的人
         *
         * 只需要展示 恭喜, xxx同意了你的家族邀请
         *
         * 附带
         *
         * varint64 heroId
         * UTFBytes 对方名字
         */
        public static const S2C_OTHER_ACCEPTED_YOUR_JOIN_INVITE : String = "19_79";

        /**
         * 开启帮派神兽副本
         */
        public static const C2S_OPEN_FAMILY_ANIMAL_DUNGEON : String = "19_80";

        /**
         * 开启帮派神兽副本成功
         */
        public static const S2C_OPEN_FAMILY_ANIMAL_DUNGEON : String = "19_81";

        /**
         * 开启帮派神兽副本失败，返回varint32错误码
         *
         * 1. 没有帮派
         * 2. 没有权限开启
         * 3. 时间没到，无法开启
         * 4. 今天已经开启了
         * 5. 服务器bug
         */
        public static const S2C_OPEN_FAMILY_ANIMAL_DUNGEON_FAIL : String = "19_82";

        /**
         * 帮派神兽副本开启了
         *
         * varint64 开启时间
         * varint32 开启时兽栏等级
         */
        public static const S2C_FAMILY_ANIMAL_DUNGEON_START : String = "19_83";

        /**
         * 帮派神兽副本结束了
         */
        public static const S2C_FAMILY_ANIMAL_DUNGEON_END : String = "19_84";

        /**
         * 请求进入帮派神兽副本
         */
        public static const C2S_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN : String = "19_85";

        /**
         * 进入帮派神兽副本成功
         */
        public static const S2C_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN : String = "19_86";

        /**
         * 进入帮派神兽副本失败，返回varint32错误码
         *
         * 1. 没有帮派
         * 2. 活动没有开启
         * 3. 当前已经死亡了
         * 4. 没在普通场景中
         * 5. 战斗状态中
         * 6. 当前状态无法进入帮派神兽副本
         */
        public static const S2C_TRY_ENTER_FAMILY_ANIMAL_DUNGOEN_FAIL : String = "19_87";

        /**
         * 进入了帮派神兽副本
         *
         * varint64 副本结束时间
         */
        public static const S2C_ENTER_FAMILY_ANIMAL_DUNGEON : String = "19_88";

        /**
         * 所有自己加入帮派的申请
         *
         * while(buffer.readable()){
         *      varint64 申请的过期时间
         *      UTF 帮派名字
         * }
         */
        public static const S2C_HAS_REQUEST_JOIN_FAMILYS : String = "19_89";

        /**
         * 查看所有向我们帮派发送过申请的人
         *
         * 申请间隔，30S
         */
        public static const C2S_GET_REQUEST_JOIN_DETAIL : String = "19_90";

        /**
         * 返回入帮申请
         *
         * while(buffer.readable()){
         *      varint64 id
         *      UTF 名字
         *      varint32 level 等级
         *      varint64 战斗力
         *      varint64 过期时间
         * }
         */
        public static const S2C_GET_REQUEST_JOIN_DETAIL : String = "19_91";

        /**
         * 请求帮派申请失败
         *
         * 1. 没有家族
         * 2. 不是官员
         * 3. 不能够邀请他人
         * 4. 服务器内部错误
         */
        public static const S2C_GET_REQUEST_JOIN_DETAIL_FAIL : String = "19_92";

        /**
         * 帮派申请数量变化了
         *
         * bool true(当前还有申请)/false(当前没有申请了)
         */
        public static const S2C_HAS_REQUEST_JOIN : String = "19_93";

        /**
         * 手动解散帮派, 只有帮主才能发送. 必须等待服务器返回, 且发送前已经2次确认过
         *
         * 没有附带信息
         */
        public static const C2S_DISMISS_FAMILY : String = "19_94";

        /**
         * 解散帮派失败, 附带varint32 错误码
         *
         * 1. 你没有帮派
         * 2. 你不是帮主
         * 3. 占领王/皇家族无法解散
         * 4. 人数太多，无法解散，只有帮主一个人时才可以解散
         * 5. 请先离开或者解散帮派
         */
        public static const S2C_DISMISS_FAMILY_FAIL : String = "19_95";

        /**
         * 帮派解散成功, 解锁. 马上全服会收到广播S2C_FAMILY_DISMISSED_BROADCAST
         *
         * 没有附带信息
         */
        public static const S2C_DISMISS_FAMILY_SUCCESS : String = "19_96";

    }
}