package app.cmd {

    public class LoginMessages {

        public static const C2S_TEST : String = "1_-1";

        public static const S2C_TEST : String = "1_-1";

        /**
         * 登录. 必须等待服务器返回. 且在收到返回前, 不能发送再发送任何消息
         *
         * 失败返回 S2C_WEB_LOGIN_FAIL
         * 成功返回 S2C_LOGIN_SUCCESS
         *
         * 附带
         *
         * UTF auth
         * UTFBytes sign
         */
        public static const C2S_WEB_LOGIN : String = "1_5";

        /**
         * 登录失败
         *
         * 这条消息之后, 服务器会把玩家弄断线, 客户端显示对应的提示信息, 提示玩家刷新页面
         *
         * 附带 varint32
         *
         * 1. 刷新 (链接失效)
         * 2. 你被ban了, 刷新也没用, 哭去吧
         * 3. 你要登录的区服不存在. 如果是测试阶段, 改登录时的参数. 正式时不该有这个问题
         * 4. 服务器内部错误, 稍后再试
         * 5. GM正在登录你的账号
         */
        public static const S2C_WEB_LOGIN_FAIL : String = "1_5";

        /**
         * 附带utf的用户名, 存在就读取已有的账号, 不存在就新建个新的.
         * 失败返回S2C_LOGIN_BY_NAME_FAIL或者S2C_CREATE_USER_BY_NAME_FAIL
         * 成功返回S2C_LOGIN_SUCCESS, 附带User.writeTo
         */
        public static const C2S_CREATE_OR_LOGIN_BY_NAME : String = "1_2";

        /**
         * 创建角色失败，返回byte错误码
         *
         * 1. 名字长度错误，长度为3-16个字符
         * 2. 使用了非法字符
         * 3. 名字已经存在
         * 4. 服务器内部错误
         */
        public static const S2C_CREATE_USER_BY_NAME_FAIL : String = "1_0";

        /**
         * bytes 压缩数据
         *
         * 解压后读取方式
         * long 英雄id
         * byte value
         *
         * boolean hasHero = value & 1 > 0;
         * int loginType = value >>> 1; // 登陆方式，0-内部 1-web 2-微端
         *
         * if (hasHero){
         *      bytes HeroProto
         * } else {
         *      while(buffer.readable){
         *          varint32 国家N人数
         *      }
         * }
         *
         */
        public static const S2C_LOGIN_SUCCESS : String = "1_1";

        /**
         * 通过名字登录失败
         *
         * byte byte错误码
         *
         * 3. 服务器内部错误
         */
        public static const S2C_LOGIN_BY_NAME_FAIL : String = "1_2";

        /**
         * 创建英雄
         * bool 性别[true: 男， false: 女]
         * varint32 头像 [目前仅支持0-15]
         * varint32 身体 [目前仅支持0-1]
         * UTF 角色名字
         *
         * if(创建的角色需要选择国家){
         *      varint32 国家 1-5
         *      if(国家 in (国家 1-5)){
         *          // 使用你发送过来的国家
         *      } else {
         *          // 服务器进行随机
         *      }
         * }
         */
        public static const C2S_CREATE_HERO : String = "1_3";

        /**
         * 创建英雄成功
         *
         * HeroProto 英雄数据
         */
        public static const S2C_CREATE_HERO_SUCCESS : String = "1_3";

        /**
         * 创建英雄失败
         *
         * byte byte错误码
         * 1. 名字中存在非法字符
         * 2. 角色名已经存在
         * 3. 服务器内部错误
         * 4. 无效的职业
         * 5. 你已经有角色了
         * 6. 名字长度非法
         * 7. 头像范围非法
         * 8. 身体范围非法
         */
        public static const S2C_CREATE_HERO_FAIL : String = "1_4";

        /**
         * 通过用户ID登陆，不存在就创建一个（机器人用）
         * varint32 用户ID
         *
         * 失败返回S2C_LOGIN_BY_NAME_FAIL或者S2C_CREATE_USER_BY_NAME_FAIL
         * 成功返回S2C_LOGIN_SUCCESS, 附带User.writeTo
         */
        public static const C2S_CREATE_OR_LOGIN_ROBOT : String = "1_4";

        /**
         * 你被Ban掉了，禁止登陆，请联系客服
         */
        public static const S2C_HERO_BANNED : String = "1_6";

        /**
         * 更新加载进度
         * varint32 进度
         */
        public static const C2S_CLIENT_LOAD_PROGRESS : String = "1_7";

        /**
         * 断线重连，附带
         * utfbyte info
         * byte[] sign
         */
        public static const C2S_RECONNECTED : String = "1_8";

        /**
         * 断线重连，失败。附带byte错误码：
         * 1. 链接失效
         * 2. 被封号
         * 3. 你要登录的区服不存在. 如果是测试阶段, 改登录时的参数. 正式时不该有这个问题
         * 4. 服务器内部错误, 稍后再试
         * 5. IP不对，正常重连不应该出现
         * 6. GM正在登陆你的号
         * 7. 配置版本不对
         */
        public static const S2C_RECONNECTED_FAIL : String = "1_9";

        /**
         * 重连成功。格式跟S2C_LOGIN_SUCCESS一样
         */
        public static const S2C_RECONNECT_LOGIN_SUCCESS : String = "1_10";

        /**
         * 断线重连需要的信息
         * UTFBytes info
         * bytes sign
         */
        public static const S2C_AUTH_INFO : String = "1_11";

    }
}