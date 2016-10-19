package app.cmd {

    public class SceneModuleMessages {

        /**
         * 客户端加载完场景数据, 可进入场景时发送. 发送完等待服务器消息
         *
         * varint32 视野范围大小
         */
        public static const C2S_SCENE_LOADED : String = "3_1";

        /**
         * 改变可视范围大小. 只有已经进入场景才能发送(每次场景加载完都会附带个视野范围的)
         *
         * varint32 视野范围大小
         */
        public static const C2S_SCENE_CHANGE_VIEW_RANGE : String = "3_2";

        /**
         * 请求换线, 后面附带varint的目标线数目. 副本中不能发这条消息. 线是从1开始的. 最大线数目是在场景表中配置的, 客户端自己读取配置文件
         *
         * 客户端请求换线后, 把选线的列表锁住, 不让客户端再点击, 以免多次请求换线. 直到服务器回应这次换线请求为止
         *
         * 服务器有2种答复
         *
         * 1. 换线成功, 发送切场景消息 S2C_SCENE_CHANGE_SCENE = 2;
         *
         * 2. 换线失败(比如正在被别人攻击) S2C_CHANGE_LINE_FAIL = 6;
         * 消息后面附带varint32的失败原因(参见那条消息的注释)
         */
        public static const C2S_SCENE_CHANGE_LINE : String = "3_3";

        /**
         * 如果玩家从A场景切换到B场景，可以立即发送该条协议，请求各条线的负载。
         * 如果玩家从A场景1线切换到A场景2线，如果此前有请求过本场景的负载信息，则使用原来的数据，否则给服务器发送一条新的请求
         *
         * 后面不附带参数
         */
        public static const C2S_SCENE_GET_LINE_INFO : String = "3_4";

        /**
         * 英雄移动, 发送各个转弯的节点, 包括自己当前所站的那一点
         *
         * varint32 总共的节点数
         *
         * for 每个节点 {
         *
         * varint32 x坐标
         *
         * varint32 y坐标
         *
         * }
         *
         */
        public static const C2S_SCENE_HERO_MOVE : String = "3_5";

        /**
         * 停止移动. 发送停止消息给服务器, 本地并立即停止移动. 只有在移动状态下才发送
         *
         * 文档有云: 在跑不停状态下，按ESC键，则中断跑不停，并在当前坐标点停下。
         *
         * 后面没有参数
         */
        public static const C2S_SCENE_STOP_MOVE : String = "3_6";

        /**
         * 改变自己面对的方向(没改变不要发!). 只有静止状态下并且身上没有晕眩状态才发送. 本地立即转向, 服务器只会广播给别人, 不发送给转向的当事人
         *
         * 文档有云: 若点击到距离人物一格以内的点时，则执行“人物转向”指令，所转的方向视鼠标当前所在的方向而定
         *
         * 后面附带个varint32 的坐标. 0-7 每个值代表哪个方向客户端自己定. 别人收到的广播消息中也会有这个值, 服务器不管每个值代表的方向,
         * 但只能是0-7, 不然会遭断线处罚
         */
        public static const C2S_SCENE_CHANGE_DIRECTION : String = "3_7";

        /**
         * 客户端请求跳跃. 不管是一段跳还是二段跳, 都只发跳跃的目标点(鼠标所指的点, 不管当前点是否可走以及距离,
         * 这些全服务器根据当时服务器上角色的坐标来计算)
         *
         * 死亡/晕眩/地图不准跳跃/体力不足/冷却中/正在施法时, 不发送
         *
         * 若当前正在移动, 发送跳跃请求后并不打断移动
         *
         * varint32 跳跃动作
         */
        public static const C2S_SCENE_HERO_JUMP : String = "3_8";

        /**
         * 请求传送. 需要判断此传送门通过的最低等级, 不到等级的话不要发此消息
         *
         * 死亡/晕眩/跳跃中不发送. 且距离此传送门1格之内才能发送 (服务器会放宽到2格)
         *
         * 服务器有2种返回可能
         *
         * 1. S2C_SCENE_CHANGE_SCENE 成功, 要求切场景
         *
         * 2. S2C_HERO_TRANSPORT_FAIL 失败, 可能是距离太远, 可能被晕, 可能坐标发错了 等等
         *
         * 客户端需要等收到以上2条消息中的任意一条, 才能再发送消息请求穿过传送门. 如果是距离太远, 可能是不同步导致,
         * 重新向传送门所在坐标移动一下再请求
         *
         * 附带要走的传送门在配置文件中所配置的坐标 (不是英雄所在坐标)
         *
         * varint32 传送门id
         */
        public static const C2S_SCENE_REQUEST_TRANSPORT : String = "3_9";

        /**
         * 释放技能
         *
         * 附带
         *
         * varint32 type，使用的技能spell_type. 必须是已学会的
         *
         * varint32 技能释放坐标x
         * varint32 技能释放坐标y
         * varint32 释放角度
         * varint64 目标id，如果无目标id则发送0，后面附带技能坐标
         *
         */
        public static const C2S_SCENE_RELEASE_SPELL : String = "3_10";

        /**
         * 拾取地上物品，客户端判定当前英雄是否可捡（拾取保护时间），不能捡不要发消息，
         * 可以拾取时发送C2S_SCENE_PICK_UP_GOODS，附带拾取物品ID
         *
         * varint64 箱子在场景中的id
         * varint32 箱子里面第几个
         *
         * 成功返回S2C_SCENE_PICK_UP_GOODS
         * 失败返回S2C_SCENE_PICK_UP_GOODS_FAIL
         */
        public static const C2S_SCENE_PICK_UP_GOODS : String = "3_13";

        /**
         * 场景中可以拾取的物品的数据
         *
         * varint64 物品id
         */
        public static const C2S_SCENE_PICK_UP_GOODS_INFO : String = "3_1400";

        /**
         * 返回可以拾取的物品的信息
         *
         * varint64 物品id
         * while(buffer.readable()){
         *      varint32 物品在箱子里面的下标
         *      varint32 后面数据长度
         *      bytes GoodsProto
         * }
         */
        public static const S2C_SCENE_PICK_UP_GOODS_INFO : String = "3_1500";

        /**
         * 请求失败，返回varint32错误码
         *
         * 1. 物品没找到
         * 2. 距离过远
         * 3. 你不可以拾取
         * 4. 挂了，不能拾取物品
         */
        public static const S2C_SCENE_PICK_UP_GOODS_INFO_FAIL : String = "3_1600";

        /**
         * 服务器已经把客户端添加到场景, 客户端可进入场景. 消息后面附带英雄的坐标/血量/buff等的信息
         * varint32 info
         * fightData.writeOnSceneEnterOrRelive(buffer);
         *
         * int pkMode = info & 15; // pk模式
         * int line = (info >>> 4) & 255; // 第几线
         * int sceneSequence = (info >>> 12); // 值>=0时有效，表示场景所属的服务器sequence（注意，当场景是副本或者中立地图时候，这个值是0）
         */
        public static const S2C_SCENE_ENTER : String = "3_1";

        /**
         * 要求客户端改变场景, 客户端开始加载目标场景数据
         *
         * varint32的目标场景id
         *
         * 客户端收到此消息后, 如果目标场景id和当前所在的场景id相同, 则为换线, 不需要出加载界面(本来就已经加载好了),
         * 直接发送C2S_SCENE_LOADED, 并把视野中所有的怪和英雄啥的都清掉. 在服务器发送进入场景成功消息之前,
         * 不可以发送任何和场景有关的消息(移动, 战斗啥的). 等待服务器返回S2C_SCENE_ENTER后, 把坐标/血量啥的都设为消息后面附带的信息
         */
        public static const S2C_SCENE_CHANGE_SCENE : String = "3_2";

        /**
         *
         * varint64 英雄id
         * varint32 英雄所属国家
         * utf 名字
         * utf 家族名字 (空为没有家族)
         * varint32 result
         *      result & 31 = vip等级
         *
         *      (result >> 5) & 7 = 帮会标识
         *
         *                      帮会标识解析, 该方法要通用
         *
         *                      boolean isLeader = (family_mask & 1) != 0 // 表示是帮主
         *                      boolean isKingFamily = ((family_mask >>> 1) & 1) != 0 // 表示是王帮
         *                      boolean isEmperorFamily = ((family_mask >>> 2) & 1) != 0 // 表示是皇帮
         *
         *      ((result >> 8) & 15) - 1 = 官员官职(CountryOfficerPos)
         *                      officerPos = ((result >> 8) & 15) - 1
         *                      if(officerPos < 0){
         *                           没有官员官职
         *                      } else {
         *                           officerPos解析成CountryOfficerPos
         *                      }
         *
         *      (result >> 12) = 平台vip类型
         *
         * 后面方法改成通用方法
         * varint32 后面换装数据的长度
         * while(buffer.readable()){
         *      byte 换装资源
         * }
         * varint32 称号id
         * varint32 pk值
         * varint32 等级
         *
         * varint32 x点
         * varint32 y点
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 当前魔法值
         * varint64 最大魔法值
         *
         * while(buffer.readable()){
         *      stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
         *      currentStackCount = byteArray.readVarInt32() // 这个状态的层数
         *      disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         * }
         */
        public static const S2C_ADD_HERO : String = "3_3";

        /**
         *
         * varint64 怪物在场景中的id // 注意是int64
         * varint32 怪物的配置id
         *
         * // 接下来是和怪物共用的
         * varint32 x点
         * varint32 y点
         * varint64 当前生命值
         * varint64 最大生命值
         * varint64 当前魔法值
         * varint64 最大魔法值
         *
         * // 加载身上附带的状态
         * while(byteArray.available){ // 以下每个循环就是一个不同的状态
         *     stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
         *     currentStackCount = byteArray.readVarInt32() // 这个状态的层数
         *     disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         * }
         */
        public static const S2C_ADD_MONSTER : String = "3_4";

        /**
         * 移除场景中的一个目标
         *
         * varint64 目标id
         */
        public static const S2C_REMOVE_OBJECT : String = "3_5";

        /**
         * 换线失败 (成功则发S2C_SCENE_CHANGE_SCENE换线消息) 后面附带varint32的失败原因
         *
         * 1. 正在战斗状态
         *
         * 2. 要进入的线非法(可能当前正在这条线, 也可能线超过了场景最大的线数
         *
         * 3. 当前不在普通场景 (防御型, 客户端只应该在普通场景才发送这条消息)
         *
         * 4. 当前状态,无法切线
         *
         */
        public static const S2C_CHANGE_LINE_FAIL : String = "3_6";

        /**
         * 服务器返回当前的线数, 以及每个场景的负载情况
         *
         * 后面的读取方法
         *
         * while(byteArray.available){
         *
         * byteArray.readUnsignedByte // 这个byte表示负载当前在线人数，客户端根据在线人数显示各个分线的信息
         *
         * }
         *
         * 以上有多少个byte, 就表示有多少条线, 每个byte对应每条线的负载情况(从第一条线开始依次的)
         */
        public static const S2C_REPLAY_LINE_INFO : String = "3_7";

        /**
         * 场景中有英雄/怪物/宠物啥的 移动了, 包含每个节点和到达这个节点的时间
         *
         * varint64 移动的对象的id
         *
         * varint64 移动速度 (每秒走的像素)
         *
         * int64 从起始点开始走的时间 (第一点)
         *
         * varint32 总共的节点数
         *
         * for 每个节点 {
         *
         * varint32 x 坐标
         *
         * varint32 y 坐标
         *
         * }
         */
        public static const S2C_OBJECT_MOVE : String = "3_8";

        /**
         * 英雄移动失败. 客户端请求移动时, 在服务器上英雄正在晕眩, 或者正在其他不可移动的状态
         *
         * 客户端收到此消息后, 就把英雄直接刷到他应该站立的点, 清掉移动路径
         *
         * 后面附带
         *
         * varint32 x 坐标
         *
         * varint32 y 坐标
         */
        public static const S2C_YOU_MOVE_FAIL : String = "3_9";

        /**
         * 英雄/怪物啥的停止了移动, 广播
         *
         * 收到消息后, 看下消息中附带的id, 如果id不是自己, 则让英雄以原速度跑到指定的坐标后才停止, 若以原速度跑将超过1秒才能跑到,
         * 则增加移动速度使英雄在1秒钟后跑到目标点, 并停止
         *
         * 如果id是自己, 判断消息中附带的坐标和客户端本地英雄所站坐标的差, 如果误差在2格之内, 则不动, 继续让客户端停在原地. 如果误差>2格,
         * 则同上处理(原速度跑, 若超过1秒才能跑到, 则以1秒能跑到的速度跑)
         *
         * varint64 id
         *
         * varint64 speed 移动速度. 如果要跑向终点, 则以此速度跑
         *
         * varint32 x
         *
         * varint32 y
         *
         */
        public static const S2C_OBJECT_STOP_MOVING : String = "3_10";

        /**
         * 英雄/怪物啥的改变了方向, 只会广播给周围人, 不会发送给转向的这个英雄自己
         *
         * 收到消息后, 根据id找到对象, 如果此对象是静止状态并且身上没有晕眩状态, 才根据此消息中的方向转向, 不然忽略
         *
         * varint64 id
         *
         * varint32 方向X
         *
         * varint32 方向Y
         */
        public static const S2C_OBJECT_CHANGE_DIRECTION : String = "3_11";

        /**
         * 英雄跳广播
         *
         * 附带
         *
         * varint64 id
         *
         * varint32 跳跃动作
         */
        public static const S2C_HERO_JUMP : String = "3_12";

        /**
         * 跳跃失败
         *
         * 附带varint32的失败原因
         *
         * 1. 你已经挂了, 别瞎跳了
         *
         * 2. cd未到 (已删)
         *
         * 3. 晕眩中
         *
         * 4. 正在施法
         */
        public static const S2C_HERO_JUMP_FAIL : String = "3_14";

        /**
         * 传送失败,
         *
         * 附带varint32的失败原因
         *
         * 1. 距离太远
         *
         * 2. 被晕或者跳跃中或者已死亡等不能传送的状态中
         *
         * 3. 坐标没找到
         *
         * 4. 等级不够
         *
         * 5. 战斗状态中
         *
         * 6. 当前无法进入目标场景
         *
         * 7. 无法使用该传送门
         *
         * 8. 不可以带镖车出国
         *
         * 9. 目标场景限制战车进入
         */
        public static const S2C_HERO_TRANSPORT_FAIL : String = "3_15";

        /**
         * 服务器广播施法成功
         *
         * varint32 技能在场景中的id
         * varint32 技能特效
         * varint32 释放角度
         *
         * varint64 施法者id
         * varint32 施法者坐标x
         * varint32 施法者坐标y
         *
         * varint64 施法目标对象id
         * varint32 施法目标坐标x
         * varint32 施法目标坐标y
         *
         * 后面的读取方法
         *
         * while(byteArray.available){
         *
         * var type:int = byteArray.readVarInt32();
         *
         * var isState:boolean = (type & 1) == 1;
         *
         * if (isState){
         *      var roleID:Number = byteArray.readVarInt64();
         *      var stateID:int = byteArray.readVarInt32(); // 状态id
         *      var currentStackCount:int = byteArray.readVarInt32(); // 状态当前层数
         *      var disappearTime:Number = byteArray.readVarInt64(); // 状态消失时间
         * } else{
         *      var roldID:Number = byteArray.readVarInt64();
         *
         *      var currentLife:int = byteArray.readVarInt64(); // 本次技能之后, 还剩多少血
         *
         *      var hasPositionChange:boolean = ((type >>> 1) & 1) == 1;
         *      if (hasPositionChange){
         *          var newX:int = byteArray.readVarInt32();
         *          var newY:int = byteArray.readVarInt32();
         *      }
         *
         *      var hasAttackerId:boolean = ((type >>> 2) & 1) == 1
         *      if(hasAttackerId:boolean){
         *          var attackerId = byteArray.readVarInt64();
         *      }
         *
         *      var hasStiffTime:boolean = ((type >>> 3) & 1) == 1
         *      if(hasStiffTime){
         *          var stiffEndTime:Number = byteArray.readVarint64();
         *      }
         *
         *      var hurtTimes:int = (type >>> 4); // 伤害次数
         *      for (伤害次数){
         *         var hurtTypeAmount:int = byteArray.readVarInt32();
         *         var hurtType:int = (hurtTypeAmount & 15); // 伤害类型 0. 普通. 1. 闪避, 2. 暴击, 3. 跳闪, 4. 免疫
         *         var hurtAmount:int = hurtTypeAmount >>> 4; // 本次伤害血量
         *      }
         * }
         */
        public static const S2C_SCENE_SPELL_RELEASED : String = "3_16";

        /**
         * 释放成功, 附带释放成功的技能varint32的spell_type. 客户端在技能列表中找到此spell_type的技能,
         * 并在当前魔法的基础上, 减掉这个技能的耗蓝. 并且根据这个技能的公共cd和cd, 冷却别的技能和当前技能
         */
        public static const S2C_SCENE_SPELL_EFFECTED : String = "3_17";

        /**
         * 释放成功, 附带释放成功的技能varint32的spell_type. 客户端在技能列表中找到此spell_type的技能, 增加他的熟练度,
         * 并在当前魔法的基础上, 减掉这个技能的耗蓝. 并且根据这个技能的公共cd和cd, 冷却别的技能和当前技能
         */
        public static const S2C_YOUR_SPELL_RELEASED : String = "3_18";

        /**
         * 施法失败, 附带varint32 失败原因
         *
         * 1. 已死亡
         *
         * 2. 晕眩
         *
         * 3. 沉默
         *
         * 4. gcd 没到
         *
         * 5. 跳跃中
         *
         * 6. 这技能你不会 (不管是不是存在于这世上)
         *
         * 7. cd 没到
         *
         * 8. 魔法不够
         *
         * 9. 技能目标没找到
         *
         * 10. 技能目标已死亡
         *
         * 11. 距离过远
         *
         * 12. 伤害技能不能打自己人 或 不是伤害技能不能打坏人 攻击技能不能打英雄的原因有
         *
         * pk模式不对
         *
         * 你在安全区域内
         *
         * 目标在安全区域内
         *
         * 新手pk保护
         *
         * 等级差pk保护
         *
         * 夜晚pk保护
         *
         * 死亡保护
         *
         * 13. 法术值不足
         *
         * 14. 施法中
         *
         * 15. 前置技能没有释放
         *
         * 16. 定身中，无法释放位移技能
         *
         * 17. 当前场景，无法使用技能
         *
         * 18. 发送过来的角度非法，必须在(0-360]之间
         *
         * 19. 当前没有武器
         *
         * 20. 当前副武器无法释放该技能
         *
         * 21. 服务器bug
         *
         * 22. 该技能必须在马上才能够释放
         *
         * 23. 飞行中，无法释放技能
         *
         * 24. 当前坐骑无法骑战
         *
         * 25. 在镖车上
         *
         * 26. 摆摊中,无法放技能
         */
        public static const S2C_SPELL_RELEASE_FAIL : String = "3_19";

        /**
         * 场景中有对象血量有变化. 可能是因为状态, 可能是因为吃药
         *
         * 附带
         *
         * varint64 id
         *
         * varint64 导致本次变化的对象的id
         * [比如玩家自己给自己吃了一个药，这个id就是玩家自己的id，别人打了我，用的一个debuf，这个id就是别人的id]
         *
         * varint64 result2
         *
         *     计算这次变化的量 result2 / 2
         *     if(result2 % 2 != 0) {
         *         加血
         *     } else {
         *         减血
         *     }
         *
         * varint64 变化完的当前血量
         *
         * if(buffer.readable()){
         *      varint32 导致变化的状态id
         * }
         */
        public static const S2C_OBJECT_LIFE_CHANGE : String = "3_20";

        /**
         * 场景中有对象魔法值有变化. 可能是因为状态, 可能是因为吃药
         *
         * 附带
         *
         * varint64 id
         *
         * varint64 导致本次变化的对象的id
         * [比如玩家自己给自己吃了一个药，这个id就是玩家自己的id，别人打了我，用的一个debuf，这个id就是别人的id]
         *
         * varint64 result2
         *
         *     计算这次变化的量 result2 / 2
         *     if(result2 % 2 != 0) {
         *         加魔法值
         *     } else {
         *         减魔法值
         *     }
         *
         * varint64 变化完的当前魔法值
         */
        public static const S2C_OBJECT_MANA_CHANGE : String = "3_21";

        /**
         * 场景中对象删除身上所有的负面效果
         *
         * varint64 id
         */
        public static const S2C_OBJECT_CLEAR_ALL_DEBUFF : String = "3_23";

        /**
         * 场景中对象最大血量变化. 会改变对象的当前血量
         *
         * 附带
         *
         * varint64 对象id
         *
         * varint64 当前血量
         *
         * varint64 最大血量
         */
        public static const S2C_SCENE_OBJECT_MAX_LIFE_CHANGE : String = "3_30";

        /**
         * 场景中对象最大魔法值变化，会改变对象的当前魔法值
         *
         * 附带
         *
         * varint64 对象id
         *
         * varint64 当前魔法值
         *
         * varint64 最大魔法值
         */
        public static const S2C_SCENE_OBJECT_MAX_MANA_CHANGE : String = "3_31";

        /**
         * 视野里的英雄传送了. 如果当前视野里没有这人, 忽略(不要添加这人到场景)
         *
         * 如果这个人在视野里面，则删除视野里原来那人, 以这条消息附带的内容新添加这个英雄,
         *
         * 只会广播给英雄周围的人. 英雄自己收到的是S2C_SCENE_HERO_TP_SAME_SCENE消息
         *
         * 附带添加英雄消息S2C_ADD_HERO消息后面的内容
         *
         */
        public static const S2C_SCENE_HERO_TP_SAME_SCENE_BROADCAST : String = "3_32";

        /**
         * 英雄场景内传送, 在同一个场景内进行传送.
         *
         * 后面附带进入场景消息S2C_SCENE_ENTER后面附带的内容 (不包括第一个varint32的当前线的字段)
         */
        public static const S2C_SCENE_HERO_TP_SAME_SCENE : String = "3_33";

        /**
         * 在视野中添加一个箱子（掉地上的），附带以下信息
         *
         * while(byteArray.avaliable){
         *     varint64 id
         *     varint32 x
         *     varint32 y
         *     varint64 拾取时间间隔
         *     bool 是否可以自动拾取
         * }
         */
        public static const S2C_ADD_SCENE_BOX : String = "3_36";

        /**
         * 物品被拾取，收到S2C_SCENE_PICK_UP_GOODS消息
         *
         * varint64 箱子id
         * varint32 拾取的下标
         *
         * 客户端收到这条消息后，播放拾取物品飞到背包图标的动画，同时删掉场景中的拾取物品
         */
        public static const S2C_SCENE_PICK_UP_GOODS : String = "3_38";

        /**
         * 失败返回S2C_SCENE_PICK_UP_GOODS_FAIL， 附带varint32错误码
         * vatint32 错误码
         *
         * 错误类型：
         * 1、拾取的物品不存在（可能已经被别人捡了）
         * 2、物品不属于你（保护时间未过）
         * 3、与物品距离过远（服务器检测2格以内，客户端需要走到物品所在的位置上面）
         * 4、背包已满
         * 5、跳跃中不能拾取物品
         * 6、挂了，不能拾取物品
         * 7、防沉迷中，不能拾取物品
         * 8、拾取物品cd中
         */
        public static const S2C_SCENE_PICK_UP_GOODS_FAIL : String = "3_39";

        /**
         * 在视野中添加一个物品（需要做抛出动画）
         * 附带信息参考S2C_ADD_SCENE_BOX消息中的附带消息(2个消息只是消息头不同)
         */
        public static const S2C_DROP_SCENE_BOX : String = "3_40";

        /**
         * 下次能够拾取物品的时间变更了
         *
         * varint64 下一次能够拾取的时间
         */
        public static const S2C_NEXT_CAN_PICK_UP_TIME_CHANGED : String = "3_41";

        /**
         * 视野中英雄的家族名变了
         *
         * 附带
         *
         * varint64 对方id
         * varint32 family_mask 帮会标识
         * UTFBytes 最新的家族名 (空表示没有家族了)
         *
         * 帮会标识解析, 该方法要通用
         *
         * boolean isLeader = (family_mask & 1) != 0 // 表示是帮主
         * boolean isKingFamily = ((family_mask >>> 1) & 1) != 0 // 表示是王帮
         * boolean isEmperorFamily = ((family_mask >>> 2) & 1) != 0 // 表示是皇帮
         *
         */
        public static const S2C_OTHER_FAMILY_NAME_CHANGED : String = "3_45";

        /**
         * 开始挂机自动打怪
         */
        public static const C2S_SCENE_AUTO_COMBAT : String = "3_16";

        /**
         * 取消挂机自动打怪
         */
        public static const C2S_SCENE_CANCEL_AUTO_COMBAT : String = "3_17";

        /**
         * 取消挂机自动打怪成功
         */
        public static const S2C_SCENE_CANCEL_AUTO_COMBAT : String = "3_47";

        /**
         * 夜晚挂机自动保护，附带以下信息
         * varint64 英雄ID
         */
        public static const S2C_SCENE_NIGHT_AUTO_COMBAT_PROTECTED : String = "3_48";

        /**
         * 取消夜晚挂机自动保护，附带以下信息
         * varint64 英雄ID
         */
        public static const S2C_SCENE_CANCEL_NIGHT_AUTO_COMBAT_PROTECTED : String = "3_49";

        /**
         * 夜晚挂机时间过期，时间超过了8点
         */
        public static const S2C_SCENE_NIGHT_AUTO_COMBAT_PROTECT_EXPIRED : String = "3_50";

        /**
         * 回城接口
         */
        public static const C2S_SCENE_RETURN_CITY : String = "3_18";

        /**
         * 给英雄加个状态，比如吃经验丹什么的，附带以下信息
         * varint64 roleID，加给谁
         * varint32 stateID，状态ID
         * varint32 状态层数
         * varint64 状态消失时间
         */
        public static const S2C_SCENE_ADD_STATE : String = "3_51";

        /**
         * 移除英雄身上的某个状态，附带以下信息
         * varint64 roleID，谁
         * varint32 stateID，状态ID
         */
        public static const S2C_SCENE_REMOVE_STATE : String = "3_140";

        /**
         * 怪物伤害排行更新，服务器定时主动推送
         * varint64 怪物id
         * varint32 怪物配置id
         * varint32 怪物掉落类型 MonsterHurtRankType，不同类型读取不同的数据
         *
         * while(byteArray.available)
         *  RANK_PERSONAL:
         *     varint64 heroId
         *     UTF8 英雄名称
         *     varint64 伤害量
         *  RANK_TEAM:
         *     UTF8 队伍名称
         *     varint64 伤害量
         *  RANK_FAMILY:
         *     UTF8 帮派名称
         *     varint64 伤害量
         *  RANK_COUNTRY:
         *     varint32 国家
         *     varint64 伤害量
         *
         * 客户端收到这个消息，（如果看得到这个怪，看不到就算了）展示伤害排行榜面板（没有打开就打开）
         */
        public static const S2C_SCENE_PLUNDER_HURT_RANK : String = "3_80";

        /**
         * 怪物伤害排行更新
         * varint64 怪物id
         * varint64 伤害量
         *
         * 客户端收到这个消息时，如果还没有收到怪物排行榜更新消息，此时客户端保存这个值
         * 当怪物排行榜面板出现时，展示这个值
         */
        public static const S2C_SCENE_PLUNDER_HURT_RANK_SELF_AMOUNT : String = "3_81";

        /**
         * 重置伤害排行榜，客户端收到此消息，重置排行榜数据
         * varint64 怪物id
         *
         * 怪物失去目标时，发送此消息
         */
        public static const S2C_SCENE_RESET_HURT_RANK : String = "3_82";

        /**
         * 设置英雄位置
         *
         * varint64 玩家id
         * varint32 x
         * varint32 y
         *
         * 收到这个消息，客户端将英雄设置到当前场景的目标位置，删除视野内的英雄由服务器发消息通知
         */
        public static const S2C_SCENE_SET_POS : String = "3_83";

        /**
         * 家族战击杀英雄(板块战，无双城，将来的皇城都用这个)
         * varint64 id
         * bytes 英雄名字
         *
         * 提示击杀XXX玩家，获得了1点家族贡献
         */
        public static const S2C_SCENE_KILL_OTHER : String = "3_84";

        /**
         * 返回英雄当前血量
         * varint32 当前血量
         */
        public static const S2C_SCENE_SYNC_LIFE : String = "3_85";

        /**
         * 视野中英雄的称号改变了
         * varint64 英雄id
         * varint32 称号id，0表示取消使用称号
         */
        public static const S2C_SCENE_NICKNAME_CHANGED : String = "3_98";

        /**
         * 玩家的平台Vip改变
         * varint64 heroID
         * varint32 vip
         *
         * 下面字段计算得到:
         * level = vip >>> 2; // vip等级，1表示1级
         * chargeType = vip & 3; // 付费类型，1-月费，2-年费，3-季费
         *
         * 各个平台显示的图标的逻辑，有客户端实现
         * 比如360年费会员优先显示，不是年费会员则显示vip等级
         */
        public static const S2C_SCENE_PVIP_CHANGED : String = "3_99";

        /**
         * 获取世界Boss和精英的信息，包括刷新时间和击杀者
         */
        public static const C2S_SCENE_REQUEST_WORLD_BOSS_AND_ELITE_DATA : String = "3_100";

        /**
         *
         * 获取世界Boss和精英的信息，包括刷新时间和击杀者
         * while(byteArray.available)
         *     varint32 场景id
         *
         *     varint32 boss的数量
         *     for(i -> boss的数量){
         *          varint32 怪物ID
         *          varint32 状态，0-未刷新 1-已刷新（未被击杀） 2-已击杀
         *          varint64 refresh_time
         *          if (状态==2-已击杀){
         *              varint64 击杀者Id
         *              UTF 击杀者名字
         *              varint32 击杀者的国家[0-2]
         *              varint64 复活时间
         *          }
         *     }
         *
         *     varint32 精英的数量
         *     for(i -> 精英的数量){
         *          varint32 怪物ID
         *          varint32 状态，0-未刷新 1-已刷新（未被击杀） 2-已击杀
         *          varint64 refresh_time
         *          if (状态==2-已击杀){
         *              varint64 击杀者Id
         *              UTF 击杀者名字
         *              varint32 击杀者的国家[0-2]
         *              varint64 复活时间
         *          }
         *     }
         */
        public static const S2C_SCENE_REQUEST_WORLD_BOSS_AND_ELITE_DATA : String = "3_101";

        /**
         * 广播消息，Boss被XXX干掉鸟，附带以下消息
         * varint32 怪物ID，哪个Boss被干掉了
         * varint32 lineNumber 第几线的Boss被干掉了
         * varint64 死的这个Boss是什么时候刷新的
         * varint64 英雄id
         * varint32 英雄所属国家
         * varint64 boss复活时间
         * bytes 击杀者(Boss: 边个冚家产队冧佐我)
         *
         * 原来是Boss专用，扩展一下，其他的也可以用
         */
        public static const S2C_SCENE_WORLD_BOSS_BEEN_KILLED : String = "3_102";

        /**
         * 请求单人打坐
         */
        public static const C2S_SCENE_SINGLE_HERO_MEDITATE : String = "3_103";

        /**
         * 单人打坐，广播周围
         * varint64 英雄ID
         * varint32 x，打坐位置的X坐标
         * varint32 y，打坐位置的X坐标
         *
         * 收到这条消息
         *
         * 如果英雄是未打坐状态，则此时进行单人打坐，同时将英雄加入双修列表
         * 如果英雄是单人打坐中，则不处理
         * 如果英雄处于双修打坐中，并且对方的双修对象是自己，则此时英雄自己单休打坐，双修对象变成单修打坐(英雄和双修对象都加入其它人的双修邀请列表)
         * 如果英雄处于双修打坐中，并且对方的双修对象不是自己，则此时英雄自己单休打坐(英雄加入其它人的双修邀请列表)，双修对象不做处理
         *
         * 注意：如果英雄已经是打坐状态（不管是单人还是双人），不要重置累计时间，累计经验
         */
        public static const S2C_SCENE_SINGLE_HERO_MEDITATE : String = "3_104";

        /**
         * 单人打坐失败，发给英雄自己，附带Byte错误码
         * 1、自动战斗中，无法打坐
         * 2、战斗状态中，无法打坐
         * 3、跳跃中，无法打坐
         * 4、持续施法中，无法打坐
         * 5、飞行中，无法打坐
         * 6、当前状态,无法打坐
         */
        public static const S2C_SCENE_SINGLE_HERO_MEDITATE_FAIL : String = "3_105";

        /**
         * 请求双修打坐
         * varint64 跟谁双修
         */
        public static const C2S_SCENE_DOUBLE_HERO_MEDITATE : String = "3_106";

        /**
         * 双修打坐，广播周围，以右边英雄的坐标为准
         * varint64 左边英雄ID
         * varint64 右边英雄ID
         * varint32 x，打坐位置的X坐标
         * varint32 y，打坐位置的X坐标
         *
         * 收到这个消息，只有当客户端可以同时找到左边英雄和右边英雄的数据时，此时2个人2个人显示双修（英雄面对面坐着）
         * 如果只能看到其中一个人，则这个英雄单休状态，但是数据层是双修状态（不加入双修邀请列表）
         * 如果一个英雄都看不到，不管，忽略这条消息
         */
        public static const S2C_SCENE_DOUBLE_HERO_MEDITATE : String = "3_107";

        /**
         * 请求双修打坐错误，附带Byte错误码
         * 1、自动战斗中，无法打坐
         * 2、战斗状态中，无法打坐
         * 3、跳跃中，无法打坐
         * 4、持续施法中，无法打坐
         * 5. 飞行状态中
         * 6. 当前状态无法打坐
         *
         * 11、本场景找不到英雄
         * 12、距离太远，服务器检查2格以内的英雄可以双修
         * 13、双修目标不在打坐中
         * 14、双修目标已经在双修了
         *
         *
         * 收到这个消息时，如果错误码>10，此时请求双修的目标英雄就移出邀请列表，这个英雄就不再邀请了
         */
        public static const S2C_SCENE_DOUBLE_HERO_MEDITATE_FAIL : String = "3_108";

        /**
         * 取消打坐
         */
        public static const C2S_SCENE_HERO_CANCEL_MEDITATE : String = "3_109";

        /**
         * 取消打坐，广播周围
         * varint64 取消打坐的英雄ID
         *
         * 如果英雄不处于打坐中，则什么都不做
         * 如果英雄处于单人打坐中，则取消单人打坐
         * 如果英雄处于双修打坐中，并且对方的双修对象是自己，则此时英雄自己取消打坐，双修对象变成单修打坐(加入其它人的双修要求列表)
         * 如果英雄处于双修打坐中，并且对方的双修对象不是自己，则此时英雄自己取消打坐，双修对象不做处理
         */
        public static const S2C_SCENE_HERO_CANCEL_MEDITATE : String = "3_110";

        /**
         * 打坐收益，发送给英雄自己
         * varint32 经验
         */
        public static const S2C_SCENE_HERO_MEDITATE_INCOME : String = "3_111";

        /**
         * 地图传送
         * varint32 场景ID
         * varint32 X坐标
         * varint32 Y坐标
         * varint32 目标点范围
         * if(非Vip或VIP等级不足){
         *      要附带数据具体参考[这里]({% post_url 2014-11-08-物品消耗 %})
         * }
         *
         * 发送此消息客户端需要预先判断VIP等级是否足够，是否在普通场景（副本中不允许传送）
         *
         * 成功后会收到切场景的消息
         */
        public static const C2S_SCENE_MAP_TRANSPORT : String = "3_112";

        /**
         * 传送成功后，返回这个消息，只表示成功
         */
        public static const S2C_SCENE_MAP_TRANSPORT : String = "3_113";

        /**
         * 地图传送失败，附带Byte错误码
         * 1、英雄不在普通场景中
         * 2、传送道具不足
         * 3、英雄已经在这个场景了
         * 4、客户端发送的场景ID不是普通场景
         * 5、英雄等级不足，还不能进入场景
         * 6、数据异常(客户端发送的物品不是传送物品ID,发送的物品位置是null,发送的物品位置是上物品已过期,发送的物品位置上的物品个数不足)
         * 7、家族战期间 (板块战, 无双城, 皇城争霸)
         * 8、英雄已经死亡，不能够地图传送
         * 9、战斗中
         * 10、你在他国
         * 11、金子不足
         * 12、当前状态下无法地图传送
         */
        public static const S2C_SCENE_MAP_TRANSPORT_FAIL : String = "3_114";

        /**
         * 触发被动技能，附带varint32类型的技能类型
         *
         * varint32 spellType
         */
        public static const S2C_SCENE_TRIGGER_PASSIVE_SPELL : String = "3_115";

        /**
         * 成为嘲讽目标
         *
         * varint64 怪物id
         */
        public static const S2C_BEEN_TAUNT_TARGET : String = "3_116";

        /**
         * 丢失嘲讽目标
         *
         * varint64 怪物id
         */
        public static const S2C_LOST_TAUNT_TARGET : String = "3_117";

        /**
         * 视野里的宠物传送了. 如果当前视野里没有这人, 忽略(不要添加这人到场景)
         *
         * 如果这个人在视野里面，则删除视野里原来那人, 以这条消息附带的位置刷新宠物位置,
         *
         * 飘一个传送特效
         *
         * 只会广播给宠物周围的人
         *
         * 附带
         * varint64 宠物id
         * varint32 x坐标
         * varint32 y坐标
         */
        public static const S2C_SCENE_PET_TRANSPORT : String = "3_125";

        /**
         * 添加坐骑宠物
         * varint64 主人id
         * UTF 主人名字
         *
         * varint32 坐骑id，去config.proto中找坐骑数据，获取模型
         * varint64 宠物id，在场景中的唯一id
         *
         * // 接下来是和英雄共用的. 提取出公共的方法来，使用公共方法
         * varint32 x坐标
         * varint32 y坐标
         * varint32 当前血量
         * varint32 最大血量
         *
         * while(byteArray.available)
         *     varint32 状态的id, 去config.proto中的状态大全里找
         *     varint32 这个状态的层数
         *     varint64 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
         *
         */
        public static const S2C_SCENE_ADD_MOUNT_PET : String = "3_130";

        /**
         * 坐骑宠物切换，如果视野中找不到这个人，忽略
         * varint64 宠物在场景中的唯一id
         * varint32 新坐骑id
         *
         * 将消息中附带的坐骑，变成新的坐骑出战模型
         */
        public static const S2C_SCENE_MOUNT_PET_CHANGED : String = "3_131";

        /**
         * 坐骑宠物死亡，客户端根据这个展示倒计时
         * varint64 复活时间
         */
        public static const S2C_SCENE_MOUNT_PET_DEAD : String = "3_132";

        /**
         * 发送英雄的打坐状态
         *
         * varint64 左边的英雄的ID
         * if(buffer.readable()) {
         *      varint64 右边的英雄的ID
         * }
         *
         */
        public static const S2C_SCENE_HERO_MEDIATER_STAT : String = "3_134";

        /**
         * 技能cd冷却时间变化
         *
         * varint64 id[场景中的对象id]
         * varint32 spellType[技能类型]
         * varint64 冷却时间
         */
        public static const S2C_SPELL_CD_CHANGED : String = "3_143";

        /**
         * 头顶冒泡
         * varint64 角色场景id（目前是怪物id，但是可能扩展到英雄或者其他东西身上，客户端直接拿这个id去场景中找）
         * bytes 文字内容
         */
        public static const S2C_OBJECT_TALK : String = "3_145";

        /**
         * 请求某个场景中的同服英雄数据，发送后锁定面板，直到收到返回解锁
         *
         * varint32 type，type是下面的任何类型的或集，单个类型，必须10S才能请求一次，比如
         *          本次要请求本场景的官员以及本场景的本家族成员，10S内已经请求过了，不可以再
         *          请求本场景的本家族成员了，只可以请求本场景的本家族成员，不然服务器踢你下线
         *
         * 比如要请求(2.本场景的官员)跟(5.本场景的所有敌对成员)
         *
         * type = (1 << 2) | (1 << 5)
         *
         *      0. 附近的队伍
         *      1. 附近的英雄
         *      2. 本场景的官员
         *      3. 本场景的所有家族成员
         *      4. 本场景的所有本国以及盟国成员
         *      5. 本场景的所有敌对成员
         *      6. 本场景的所有本队伍成员
         */
        public static const C2S_GET_SURROUNDING_SCENE_INFO : String = "3_156";

        /**
         * 请求失败，附带byte错误码
         *
         * 0. 你在远程服务器中
         * 1. 没在场景中
         * 2. 普通场景没有找到
         * 3. 类型非法
         */
        public static const S2C_GET_SURROUNDING_SCENE_INFO_FAIL : String = "3_157";

        /**
         * 请求成功
         *
         * 数据已压缩
         *
         * varint32 type
         *
         * if(type是附近队伍){
         *     while(buffer.readable) {
         *         // 每个循环里面是一个队伍
         *         var heroCount:int = byteArray.readVarint32() 队伍当前人数
         *
         *         for (var i:int = 0; i < heroCount; i++){
         *             // 每个队员的信息, 用以显示tips, 以及线数. 算出队长等级和平均等级
         *             // 列表里第一个就是队长
         *             varint64 此人id
         *             UTF 此人名字
         *             varint32 此人等级
         *             bool 是否在线，在线读取后面的数据，不在线直接不读取
         *             if(在线){
         *                 varint32 此人职业(0表示没有职业)
         *             }
         *         }
         *     }
         * }
         *
         * if(type是附近的人){
         *     while(buffer.readable) {
         *         varint64 id
         *         UTF 名字
         *         varint32 职业，即RaceId
         *         varint32 等级
         *         varint64 战斗力
         *     }
         * }
         *
         * if(type是官员) {
         *     while(buffer.readable) {
         *          varint32 官职CountryOfficerPos
         *          utf 官员名字
         *          varint32 坐标X
         *          varint32 坐标Y
         *      }
         * }
         *
         * if(type是队伍/家族的人) {
         *     while(buffer.readable) {
         *              utf 成员名字
         *              varint32 坐标X
         *              varint32 坐标Y
         *          }
         *     }
         *
         * if(敌国的人){
         *          while(buffer.readable()){
         *              varint32 坐标X
         *              varint32 坐标Y
         *          }
         *     }
         *
         * if(type是盟友){
         *          while(buffer.readable()){
         *              varint64 玩家id
         *              varint32 坐标X
         *              varint32 坐标Y
         *          }
         *     }
         */
        public static const S2C_REPLY_SURROUNDING_SCENE_INFO : String = "3_158";

        /**
         * 怪物首次攻击者变更，附带
         * varint64 id
         * utfbyte name
         */
        public static const S2C_MONSTER_FIRST_HIT_CHANGE : String = "3_170";

        /**
         * 英雄请求复活
         *
         * 附带varint32 复活类型
         *
         * 0. 表示回城复活
         * 1. 表示花钱原地复活
         * 2. 表示花钱原地完美复活
         * 3. 表示信春哥
         * 4. 表示伤不起
         * 5. 表示跑得快
         */
        public static const C2S_REQUEST_RELIVE : String = "3_200";

        /**
         * 英雄复活失败
         *
         * 附带varint32的失败原因
         *
         * 1. 你还没有死亡
         * 2. 银两不够
         * 3. 非法的复活类型
         * 4. 当前无法回城复活
         */
        public static const S2C_RELIVE_FAIL : String = "3_201";

        /**
         * 英雄复活了，客户端增加复活次数，或者清空复活次数
         *
         * varint32 复活类型  0: 回城复活, 1: 原地复活, 2: 原地完美复活, 3: 信春哥复活, 4: 伤不起复活, 5: 跑得快复活
         */
        public static const S2C_HERO_RELIVE : String = "3_202";

        /**
         * 英雄复活, 复活场景就是本场景. 可能是完美复活, 也有可能是回城复活, 但是回城复活的场景正好就是同一个场景. 播放复活特效，该消息只有自己会收到
         *
         * 清空什么复活保护时间等等
         *
         * 后面附带进入场景消息S2C_SCENE_ENTER后面附带的内容 (不包括第一个varint32的当前线的字段)
         */
        public static const S2C_SCENE_HERO_RELIVE_IN_SAME_SCENE : String = "3_203";

        /**
         * 视野里的英雄完美复活了. 这时这人应该是个尸体. 如果当前视野里没有这人, 忽略(不要添加这人到场景)
         *
         * 就算不是尸体, 不管, 删除视野里原来那人, 以这条消息附带的内容新添加这个英雄, 并在他身上播放复活特效
         *
         * 只会广播给英雄周围的人. 英雄自己收到的是S2C_SCENE_HERO_RELIVE_IN_SAME_SCENE消息
         *
         * 附带添加英雄消息S2C_ADD_HERO消息后面的内容
         */
        public static const S2C_SCENE_HERO_RELIVED_BROADCAST : String = "3_204";

        /**
         * 服务器通知客户端已经死亡. 客户端收到此消息1秒后, 弹出死亡复活面板, 并将场景/人物/怪物 颜色抽黑
         *
         * 附带
         *
         * varint32 可完美复活类型以及击杀者的类型
         *
         * 客户端读取方式
         *
         * var speicialReliveInfo = byteArray.readVarint32();
         *      // 复活类型：
         *      // specialReliveInfo & 1 != 0 // 能够信春哥复活
         *      // specialReliveInfo & 2 != 0 // 能够伤不起复活
         *      // specialReliveInfo & 4 != 0 // 能够跑得快复活
         *
         * var reliveTime:int64 = byteArray.readVarint64(); // 服务器复活的时间
         *
         * var killerType: int = byteArray.readVarint32();
         *      // killerType 的意义:
         *      // 0: 英雄
         *      // 1: 怪物
         *      // 2: 无名氏 (bug?)
         *
         * var killerName:string = byteArray.readUTF()
         *
         * //杀手名字
         * if (killerType == 0){
         *     // 如果是英雄，再读一个英雄ID
         *     var killerId:long = byteArray.readVarInt64();
         *
         *     var familyName:string = byteArray.readUTF();
         *
         *     if(buffer.readable()) {
         *          country = byteArray.readVarInt32();
         *     }
         * }
         *
         */
        public static const S2C_SCENE_YOU_ARE_DEAD : String = "3_205";

        /**
         * 原地复活折扣时间变化了
         *
         * varint64 折扣结束时间
         * varint32 折扣
         */
        public static const S2C_ORIGIN_RELIVE_DISCOUNT_TIME_CHANGED : String = "3_206";

        /**
         * 原地完美复活折扣时间变化了
         *
         * varint64 折扣结束时间
         * varint32 折扣
         */
        public static const S2C_ORIGIN_PERFECT_RELIVE_DISCOUNT_TIME_CHANGED : String = "3_207";

        /**
         * 触发客户端时间
         *
         * varint64 触发的人的id,可能是怪物,可能是人
         * varint32 触发的事件id
         */
        public static const S2C_TRIGGER_CLIENT_EVENT : String = "3_210";

    }
}