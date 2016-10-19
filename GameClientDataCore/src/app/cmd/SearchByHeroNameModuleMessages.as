package app.cmd {

    public class SearchByHeroNameModuleMessages {

        /**
         * 根据名字模糊搜索玩家. 需要包含离线玩家.
         * 客户端需要限制1秒钟只能搜索1次(包括只搜索在线玩家). 且是从服务器返回了之后开始计时. 不然踢掉
         * 返回错误不算, 可以马上再发
         *
         * 附带
         * varint32 客户端类型
         * boolean true(本国)/false(他国)
         * UTFBytes 名字 (需要已经前后去空, 并且不能为空. 长度限制7个字符(中英文都算一个字符))
         */
        public static const C2S_SEARCH_WITH_OFFLINE : String = "14_1";

        /**
         * 同上, 不包含离线玩家
         */
        public static const C2S_SEARCH_WITHOUT_OFFLINE : String = "14_2";

        /**
         * 根据英雄名字查询英雄ID
         * varint32 客户端类型
         * UTFBytes 名字 (需要已经前后去空, 并且不能为空. 长度限制7个字符(中英文都算一个字符))
         *
         * 这个消息客户端发送消息后上锁，等待服务器返回，
         * 此消息允许的请求频率是一秒一次，客户端需要严格限制，否则会被T下线
         */
        public static const C2S_SEARCH_HERO_ID_BY_NAME : String = "14_3";

        /**
         * 搜索失败. 不管是只搜离线或者只搜在线, 如果错误, 都是返回这条消息, 附带varint32 错误码
         *
         * 1. 发来的字符不符合条件 (空或者大于7个字符)
         * 2. 频率过快 (仅测试用, 返回个错误码. 正式的时候过快就踢掉)
         * 3. 服务器内部错误. 不要主动重试, 就提示玩家, 让玩家过会手动再重试. 出这个错时, 也需要等待1秒才能再请求
         */
        public static const S2C_SEARCH_ERROR : String = "14_1";

        /**
         * 返回搜索结果. 不管是只搜离线或者只搜在线, 都是返回这条消息
         *
         * 读取方法
         *
         * varint32 客户端类型
         *
         * bool 是否还有更多没返回 (如果是false, 表示所有名字中带这个字符的都在这条消息里了)
         *
         * while(byteArray.available){
         *  varint64 id
         *  UTF 名字
         *
         *  var levelAndOnline:int = byteArray.readVarint32();
         *
         *  var isOnline:Boolean = (levelAndOnline & 0x1) == 1; // 是否在线
         *  var level:int = levelAndOnline >>> 1; // 等级     *
         *
         *  varint32 玩家所属国家
         * }
         */
        public static const S2C_SEARCH_SUCCESS : String = "14_2";

        /**
         * 根据英雄名字查询英雄ID成功，附带byte错误码
         * 1. 发来的字符不符合条件 (空或者大于7个字符)
         * 2. 频率过快 (仅测试用, 返回个错误码. 正式的时候过快就踢掉)
         * 3. 服务器内部错误. 不要主动重试, 就提示玩家, 让玩家过会手动再重试. 出这个错时, 也需要等待1秒才能再请求
         */
        public static const S2C_SEARCH_HERO_ID_BY_NAME_FAIL : String = "14_3";

        /**
         * 根据英雄名字查询英雄ID成功
         *
         * varint32 客户端类型
         * 后面没有数据可以读，书名搜不到
         * while(byteArray.available){
         *      varint64 英雄ID，0表示英雄不存在
         *      varint32 国家ID (英雄ID=0时表示不存在就不发此数据)
         * }
         */
        public static const S2C_SEARCH_HERO_ID_BY_NAME : String = "14_4";

    }
}