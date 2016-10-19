package app.cmd {

    public class TransferModuleMessages {

        /**
         * 使用改名卡，改名，附带
         * UTF 新名字
         * UpgradeProto 改名物品的扣费
         */
        public static const C2S_CHANGE_NAME : String = "42_0";

        /**
         * 改名失败，附带varint32错误码
         *
         * 1. 物品不够
         * 2. 名字长度不合法
         * 3. 名字里有非法字符
         * 4. 这名字在目标服务器已经存在
         * 5. 没进入场景
         * 6. 内部错误, 稍后再试
         * 7. 冷却中，别逗了
         * 8. 在远程服务器[暂时不支持]
         * 9. 还没连服
         */
        public static const S2C_CHANGE_NAME_FAIL : String = "42_1";

        /**
         * 名字改变广播
         * varint64 英雄id
         * UTF 英雄原来名字
         * bytes 英雄新名字
         *
         * 收到这个消息，要将所有的这个英雄的名字改成新的名字，但是考虑这个可能很难改全，
         * 所以客户端先将下面的这些处理了，其他的等测试发现之后再改
         * 1、好友列表
         * 2、王城/皇城面板信息
         * 3、家族面板
         * 4、组队面板
         * 5、场景中的角色
         */
        public static const S2C_CHANGE_NAME_BROADCAST : String = "42_2";

        /**
         * 使用移民卡，移民，附带
         * varint32 新的国家id[0-2]
         * UpgradeProto 移民物品的扣费
         */
        public static const C2S_CHANGE_COUNTRY : String = "42_10";

        /**
         * 移民失败，附带varint32错误码
         *
         * 1. 国家非法
         * 2. 物品不够
         * 3. 内部错误, 稍后再试
         * 4. 没在普通场景
         * 5. 有家族
         * 6. 目标国家等级太高
         * 7. 王城官员
         * 11. 还没连服
         * 12. 国家系统没有开启
         * 13. 7天内无法移民
         * 14. 移民时有镖车
         */
        public static const S2C_CHANGE_COUNTRY_FAIL : String = "42_11";

        /**
         * 国家改变广播
         * varint64 英雄id
         * varint32 英雄原来的国家id
         * varint32 英雄新的的国家id
         * bytes 英雄的名字
         *
         * 收到这个消息，要将所有的这个英雄的国家改成新的国家，但是考虑这个可能很难改全，
         * 所以客户端先将下面的这些处理了，其他的等测试发现之后再改
         * 1、好友列表[清空自己的好友列表]
         * 2、场景中的角色
         */
        public static const S2C_CHANGE_COUNTRY_BROADCAST : String = "42_12";

    }
}