package app.cmd {

    public class MiscModuleMessages {

        /**
         * 请求服务器当前时间. 后面没有参数
         */
        public static const C2S_GET_SERVER_TIME : String = "2_0";

        /**
         * 返回服务器当前时间. 后面跟一个long的当前时间. (注意不是varint64)
         */
        public static const S2C_REPLY_SERVER_TIME : String = "2_2";

        /**
         * 设置客户端的数据
         *
         * varint32 标识
         * bytes 数据
         */
        public static const C2S_SET_CLIENT_CONFIGS : String = "2_4";

        /**
         * 即将断开你的连接, 后面附带varint32的原因. 这条消息不一定每次都发出来.
         *
         * 1. 服务器即将重启
         * 2. 你干了坏事
         * 3. 被顶号
         * 4. 未登录发送了之后的消息, 或者登录了又发送了登录消息
         * 5. 聊天信息发送无效数据次数太多
         * 6. 理由不好细说, 反正你重新登录
         */
        public static const S2C_DISCONNECT_REASON : String = "2_3";

        public static const C2S_GET_CONFIG2 : String = "2_10";

        public static const S2C_REPLY_CONFIG2_VERSION_SAME : String = "2_11";

        public static const S2C_REPLY_CONFIG2 : String = "2_12";

        public static const C2S_GET_CONFIG3 : String = "2_13";

        public static const S2C_REPLY_CONFIG3 : String = "2_14";

        /**
         * 附带客户端读取到的配置版本号，varint64
         */
        public static const C2S_REPLY_CONFIG4 : String = "2_17";

        /**
         * 如果客户端配置版本号不一致，返回这条消息，附带下面信息（此消息已压缩，读取时先解压）
         * 解压之前
         * bool true表示最后一条消息，如果读到false，则缓存起来，等待下一条消息过来
         * bytes 数据
         *
         * 接收到所有内容后（不要解压）：
         * varint64 最新配置
         * varint32 config配置的长度
         * bytes Config配置（读取到这个数据，解压）
         * varint32 ServiceConfig配置的长度
         * bytes ServiceConfig
         */
        public static const S2C_REPLY_CONFIG4 : String = "2_18";

        /**
         * 如果配置版本号一致，返回此消息，附带以下信息
         * bytes ServiceConfig
         */
        public static const S2C_REPLY_CONFIG4_VERSION_SAME : String = "2_19";

        /**
         * ping. 客户端记录发送这条消息的时间. 必须在已经登录后且创建完英雄才能发送
         *
         * 服务器返回前不能再请求. 不然结果不对
         *
         * 没有附带消息
         */
        public static const C2S_PING : String = "2_15";

        /**
         * pong. 客户端收到这条消息的时间 - 发送请求的时间 = ping
         *
         * 没有附带消息
         */
        public static const S2C_PONG : String = "2_16";

        /**
         * 客户端定时发送心跳. 第一次进入场景之后10秒后开始发送 (客户端第一次发送加载完成消息后的10秒后发送第一次)
         *
         * 每10秒发送一次 (开始发送之后, 不管风吹雨打都要发. 每10秒一次, 不多不少). 服务器判断外挂用
         *
         * 附带
         *
         * varint64 客户端的flash已运行时间 (毫秒)
         */
        public static const C2S_HEART_BEAT : String = "2_20";

        /**
         * 将内容滚动播放
         * bytes 内容
         */
        public static const S2C_BROADCAST : String = "2_21";

        /**
         * 客户端报错了, 把报错的内容和客户端环境信息发送上来
         *
         * 确保消息长度不能大于1000个字节
         *
         * 附带
         *
         * bytes 内容
         */
        public static const C2S_HERE_IS_A_BUG : String = "2_22";

        /**
         * 服务器返回的统一错误码
         * varint32 模块号
         * varint32 消息号
         * varint32 错误码
         */
        public static const S2C_ERROR_CODE : String = "2_24";

        /**
         * 客户端收到该协议，解压缩以后把数据再丢到前面去再读取一回，读取MODULE_ID，MSG_ID
         *
         * 协议内容：
         *
         * MODULE_ID
         * S2C_COMPRESS_MSG
         * 压缩数据(此处需要解压)：
         *      压缩前的MODULE_ID
         *      压缩前的MSG_ID
         *      压缩前的超长数据
         */
        public static const S2C_COMPRESS_MSG : String = "2_23";

        /**
         * 控制台，上行，长度不能超过200个字节
         * UTF 客户端发送上来的内容（带长度）
         */
        public static const C2S_CONSOLE : String = "2_120";

        /**
         * 控制台返回，客户端显示出来
         * bytes 显示内容（不带长度，读到尾）
         */
        public static const S2C_CONSOLE : String = "2_121";

    }
}