package app.cmd {

    public class GoodsContainerModuleMessages {

        /**
         * 背包物品移动，发送C2S_MOVE_GOODS，附带以下信息
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 原格子位置
         * varint32 目标格子位置
         */
        public static const C2S_MOVE_GOODS : String = "5_3";

        /**
         * 操作成功后，附带以下信息
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 原格子位置
         * varint32 目标格子位置
         * varint32 count，堆叠个数
         */
        public static const S2C_MOVE_GOODS : String = "5_4";

        /**
         * 移动失败，发挥byte错误码
         *
         * 1. 客户端发送的type无效
         * 2. 客户端发送的源位置与目标位置相同
         * 3. 客户端发送的源位置无效
         * 4. 客户端发送的目标位置无效
         * 5. 客户端发送的源位置已经被锁定
         * 6. 客户端发送的目标位置已经被锁定
         * 7. 客户端发送的源位置上面的物品不存在
         * 8. 英雄还没有仓库
         * 9. 物品不能够移出背包
         * 10. 过期
         * 11. 不是装备
         * 12. 性别不符
         * 13. 装备类型不符
         * 14. 副武器不匹配
         * 15. 等级不符
         * 16. 服务器bug
         * 17. 距离仓库NPC过远
         * 18. 坐骑未鉴定
         */
        public static const S2C_MOVE_GOODS_FAIL : String = "5_5";

        /**
         * 拆分物品发送C2S_SPLIT_GOODS，附带以下信息
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 原格子位置（拆分哪个）
         * varint32 目标格子位置（拆分到哪里）
         * varint32 拆分数量（拆分多少个出来）
         *
         * 失败返回S2C_SPLIT_GOODS_FAIL，附带byte错误码.错误码详见后面的说明.
         */
        public static const C2S_SPLIT_GOODS : String = "5_9";

        /**
         * 操作成功后，附带以下信息
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 原格子位置（拆分哪个）
         * varint32 目标格子位置（拆分到哪里）
         * varint32 拆分数量（拆分多少个出来）
         */
        public static const S2C_SPLIT_GOODS : String = "5_10";

        /**
         * 拆分失败，返回byte错误码
         * 1.客户端发送的type无效
         * 2.客户端发送的源位置与目标位置相同
         * 3.客户端发送的源位置无效
         * 4.客户端发送的目标位置无效
         * 5.客户端发送的源位置已经被锁定
         * 6.客户端发送的源位置上面的物品不存在
         * 7.客户端发送的目标位置上面的物品已经存在
         * 8.客户端发送的拆分数量错误，1、count <= 0 或者 count >= 源堆中的数量
         * 9.英雄还没有仓库
         * 10.距离仓库npc过远
         */
        public static const S2C_SPLIT_GOODS_FAIL : String = "5_11";

        /**
         * 背包仓库整理发送C2S_CLEAN，附带以下信息
         * varint32 操作类型：0-背包整理 1-仓库整理
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         */
        public static const C2S_CLEAN : String = "5_12";

        /**
         * 成功，附带以下信息
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint64 下次可整理时间
         * while(readable()){
         *      varint32 未整理前所在的位置，根据这个位置读取物品信息
         *      varint32 整理后对应下标的物品数量
         * }
         */
        public static const S2C_CLEAN_SUCCESS : String = "5_13";

        /**
         * 失败返回S2C_CLEAN_FAIL，附带byte错误码
         *
         * 1.客户端发送的type无效
         * 2.背包下次更新时间未到
         * 3.仓库下次更新时间未到
         * 4.背包已锁定
         * 5.英雄还没有仓库
         * 6.距离仓库npc太远
         */
        public static const S2C_CLEAN_FAIL : String = "5_14";

        /**
         * 手动解锁仓库页, 附带下面信息
         *
         * UpgradeProto StorageUnlockProto.upgradeData
         */
        public static const C2S_STORAGE_OPEN_PAGE : String = "5_17";

        /**
         * 成功解锁仓库页, 附带以下信息.
         *
         * varint32 格子第N页
         */
        public static const S2C_STORAGE_OPEN_PAGE : String = "5_18";

        /**
         * 失败返回S2C_DEPOT_STORAGE_OPEN_PAGE_FAIL，附带byte错误码.
         *
         * 1. 当前没有仓库
         * 2. 已经是最后一页了，无法再解锁
         * 3. 银两不足
         * 4. 金子不足
         * 5. 物品不足
         * 6. 距离仓库npc过远
         */
        public static const S2C_STORAGE_OPEN_PAGE_FAIL : String = "5_19";

        /**
         * 解锁背包格子
         *
         * varint32 当前总共的格子数量
         */
        public static const S2C_UNLOCK_DEPOT_GRID : String = "5_20";

        /**
         * 获取仓库的数据，发送C2S_STORAGE_GET_DATA
         */
        public static const C2S_DEPOT_STORAGE_GET_DATA : String = "5_21";

        /**
         * 服务器返回S2C_STORAGE_GET_DATA，附带以下信息
         * bytes GoodsContainerProto仓库数据
         *
         * 当英雄还没有仓库时，返回S2C_STORAGE_NOT_OPEN消息
         *
         * 注意：S2C_STORAGE_GET_DATA消息服务器只会返回一次
         */
        public static const S2C_DEPOT_STORAGE_GET_DATA : String = "5_22";

        /**
         * 获取仓库数据失败，返回varint32错误码
         *
         * 1. 没有仓库
         * 2. 距离npc过远
         */
        public static const S2C_DEPOT_STORAGE_GET_DATA_FAIL : String = "5_23";

        /**
         * 给英雄开放仓库时发生这条消息，收到这条消息后，客户端可以显示仓库按钮，可以使用仓库
         */
        public static const S2C_OPEN_STORAGE : String = "5_24";

        /**
         * 客户端收到S2C_ADD_GOODS消息，在背包或者仓库中添加一个物品，该消息附带以下信息
         * varint32 类型 0-背包 1-仓库
         * for (byteArray.avaliable)
         *     varint32 位置
         *     varint32 动态数据大小
         *     bytes 物品动态数据，客户端解析成GoodsProto
         */
        public static const S2C_ADD_GOODS : String = "5_25";

        /**
         * 客户端收到S2C_CHANGE_GOODS_COUNT消息，在背包或者仓库中修改一个或者多个物品的个数，该消息附带以下信息
         * varint32 类型 0-背包 1-仓库
         * while (byteArray.avaliable)
         *     varint32 位置
         *     varint32 新数量（如果数量为0，则客户端移除该位置的物品）
         */
        public static const S2C_SET_GOODS_COUNT : String = "5_27";

        /**
         * 背包或者仓库物品移除一个或者多个物品时，收到此消息，附带以下信息
         * varint32 类型 0-背包 1-仓库
         * if (byteArray.avaliable)
         *     varint32 物品的位置
         * 客户端收到这条消息时，移除物品
         */
        public static const S2C_REMOVE_GOODS : String = "5_28";

        /**
         * 丢弃物品，客户端先判断物品是否可以丢弃，是否处于安全区等限制，判断通过后，发送C2S_DROP_GOODS消息，
         * 附带丢弃物品的格子位置pos，物品ID，此时客户端需要锁定背包面板，等待服务器返回消息后才可以继续操作背包
         * 在收到确认消息之前，会先收到背包物品移除消息，此时客户端根据此消息将物品移除
         *
         * 然后客户端会收到物品视野相关的消息，具体参考物品视野文档
         *
         * 丢弃物品发送C2S_DROP_GOODS，附带以下信息
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 丢弃的物品位置
         * varint32 goodsId 防御性，防止客户端与服务器数据不一致，导致丢掉了重要物品
         *
         * 失败返回S2C_DROP_GOODS_FAIL，详见消息说明.
         * 解锁面板
         */
        public static const C2S_DROP_GOODS : String = "5_29";

        /**
         * 成功返回S2C_DROP_GOODS，该消息只有消息头，解锁面板
         * 解锁面板
         *
         * varint32 value
         *      容器类型：
         *      if(容器类型=MOUNT_EQUIPMENT){
         *          (坐骑第几个槽位 << 8) | ContainerType
         *      } else if(容器类型=STORAGE){
         *          如果vip可以直接使用，可以不带npcId，返回的S2C里面，客户端如果不需要，也可以不拿npcId
         *          (npcId << 8) | ContainerType
         *      } else {
         *          ContainerType
         *      }
         * varint32 丢弃的物品位置
         * varint32 goodsId 防御性，防止客户端与服务器数据不一致
         *
         */
        public static const S2C_DROP_GOODS : String = "5_30";

        /**
         * 失败返回byte错误码，详见消息说明.
         * 解锁面板
         *
         * 1、客户端发送的位置无效
         * 2、客户端发送的位置上没有物品
         * 3、客户端发送的位置上的物品ID，与客户端发送的物品ID不同
         * 4、物品不能丢弃
         * 5、处于安全区，不能丢弃物品
         * 6、跳跃中，不能丢弃物品
         * 7、物品已过期，不能丢弃物品
         * 8、英雄挂了，不能丢弃物品
         * 9、物品已经被锁定，不能丢弃物品
         * 10. 跨服区域不能丢物品
         * 11. 距离仓库npc过远
         * 12. 无效的容器类型
         */
        public static const S2C_DROP_GOODS_FAIL : String = "5_31";

        /**
         * 使用物品发送C2S_USE_GOODS，附带以下信息
         * varint32 物品位置（背包中）
         * varint32 使用数量
         *
         * 其他数据，后面会再加上
         *
         * 使用王者之印，后面单上参数
         *
         * varint32 要传送去的普通场景
         * varint32 要传送去的普通场景的x坐标
         * varint32 要传送去的普通场景的y坐标
         *
         * 打开未开启的会根据不同职业有不同奖励的礼包(PakcageGoodsProto)，否则都可以不带
         * varint32 职业
         *
         * 失败返回S2C_USE_GOODS_FAIL，附带byte错误码.错误码详见消息的说明.
         */
        public static const C2S_USE_GOODS : String = "5_50";

        /**
         * 使用物品成功，附带以下信息
         * varint32 物品位置（背包中）
         * varint32 该位置剩余数量（如果是0，则移除该位置物品）
         */
        public static const S2C_USE_GOODS : String = "5_51";

        /**
         * 有以下几种情况
         * 1、客户端发送的背包位置无效
         * 2、客户端发送的位置上没有物品
         * 3、物品不能使用（如装备）
         * 4、物品不能批量使用（客户端发送的数量大于1）
         * 5、物品个数不足（物品只有五个，客户端说要用6个）
         * 6、物品使用等级不足
         * 7、物品已经过期
         * 8、物品CD中
         * 9、英雄已经挂了
         * 10、物品已经被锁定，不能使用
         * 11、使用物品数量过多
         *
         * --包裹
         *
         * 15、打开金子礼包，金子不足
         *
         * --传送卷轴
         * 30、传送失败
         * 31、当前等级还不能进入目标场景
         * 32、当前家族不是无双城占领家族
         * 33、攻城战期间不能传送
         *
         * --任务卷轴
         * 50、英雄未完成第二章主线任务
         * 51、今日接受任务个数已达最大个数
         * 52、当前机缘任务列表个数已达最大个数
         *
         * --药品
         * 60、PK值为0，不能使用物品减少PK值
         * 61、加Buff类物品，英雄的Buff已满
         * 62、使用经验丹，但是经验已满
         * 64、使用银两物品，但是银两已满
         * 65、使用绑金物品，但是绑金已满
         * 66、使用家族历练物品，但是家族历练已满
         * 68、使用限制个数的物品，但是已经达到使用上限
         * 69、使用升级物品（大还丹），但是英雄已经满级了
         *
         * 70、没有镖车
         * 71、当前镖车不需要使用该接镖令
         *
         * 137、已经激活该称号
         *
         * 138、背包已经全部解锁
         *
         * 139、权限不足，不能使用
         * 140、当前场景无法使用该物品
         * 141、死了
         * 142、当前状态无法使用王者之令
         * 143、等级不足进入目标场景
         * 144、传送目标点不可行走
         * 145、没有权限使用家族召唤令
         *
         * 146、银两不足
         * 147、绑银不足
         *
         * 148、该物品不是兽牌
         * 149、没有空的坐骑槽位了
         *
         * 150、当前有折扣，无法使用
         *
         * 160、没有权限使用帮派召唤令
         */
        public static const S2C_USE_GOODS_FAIL : String = "5_52";

        /**
         * 物品冷却，附带
         * varint32 goodsId
         * varint32 冷却时间，单位毫秒，3000表示收到这个消息后，冷却时间转3秒
         */
        public static const S2C_GOODS_COOLDOWN : String = "5_53";

        /**
         * 物品层级冷却，附带
         * varint32 type 冷却层级
         * varint32 冷却时间，单位毫秒，3000表示收到这个消息后，冷却时间转3秒
         */
        public static const S2C_GOODS_TYPE_COOLDOWN : String = "5_54";

        /**
         * 使用礼包物品成功
         *
         * varint32 使用的物品在背包中的格子位置
         * bytes PrizeProto
         */
        public static const S2C_USE_PACKAGE_GOODS_SUCCESS : String = "5_60";

        /**
         * 使用礼包失败
         *
         * 1. 发送职业非法
         * 2. 没有武器，请选择职业奖励
         * 3. 背包空间不足
         *
         * 100. 服务器bug
         */
        public static const S2C_USE_PACKAGE_GOODS_FAIL : String = "5_61";

    }
}