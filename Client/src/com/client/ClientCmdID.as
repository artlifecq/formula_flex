package com.client
{

	/**
	 * C2S_XXXX表示客户端发给服务器的协议ID
	 * S2C_XXXX表示服务器返回给客户端的协议ID
	 * 协议号 模块ID_当前模块消息ID(例如:1_1),模块ID为1,消息ID为1;
	 * @author carver
	 *
	 */
	public class ClientCmdID
	{
		/**----------------------------------登录相关(moduleID==1)--------------------------------------------*/
		public static const C2S_CREATE_OR_LOGIN_BY_NAME : String = "1_2"; //登陆
		public static const S2C_LOGIN_SUCCESS : String = "1_1"; //登陆返回,若没有英雄, 则显示英雄创建界面. 若有英雄, (之后会附带英雄的具体信息) 则直接进入游戏.
		public static const S2C_LOGIN_BY_NAME_FAIL : String = "1_2"; //通过用户名获得用户错误码
//	
		public static const S2C_CREATE_USER_BY_NAME_FAIL : String = "1_0"; //创建新人物失败
		public static const C2S_CREATE_HERO : String = "1_3"; //创建新人物
		public static const S2C_CREATE_HERO_SUCCESS : String = "1_3"; //成功,后面附带heroData  (里面的内容和用户登录成功时, 已经有英雄的情况一样): utf 名字,protobuf
		public static const S2C_CREATE_HERO_FAIL : String = "1_4"; //创建英雄失败
//
		public static const C2S_WEB_LOGIN : String = "1_5"; //网页登录
		public static const S2C_WEB_LOGIN_FAIL : String = "1_5"; //网页登录
		public static const S2C_DISCONNECT_REASON : String = "2_3"; //断线...
//		
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
