package app.cmd {

    public class ExamModuleMessages {

        /**
         * 问题更新，广播全服
         *
         * 客户端收到这个消息时，如果英雄可以答题，则发送消息请求最新的题目
         */
        public static const S2C_EXAM_QUESTION_UPDATE : String = "87_0";

        /**
         * 请求最新的题目
         */
        public static const C2S_EXAM_GET_QUESTION : String = "87_1";

        /**
         * 请求最新的题目 bytes ExamQuestionProto
         *
         * 注意，该消息已被压缩，读取之前先解压一下
         */
        public static const S2C_EXAM_GET_QUESTION : String = "87_2";

        /**
         * 请求最新题目失败，附带byte错误码 1、答题还未开始或者已经结束 2、英雄等级不足
         */
        public static const S2C_EXAM_GET_QUESTION_FAIL : String = "87_3";

        /**
         * 回答问题 varint32 answer
         *
         * answerIndex答案索引，从0开始
         */
        public static const C2S_EXAM_ANSWER_QUESTION : String = "87_4";

        /**
         * 回答问题成功 if (byteArray.available) // 后面还有数据，说明回答正确 varint32 英雄积分
         */
        public static const S2C_EXAM_ANSWER_QUESTION : String = "87_5";

        /**
         * 回答问题失败，
         * 附带byte错误码
         * 1、英雄等级不足
         * 2、您已错过本题，请等下道题！
         * 3、这道题已经回答过了
         * 4、答案索引无效（0-3）
         *
         */
        public static const S2C_EXAM_ANSWER_QUESTION_FAIL : String = "87_6";

        /**
         * 去除错误答案/使用双倍积分
         * byte 0-表示去除错误答案 /1-表示使用双倍积分
         */
        public static const C2S_EXAM_USE_GOOD_ANSWER : String = "87_7";

        /**
         * 去除错误答案 / 使用双倍积分 成功
         * varint32 0-表示去除错误答案 /1-表示使用双倍积分
         * 客户端自己将去除错误次数-1 并且在三个错误答案中随机出2个错误答案
         */
        public static const S2C_EXAM_USE_GOOD_ANSWER_SUCCESS : String = "87_8";

        /**
         * 去除错误答案/ 使用双倍积分 失败，
         *
         * 附带varint32错误码
         * 1、英雄等级不足
         * 2、您已错过本题，请等下道题！
         * 3、这道题已经回答过了
         * 4、去除错误答案次数不足
         * 5、你已经使用了该道具
         * 6、双倍积分次数不足
         *
         */
        public static const S2C_EXAM_USE_GOOD_FAIL : String = "87_9";

        /**
         * 打开面板获取英雄自己的答题数据
         */
        public static const C2S_EXAM_SELF_DATA : String = "87_10";

        /**
         * 获取英雄答题数据成功 varint32 答到第几题，0表示一题都没回答
         * varint32 双倍积分使用次数
         * varint32 排错使用次数
         * varint32 从善如流使用次数
         * varint32 答题积分
         * varint32 当前排名
         * varint32 当前总经验
         * varint32 答对的题数目
         */
        public static const S2C_EXAM_SELF_DATA : String = "87_11";

        /**
         * 获取英雄数据失败，
         * 附带byte错误码
         * 1、答题还未开始或者已经结束
         * 2、英雄等级不足
         * 3、已经花钱完成过了
         */
        public static const S2C_EXAM_SELF_DATA_FAIL : String = "87_12";

        /**
         * 答题结束广播
         * if (!byteArray.available)
         * 		// 如果没有数据，则说明没有第1,2,3名 不用提示了，否则有几个提示几个
         * 		return;
         * varint64 heroID
         * UTF 第一名名字
         *
         * if (!byteArray.available)
         * 		return;
         * varint64 heroID
         * UTF 第2名名字
         *
         * if (!byteArray.available)
         * 		return;
         * varint64 heroID
         * UTF 第3名名字
         */
        public static const S2C_EXAM_FINISH_BROADCAST : String = "87_14";

        /**
         *
         *
         * 答题结算面板个人信息
         *  varint32 答对
         *  varint32 答错
         *  varint32得分
         *  varint32排名
         *  varint32 经验
         *
         */
        public static const S2C_EXAM_FINISH_MSG : String = "87_17";

        /**
         * 答题结算面板排行信息 跟S2C_EXAM_GET_QUESTION一样 只是协议号不同
         *
         * bytes ExamQuestionProto
         *
         * 注意，该消息已被压缩，读取之前先解压一下
         */
        public static const S2C_EXAM_FINISH_RANK_MSG : String = "87_18";

        /**
         * 从善如流
         */
        public static const C2S_EXAM_FOLLOW_MSG : String = "87_19";

        /**
         * 从善如流成功 varint32 答案
         *
         */
        public static const S2C_EXAM_FOLLOW_MSG : String = "87_20";

        /**
         * 从善如流失败，附带byte错误码
         * 1、英雄等级不足
         * 2、您已错过本题，请等下道题！
         * 3、这道题已经回答过了
         * 4、从善如流次数不足
         * 5、你已经使用了从善如流
         */
        public static const S2C_EXAM_FOLLOW_FAIL : String = "87_21";

        /**
         * 更新排名  varint32
         *
         */
        public static const S2C_UPDATE_RANK : String = "87_22";

    }
}