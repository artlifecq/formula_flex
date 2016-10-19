package app.cmd {

    public class DiscountModuleMessages {

        /**
         * 英雄登陆时，如果当前有折扣店，则服务器会主动发送这条消息，如果当前没有收到这个消息，不要显示折扣店
         *
         * 当收到这条消息时，如果当前有折扣店数据，则用消息中的数据更新折扣店（已购买个数重置为0，等待物品个数更新消息来更新）
         *
         * 消息中附带DiscountStoreProto数据
         *
         * 特别的，如果收到这个消息没有附带内容，此时客户端关闭折扣店
         *
         * 就算倒计时到了，也不要关闭折扣店，等服务器消息再关闭
         *
         * bytes DiscountStoreProto
         */
        public static const S2C_DISCOUNT_STORE_INFO : String = "93_1";

        /**
         * 折扣店物品个数改变，当收到这条消息时，更新折扣店物品的购买个数
         * while(byteArray.available)
         *     varint32 index，从0开始
         *     varint32 已经购买的个数
         */
        public static const S2C_DISCOUNT_STORE_PUSH_COUNT : String = "93_2";

        /**
         * 折扣店物品个数改变，当收到这条消息时，更新折扣店物品的数据
         * varint32 index，从0开始
         * varint32 已经购买的个数
         */
        public static const S2C_DISCOUNT_STORE_COUNT_CHANGED : String = "93_3";

        /**
         * 购买折扣店物品
         * varint32 index
         * varint32 count
         */
        public static const C2S_DISCOUNT_STORE_BUY : String = "93_4";

        /**
         * 购买折扣店物品成功
         * varint32 index
         * varint32 count
         */
        public static const S2C_DISCOUNT_STORE_BUY : String = "93_5";

        /**
         * 购买折扣店物品失败，附带byte错误码
         * 1、折扣店未开放
         * 2、index无效或者count无效
         * 3、物品已卖完
         * 4、要购买的个数不够（限购30个，你要买40个）
         * 5、金子不足
         * 6、背包已满
         * 7、服务器忙
         */
        public static const S2C_DISCOUNT_STORE_BUY_FAIL : String = "93_6";

    }
}