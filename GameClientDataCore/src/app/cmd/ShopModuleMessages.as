package app.cmd {

    public class ShopModuleMessages {

        /**
         * 打开Npc商店发送C2S_OPEN_NPC_SHOP，附带以下信息
         * varint32 shopId
         */
        public static const C2S_OPEN_NPC_SHOP : String = "7_0";

        /**
         * 购买商店物品，发送C2S_BUY_SHOP_GOODS消息，附带以下信息
         * varint32 shopId (从ShopProto中读取)
         * varint32 tabIndex (从ShopProto中读取)
         * varint32 goodsIndex 从0开始
         * varint32 count
         * varint64 npcId(如果是npc商店需要把npcId传过来验证，否则不用传这个值)
         */
        public static const C2S_BUY_SHOP_GOODS : String = "7_3";

        /**
         * 回购物品，附带以下信息
         * varint32 buyBackPos 回购位置 从0开始
         * varint32 物品回购到背包中哪个空位
         */
        public static const C2S_BUY_BACK_GOODS : String = "7_6";

        /**
         * 卖出物品发送C2S_SELL_GOODS，附带以下信息
         * byte 卖出物品的位置(背包中)
         */
        public static const C2S_SELL_GOODS : String = "7_9";

        /**
         * 购买商店物品，发送C2S_BUY_JINZI_SHOP_GOODS消息，附带以下信息
         * byte 消费类型 0-银两 1-绑金  2-金子
         * varint32 goodsId
         * varint32 count
         */
        public static const C2S_BUY_JINZI_SHOP_GOODS : String = "7_12";

        /**
         * 装备修理
         * varint32  容器类型
         * varint32 装备位置
         * varint32 装备id，防止错误
         * bool 使用银两替代绑银
         */
        public static const C2S_REPAIR_GOODS : String = "7_15";

        /**
         * 装备修理all所有
         *
         * bool 使用银两替代绑银
         */
        public static const C2S_REPAIR_GOODS_ALL : String = "7_17";

        /**
         * 成功，附带卖出物品位置
         * bytes ShopProto（已压缩），具体参考ShopProto说明
         */
        public static const S2C_OPEN_NPC_SHOP : String = "7_1";

        /**
         * 购买商店成功，附带以下信息
         * UTF8 物品名称
         * varint32 品质
         * varint32 个数
         * byte 消费类型 AmountType
         * varint32 消费金额
         * varint32 goodsIndex 物品在商店中的位置
         * while(byteArray.avaliable){
         *     varint32 背包格子位置
         * }
         */
        public static const S2C_BUY_SHOP_GOODS : String = "7_4";

        /**
         * 回购物品
         *
         * 成功，附带以下信息
         * varint32 buyBackPos 回购位置 从0开始
         * varint32 物品回购到背包中哪个空位
         */
        public static const S2C_BUY_BACK_GOODS : String = "7_7";

        /**
         * 出售物品成功
         *
         * varint32 卖出物品的位置(背包中)
         * varint64 卖出的物品在多久以后在回购列表中消失
         */
        public static const S2C_SELL_GOODS : String = "7_10";

        /**
         * 成功返回S2C_BUY_SHOP_GOODS消息，附带以下信息
         * UTF8 物品名称
         * varint32 物品品质
         * varint32 个数
         * byte 消费类型 0-银两 1-绑金  2-金子
         * varint32 消费金额
         */
        public static const S2C_BUY_JINZI_SHOP_GOODS : String = "7_13";

        /**
         * 修理成功
         * varint32 容器类型
         * varint32 装备位置
         * bool 使用银两替代绑银
         */
        public static const S2C_REPAIR_GOODS_SUCCESS : String = "7_16";

        /**
         * all修理成功所有
         * bool 使用银两替代绑银
         * while(byteArray.avaliable){//如果没有可以读的字节  说明一个装备都没修理成功
         *     varint32 装备位置  --success
         * }
         */
        public static const S2C_REPAIR_GOODS_ALL_SUCCESS : String = "7_18";

        /**
         * 失败，附带byte错误码
         * 有以下几种失败情况，
         * 1、客户端发送的位置无效
         * 2、钱不够（银两，绑金，金子）
         * 3、耐久度满了不能修理
         * 4.容器非法
         * 5.要修理的不是装备
         * 6.修理的装备过期
         * 7、物品ID无效，该物品没找到
         * 8、客户端发送的购买数量无效
         * 9、商品已过期
         * 10、背包空间不足
         * 11 客户端发送的目标位置上面的物品不存在
         * 12、物品不能出售
         * 13 位置已经被锁定
         * 14、银两已满，英雄最大可以携带20亿银两
         * 15 客户端发送的背包位置已经有物品存在
         * 16、客户端发送的shop id无效
         * 17、客户端发送的tab index或者goods index无效
         * 18、客户端发送的购买数量无效
         * 19  距离NPC太远
         * 20  没有可以修理的装备（一键修理）
         */
        public static const S2C_COMMON_ERROR_CODE : String = "7_100";

    }
}