package app.cmd {

    public class AuctionModuleMessages {

        /**
         * 获取自己摊位的物品列表. 没有附带信息
         *
         * 只有每次登录, 第一次打开"我的摊位"时, 才需要请求一次. 之后如果用户自己改变了摊位, 自己是知道的
         * 如果东西被人买了, 服务器也会通知, 附带卖掉的物品id, 客户端可以根据id去掉卖掉的物品. 保持数据的正确
         */
        public static const C2S_GET_SELF_AUCTION_LIST : String = "17_1";

        /**
         * 获取自己的摊位列表失败, 附带varint32 的失败原因
         *
         * 1. 已经请求过了, 不该再请求
         * 2. 获取时内部出错, 过会再试, 不要自动试, 让用户自己过会再试. 此次请求不算, 之后可以再请求
         */
        public static const S2C_GET_SELF_AUCTION_LIST_FAIL : String = "17_1";

        /**
         * 获取别人的摊位列表
         *
         * 附带
         *
         * varint64 对方id
         */
        public static const C2S_GET_TARGET_AUCTION_LIST : String = "17_2";

        /**
         * 获取某人摊位失败, 附带varint32 失败原因
         *
         * 1. id不存在
         * 2. 获取时内部出错, 过会再试, 不要自动试, 让用户自己过会再试.
         * 3. 不是同一联服, 不能看别人摊位
         */
        public static const S2C_GET_TARGET_AUCTION_LIST_FAIL : String = "17_2";

        /**
         * 返回查询的摊位的物品列表. 里面可能夹杂着卖的银两和金子, 提出来, 放到应该放他们的位置
         *
         * 查询的时候, 英雄的名字客户端肯定是知道的, 就不在消息中附带了
         *
         * 如果没有物品列表, 则此人没有摆摊.
         *
         * 附带
         *
         * unsignedByte 可购买类型 0: 摊主当前在线, 可购买. 1: 摊主当前不在线, 不可购买. 2: 摊主当前不在线, 但vip等级足够, 可购买
         *              如果是查看自己的摊位时, 返回的, 则无视这个字段
         *
         * while(byteArray.available){
         * -- 以下部分写成个方法, 搜索物品的时候也是这样的读法 --
         *      varint64 此件拍卖品的id
         *      varint32 售价. 如果是物品或银两, 则单位是金子. 如果物品是金子, 则单位是银两
         *
         *      bool 是否是物品
         *
         *      if(是物品){
         *          下面是读物品. 和摊位搜索/自己摊位物品列表里的一样
         *          var dynamicLen:int = byteArray.readVarint32();
         *          dynamicBytes = new ByteArray();
         *          byteArray.readBytes(dynamicBytes, 0, dynamicLen); // 物品的动态长度
         *      } else{
         *          var goodsType:int = staticBytes.readVarint32(); // 物品类型. 54是金子, 51是银两
         *          var amount:int = staticBytes.readVarint32(); // 卖家出的金子或银两数
         *      }
         *  }
         */
        public static const S2C_REPLY_TARGET_AUCTION_LIST : String = "17_3";

        /**
         * 将背包中的物品加入到摊位中. 此时已上架的物品必须少于10个. 一定要等待返回才能再上架/下架
         *
         * 附带
         *
         * varint32 物品在背包中的格子
         * varint32 物品id (校验用的, 别上错了东西, 或者物品其实在服务器端已经移动)
         * varint32 要卖的数量 (必须>=1 不然断线)
         * varint32 售价 (一定是金子) (必须是>=2 && <= 9亿, 不然断线)
         */
        public static const C2S_ADD_GOODS_TO_AUCTION : String = "17_3";

        /**
         * 物品上架失败, 附带varint32 失败原因
         *
         * 1. 那格子没物品 (或格子坐标错误 >=0 && <= 已经开的格子)
         * 2. 物品id对不上
         * 3. 那物品不能卖 (绑定或者有过期时间)
         * 4. 服务器内部错误 (过会再试, 不要自动试)
         * 5. 已经有10个在售物品了, 先下架
         * 6. 物品在交易中
         * 7. 没那么多可以卖, 数量太多
         */
        public static const S2C_ADD_GOODS_TO_AUCTION_FAIL : String = "17_4";

        /**
         * 将物品上架成功, 将此时在之前请求消息中附带的格子里的物品(根据请求的消息中附带的个数)放上摊位. (一定是按照格子来, 不要按照物品来)
         *
         *
         * 将物品加到摊位列表的最后 (没得选格子, 服务器暂不支持自己选要上架的格子, 以及格子间上下移位)
         *
         * 附带
         *
         * varint64 此物品的摊位唯一id (被售出提醒, 及下架/改价格, 都需要这个id. 和物品id是2回事)
         */
        public static const S2C_ADD_GOODS_TO_AUCTION_SUCCESS : String = "17_5";

        /**
         * 卖银两, 当前必须没有在卖银两
         *
         * 附带
         *
         * varint32 卖的银两数 必须>=1, 不然断线
         * varint32 金子价格 (要把这些银两卖多少金子) (必须 >=2 && <= 9亿, 不然断线)
         */
        public static const C2S_ADD_MONEY_TO_AUCTION : String = "17_4";

        /**
         * 上架银两失败, 附带varint32 错误码
         *
         * 1. 身上没有这么多银两
         * 2. 当前已经在卖银两了
         * 3. 服务器内部错误, 稍后再试, 不要自动重试
         */
        public static const S2C_ADD_MONEY_TO_AUCTION_FAIL : String = "17_6";

        /**
         * 银两上架成功. 背包中银两改变会另外发消息.
         * 只需要把之前消息中附带的那些银两数, 以消息中附带的金子价格放上摊位
         *
         * 附带
         *
         * varint64 这些银两的唯一摊位id. (售出或下架/改价格都用这个id)
         */
        public static const S2C_ADD_MONEY_TO_AUCTION_SUCCESS : String = "17_7";

        /**
         * 卖金子, 当前必须没有在卖金子. 且为了保险起见, 当前也不能正在交易
         *
         * 附带
         *
         * varint32 卖的金子数 必须>=2, 不然断线
         * varint32 银两价格 (要把这点金子卖多少银两) (必须 > 0 && <= 9亿, 不然断线)
         */
        public static const C2S_ADD_JINZI_TO_AUCTION : String = "17_5";

        /**
         * 上架金子失败, 附带varint32 错误码
         *
         * 1. 身上没有这么多金子 (如果< 2会断线, 就没有错误码了)
         * 2. 当前已经在卖金子了
         * 3. 当前正在交易中
         * 4. 服务器内部错误, 稍后再试, 不要自动重试
         */
        public static const S2C_ERROR_ADD_JINZI_TO_AUCTION : String = "17_8";

        /**
         * 金子上架成功. 背包中金子改变会另外发消息
         * 只需要把之前请求的消息中附带的金子数, 以消息中附带的银两价格放上摊位
         *
         * 附带
         *
         * varint64 这些金子的唯一摊位id. (售出或者下架/改价格都用这个id)
         */
        public static const S2C_ADD_JINZI_TO_AUCTION_SUCCESS : String = "17_9";

        /**
         * 根据物品名/类别/职业/等级/品质搜索物品, 并根据单价/总价排序. 摊位页面第一个列表里的信息, 全都只有这一条消息
         *
         * 返回前不能再发送请求
         *
         * 附带
         *
         * varint32 物品的品质限制 0表示不限, 1-白色以上;2-绿色以上;3-蓝色以上;4-紫色以上;5-橙色以上
         * varint32 物品的等级限制 0表示不限, 21表示20级, 41表示40级, 61表示60级. 以此类推
         * varint32 排序方式 0表示无排序, 1表示按单价排序, 2表示按总价排序
         * varint32 物品的类别. 参照文档的物品类别表
         * varint32 页数 0表示第一页. 必须>=0, 不然断线
         * UTFBytes 物品的名字模糊查找. 需要自己前后去尾. 没有或者去完尾后为空就不发. 物品名字必须是1-6个汉字之间
         */
        public static const C2S_SEARCH_AUCTION_GOODS : String = "17_6";

        /**
         * 查找物品错误, 附带varint32 错误码
         *
         * 1. 发来的品质不合法
         * 2. 发来的等级不合法
         * 3. 发来的职业不合法
         * 4. 发来的排序方式不合法
         * 5. 发来的物品类别不合法
         * 6. 发来的物品名字不合法
         * 7. 服务器内部错误
         * 8. 服务器还没返回, 怎么又发来请求
         */
        public static const S2C_SEARCH_AUCTION_GOODS_ERROR : String = "17_10";

        /**
         * 返回搜索物品结果
         *
         * 附带
         *
         * bool 是否还有下一页 如果有的话, 下一页按钮亮/可按
         *
         * while(byteArray.available){
         *      varint64 出售者id
         *      UTF 出售者名字
         *
         *      -- 下面的部分和查看别人摊位的是一样的 --
         *      varint64 此件拍卖品的id
         *      varint32 售价. 如果是物品或银两, 则单位是金子. 如果物品是金子, 则单位是银两
         *
         *      bool 是否是物品
         *
         *      if(是物品){
         *          下面是读物品. 和摊位搜索/自己摊位物品列表里的一样
         *          var dynamicLen:int = byteArray.readVarint32();
         *          dynamicBytes = new ByteArray();
         *          byteArray.readBytes(dynamicBytes, 0, dynamicLen); // 物品的动态长度
         *      } else{
         *          var goodsType:int = staticBytes.readVarint32(); // 物品类型. 54是金子, 51是银两
         *          var amount:int = staticBytes.readVarint32(); // 卖家出的金子或银两数
         *      }
         * }
         */
        public static const S2C_REPLY_SEARCH_AUCTION_GOODS : String = "17_11";

        /**
         * 下架物品, 服务器返回前不能再上架/下架/改变售价等操作
         *
         * 客户端先本地判断有没有位置放这件拍卖品 (银两/金子/背包空格)
         *
         * 附带
         *
         * varint64 商品id (不是物品id, 是每件摊位物品的唯一id)
         */
        public static const C2S_REMOVE_MY_AUCTION : String = "17_7";

        /**
         * 下架失败, 附带varint32 错误码
         *
         * 1. id没有找到 (要么被人买了, 要么已经下架了)
         * 2. 这件物品不是你上架的
         * 3. 包里放不下了 (如果是银两或金子, 则是下架后总数超过20亿, 如果是物品, 则是背包里没有一个空格子)
         * 4. 服务器内部错误, 不要自动重试
         */
        public static const S2C_REMOVE_MY_AUCTION_FAIL : String = "17_12";

        /**
         * 下架成功, 只需要把id为之前请求中附带的货下架就行. 服务器会另外发送改变银两/金子/物品的消息
         *
         * 没有附带信息
         */
        public static const S2C_REMOVE_MY_AUCTION_SUCCESS : String = "17_13";

        /**
         * 获取自己的摊位日志. 每次登录只能请求一次
         *
         * 如果请求过了摊位日志, 则后续的购买或售出事件由客户端收到对应消息的时候, 自己生成日志加在日志的最前面 (如果超过30条则挤掉最老的1条)
         * 没有请求过, 则收到对应事件的消息则不需要管日志, 只管其他提示的逻辑
         *
         * 请求的时候会返回最近的30条和你相关的日志. 卖出和买入都有
         *
         * 没有附带信息
         */
        public static const C2S_GET_AUCTION_LOG : String = "17_8";

        /**
         * 获取摊位列表失败, 附带varint32 错误码
         *
         * 1. 已经请求过了
         * 2. 服务器内部错误, 别自动重试. 这次请求不算, 之后可以再请求
         */
        public static const S2C_GET_AUCTION_LOG_FAIL : String = "17_14";

        /**
         * 返回摊位日志. 最多30条
         *
         * 这里面附带的售价或卖出物都已经根据自己是买家还是卖家, 区分了税前和税后了. 客户端不需要扣税
         *
         * 附带
         *
         * while(byteArray.available){
         *      varint64 事件发生的事件点
         *      bool true 自己是买家, false 自己是卖家
         *      varint64 对方id
         *      UTF 对方名字
         *
         *      varint32 售价 (如果后面卖出的东西是金子, 则这个是数字的单位是银两. 别的都是金子)
         *      varint32 交的税 (如果是买家, 只有在买金子时才有, 如果是卖家, 只在卖金子时没有)
         *
         *      bool 是否是物品
         *
         *      if(是物品){
         *          下面是读物品. 和摊位搜索/自己摊位物品列表里的一样
         *          var dynamicLen:int = byteArray.readVarint32();
         *          dynamicBytes = new ByteArray();
         *          byteArray.readBytes(dynamicBytes, 0, dynamicLen); // 物品的动态长度
         *      } else{
         *          var goodsType:int = staticBytes.readVarint32(); // 物品类型. 54是金子, 51是银两
         *          var amount:int = staticBytes.readVarint32(); // 卖家出的金子或银两数
         *      }
         * }
         */
        public static const S2C_REPLY_AUCTION_LOG : String = "17_15";

        /**
         * 请求购买物品
         *
         * 客户端需本地判断自己有足够的钱买, 且买下来后能够放得下 (如果买的是钱, 加上后不超过20亿, 如果是物品, 有1个空格)
         * 且此件物品的出售者不为自己
         *
         * 返回前, 不能再发送购买消息
         *
         * 保险起见, 交易过程中不能买东西
         *
         * 附带
         *
         * varint64 摊位物品唯一id
         */
        public static const C2S_BUY_AUCTION_GOODS : String = "17_9";

        /**
         * 购买物品失败, 附带varint32 错误码
         *
         * 1. 物品不存在 (别人已下架/或已经改了价格/或已经被人买了)
         * 2. 你买不起
         * 3. 放不下 (如果是钱, 加上后超过了20亿, 如果是物品, 背包中没有足够格子)
         * 4. 出售者是自己, 买了白交税?
         * 5. 服务器内部错误, 不要自动重试
         * 6. 你正在交易
         * 7. 不能买别的联服的物品
         */
        public static const S2C_BUY_AUCTION_GOODS_FAIL : String = "17_16";

        /**
         * 购买物品成功. 如果已经请求过最近摊位记录, 则把这次购买的东西也加入到列表中
         *
         *  附带
         *
         *  varint32 买家这次付的税
         */
        public static const S2C_BUY_AUCTION_GOODS_SUCCESS : String = "17_17";

        /**
         * 别人购买了你的摊位物品.
         *
         * 如果请求过了摊位记录, 将这次出售也加入到列表中. 不需要改变可领取收益. 服务器会另外发消息通知
         *
         * 附带
         *
         * varint64 摊位物品的唯一id
         *
         *  varint64 事件发生的事件点
         *  varint64 买方id
         *  UTF 买方名字
         *
         *  varint32 卖家可领取的银两或金子数
         *  varint32 卖家交的税
         *
         *  bool 是否是物品
         *
         *  if(是物品){
         *      下面是读物品. 和摊位搜索/自己摊位物品列表里的一样
         *      var dynamicLen:int = byteArray.readVarint32();
         *      dynamicBytes = new ByteArray();
         *      byteArray.readBytes(dynamicBytes, 0, dynamicLen); // 物品的动态长度
         *  } else{
         *      var goodsType:int = staticBytes.readVarint32(); // 物品类型. 54是金子, 51是银两
         *      var amount:int = staticBytes.readVarint32(); // 卖家出的金子或银两数
         *  }
         */
        public static const S2C_OTHER_BOUGHT_YOUR_AUCTION_GOODS : String = "17_18";

        /**
         * 上线时, 如果有可领取的收益 (银两/金子), 服务器会主动推送
         * 改变时, 服务器也会推送. 即东西卖掉了, 或领取了收益了
         *
         * 如果本来没有可领取收益, 只有在收到这条消息时才弹出领取收益按钮
         *
         * 附带
         *
         * varint64 可领取的银两
         * varint64 可领取的金子
         */
        public static const S2C_SET_COLLECTABLE_PRIZE : String = "17_21";

        /**
         * 要求领取所有收益. 必须是有可领取的收益时才能发送. 即银两/金子中有一个不为0.
         * 必须等待服务器返回, 才能再发送
         *
         * 安全起见, 交易时不能领取收益
         *
         * 没有附带的信息
         */
        public static const C2S_COLLECT_PRIZE : String = "17_11";

        /**
         * 领取失败, 附带varint32 失败原因
         *
         * 1. 没有可领的收益
         * 2. 服务器内部错误, 稍后再试
         * 3. 当前正在交易
         */
        public static const S2C_COLLECT_PRIZE_FAIL : String = "17_22";

        /**
         * 领取成功. 只供展示提示, 服务器会另外发消息改变银两/金子
         *
         * 不要在这条消息改变可领取的收益. 服务器也会另外发送S2C_SET_COLLECTABLE_PRIZE改变可领取的收益.
         *
         * 附带
         *
         * varint64 已领取的银两. -1表示银两满了, 没领成功
         * varint64 已领取的金子. -1表示金子满了, 没领成功
         */
        public static const S2C_COLLECT_PRIZE_SUCCESS : String = "17_23";

        /**
         * 要改个物品的价格. 返回前不能再发下架/上架/改价格
         *
         * 改价格会导致物品的唯一id变化. 确保别人不会买到改了价格之后的物品
         *
         * 价格和之前的有变化才发过来
         *
         * 附带
         *
         * varint64 要改的物品的摊位唯一id
         * varint32 最新价格 (如果卖的物品是金子, 则这个价格的单位是银两). 如果是银两, 必须>0, 如果是金子, 必须>1
         */
        public static const C2S_CHANGE_PRICE : String = "17_12";

        /**
         * 改价失败, 附带varint32 错误码
         *
         * 1. 要改的物品不存在 (可能已经下架/已经改了价格/被人买了)
         * 2. 价格非法 (价格必须>0)
         * 3. 服务器内部错误, 稍后再试, 不要重试
         * 4. 这个物品不是你放上去卖的
         */
        public static const S2C_CHANGE_PRICE_FAIL : String = "17_24";

        /**
         * 改价成功. 根据id, 把摊位上的物品的价格改成之前的请求中附带的价格
         *
         * 附带
         *
         * varint64 这件被改价的物品的最新id
         */
        public static const S2C_CHANGE_PRICE_SUCCESS : String = "17_25";

        /**
         * 展示个自己摆摊中的物品. 10秒钟只能展示一次. 等收到S2C_DISPLAY_SUCCESS后开始计时
         *
         * 附带
         *
         * varint64 要展示的摊位物品的唯一id
         */
        public static const C2S_DISPLAY : String = "17_13";

        /**
         * 展示失败, 附带varint32 错误码
         *
         * 1. id不存在 (可能卖了, 可能改价了, 可能下架了)
         * 2. 物品不属于你 (搞毛, bug?)
         * 3. 服务器内部错误
         * 4. 展示cd没到
         */
        public static const S2C_DISPLAY_FAIL : String = "17_26";

        /**
         * 展示成功, 开始记展示cd. 服务器会另外广播给所有人摊位物品的信息
         *
         * 没有附带的信息
         */
        public static const S2C_DISPLAY_SUCCESS : String = "17_27";

        /**
         * 别人发送的摊位物品展示
         *
         * 附带
         *
         * 以下和S2C_REPLY_SEARCH_AUCTION_GOODS消息返回的物品格式一模一样. 以后就算改了也是一起改的, 提成个方法
         *  varint64 出售者id
         *  UTF 出售者名字
         *
         *
         *  -- 下面的部分和查看别人摊位的是一样的 --
         *  varint64 此件拍卖品的id
         *  varint32 售价. 如果是物品或银两, 则单位是金子. 如果物品是金子, 则单位是银两
         *
         *  bool 是否是物品
         *
         *  if(是物品){
         *      下面是读物品. 和摊位搜索/自己摊位物品列表里的一样
         *      var dynamicLen:int = byteArray.readVarint32();
         *      dynamicBytes = new ByteArray();
         *      byteArray.readBytes(dynamicBytes, 0, dynamicLen); // 物品的动态长度
         *  } else{
         *      var goodsType:int = staticBytes.readVarint32(); // 物品类型. 54是金子, 51是银两
         *      var amount:int = staticBytes.readVarint32(); // 卖家出的金子或银两数
         *  }
         *
         * }
         *
         */
        public static const S2C_DISPLAY_BROADCAST : String = "17_28";

    }
}