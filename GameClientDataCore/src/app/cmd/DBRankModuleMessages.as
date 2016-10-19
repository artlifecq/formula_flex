package app.cmd {

    public class DBRankModuleMessages {

        /**
         * 请求排行榜
         * varint32 rankNum 榜单类型和页数，看下面的说明
         *
         * 字段说明
         * rank 文档最前面的排行榜类型
         * varint32 页数，从1开始
         * num 页数，从1开始
         *
         * rankNum = rank | (num << 4);
         * rank = rankNum & 15;
         * num = rankNum >>> 4;
         */
        public static const C2S_RANK_GET_RANK : String = "84_0";

        /**
         * 同上, 请求联服的
         *
         * 返回和上面的同样的
         */
        public static const C2S_GET_UNION_RANK : String = "84_100";

        /**
         * 请求排行榜数据成功
         * varint32 rankNum 榜单类型和页数，C2S消息中有说明
         * varint32 总页数，总页数为0，表示这个排行榜还没有数据
         * while(byteArray.available) // 将循环里面的内容写成一个方法，后面还会用到
         *
         * 通用内容
         *
         *      varint64 英雄ID
         *      varUTF 英雄名称
         *      varUTF 家族名称
         *      varint32 raceAdmired
         *      varint32 国家
         *      varint32 vip等级
         *
         * race = raceAdmired & 7; // 职业
         * admired = raceAdmired >>> 3; // 被崇拜次数
         *
         *  具体排行榜不同部分
         *
         *     // 等级榜读取下面的字段
         *     varint32 等级
         *     varint64 英雄形象换装
         *
         *     // 战斗力榜读取下面的字段
         *     varint64 战斗力
         *     varint64 英雄形象换装
         *
         *     // 崇拜榜读取下面的字段
         *     varint64 英雄形象换装
         *
         * 如果消息中一个英雄数据都没有读到，说明榜单上还没有英雄上榜
         */
        public static const S2C_RANK_GET_RANK : String = "84_1";

        /**
         * 请求英雄自己的等级排行榜失败，附带byte错误码
         * 1、无效的排行榜类型
         * 2、页数无效（页数<1或者大于最大页数）
         * 3、内部错误
         */
        public static const S2C_RANK_GET_RANK_FAIL : String = "84_2";

        /**
         * 请求英雄自己的排位
         * varint32 排行榜类型 0-等级排行榜 1-战斗力排行榜
         */
        public static const C2S_RANK_SELF_POS : String = "84_3";

        /**
         * 联服下
         */
        public static const C2S_RANK_UNION_SELF_POS : String = "84_103";

        /**
         * 请求英雄自己的排位成功
         * varint32 rankPos 排行榜类型，位置复合字段，后面有说明
         *
         * 等级排行榜，这个数据是 等级
         *      varint32 排行信息，
         * 战斗力排行榜，这个数据是 战斗力
         *      varint64 排行信息，
         *
         * 排行榜类型 具体参考文档最前面的排行榜类型
         * (神兵排行榜另外有消息支持，这里不支持神兵排行榜)
         * rank = rankPos & 15;
         * pos = rankPos >>> 4;
         *
         */
        public static const S2C_RANK_SELF_POS : String = "84_4";

        /**
         * 请求英雄自己的排位失败，附带byte错误码
         * 1、无效的排行榜类型
         * 2、发送的排行榜类型是神兵排行榜
         */
        public static const S2C_RANK_SELF_POS_FAIL : String = "84_5";

        /**
         * 请求我的排名列表
         *
         * 先等知道自己的排名
         *
         * 如果自己的排名在前10名, 不要请求. 没必要
         * 如果自己没上榜, 不要请求, 没必要
         *
         * varint32 排行榜类型 0-等级排行榜 1-战斗力排行榜
         */
        public static const C2S_RANK_MY_RANK_LIST : String = "84_6";

        /**
         * 联服下
         */
        public static const C2S_RANK_UNION_MY_RANK_LIST : String = "84_106";

        /**
         * 请求我的排名列表成功
         * varint32 rankIndex 排行榜类型和名次复合字段;
         * while(byteArray.available)
         *     读取英雄 // 可以用上你之前写的公共方法了
         *
         * 字段说明：
         * rank 排行榜类型 具体参考文档最前面的排行榜类型
         * rank = rankIndex & 15;
         * startIndex = rankIndex >>> 4; // 启始名次
         *
         * 启始名次为0(startIndex == 0)表示英雄不在排名上，不要再读后面的英雄数据了
         * 循环读取榜单英雄，第一个英雄的排名就是启始名次，后面的英雄名次+1
         */
        public static const S2C_RANK_MY_RANK_LIST : String = "84_7";

        /**
         * 请求我的排名列表失败，附带byte错误码
         * 1、无效的排行榜类型
         * 2、内部错误
         * 3、发送的排行榜类型不对
         */
        public static const S2C_RANK_MY_RANK_LIST_FAIL : String = "84_8";

        /**
         * 搜索排行榜
         * varint32 rankIdx
         * varint32 len名字长度
         * bytes 名字
         *
         * 字段说明:
         * rank 排行榜类型 具体参考文档最前面的排行榜类型
         * idx 服务器返回的索引，第一次发送0，如果点击下一页，则返回本页搜索的(最后一名的排名+1)
         *
         * rankIdx = rank | (idx << 4);
         * rank = rankIdx & 15;
         * idx = rankIdx >>> 4;
         */
        public static const C2S_RANK_SEARCH : String = "84_9";

        /**
         * 联服下
         */
        public static const C2S_RANK_UNION_SEARCH : String = "84_109";

        /**
         * 搜索排行榜成功
         * varint32 排行榜类型 具体参考文档最前面的排行榜类型
         * while(byteArray.available)
         *     varint32 排名
         *     读取英雄 // 再次用上你之前写的公共方法了
         *
         * 如果英雄列表的个数不足一页，则此时将下一页的按钮置灰
         *
         * 如果英雄列表一个数据都没有读取到，则做如下处理
         *     如果查询第一页，则显示搜索的记录不存在
         *     如果是查询下一页，则此时将下一页按钮置灰，提示“当前已经是最后一页”，不要执行翻页（保留当前的列表）
         */
        public static const S2C_RANK_SEARCH : String = "84_10";

        /**
         * 搜索排行榜失败，附带byte错误码
         * 1、无效的排行榜类型
         * 2、搜索内容长度不对，不能超过14个字符
         * 3、搜索时间间隔太短（每次倒计时3秒(看配置)）
         * 4、内部错误
         */
        public static const S2C_RANK_SEARCH_FAIL : String = "84_11";

        /**
         * 崇拜英雄
         * varint64 英雄ID
         *
         * 客户端发送这个消息后，必须等到服务器返回之后才能发送下一个崇拜英雄消息
         *
         * 客户端发送崇拜消息后，记录下这个英雄的ID，收到回复消息时需要用到
         */
        public static const C2S_RANK_ADMIRE : String = "84_16";

        /**
         * 崇拜英雄成功
         * varint64 英雄ID
         *
         * 崇拜英雄成功后，将目标英雄加入到已崇拜列表，更新目标英雄的被崇拜次数
         *
         * 如果英雄已使用的崇拜次数已达最大个数，不要再发送崇拜英雄消息，直到收到每日重置消息
         */
        public static const S2C_RANK_ADMIRE : String = "84_17";

        /**
         * 崇拜英雄失败，附带Byte错误码
         * 1、崇拜的英雄不在排行榜中
         * 2、今日已经崇拜过这个英雄了（将英雄加入已崇拜列表）
         * 3、英雄崇拜次数已用完（在本次登陆中不要再发送崇拜英雄消息，直到收到每日重置消息）
         * 4. 内部错误
         */
        public static const S2C_RANK_ADMIRE_FAIL : String = "84_18";

        /**
         * 获取英雄自己的被崇拜次数
         *
         * 此消息客户端缓存10秒钟，上一次讯问过后，需要等到10秒过后才能问下一次
         *
         * 服务器不返回就不能再发
         */
        public static const C2S_RANK_SELF_ADMIRED_TIMES : String = "84_19";

        /**
         * 获取英雄自己的被崇拜次数
         * varint32 被崇拜次数
         *
         * 此消息客户端缓存10秒钟
         */
        public static const S2C_RANK_SELF_ADMIRED_TIMES : String = "84_20";

        /**
         * 请求英雄详细信息,失败。附带错误码：
         * 1.英雄不存在
         * 2.服务器内部错误
         */
        public static const S2C_RANK_HERO_INFO_FAIL : String = "84_23";

    }
}