package app.cmd {

    public class TaskModuleMessages {

        /**
         * 接受新的剧情任务，数据已压缩
         * varint32 章节数，表示第几章，1表示第一章
         * bytes TaskProto
         */
        public static const S2C_TASK_NEW_CHAPTER_TASK : String = "13_0";

        /**
         * 接受新的机缘任务
         * bytes ChanceTaskProto
         */
        public static const S2C_TASK_NEW_CHANCE_TASK : String = "13_1";

        /**
         * 接受新的日常任务
         * bytes DailyTaskProto，日常任务数据
         */
        public static const S2C_TASK_NEW_DAILY_TASK : String = "13_2";

        /**
         * 接受新的支线任务
         * varint32 branchId;
         * bytes TaskProto，支线任务数据
         */
        public static const S2C_TASK_NEW_BRANCH_TASK : String = "13_3";

        /**
         * 完成任务，附带以下信息
         * varint32 taskId
         */
        public static const S2C_TASK_COMPLETE_TASK : String = "13_4";

        /**
         * 更新任务进度，附带以下信息
         * varint32 taskId
         * varint32 index 第几个任务目标，0表示第一个目标
         * varint32 progress
         */
        public static const S2C_TASK_UPDATE_PROGRESS : String = "13_5";

        /**
         * 回复NPC任务完成，发送C2S_TASK_REPLY_NPC_TASK消息，附带以下信息
         * varint32 taskId
         * varitn64 npc在场景中的id
         * varint32 答题选择的答案(无论怎么都要带上，不是答题，就发送0)
         * if(完成任务[该任务是最后一个任务了目标了]){
         *      varint32 领取的奖励的下标
         * }
         * 服务器返回S2C_TASK_REPLY_NPC_TASK消息
         */
        public static const C2S_TASK_REPLY_NPC_TASK : String = "13_10";

        /**
         * 回复NPC任务，附带byte错误码
         * 1-任务不是回复NPC任务
         * 2-与NPC距离过远
         * 3-任务不存在
         * 4-领取的奖励下标非法
         * 5-任务目标未完成
         */
        public static const S2C_TASK_REPLY_NPC_TASK : String = "13_11";

        /**
         * 采集场景物品
         * varint32 taskId
         * varint32 collectObjectId
         */
        public static const C2S_TASK_COLLECT_GOODS : String = "13_12";

        /**
         * 采集场景物品失败，附带byte错误码
         * 1、任务不存在，客户端发送的任务ID无效
         * 2、客户端发送了任务不需要的采集物品（1、任务不是采集任务 2、任务需要的采集物品不是这个 3、这个物品已经采集完成了）
         * 3、发送的任务采集任务物品
         * 4、英雄距离采集物品太远
         */
        public static const S2C_TASK_COLLECT_GOODS_FAIL : String = "13_13";

        /**
         * 请求已完成章节任务列表，附带章节ID
         * varint32 chapterId，第几章，1表示第一章
         *
         * 服务器返回S2C_TASK_REQUEST_CHAPTER_LIST
         */
        public static const C2S_TASK_REQUEST_COMPLETED_CHAPTER_TASK : String = "13_14";

        /**
         * 回复已完成章节任务列表，附带以下信息
         * varint32 chapterId，第几章，1表示第一章
         * while(ByteArray.avaliable)
         *     varint32 下面的proto数据长度
         *     bytes TaskDataProto
         */
        public static const S2C_TASK_REQUEST_COMPLETED_CHAPTER_TASK : String = "13_15";

        /**
         * 附带byte错误码
         * 1、章节ID不合法
         * 2、章节未开放
         */
        public static const S2C_TASK_REQUEST_COMPLETED_CHAPTER_TASK_FAIL : String = "13_16";

        /**
         * 吞噬机缘任务
         * varint32 被吞噬任务ID
         * varint32 吞噬任务ID
         * bool 金子吞噬，true表示金子吞噬，false表示普通吞噬
         */
        public static const C2S_TASK_SWALLOW_TASK : String = "13_17";

        /**
         * 吞噬成功，附带以下信息
         * varint32 今天已吞噬任务的个数
         * varint32 被吞噬任务ID，在列表中找到这个任务，删除掉
         * varint32 加成任务ID
         * varint32 吞噬百分比加成（最新的百分比，直接显示这个值）
         * bytes PrizeProto 加成后的任务奖励
         */
        public static const S2C_TASK_SWALLOW_TASK : String = "13_18";

        /**
         * 吞噬失败，附带byte错误码
         * 1、被吞噬任务没找到，客户端发送的ID有问题
         * 2、吞噬任务没找到，客户端发送的ID有问题
         * 3、吞噬任务ID与被吞噬任务ID相同
         * 4、今日吞噬次数已达上限
         * 5、金子不足（金子吞噬）
         */
        public static const S2C_TASK_SWALLOW_TASK_FAIL : String = "13_19";

        /**
         * 秒杀机缘任务
         * varint32 任务ID
         * if (byteArray.available)
         *     varint32 机缘令在背包的过期时间
         */
        public static const C2S_TASK_AUTO_COMPLETE_CHANCE_TASK : String = "13_20";

        /**
         * 秒杀机缘任务
         * varint32 已使用秒杀橙色任务次数
         */
        public static const S2C_TASK_AUTO_COMPLETE_CHANCE_TASK : String = "13_21";

        /**
         * 秒杀机缘任务失败
         * 1、任务没找到，客户端发送任务ID无效
         * 2、金子不足
         * 3、今日秒杀机缘任务已达最大次数
         * 4、发送过来的扣除的物品在背包中的位置非法
         * 5、发送过来的位置已经被锁了
         * 6、发送过来的位置的上没有物品
         * 7、发送过来的位置上的物品跟直接完成机缘任务需要扣除的物品不同
         * 8、发送过来的物品已经过期
         */
        public static const S2C_TASK_AUTO_COMPLETE_CHANCE_TASK_FAIL : String = "13_22";

        /**
         * 降低日常任务难度
         */
        public static const C2S_TASK_REDUCE_DIFFI_STAR : String = "13_23";

        /**
         * 降低日常任务难度
         * bytes 任务目标
         */
        public static const S2C_TASK_REDUCE_DIFFI_STAR : String = "13_24";

        /**
         * 降低日常任务难度失败，附带byte错误码
         * 1、当前没有日常任务，今天所有的日常任务都完成了
         * 2、银两不足
         * 3、任务已经是最低难度了
         */
        public static const S2C_TASK_REDUCE_DIFFI_STAR_FAIL : String = "13_25";

        /**
         * 增加日常任务奖励
         */
        public static const C2S_TASK_ADD_PRIZE_STAR : String = "13_26";

        /**
         * 增加日常任务奖励
         * bytes PrizeProto 奖励
         */
        public static const S2C_TASK_ADD_PRIZE_STAR : String = "13_27";

        /**
         * 增加日常任务奖励失败，附带byte错误码
         * 1、当前没有日常任务，今天所有的日常任务都完成了
         * 2、银两不足
         * 3、奖励已经是最高星级了
         */
        public static const S2C_TASK_ADD_PRIZE_STAR_FAIL : String = "13_28";

        /**
         * 秒杀当前日常任务
         */
        public static const C2S_TASK_AUTO_COMPLETE_DAILY_TASK : String = "13_29";

        /**
         * 增加日常任务奖励失败，附带byte错误码
         * 1、当前没有日常任务，今天所有的日常任务都完成了
         * 2、金子不足
         */
        public static const S2C_TASK_AUTO_COMPLETE_DAILY_TASK_FAIL : String = "13_30";

        /**
         * 秒杀剩余所有日常任务
         */
        public static const C2S_TASK_AUTO_COMPLETE_ALL_DAILY_TASK : String = "13_31";

        /**
         * 秒杀剩余所有日常任务失败
         * bytes PrizeProto 10星任务奖励
         */
        public static const S2C_TASK_AUTO_COMPLETE_ALL_DAILY_TASK : String = "13_32";

        /**
         * 秒杀剩余所有日常任务失败，附带byte错误码
         * 1、当前没有日常任务，今天所有的日常任务都完成了
         * 2、金子不足
         * 3、vip等级不足
         */
        public static const S2C_TASK_AUTO_COMPLETE_ALL_DAILY_TASK_FAIL : String = "13_33";

        /**
         * 任务传送，附带下面的消息
         * varint32 taskTypeIndex 任务类型和子任务Index，下面有说明
         * if (机缘任务) // 如果是机缘任务，再写一个任务ID
         *     varint32 机缘任务ID
         *
         * if(非Vip或VIP等级不足){
         *      要附带数据具体参考[这里]({% post_url 2014-11-08-物品消耗 %})
         * }
         *
         *
         * (任务类型) type 0-剧情任务 1-机缘任务 2-日常任务 3-家族任务
         * (子任务Index) index 从0开始，第一个子任务为0
         * (升级任务打坐传送) isDazuo 0-默认值 1-升级任务打坐传送
         *
         * taskTypeIndex = (isDazuo <<< 6) | (index << 3) | type
         *
         * 传送成功，会收到切场景的消息
         */
        public static const C2S_TASK_TRANSPORT : String = "13_43";

        /**
         * 传送成功后，返回这个消息，只表示成功
         */
        public static const S2C_SCENE_TASK_TRANSPORT : String = "13_44";

        /**
         * 任务传送，附带byte错误码
         * 1、英雄不在普通场景中
         * 2、英雄VIP等级不够，但是又没有发物品（或者物品位置无效）
         * 3、任务类型无效[0-3]
         * 4、任务没找到(机缘任务ID不对，日常/家族任务已经完成，)
         * 5、子任务Index无效
         * 6、扣背包物品任务不能传送
         * 7、任务目标已经完成
         * 8、英雄等级不足，还不能进入场景
         * 9、当前是攻城战期间，不能传送
         * 10、进入副本任务不能传送
         * 11、玩家已经死亡
         * 12、玩家在他国
         * 13、完成副本任务不能传送
         * 14、金子不足
         * 15、传送物品不足
         * 16、PK中
         * 17、古剑升阶任务不可以传送
         * 18、当前状态无法使用任务传送
         */
        public static const S2C_TASK_TRANSPORT_FAIL : String = "13_45";

        /**
         * 新功能开启
         * varint32 新功能ID（参考ClientFunction）
         */
        public static const C2S_CLIENT_SET_FUNCTION : String = "13_47";

        /**
         * 接受偷经成功
         *
         * varint32 接受任务的奖励等级
         * bool 是否是偷经活动期间接受的
         */
        public static const S2C_ACCEPT_TOU_JING : String = "13_51";

        /**
         * 接受偷经失败，返回varint32错误码
         *
         * 1.你死了
         * 2.距离npc过远
         * 3.功能没开启
         * 4.没在活动期间
         * 5.已经有了偷经任务
         * 6.国战期间不可以接取该任务
         */
        public static const S2C_ACCEPT_TOU_JING_FAIL : String = "13_52";

        /**
         * 偷经失败，返回varint32错误码
         *
         * 0.你已经死了
         * 1.你在跳跃中
         * 2.被击晕或者不可以移动
         * 3.没在普通场景
         * 4.偷经任务已经完成了
         * 5.任务目标已经完成了
         * 6.没接取偷经任务
         * 7.不在偷经范围内
         * 8.服务器bug
         * 9.盟国不能够去偷经
         * 10.偷经功能没有开启
         * 11.偷经时间没到
         * 12.不能够在已经偷到的经书国家以外的其他国家更换
         */
        public static const S2C_START_TOU_JING_FAIL : String = "13_54";

        /**
         * 场景中有人在偷经，附带偷经结束时间，客户端根据时间做玩家的偷经动作
         *
         * varint64 场景中谁在偷经
         * varint64 偷经结束时间
         *
         * 说明：这条消息可能会在S2C_DO_TOU_JING消息之后[因为被攻击会导致偷经结束时间变更]
         *      客户端需要判断当前有没有进度条
         */
        public static const S2C_TOU_JING_PROGRESS : String = "13_55";

        /**
         * 读条完毕，偷经，不需要附带任何参数
         */
        public static const C2S_DO_TOU_JING : String = "13_56";

        /**
         * 偷经失败，返回varint32错误码
         * 0.你已经死了
         * 1.你在跳跃中
         * 2.击晕或者不可移动不可以采灵
         * 3.没在普通场景中
         * 4.最好的经书了
         * 5.任务目标已经完成了
         * 6.不是偷经任务
         * 7.不在偷经范围内
         * 8.服务器bug
         * 9.盟国不能够去偷经
         * 10.进度条还没读完呢
         * 11.偷经功能没有开启
         * 12.偷经时间没到
         * 13.目标国家经书不够
         * 14.偷经任务都已经完成了
         * 15.国战期间无法偷经
         */
        public static const S2C_DO_TOU_JING_FAIL : String = "13_57";

        /**
         * 偷经成功，客户端清掉进度条
         *
         * varint32 偷盗的经书所属的国家
         * varint32 偷盗的经书的品质[0 白色 ,1 ,2 ,3 ,4 ]
         * bool 是不是偷经书偷成功了 true(偷到了)/false(没偷到)显示灰色
         */
        public static const S2C_DO_TOU_JING : String = "13_58";

        /**
         * 偷经头顶上面的状态
         *
         * varint64 哪个角色头顶上
         * if(readable()){
         *      varint32 偷盗的经书的品质[0 白色 ,1 ,2 ,3 ,4 ]
         * } else{
         *      头顶上的偷经状态消失
         * }
         */
        public static const S2C_TOU_JING_STATUS : String = "13_59";

        /**
         * 完成偷经任务失败，返回varint32错误码
         *
         * 1.当前没有偷经任务
         * 2.没有偷到经书
         * 3.距离偷经任务完成npc过远
         * 4.国战期间不可以交经书任务
         */
        public static const S2C_COMPLETE_TOU_JING_TASK_FAIL : String = "13_61";

        /**
         * 完成偷经任务，客户端偷经次数+1，清空偷经任务
         *
         * 如果当前还有偷经任务次数，客户端默认又获得该任务
         */
        public static const S2C_COMPLETE_TOU_JING_TASK : String = "13_62";

        /**
         * 弄出了个最高品质的经书
         *
         * varint32 品质
         * varint32 玩家所属国家
         * varint32 ji经书所属国家
         * bytes 玩家名字
         */
        public static const S2C_MAX_QUALITY_JING_SHU_BROADCAST : String = "13_63";

        /**
         * 接受密信失败，附带varint32错误码：
         *
         * 1.距离NPC太远
         * 2.密信功能没有开启
         * 3.当前已经有密信任务了，无法再接受
         * 4.次数不够，无法接受密信任务
         */
        public static const S2C_ACCEPT_MIXIN_FAIL : String = "13_71";

        /**
         * 接受密信成功，接受密信次数+1
         *
         * varint32 接受密信的等级
         * bool 是不是在密信活动中接的
         */
        public static const S2C_ACCEPT_MIXIN_SUCCEED : String = "13_72";

        /**
         * 随机密信失败，附带varint32错误码：
         *
         * 1.没有密信任务
         * 2.CD中
         * 3.距离npc过远
         * 4.已经是最高品质，无法刷新
         */
        public static const S2C_REFRESH_MIXIN_FAIL : String = "13_74";

        /**
         * 刷新密信成功
         *
         * varint32 新的密信品质
         * varint64 下次能够刷新密信的时间
         */
        public static const S2C_REFRESH_MIXIN_SUCCEED : String = "13_75";

        /**
         * 放弃密信任务
         */
        public static const C2S_GIVE_UP_MI_XIN : String = "13_76";

        /**
         * 放弃密信任务失败，返回varint32错误码
         *
         * 1. 没有密信任务
         */
        public static const S2C_GIVE_UP_MI_XIN_FAIL : String = "13_77";

        /**
         * 放弃密信任务成功
         *
         * 将已经接取的密信任务次数-1，-1后，该值必须>=0
         */
        public static const S2C_GIVE_UP_MI_XIN : String = "13_78";

        /**
         * 完成密信失败，附带varint32错误码：
         *
         * 1.没有密信任务
         * 2.没有交密信任务
         * 3.距离npc太远
         * 4.你已经死亡了
         */
        public static const S2C_COMPLETE_MIXIN_FAIL : String = "13_80";

        /**
         * 完成密信成功
         *
         * 客户端清空密信任务，密信任务次数+1
         */
        public static const S2C_COMPLETE_MIXIN_SUCCEED : String = "13_81";

        /**
         * 大转盘
         *
         * varint32 奖励id
         * varint32 基础经验
         * varint32 奖励下标
         *
         * varint32 后面数据长度
         * bytes 解析成 RoulettePrizesProto
         *
         * bytes 解析成PrizeProto
         */
        public static const S2C_ROULETTE : String = "13_82";

        /**
         * 领取大转盘奖励
         *
         * varint32 奖励id
         */
        public static const C2S_COLLECT_ROULETTE_PRIZE : String = "13_83";

        /**
         * 领取奖励成功
         *
         * varint32 奖励id
         *
         * 删除密信转盘
         */
        public static const S2C_COLLECT_ROULETTE_PRIZE : String = "13_84";

        /**
         * 领取转盘奖励失败，返回varint32错误码
         *
         * 1. 没有奖励可以领取
         */
        public static const S2C_COLLECT_ROULETTE_PRIZE_FAIL : String = "13_85";

        /**
         * 头顶上面的密信状态
         *
         * varint64 哪个角色头顶上
         * if(buffer.readable()){
         *     varint32 密信的品质[0 白色 ,1 ,2 ,3 ,4 ]
         * } else {
         *     头顶上的密信状态消失
         * }
         */
        public static const S2C_MIXIN_STATUS : String = "13_86";

        /**
         * 弄出了个最高品质的密信
         *
         * varint32 品质
         * varint32 玩家所属国家
         * bytes 玩家名字
         */
        public static const S2C_MAX_QUALITY_MIXIN_BROADCAST : String = "13_87";

        /**
         * 接受偷猪任务失败，返回varint32错误码
         *
         * 1.偷猪任务没有开放
         * 2.不在自己国家，无法领取偷猪任务
         * 3.请求偷猪任务，但是距离NPC太远
         * 4.请求偷猪任务，但是当前已经有偷猪任务了
         * 5.不在偷猪活动期间
         * 6.次数不够，无法接受偷猪任务
         * 7.其他状态导致当前无法显示，有其他消息来提示，客户端不需要用这条消息提示
         */
        public static const S2C_ACCEPT_TOU_ZHU_TASK_FAIL : String = "13_91";

        /**
         * 接取偷猪任务完成
         *
         * varint64 任务结束时间
         *
         * 偷猪任务次数+1
         */
        public static const S2C_ACCEPT_TOU_ZHU_TASK : String = "13_92";

        /**
         * 偷猪变身
         *
         * varint64 玩家id
         *
         * if(readable()){
         *      varint32 偷到的猪
         * } else{
         * 		当前有偷猪任务，只是没有偷到猪
         * }
         */
        public static const S2C_TOU_ZHU_BIAN_SHEN : String = "13_93";

        /**
         * 偷猪变身消失
         *
         * varint64 玩家id
         */
        public static const S2C_TOU_ZHU_BIAN_SHEN_DISAPPEAR : String = "13_94";

        /**
         * 偷猪任务结束
         */
        public static const S2C_TOU_ZHU_TASK_DISAPPER : String = "13_95";

        /**
         * 申请开始偷猪
         *
         * varint64 猪在场景中的id
         */
        public static const C2S_STRAT_TOU_ZHU : String = "13_96";

        /**
         * 开始偷猪失败，返回varint32错误码
         *
         * 1.不在敌国场景中
         * 2.当前没有偷猪任务，无法偷猪
         * 3.猪已经被偷到了
         * 4.发送过来的目标不是猪
         * 5.距离过远
         */
        public static const S2C_STRAT_TOU_ZHU_FAIL : String = "13_97";

        /**
         * 开始偷猪成功
         *
         * varint64 进度条的结束时间
         */
        public static const S2C_STRAT_TOU_ZHU : String = "13_98";

        /**
         * 偷猪失败，返回varint32错误码
         *
         * 1.不在敌国场景中
         * 2.当前没有偷猪任务，无法偷猪
         * 3.猪已经被偷到了
         * 4.偷猪进度条还没走完呢
         * 5.目标没找到
         * 6.距离过远
         */
        public static const S2C_DO_TOU_ZHU_FAIL : String = "13_100";

        /**
         * 偷猪成功
         *
         * varint32 猪的配置id
         */
        public static const S2C_DO_TOU_ZHU : String = "13_101";

        /**
         * 完成偷猪任务
         */
        public static const C2S_COMPLETE_TOU_ZHU_TASK : String = "13_102";

        /**
         * 完成偷猪任务失败，返回varint32错误码
         *
         * 1.不在本国
         * 2.当前没有偷猪任务
         * 3.偷猪目标没有完成
         * 4.距离NPC太远
         */
        public static const S2C_COMPLETE_TOU_ZHU_TASK_FAIL : String = "13_103";

        /**
         * 完成偷猪任务
         *
         * 清掉当前偷猪任务
         */
        public static const S2C_COMPLETE_TOU_ZHU_TASK : String = "13_104";

        /**
         * 完成区域探索
         *
         * varint32 任务id
         */
        public static const C2S_COMPLETE_AREA_SEARCH : String = "13_200";

        /**
         * 完成区域探索失败，返回varint32错误码
         *
         * 1. 不在目标区域内
         */
        public static const S2C_COMPLETE_AREA_SEARCH_FAIL : String = "13_201";

        /**
         * 完成客户端任务1次
         *
         * varint32 任务id
         * varint32 任务类型
         */
        public static const C2S_COMPLETE_CLIENT_TASK : String = "13_202";

        /**
         * 完成客户端任务失败，返回varint32错误码
         *
         * 1. 不是客户端任务
         */
        public static const S2C_COMPLETE_CLIENT_TASK_FAIL : String = "13_203";

        /**
         * 领取护送npc
         *
         * varint32 任务id
         * varint64 场景中的npcid
         */
        public static const C2S_ACCEPT_SENT_NPC : String = "13_204";

        /**
         * 领取护送npc成功
         */
        public static const S2C_ACCEPT_SENT_NPC : String = "13_205";

        /**
         * 领取护送npc失败，返回varint32错误码
         *
         * 1. 距离npc过远
         * 2. 当前已经有领取护送的npc了
         * 3. 服务器bug
         * 4. 你已经死了
         * 5. 没有找到该护送任务
         */
        public static const S2C_ACCEPT_SENT_NPC_FAIL : String = "13_206";

        /**
         * 场景中看到一只护送npc
         *
         * varint64 主人的id
         * UTF 主人的名字
         *
         * 其他数据同
         *
         * SceneModuleMessages.S2C_ADD_MONSTER
         */
        public static const S2C_ADD_SENT_NPC : String = "13_207";

        /**
         * 同步任务护送npc所在位置
         *
         * varint32 任务id
         * varint64 npc的id
         * varint32 场景id
         * varint32 场景所属国家
         * varint32 场景所属线
         * varint32 场景x
         * varint32 场景y
         */
        public static const S2C_SYNC_SENT_NPC_POS : String = "13_208";

        /**
         * 任务护送的npc死亡了
         *
         * varint32 任务id
         */
        public static const S2C_SENT_NPC_DEAD : String = "13_209";

        /**
         * 护送任务的npc消失了
         *
         * varint32 任务id
         */
        public static const S2C_SENT_NPC_DISAPPEAR : String = "13_210";

        /**
         * 完成护送任务
         *
         * varint32 任务id
         */
        public static const C2S_COMPLETE_SENT_NPC : String = "13_211";

        /**
         * 完成护送任务失败，返回varint32错误码
         *
         * 1. 护送对象距离目标点过远
         * 2. 自己不在目标范围内
         * 3. 要完成的任务跟目前护送的npc不是同一个任务
         * 4. 你已经死了
         * 5. 没有找到可以完成的任务
         */
        public static const S2C_COMPLETE_SENT_NPC_FAIL : String = "13_212";

        /**
         * 完成玩家等待任务
         *
         * varint32 要完成的任务id
         */
        public static const C2S_COMPLETE_PLAYER_WAIT_TASK : String = "13_214";

        /**
         * 完成等待任务失败，返回varint32错误码
         *
         * 1. 当前已经死了
         * 2. 等待时间不够
         */
        public static const S2C_COMPLETE_PLAYER_WAIT_TASK_FAIL : String = "13_215";

        /**
         * 接受新的剧情任务
         * bytes StoryTaskProto
         */
        public static const S2C_TASK_NEW_STORY_TASK : String = "13_220";

    }
}