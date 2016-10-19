package app.cmd {

    public class MailModuleMessages {

        /**
         * 收到新邮件，附带以下内容 while(byteArray.availiable){ varint32 mailId 邮件ID varint32
         * MailProto数据的长度 bytes MailProto数据
         *
         *     if(!byteArray.availiable){
         *          邮件没有被读
         *          break;
         *     } else {
         *          varint32 MailCollectProto数据的长度
         *          bytes MailCollectProto数据
         *     }
         * }
         */
        public static const S2C_NEW_MAIL : String = "18_1";

        /**
         * 设置邮件被读了
         *
         * varint32 邮件id
         */
        public static const C2S_SET_MAIL_READED : String = "18_2";

        /**
         * 设置邮件被读失败，返回varint32错误码
         *
         * 1. 邮件没找到 2. 邮件已经被设置为被读
         */
        public static const S2C_SET_MAIL_READED_FAIL : String = "18_3";

        /**
         * 设置邮件读取成功
         *
         * varint32 邮件id
         *
         * 客户端将该邮件设置为被读，并且将isRead= true;
         */
        public static const S2C_SET_MAIL_READED : String = "18_4";

        /**
         * 请求领取邮件中的货币
         *
         * varint32 邮件id
         *
         * varint32 数值类型
         */
        public static const C2S_COLLECT_MAIL_MONEY : String = "18_5";

        /**
         * 领取邮件奖励失败，返回varint32错误码
         *
         * 1. 邮件没找到
         * 2. 货币已经领取
         * 3. 没有货币可以领取
         * 4. 货币已满，无法领取
         */
        public static const S2C_COLLECT_MAIL_MONEY_FAIL : String = "18_6";

        /**
         * 领取邮件的货币成功
         *
         * varint32 邮件id varint32 货币类型amountType
         * varint32 货币类型amountType
         *
         * 客户端将MailCollectInfo的is_collect_money设置为 is_collect_money |= 1 << N
         * (N为数值类型)
         *
         */
        public static const S2C_COLLECT_MAIL_MONEY : String = "18_7";

        /**
         * 领取邮件中的物品
         *
         * varint32 邮件id varint32 第N个格子上面的物品奖励[N 从零开始]
         */
        public static const C2S_COLLECT_MAIL_GOODS : String = "18_8";

        /**
         * 领取邮件中的物品失败，返回varint32错误码
         *
         * 1. 邮件没找到 2. 物品已经领取 3. 没有物品可以领取 4. 背包已满
         */
        public static const S2C_COLLECT_MAIL_GOODS_FAIL : String = "18_9";

        /**
         * 领取邮件中的物品成功
         *
         * varint32 邮件id varint32 第N个格子上面的物品奖励[N 从零开始]
         *
         * 客户端将MailCollectInfo的collect_goods设置为 collect_goods |= 1 << N
         */
        public static const S2C_COLLECT_MAIL_GOODS : String = "18_10";

        /**
         * 领取邮件中的所有东西
         *
         * varint32 邮件id
         */
        public static const C2S_COLLECT_MAIL : String = "18_11";

        /**
         * 领取邮件中的所有东西失败，返回varint32错误码
         *
         * 1. 邮件没找到
         * 2. 没有东西可以领取
         * 3. 货币已满
         * 4. 背包已满
         */
        public static const S2C_COLLECT_MAIL_FAIL : String = "18_12";

        /**
         * 领取邮件成功
         *
         * varint32 邮件id
         *
         * 客户端将MailCollectInfo的is_collect_money设置为collect_money = 0xFFFFFFFF
         * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
         */
        public static const S2C_COLLECT_MAIL : String = "18_13";

        /**
         * 一键领取所有邮件
         *
         * bool 是否领取后删除
         */
        public static const C2S_COLLECT_ALL_MAIL : String = "18_14";

        /**
         * 一键领取所有邮件失败，可能有部分邮件是领取成功的，
         *
         * 返回varint32错误码(1. 没有邮件可以领取 2. 背包已满 3. 货币已满)
         * 返回 bool 是否领取后删除
         *
         * while(readable()){ varint32 邮件id
         * 客户端将MailCollectInfo的is_collect_money设置为true
         * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
         * 同时该邮件已经被读了 }
         */
        public static const S2C_COLLECT_ALL_MAIL_FAIL : String = "18_15";

        /**
         * 一键领取邮件成功
         *  返回 bool 是否领取后删除
         *
         * while(readable()){ varint32 邮件id
         * 客户端将MailCollectInfo的is_collect_money设置为true
         * 客户端将MailCollectInfo的collect_goods设置为 collect_goods = 0xFFFFFFFF
         * 同时该邮件已经被读了 }
         */
        public static const S2C_COLLECT_ALL_MAIL : String = "18_16";

        /**
         * 删除邮件
         *
         * varint32 要删除的邮件id数量 for(i->要删除的邮件id数量){ varint32 邮件id }
         */
        public static const C2S_DELETE_MAIL : String = "18_17";

        /**
         * 删除邮件失败，返回varint32错误码
         *
         * 1. 起码要删除一封邮件吧 2. 没有删除一封邮件 3. 服务器bug，删除失败
         */
        public static const S2C_DELETE_MAIL_FAIL : String = "18_18";

        /**
         * 删除邮件成功
         *
         * while(readable){ varint32 邮件id }
         */
        public static const S2C_DELETE_MAIL_SUCCESS : String = "18_19";

        /**
         * 发送邮件
         *
         * varint64 目标id
         *
         * utf 邮件标题 utf 邮件内容
         *
         * varint32 发送银两数量
         *
         * while(readable()){ varint32 邮件的第N个格子
         *
         * varint32 物品在背包中的第N个格子
         *
         * varint32 物品id[用于验证]，物品只能是没有过期时间，同时非绑定的物品 }
         */
        public static const C2S_SEND_MAIL : String = "18_20";

        /**
         * 发送失败，返回varint32错误码
         *
         * 1. 目标没找到 2. 邮件标题长度非法 3. 邮件内容长度非法 4. 邮寄银两数量非法 5. 邮寄物品位置非法 6. 银两不够 7.
         * 目标拒绝接收个人邮件 8. 邮件不能够发送给自己
         */
        public static const S2C_SEND_MAIL_FAIL : String = "18_21";

        /**
         * 发送邮件成功
         *
         * varint64 目标id bytes 目标名字
         *
         * 客户端将玩家id，名字添加进最近联系人里面
         */
        public static const S2C_SEND_MAIL : String = "18_22";

        /**
         * 设置是否拒绝接收邮件
         *
         * boolean true拒绝接收/false接收
         */
        public static const C2S_SET_REFUSE_RECEIVE_MAIL : String = "18_23";

        /**
         * 设置是否拒绝接收邮件成功
         *
         * boolean true拒绝接收/false接收
         */
        public static const S2C_SET_REFUSE_RECEIVE_MAIL : String = "18_24";

    }
}