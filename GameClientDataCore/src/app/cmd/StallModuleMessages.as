package app.cmd {

    public class StallModuleMessages {

        /**
         * 摆摊模块通用错误码,返回varint32错误码
         *
         * 1.没有摊位
         * 2.有摊位了
         * 3.银两不够
         * 4.物品不够
         * 5.银两已满
         * 6.背包已满
         * 7.距离过远
         * 8.物品出售单价非法
         * 9.物品位置非法
         * 10.物品出售数量非法
         * 11.操作过于频繁
         * 12.只有在本国或者中立区才可以摆摊
         * 13.当前状态无法执行该操作
         * 14.未知的摊位
         * 15.该摊位其他人已经占据了
         * 16.非法的摊位类型
         * 17.该摊位类型时间不够
         * 18.当前摊位类型无法购买这么多种类的物品
         * 19.当前摊位类型无法出售这么多种类的物品
         * 20.摊位起码要出售一件物品
         * 21.该物品不可以呗收购
         * 22.要收购的物品数量非法
         * 23.物品收购价格非法
         * 24.无法切换到该摊位类型
         * 25.该摊位类型不需要购买
         * 26.非法的购买时长
         * 27.名字没有变化
         * 28.当前摊位无法设置广告
         * 29.要购买的产品位置非法
         * 30.要购买的产品下架了
         * 31.产品信息已经变更
         * 32.要购买的产品卖光了
         * 33.你一次购买的产品太多了,无法购买
         * 34.产品信息单价变更
         * 35.出售的产品位置非法
         * 36.要收购的产品下架了
         * 37.收购的产品变更了
         * 38.收购的产品价格变更了
         * 39.出售的物品位置非法
         * 40.出售的物品在背包中的数量不够
         * 41.摊位不需要收购这么多产品
         * 42.要操作出售物品位置非法
         * 43.操作出售物品的类型非法
         * 44.操作的出售物品已经下架
         * 45.操作的出售物品已经卖光了
         * 46.新的出售价格非法
         * 47.要减少的数量非法
         * 48.没有银两可以领取
         * 49.操作位置有产品无法上架新产品
         *
         * 50.要操作收购物品位置非法
         * 51.操作收购物品的类型非法
         * 52.操作的收购物品已经下架
         * 53.新的收购价格非法
         * 54.要变更的数量非法
         * 55.没有物品可以领取
         * 56.操作位置有产品无法上架新产品
         *
         * 100.服务器bug
         */
        public static const S2C_STALL_FAIL : String = "43_0";

        /**
         * 请求摆摊,两次摆摊请求之间相隔10S
         *
         * varint32 摊位id
         * varint32 摊位类型
         * utf 摊位名字
         *
         * varint32 收购物品数量
         * varint32 出售物品数量
         *
         * for(i->收购物品数量){
         *      varint32 收购物品的id
         *      varint32 收购物品的数量
         *      varint32 收购物品的单价(银两)
         * }
         *
         *
         * for(i->出售物品数量){
         *      varint32 出售物品在背包中得位置
         *      varint32 出售物品的数量
         *      varint32 出售物品的id,防止出错
         *      varint32 出售物品的单价(银两)
         * }
         */
        public static const C2S_STALL : String = "43_1";

        /**
         * 摆摊成功,只是一个提示性的,如果客户端需要可以用来提示,已经压缩
         *
         * 解压缩
         *
         * bytes StallDetailProto
         */
        public static const S2C_STALL : String = "43_2";

        /**
         * 摆摊广播 标记该玩家的状态为摆摊中
         *
         * varint64 玩家id
         * varint32 摊位id
         * varint32 摊位类型
         * bytes 摊位名字
         */
        public static const S2C_STALL_BROADCAST : String = "43_3";

        /**
         * 请求撤摊
         */
        public static const C2S_CANCEL_STALL : String = "43_5";

        /**
         * 撤销成功,如果客户端有需要,可以加个提示
         */
        public static const S2C_CANCEL_STALL : String = "43_6";

        /**
         * 撤摊广播
         *
         * varint64 撤摊的玩家id,标记该玩家的状态为没有摆摊中
         */
        public static const S2C_CANCEL_STALL_BROADCAST : String = "43_7";

        /**
         * 请求修改我要出售的物品,本次操作在收到返回之前,都清锁定
         *
         * varint32 出售物品的槽位
         *
         * varint32 ChangeToSellGoodsType
         *
         * if(下架){
         *      // 什么都不带
         * } else if(修改价格或者修改出售数量) {
         *      varint32 新的价格
         *      bool 增加物品,只改价格就发送减少物品,减少物品的数量为0
         *      if(增加物品的数量){
         *          varint32 新的出售物品在背包中的位置
         *          varint32 新的出售物品的数量,如果必须跟原来出售的物品是可以叠加的,不可以超出叠加上限
         *          varint32 新的出售物品的id,防止出错
         *      } else {
         *          varint32 减少的数量,减少的物品会加回背包,新的数量不能够为0
         *      }
         * } else if(上架新产品){
         *      varint32 出售物品在背包中的位置
         *      varint32 出售物品的数量
         *      varint32 出售物品的id,防止出错
         *      varint32 出售物品的单价(银两)
         * } else {
         *     错误类型,直接断线
         * }
         */
        public static const C2S_CHANGE_TO_SELL_GOODS : String = "43_10";

        /**
         * 要出售的物品变更了
         *
         * varint32 修改类型ChangeToSellGoodsType,用于提示
         * varint32 出售物品的槽位
         *
         * if(修改类型不是下架){
         *      bytes StallSellGoodsProto
         * }
         */
        public static const S2C_CHANGE_TO_SELL_GOODS : String = "43_11";

        /**
         * 修改我要出售的物品失败解锁
         */
        public static const S2C_CHANGE_TO_SELL_GOODS_UNLOCK : String = "43_12";

        /**
         * 修改收购物品,上锁
         *
         * varint32 收购物品的槽位
         *
         * varint32 收购物品的类型 ChangeToBuyGoodsType
         *
         * if(下架){
         *      // 啥都不带
         * } else if(修改收购价格或者修改收购数量){
         *      varint32 新的价格
         *      varint32 新的收购数量,这个收购数量只能最大变成物品叠加上限
         *      varint32 收购物品的id
         * } else if(收购新的产品){
         *      varint32 收购物品的id
         *      varint32 收购物品的数量
         *      varint32 收购物品的单价(银两)
         * } else {
         *      错误的修改收购类型
         * }
         */
        public static const C2S_CHANGE_TO_BUY_GOODS : String = "43_15";

        /**
         * 修改收购物品成功
         *
         * varint32 收购物品的类型 ChangeToBuyGoodsType
         * varint32 收购物品的槽位
         *
         * if(收购类型不是不收购了){
         *      bytes StallBuyGoodsProto
         * }
         */
        public static const S2C_CHANGE_TO_BUY_GOODS : String = "43_16";

        /**
         * 修改我要收购的物品失败解锁
         */
        public static const S2C_CHANGE_TO_BUY_GOODS_UNLOCK : String = "43_17";

        /**
         * 修改摊位类型,不可以修改成出售或者寄售的物品数量减少的摊位类型
         *
         * 消息S2C_STALL_BROADCAST返回修改成功
         *
         * varint32 新的摊位类型(发送摊位类型id)
         */
        public static const C2S_CHANGE_STALL_TYPE : String = "43_20";

        /**
         * 购买摊位时长
         *
         * varint32 摊位类型(发送摊位类型id)
         * varint32 购买摊位时长,单位小时
         */
        public static const C2S_BUY_STALL_TYPE : String = "43_25";

        /**
         * 摊位剩余时间变化了
         *
         * varint32 摊位类型
         * varint64 剩余摊位时长,如果当前在摆摊,这个摊位时长,是包括你从购买到现在总共的时长
         *          那么还剩余多久,要减去摊位开始摆摊到现在摆摊的时长,这个需要特殊注意
         */
        public static const S2C_STALL_TYPE_LEFT_TIME_CHANGED : String = "43_26";

        /**
         * 修改摊位的名字，修改成功通过 S2C_STALL_BROADCAST 修改,该操作写死3秒钟才可以操作一次
         *
         * bytes 摊位的名字
         */
        public static const C2S_CHANGE_STALL_NAME : String = "43_30";

        /**
         * 发广告，没有返回
         *
         * bool 开启(true)/关闭(false)
         *
         * if(开启){
         *      bytes 广告内容
         * }
         *
         */
        public static const C2S_SET_AD : String = "43_35";

        /**
         * 设置广告成功
         *
         * bool 开启(true)/关闭(false)
         *
         * if(成功){
         *      客户端自己把当前时间加上广告cd
         * }
         */
        public static const S2C_SET_AD : String = "43_36";

        /**
         * 广告广播
         *
         * bytes 广告内容
         */
        public static const S2C_AD_BROADCAST : String = "43_37";

        /**
         * 请求店铺的详细信息,每次重新请求都会有返回,如果玩家当前打开了该店铺面板,可以每3S来请求一次,防止有数据变动
         *      如果玩家确切的指导了该商铺的物品变更了,可以无视cd,直接来请求,比如服务器提示你卖出去了一个,或者收购到了一个
         *
         *      如果玩家视野里面没有这个摊位或者这个摊位上面没有人,清空掉所有这个摊位的详细信息
         *      如果玩家视野里面有这个这个玩家以及这个摊位,如果玩家当前有缓存,拿缓存的数据
         *
         * varint32 摊位id
         * varint32 上次该摊位数据的版本号,默认为0
         */
        public static const C2S_GET_STALL_DETAIL : String = "43_50";

        /**
         * 返回店铺的详细信息,如果客户端视野里面有这个玩家以及这个摊位,缓存
         *
         * if(buffer.readable()){
         *      解压缩
         *      bytes StallDetailProto
         * } else {
         *      直接用旧的数据进行展示
         * }
         */
        public static const S2C_GET_STALL_DETAIL : String = "43_51";

        /**
         * 获取摊位详情，解锁消息
         */
        public static const S2C_GET_STALL_DETAIL_UNLOCK : String = "43_52";

        /**
         * 购买摊位里面的东西
         *
         * varint32 摊位id
         * varint32 摊位出售物品的槽位
         * varint32 摊位出售物品的槽位的flag,看proto
         *
         * varint32 购买数量
         * varint32 购买的物品id,防止这一瞬间卖家改了出售的物品
         * varint32 购买的物品的单价,防止这一瞬间卖家改了出售价格
         */
        public static const C2S_BUY_STALL_GOODS : String = "43_55";

        /**
         * 购买成功,收到物品会是其他消息推送,收到该消息以后,可以立刻来请求详细信息
         *
         * varint32 摊位id
         * varint32 获得物品数量
         */
        public static const S2C_BUY_STALL_GOODS : String = "43_56";

        /**
         * 告诉商家,你卖出了产品了
         *
         * varint32 出售的物品的槽位
         * varint32 出售的物品id
         * varint32 出售物品数量
         * varint32 出售单价,客户端自己算出这个位置是下架了或者剩余物品数量
         */
        public static const S2C_STALL_OWNER_SELL_SUCCESS : String = "43_57";

        /**
         * 出售物品给收购摊位
         *
         * varint32 摊位id
         * varint32 摊位收购物品的槽位
         * varint32 摊位收购物品的槽位的flag,看proto
         *
         * varint32 出售的物品id,防止这一瞬间卖家改了物品
         * varint32 出售的物品的单价,防止这一瞬间卖家改了价格
         *
         * varint32 出售的物品的位置的数量
         *
         * for(i->出售的物品的位置的数量){
         *      varint32 物品在背包中的位置(不可以重复)
         *      varint32 出售的数量
         * }
         */
        public static const C2S_SELL_GOODS_TO_STALL : String = "43_60";

        /**
         * 出售物品给收购摊位成功,背包中增加银两通过其他消息来广播
         *
         * varint32 摊位id
         * varint32 获得的银两,用于提示
         */
        public static const S2C_SELL_GOODS_TO_STALL : String = "43_61";

        /**
         * 告诉商家,你收购了产品了
         *
         * varint32 收购产品的槽位
         * varint32 收购的物品id
         * varint32 收购的物品数量,客户端自己算出有多少个物品要自己去领取,还剩余多少的收购物品数量
         * varint32 出售价格
         */
        public static const S2C_STALL_OWNER_BUY_SUCCESS : String = "43_62";

    }
}