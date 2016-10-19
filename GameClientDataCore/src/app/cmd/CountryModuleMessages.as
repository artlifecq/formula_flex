package app.cmd {

    public class CountryModuleMessages {

        /**
         * 自己国家的状态，数据已经压缩
         * <p>
         * byte[] AllCountryDataProto，数据已经压缩
         */
        public static const S2C_COUNTRY_STATUS : String = "104_1";

        /**
         * 请求他国国王数据，缓存数据，30S后数据无效
         * <p>
         * 如果收到国王变更，立即将数据设置为无效，在需要数据是再次请求
         */
        public static const C2S_OTHER_COUNTRY_KING : String = "104_3";

        /**
         * 返回他国国王数据，已经压缩
         * <p>
         * 该数据里面不会包括自己国家国王的数据
         * <p>
         * 解压缩
         * <p>
         * while(buffer.readable()){
         * varint32 国家
         * varint32 后面数据长度，长度为0表示没有国王
         * bytes decode成CountryMemberProto
         * }
         */
        public static const S2C_OTHER_COUNTRY_KING : String = "104_4";

        /**
         * 请求国家历史记录，单个国家的请求，60S才允许请求一次
         * <p>
         * varint32 国家id
         */
        public static const C2S_COUNTRY_HISTORY_RECORDS : String = "104_5";

        /**
         * 国家历史记录，该消息需要解压，收到后，客户端缓存
         * <p>
         * 解压后
         * <p>
         * varint32 国家id
         * <p>
         * bytes CountryHistoryRecordsProto
         */
        public static const S2C_COUNTRY_HISTORY_RECORDS : String = "104_6";

        /**
         * 每晚0点，国家实力会变更
         * <p>
         * varint32 country 哪个国家
         * varint64 country_power 国力
         * varint32 power_type 国力类型，即CountryPowerType
         */
        public static const S2C_COUNTRY_POWER_CHANGED : String = "104_7";

        /**
         * 获得国库里有多少钱，该国国库资金客户端缓存5S，如有需要，该国数据5S后可以来请求一次
         * <p>
         * varint32 哪个国家
         */
        public static const C2S_GET_COUNTRY_EXCHEQUER_AMOUNT : String = "104_8";

        /**
         * 返回当前国库里面总共有多少钱，缓存该国家的数据
         * <p>
         * varint32 哪个国家
         * varint64 国库钱的数量
         */
        public static const S2C_GET_COUNTRY_EXCHEQUER_AMOUNT : String = "104_9";

        /**
         * 请求获得本国官员列表
         * <p>
         * 客户端缓存30S，如有需要，可以来进行请求，如果收到官员变更，如有需要可以请求
         * <p>
         * 如果没有收到任何官员变更，也不需要知道这些官员在线不在线，也不需要来请求
         */
        public static const C2S_GET_OFFICE : String = "104_10";

        /**
         * 官员列表数据，已经压缩
         * <p>
         * 解压
         * <p>
         * bytes CountryOfficeProto
         */
        public static const S2C_GET_OFFICE : String = "104_11";

        /**
         * 昨日收益跟禁卫今日的俸禄变更了
         * <p>
         * varint64 昨日收入
         * varint64 禁卫今日的俸禄
         */
        public static const S2C_YESTERDAY_INCOME_CHANGED : String = "104_12";

        /**
         * 获取军费补贴数据, 如果当前死亡了，且在军费补贴地图，有军费补贴，5S后可以再来请求一次该数据
         * <p>
         * 如果当前没有军费补贴，不要来请求
         * <p>
         * 当前没达到复活军费补贴的等级，不要来请求
         * <p>
         * 如果当前没死亡或者没在军费补贴地图，不要请求
         * <p>
         * 如果当前有权限修改军费，不知道该数据时，可以来请求
         */
        public static const C2S_GET_MILITARY : String = "104_13";

        /**
         * 获取军费补贴数据成功
         * <p>
         * varint64 军费补贴总额
         * varint32 军费补贴百分比
         * varint32 军费补贴上限
         * varint64 剩余的补贴额度
         */
        public static const S2C_GET_MILITARY : String = "104_14";

        /**
         * 请求禁卫申请，如果不能够设置禁卫，则不可以请求
         * <p>
         * 本次登录期间，每30S可以请求一次
         */
        public static const C2S_GET_JIN_WEI_APPLICANT : String = "104_15";

        /**
         * 回复禁卫申请，压缩
         * <p>
         * 解压缩
         * <p>
         * while(buffer.readable()){
         * varint64 该申请过期时间
         * varint32 后面数据长短
         * bytes 解析成 CountryMemberProto
         * }
         */
        public static const S2C_GET_JIN_WEI_APPLICANT : String = "104_16";

        /**
         * 请求禁卫申请失败，返回varint32错误码
         * <p>
         * 1. 没有权限查看
         */
        public static const S2C_GET_JIN_WEI_APPLICANT_FAIL : String = "104_17";

        /**
         * 请求禁卫需求，登录是，该数据为空，如有需要可以来请求
         * <p>
         * 收到S2C_CHANGE_JIN_WEI_REQUIRES_BROADCAST，将缓存删除掉，如有需要可以在此请求
         * <p>
         * 当存在缓存时，一直使用缓存
         */
        public static const C2S_GET_JIN_WEI_REQUIRES : String = "104_18";

        /**
         * 返回禁卫需求，缓存下来
         * <p>
         * bytes JinWeiRequiresProto
         */
        public static const S2C_GET_JIN_WEI_REQUIRES : String = "104_19";

        /**
         * 请求本国国库日志，不附带任何参数
         * <p>
         * 如果有需要，可以1分钟来请求
         */
        public static const C2S_COUNTRY_EXCHEQUER_RECORDS : String = "104_20";

        /**
         * 国库日志，该消息需要解压
         * <p>
         * 解压后
         * <p>
         * while(buffer.readable()){
         * varint32 后面历史数据长度
         * bytes 数据，解析成CountryExchequerLogProto，如果CountryExchequerLogProto.time==0，表明这是当前的数据，还没有加入到现有日志里面去的
         * }
         */
        public static const S2C_COUNTRY_EXCHEQUER_RECORDS : String = "104_21";

        /**
         * 统治力变更了
         * <p>
         * varint32 新的统治力
         * <p>
         * 国王可能做了什么操作，导致统治力变更了
         */
        public static const S2C_TONG_ZHI_LI_CHANGED : String = "104_22";

        /**
         * 设置官员
         * <p>
         * varint32 CountryOfficerPos
         * varint32 第几个
         * varint64 设置的人
         * bool true(上任)/false(卸任)
         */
        public static const C2S_SET_OFFICER : String = "104_23";

        /**
         * 设置官员成功
         * <p>
         * if(buffer.readable()){
         * bytes OfficerMemberProto 设置官员上任成功
         * } else {
         * 设置官员卸任成功
         * }
         * 提示设置成功
         */
        public static const S2C_SET_OFFICER : String = "104_24";

        /**
         * 设置官员失败，返回varint32错误码
         * <p>
         * 解锁
         * <p>
         * 1. 没有权限
         * 2. 要设置的官职没有找到
         * 3. 国王无法通过该方法设置
         * 4. 禁卫无法通过该方法设置
         * 5. 目标不在线，无法设置官员
         * 6. 目标不是我们国家的
         * 7. 今天已经被设置过官员了
         * 8. 目标已经是官员了，请先卸任
         * 9. 要卸任的官职上不是该官员了(刷新官员数据)
         * 10. 要设置的位置有别的官员，清闲卸任他
         * 11. 服务器bug
         * 12. 目标不是王帮成员
         */
        public static const S2C_SET_OFFICER_FAIL : String = "104_25";

        /**
         * 自己卸任
         */
        public static const C2S_OFFICE_RETIRE : String = "104_26";

        /**
         * 卸任成功
         * <p>
         * 如有需要，玩家可以立刻请求官员数据
         */
        public static const S2C_OFFICE_RETIRE : String = "104_27";

        /**
         * 卸任失败，返回varint32错误码
         * <p>
         * 1. 你不是官员
         * 2. 国王无法卸任
         */
        public static const S2C_OFFICE_RETIRE_FAIL : String = "104_28";

        /**
         * 周围有官员职位变更了
         * <p>
         * varint64 变更官职的玩家
         * <p>
         * if(buffer.readable()){
         * varint32 CountryOfficerPos
         * } else {
         * 职位变没了
         * }
         * <p>
         * 收到这个消息，在视野内查找变更官职的玩家，如果有，则变更玩家头顶的官职头衔
         * <p>
         * 如果该玩家是皇帝，又是国王，当变得没有国王的时候，显示皇帝
         */
        public static const S2C_AROUND_OFFICER_CHANGED : String = "104_29";

        /**
         * 官职变更了
         * <p>
         * boolean isSet true(上任)/false(卸任)
         * varint32 CountryOfficerPos
         * varint32 该官职的第几个官员
         * varint64 被设置的人的id
         * bytes 被设置的人的名字
         * <p>
         * 如果是自己，提示自己怎么怎么了，如果不是自己，提示别人怎么怎么了
         * <p>
         * 清掉本国官员数据，如有需要可以请求
         */
        public static const S2C_OFFICER_CHANGED : String = "104_30";

        /**
         * 请求获得官员官印
         */
        public static const C2S_GET_OFFICE_SEAL : String = "104_31";

        /**
         * 获得官印成功
         */
        public static const S2C_GET_OFFICE_SEAL : String = "104_32";

        /**
         * 获得官印失败，返回varint32错误码
         */
        public static const S2C_GET_OFFICE_SEAL_FAIL : String = "104_33";

        /**
         * 国家的经书数量变化，如果有打开需要显示该国家经书数量的面板等等，更新经书数量
         * <p>
         * varint32 serverSequence 有经书变化的国家
         * varint32 变化后的国家的经书数量
         * varint32 serverSequence 有经书变化的国家
         * varint32 变化后的国家的经书数量
         * <p>
         * 增加经书的国家广播:
         * 找策划
         * <p>
         * 减少经书的国家广播:
         * 找策划
         */
        public static const S2C_COUNTRY_JING_SHU_CHANGED : String = "104_34";

        /**
         * 发送禁卫申请
         */
        public static const C2S_SENT_JIN_WEI_APPLICANT : String = "104_35";

        /**
         * 发送禁卫申请成功，等待国王回复
         */
        public static const S2C_SENT_JIN_WEI_APPLICANT : String = "104_36";

        /**
         * 发送申请失败，返回
         * <p>
         * varint32错误码
         * <p>
         * 1. 当前是官员，不可以申请禁卫
         * 2. 禁卫人数已满
         * 3. 当前没有国王
         * 4. 申请已经达到上限了
         * 5. 已经发送了禁卫申请了
         * 6. 等级不满足
         * 7. 战斗力不满足
         * 8. 排行不满足
         */
        public static const S2C_SENT_JIN_WEI_APPLICANT_FAIL : String = "104_37";

        /**
         * 收到禁卫申请
         * <p>
         * 数据
         * <p>
         * varint64 该申请过期时间
         * varint64 申请者的id
         * bytes 申请者的名字
         * <p>
         * 清楚本地禁卫请求缓存
         */
        public static const S2C_RECEIVE_JIN_WEI_APPLICANT : String = "104_38";

        /**
         * 回复禁卫申请
         * <p>
         * varint64 申请者的id
         * bool 同意(true)/拒绝(false)
         */
        public static const C2S_REPLY_JIN_WEI_APPLICANT : String = "104_39";

        /**
         * 回复申请成功，删除目标的申请
         * <p>
         * varint64 申请者的id
         * bool 同意(true)/拒绝(false)
         */
        public static const S2C_REPLY_JIN_WEI_APPLICANT : String = "104_40";

        /**
         * 回复申请失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 目标根本没有发送过申请
         * 3. 不是本国的
         * 4. 禁卫人数已满
         * 5. 目标已经是官员了
         * 6. 目标没在线
         * 7. 目标今天已经被设置过官员了
         */
        public static const S2C_REPLY_JIN_WEI_APPLICANT_FAIL : String = "104_41";

        /**
         * 收到禁卫申请回复
         * <p>
         * bool 同意(true)/拒绝(false)
         * <p>
         * if(同意){
         * bytes OfficerMemberProto
         * }
         */
        public static const S2C_RECEIVE_JIN_WEI_APPLICANT_REPLY : String = "104_42";

        /**
         * 领取自己的职位俸禄
         */
        public static const C2S_COLLECT_SALARY : String = "104_43";

        /**
         * 领取自己的职位俸禄成功，不附带任何参数
         * <p>
         * 将今日是否领取俸禄设置为已经领取
         */
        public static const S2C_COLLECT_SALARY : String = "104_44";

        /**
         * 领取职位俸禄失败，返回varint32错误码
         * <p>
         * 1. 不是官员
         * 2. 不够一天
         * 3. 当前没有俸禄
         * 4. 银子太多
         * 5. 已经领取俸禄了
         */
        public static const S2C_COLLECT_SALARY_FAIL : String = "104_45";

        /**
         * 修改税率
         * <p>
         * varint32 税率
         */
        public static const C2S_CHANGE_TAX_RATE : String = "104_46";

        /**
         * 修改税率成功
         * <p>
         * varint32 税率，自己换算百分比
         */
        public static const S2C_CHANGE_TAX_RATE_BROADCAST : String = "104_47";

        /**
         * 修改税率失败，返回varint32错误码
         * <p>
         * 1. 没权限修改税率
         * 2. 税率设置非法，不是有效的税率
         */
        public static const S2C_CHANGE_TAX_RATE_FAIL : String = "104_48";

        /**
         * 修改禁卫要求，本次请求期间
         * <p>
         * varint32 等级要求
         * varint64 战斗力要求
         * varint32 战斗力排名
         * bool true(是本国)/false(是所有国家) 战斗力排行
         */
        public static const C2S_CHANGE_JIN_WEI_REQUIRES : String = "104_49";

        /**
         * 修改禁卫要求成功，将发送修改前的数据覆盖上去
         */
        public static const S2C_CHANGE_JIN_WEI_REQUIRES : String = "104_50";

        /**
         * 禁卫需求修改了，清掉禁卫需求数据
         */
        public static const S2C_CHANGE_JIN_WEI_REQUIRES_BROADCAST : String = "104_51";

        /**
         * 修改禁卫要求失败，返回varint32错误码
         * <p>
         * 1. 没权限修改禁卫请求
         * 2. 等级要求非法
         * 3. 战力要求非法
         * 4. 战力排行要求非法
         */
        public static const S2C_CHANGE_JIN_WEI_REQUIRES_FAIL : String = "104_52";

        /**
         * 修改军费设置
         * <p>
         * varint64 军费补贴总额，为0表示不设置
         * varint32 军费补贴百分比，为0表示不设置
         * varint32 军费补贴上限，为0表示不设置
         */
        public static const C2S_CHANGE_MILITARY : String = "104_53";

        /**
         * 修改军费设置
         * <p>
         * 将新的设置覆盖进去
         */
        public static const S2C_CHANGE_MILITARY : String = "104_54";

        /**
         * 修改军费补贴失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 补贴额度非法
         * 3. 补贴百分比非法
         * 4. 补贴上限非法
         * 5. 当前国库钱不够
         */
        public static const S2C_CHANGE_MILITARY_FAIL : String = "104_55";

        /**
         * 请求结盟状态，或者如果收到
         * <p>
         * S2C_UNION_BROADCAST
         * S2C_OFFICIAL_UNION_BROADCAST
         * S2C_LIFT_UNION_BROADCAST
         * S2C_OFFICIAL_LIFT_UNION_BROADCAST
         * <p>
         * 可以来请求一次
         */
        public static const C2S_ALL_COUNTRY_UNION_STATUS : String = "104_106";

        /**
         * 各个国家的结盟状态，压缩，缓存数据，将是否已经请求结盟状态设置为true
         * <p>
         * 解压
         * <p>
         * bytes AllUnionStatusProto
         */
        public static const S2C_ALL_COUNTRY_UNION_STATUS : String = "104_107";

        /**
         * 请求结盟
         * <p>
         * varint32 目标国
         * <p>
         * bytes 结盟文字
         */
        public static const C2S_UNION_INVITE_OTHER : String = "104_56";

        /**
         * 发送结盟成功，等待对方回复，这时候会进入cd，一定时间以内是无法操作的
         * <p>
         * varint32 目标国
         */
        public static const S2C_UNION_INVITE_OTHER : String = "104_57";

        /**
         * 发送结盟申请失败，返回varint32错误码
         * <p>
         * 1. 我国是强国，无法发起结盟
         * 2. 没权限
         * 3. 当前在结盟状态中
         * 4. 非法的结盟国家
         * 5. 想结盟国家是强国
         * 6. 想结盟的国家没有结盟管理者在线
         * 7. 目标在结盟状态中
         * 8. 国库钱不够
         * 9. 结盟cd中
         * 10. 目标国家结盟cd中
         */
        public static const S2C_UNION_INVITE_OTHER_FAIL : String = "104_58";

        /**
         * 有别的国家给你发送了结盟请求
         * <p>
         * varint32 申请国
         * <p>
         * bytes 结盟文字
         */
        public static const S2C_UNION_OTHER_INVITE_SELF : String = "104_59";

        /**
         * 回复目标结盟邀请
         * <p>
         * bool true(同意结盟)/false(拒绝结盟)
         */
        public static const C2S_UNION_INVITEES_REPLY : String = "104_60";

        /**
         * 回复失败，返回varint32错误码
         * <p>
         * 1. 没权限
         * 2. 回复结盟的国家非法
         * 3. 目标没有给你发送过结盟邀请
         * 4. 申请过期了
         * 5. 自己是强国
         * 6. 目标国家是强国
         */
        public static const S2C_UNION_INVITEES_REPLY_FAIL : String = "104_61";

        /**
         * 回复目标结盟邀请成功（回复人会收到）
         * <p>
         * varint32 回复的国家
         * bool true(同意结盟)/false(拒绝结盟)
         * <p>
         * 收到消息，关闭面板，提示您同意/拒绝了xxx国的结盟邀请
         */
        public static const S2C_UNION_INVITEES_REPLY : String = "104_62";

        /**
         * 他国回复拒绝你的结盟邀请（邀请人会收到）
         * <p>
         * varint32 回复的国家
         * bool true(同意结盟)/false(拒绝结盟)
         * <p>
         * 收到消息，关闭面板，提示对方拒绝结盟
         */
        public static const S2C_UNION_OTHER_REPLY_INVITATION : String = "104_63";

        /**
         * 结盟广播
         * <p>
         * varint32 A
         * varint32 B
         * <p>
         * 广播内容:
         * <p>
         * A已成功向B发起结盟，结盟关系将于本日24:00正式确立。
         * <p>
         * 修改A/B两国的结盟状态
         */
        public static const S2C_UNION_BROADCAST : String = "104_64";

        /**
         * 正式结盟广播
         * <p>
         * varint32 A
         * varint32 B
         * <p>
         * 广播内容:
         * <p>
         * A跟B正式结盟
         */
        public static const S2C_OFFICIAL_UNION_BROADCAST : String = "104_65";

        /**
         * 申请解盟
         */
        public static const C2S_LIFT_UNION : String = "104_66";

        /**
         * 解盟成功，不附带消息
         */
        public static const S2C_LIFT_UNION : String = "104_67";

        /**
         * 解盟失败，附带varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 当前没有盟国
         * 3. 当前正在解盟中
         */
        public static const S2C_LIFT_UNION_FAIL : String = "104_68";

        /**
         * 广播解盟
         * <p>
         * varint32 国家A
         * varint32 国家B
         * <p>
         * A已成功向B发起解盟，结盟关系将于本日24:00正式解除。
         */
        public static const S2C_LIFT_UNION_BROADCAST : String = "104_69";

        /**
         * 广播正式解盟
         * <p>
         * varint32 国家A
         * varint32 国家B
         * <p>
         * A跟B正式解盟
         */
        public static const S2C_OFFICIAL_LIFT_UNION_BROADCAST : String = "104_70";

        /**
         * 将自动解盟
         * <p>
         * varint32 国家A
         * varint32 国家B
         * <p>
         * A跟B将自动解盟，两个成员将外交值设置为0
         */
        public static const S2C_AUTO_LIFT_UNION_BROADCAST : String = "104_71";

        /**
         * 王帮变更了
         * <p>
         * UTF 老帮派
         * bytes 新帮派
         * <p>
         * 客户端根据新老帮派这个消息，动态改变英雄的头顶王帮/皇榜信息
         * <p>
         * 将场景中看到的老帮派的人，将他们头顶的王帮信息移除，如果还有皇帮，则显示皇帮
         * 将场景中看到的新帮派的人，将他们头顶加上王帮标识（如果没有皇帮标识，有则显示皇帮）
         */
        public static const S2C_KING_GUILD_CHANGED : String = "104_72";

        /**
         * 国王变化广播
         * <p>
         * varint32 国家
         * if(buffer.readable()){
         * varint64 国王id
         * bytes 国王名字
         * }
         */
        public static const S2C_KING_CHANGED_BROADCAST : String = "104_127";

        /**
         * 禁言
         * <p>
         * varint32 禁言时长类型的下标
         * varint64 目标玩家id
         */
        public static const C2S_SET_DONT_TALK : String = "104_73";

        /**
         * 禁言成功
         * <p>
         * varint32 当前的禁言次数
         */
        public static const S2C_SET_DONT_TALK : String = "104_74";

        /**
         * 禁言失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 没有次数了
         * 3. 要禁言的时长非法
         * 4. 目标没在线
         * 5. 目标已经被禁言过了
         * 6. 服务器繁忙
         * 7. 目标不是本国国民
         */
        public static const S2C_SET_DONT_TALK_FAIL : String = "104_75";

        /**
         * 你被禁言了
         * <p>
         * varint64 禁言结束时间
         */
        public static const S2C_BEEN_SET_DONT_TALK : String = "104_76";

        /**
         * 囚禁目标
         * <p>
         * varint32 囚禁时长类型的下标
         * varint64 目标id
         */
        public static const C2S_CAPTIVITY : String = "104_77";

        /**
         * 囚禁目标成功
         * <p>
         * varint32 今日囚禁的次数
         */
        public static const S2C_CAPTIVITY : String = "104_78";

        /**
         * 囚禁失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 没有次数了
         * 3. 要禁言的时长非法
         * 4. 目标没在线
         * 5. 目标已经被禁言过了
         * 6. 服务器繁忙
         * 7. 目标不是本国国民
         * 8. 目标在副本
         * 9. 服务器bug
         */
        public static const S2C_CAPTIVITY_FAIL : String = "104_79";

        /**
         * 你被国王囚禁了
         * <p>
         * 接着你就要进入被囚禁的场景了
         * <p>
         * varint64 囚禁结束时间
         */
        public static const S2C_BEEN_CAPTIVITY : String = "104_80";

        /**
         * 设置国家公告，长度不能够超过100个字节
         * <p>
         * bytes
         */
        public static const C2S_SET_COUNTRY_ANNOUNCEMENT : String = "104_81";

        /**
         * 设置国家公告成功
         * <p>
         * bytes 国家公告
         */
        public static const S2C_SET_COUNTRY_ANNOUNCEMENT : String = "104_82";

        /**
         * 设置国家公告失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         */
        public static const S2C_SET_COUNTRY_ANNOUNCEMENT_FAIL : String = "104_83";

        /**
         * 国家公告变更广播，如有需要，清空国家公告
         */
        public static const S2C_SET_COUNTRY_ANNOUNCEMENT_CHANGED_BROADCAST : String = "104_84";

        /**
         * 请求国家公告，上线时/或者收到国家公告变更，清除缓存
         */
        public static const C2S_GET_COUNTRY_ANNOUNCEMENT : String = "104_85";

        /**
         * 返回国家公告，缓存数据，该国家公告可能为空，意味着官员没有设置，不管，缓存
         * <p>
         * bytes 国家公告
         */
        public static const S2C_GET_COUNTRY_ANNOUNCEMENT : String = "104_86";

        /**
         * 设置禁卫公告，长度不能够超过100个字节
         * <p>
         * bytes
         */
        public static const C2S_SET_JIN_WEI_ANNOUNCEMENT : String = "104_87";

        /**
         * 设置禁卫公告成功
         * <p>
         * bytes 禁卫公告内容
         */
        public static const S2C_SET_JIN_WEI_ANNOUNCEMENT : String = "104_88";

        /**
         * 设置禁卫公告失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         */
        public static const S2C_SET_JIN_WEI_ANNOUNCEMENT_FAIL : String = "104_89";

        /**
         * 禁卫公告变更广播，如有需要，清空禁卫公告
         */
        public static const S2C_SET_JIN_WEI_ANNOUNCEMENT_CHANGED_BROADCAST : String = "104_90";

        /**
         * 请求禁卫公告，上线时/或者收到禁卫公告变更，清除缓存
         */
        public static const C2S_GET_JIN_WEI_ANNOUNCEMENT : String = "104_91";

        /**
         * 返回禁卫公告，缓存数据，该禁卫公告可能为空，意味着官员没有设置，不管，缓存
         * <p>
         * bytes 禁卫公告
         */
        public static const S2C_GET_JIN_WEI_ANNOUNCEMENT : String = "104_92";

        /**
         * 请求募捐
         * <p>
         * bytes 募捐的文字，不超过30个字
         */
        public static const C2S_COUNTRY_DONATE : String = "104_93";

        /**
         * 募捐成功
         * <p>
         * 将当前是否发送过募捐设置成true
         */
        public static const S2C_COUNTRY_DONATE : String = "104_94";

        /**
         * 募捐失败，返回varint32错误码
         * <p>
         * 1. 没有权限
         * 2. 已经募捐过了
         */
        public static const S2C_COUNTRY_DONATE_FAIL : String = "104_95";

        /**
         * 募捐广播
         * <p>
         * bytes 募捐的文字
         */
        public static const S2C_COUNTRY_DONATE_BROADCAST : String = "104_96";

        /**
         * 捐款
         * <p>
         * varint32 捐献的额度
         */
        public static const C2S_DO_DONATE : String = "104_97";

        /**
         * 捐款成功
         * <p>
         * varint64 当前国库银子数量
         */
        public static const S2C_DO_DONATE : String = "104_98";

        /**
         * 大额捐款广播
         * <p>
         * varint32 捐献的额度
         * bytes 捐献者的名字
         */
        public static const S2C_LARGE_DONATE_BROADCAST : String = "104_99";

        /**
         * 捐款失败，返回varint32错误码
         * <p>
         * 1. 要捐的钱的数量非法
         * 2. 钱不够捐
         * 3. 捐献失败，国库已满
         */
        public static const S2C_DO_DONATE_FAIL : String = "104_100";

        /**
         * 国家有人被击杀
         * <p>
         * 公告内容：
         * <p>
         * 国民被杀：击杀者国家·名字在【地图：坐标x,y】袭击国民。
         * <p>
         * varint32 击杀者国家
         * varint32 所在地图id
         * varint32 x
         * varint32 y
         * varint32 被袭击者的等级
         * varint64 被袭击者的武勋
         * bytes 击杀者的名字
         */
        public static const S2C_COUNTRY_MEMBER_BEEN_KILLED : String = "104_101";

        /**
         * 国家官员被人击杀
         * <p>
         * 公告内容：
         * <p>
         * 官员被杀：击杀者国家·名字在【地图：坐标x,y】袭击职位。
         * <p>
         * varint32 击杀者国家
         * varint32 所在地图id
         * varint32 x
         * varint32 y
         * varint32 countryOfficerPos职位
         * bytes 击杀者的名字
         */
        public static const S2C_COUNTRY_OFFICER_BEEN_KILLED : String = "104_102";

        /**
         * 镖车被劫
         * <p>
         * 镖车被劫：镖车主国民名字在【地图：坐标x,y】被劫。
         * <p>
         * varint32 所在地图id
         * varint32 x
         * varint32 y
         * bytes 镖车主国民名字
         */
        public static const S2C_BIAO_CHE_BEEN_DESTROY : String = "104_103";

        /**
         * 与盟国的外交值变化了
         * <p>
         * varint32 当前的外交值
         */
        public static const S2C_UNION_AMOUNT_CHANGED : String = "104_104";

        /**
         * 总共获得的武勋点数变更
         * <p>
         * varint64 总的武勋点数
         * varint64 今天总共击杀总共获得的武勋点数
         * varint64 今天总共非击杀总共获得的武勋点数
         */
        public static const S2C_TOTAL_WUXUN_CHANGED : String = "104_105";

        /**
         * 开启国家夺经
         */
        public static const C2S_START_DUO_JING : String = "104_112";

        /**
         * 开启国家夺经成功
         */
        public static const S2C_START_DUO_JING : String = "104_113";

        /**
         * 开启国家夺经失败，返回varint32错误码
         * <p>
         * 1. 权限不够
         * 2. 已经开启了
         * 3. 没在活动期间
         */
        public static const S2C_START_DUO_JING_FAIL : String = "104_114";

        /**
         * 开启国家夺经广播
         * <p>
         * varint32 哪个国家
         * varint64 夺经结束时间
         * <p>
         * if(buffer.readable()){
         * varint32 召唤id，检测条件满足，发送：C2S_COUNTRY_OFFICER_SUMMON
         * varint64 召唤结束时间
         * bytes 召唤者的名字
         * }
         */
        public static const S2C_START_DUO_JING_BROADCAST : String = "104_115";

        /**
         * 开启国家刺探
         */
        public static const C2S_START_MI_XIN : String = "104_116";

        /**
         * 开启国家刺探成功
         */
        public static const S2C_START_MI_XIN : String = "104_117";

        /**
         * 开启国家刺探失败，返回varint32错误码
         * <p>
         * 1. 权限不够
         * 2. 已经开启了
         * 3. 没在开启时间段内
         */
        public static const S2C_START_MI_XIN_FAIL : String = "104_118";

        /**
         * 开启国家刺探广播
         * <p>
         * varint32 哪个国家
         * varint64 刺探结束时间
         * <p>
         * if(buffer.readable()){
         * varint32 召唤id，检测条件满足，发送：C2S_COUNTRY_OFFICER_SUMMON
         * varint64 召唤结束时间
         * }
         */
        public static const S2C_START_MI_XIN_BROADCAST : String = "104_119";

        /**
         * 自己国家刺探目标国家变更了
         * <p>
         * varint32 哪个国家
         */
        public static const S2C_MI_XIN_TARGET_COUNTRY_CHANGED : String = "104_120";

        /**
         * 请求开启/关闭军费补贴
         * <p>
         * bool true(开启)/false(关闭)
         */
        public static const C2S_START_COUNTRY_MILITARY : String = "104_121";

        /**
         * 开启/关闭军费补贴成功
         * <p>
         * bool true(开启)/false(关闭)
         */
        public static const S2C_START_COUNTRY_MILITARY : String = "104_122";

        /**
         * 开启军费补贴失败，返回varint32错误码
         * <p>
         * 1. 没权限
         * 2. 军费额度不够
         * 3. 国库资金不够
         * 4. 已经开启/关闭了
         */
        public static const S2C_START_COUNTRY_MILITARY_FAIL : String = "104_123";

        /**
         * 军费调整广播
         * <p>
         * bool true(开启)/false(关闭)
         */
        public static const S2C_START_COUNTRY_MILITARY_BROADCAST : String = "104_124";

        /**
         * 国家投票
         * <p>
         * if(buffer.readable()){
         * bool true(好评)/false(差评)
         * } else {
         * 弃权
         * }
         */
        public static const C2S_COUNTRY_VOTE : String = "104_128";

        /**
         * 评价成功，将当前国家投票状态设置为true
         */
        public static const S2C_COUNTRY_VOTE : String = "104_129";

        /**
         * 评价失败，返回varint32错误码
         * <p>
         * 1. 已经评价过了
         * 2. 等级过低
         * 3. 没有国王
         * 4. 当前没在投票时间段内
         */
        public static const S2C_COUNTRY_VOTE_FAIL : String = "104_130";

        /**
         * 某国投票变更了
         * <p>
         * varint32 国家
         * varint32 昨天的好评
         * varint32 昨天的差评
         */
        public static const S2C_COUNTRY_VOTE_CHANGED : String = "104_131";

        /**
         * 开启国运
         */
        public static const C2S_START_GUO_YUN : String = "104_132";

        /**
         * 开启国运成功
         */
        public static const S2C_START_GUO_YUN : String = "104_133";

        /**
         * 开启国运失败，返回varint32错误码
         * <p>
         * 1. 权限不够
         * 2. 已经开启了
         * 3. 没在开启时间段内
         */
        public static const S2C_START_GUO_YUN_FAIL : String = "104_134";

        /**
         * 开启国家刺探广播
         * <p>
         * varint32 哪个国家
         * varint64 国运结束时间
         * <p>
         * if(buffer.readable()){
         * varint32 召唤id，检测条件满足，发送：C2S_COUNTRY_OFFICER_SUMMON
         * varint64 召唤结束时间
         * bytes 召唤者的名字
         * }
         */
        public static const S2C_START_GUO_YUN_BROADCAST : String = "104_135";

    }
}