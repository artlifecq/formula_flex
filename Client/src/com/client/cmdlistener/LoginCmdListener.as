package com.client.cmdlistener
{
	import com.client.ClientCmdID;
	import com.client.ClientGlobal;
	import com.client.process.ServerConnect;
	import com.client.ui.alert.GameAlert;
	import com.gameClient.log.GameLog;

	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 登录命令侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class LoginCmdListener
	{
		public static var onLoginSuccessHandler : Function;
		public static var onCreateCharSuccessHandler : Function;
		public static var onCreateCharFailHandler : Function;

		public function LoginCmdListener()
		{
		}

		public static function start() : void
		{
			SocketConnection.addCmdListener(ClientCmdID.S2C_DISCONNECT_REASON, onSocketDisconnect);
			SocketConnection.addCmdListener(ClientCmdID.S2C_LOGIN_SUCCESS, onLoginSuccess);
			SocketConnection.addCmdListener(ClientCmdID.S2C_RECONNECT_LOGIN_SUCCESS, onReLoginSuccess);
			SocketConnection.addCmdListener(ClientCmdID.S2C_LOGIN_BY_NAME_FAIL, onLoginFail);
			SocketConnection.addCmdListener(ClientCmdID.S2C_CREATE_USER_BY_NAME_FAIL, onCreateUserByNameFail);
			SocketConnection.addCmdListener(ClientCmdID.S2C_CREATE_HERO_SUCCESS, onCreateHeroSuccess);
			SocketConnection.addCmdListener(ClientCmdID.S2C_CREATE_HERO_FAIL, onCreateHeroFail);
			SocketConnection.addCmdListener(ClientCmdID.S2C_AUTH_INFO, onGetAuthInfo);
			SocketConnection.addCmdListener(ClientCmdID.S2C_RECONNECTED_FAIL, onReconnectedFail);
		}

		private static function onLoginSuccess(data : ByteBuffer) : void
		{
			ClientGlobal.loginData = SocketConnection.messsageUnCompress(data, ClientCmdID.S2C_LOGIN_SUCCESS);
			ClientGlobal.userID = ClientGlobal.loginData.readLong();
			var hasUserValue : int = ClientGlobal.loginData.readByte();
			ClientGlobal.loginType = hasUserValue >>> 1; // 登陆方式，0-内部 1-web 2-微端
			GameLog.addShow("hasUserValue" + hasUserValue);
			GameLog.addShow("_loginType" + ClientGlobal.loginType);

			ClientGlobal.hasHero = (hasUserValue & 1) > 0;

			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
			}
		}

		private static function onReLoginSuccess(data : ByteBuffer) : void
		{
			ClientGlobal.loginData = SocketConnection.messsageUnCompress(data, ClientCmdID.S2C_RECONNECT_LOGIN_SUCCESS);
			ClientGlobal.userID = ClientGlobal.loginData.readLong();
			var hasUserValue : int = ClientGlobal.loginData.readByte();
			ClientGlobal.loginType = hasUserValue >>> 1; // 登陆方式，0-内部 1-web 2-微端
			GameLog.addShow("hasUserValue" + hasUserValue);
			GameLog.addShow("_loginType" + ClientGlobal.loginType);

			ClientGlobal.hasHero = (hasUserValue & 1) > 0;

			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
			}
		}

		private static function onLoginFail(data : ByteBuffer) : void
		{
			var errID : uint = data.readVarint32();
			switch (errID)
			{
				case 1:
					showErrorMessage("登录失败,非法字符");
					break;
				case 2:
					showErrorMessage("登录失败,用户不存在");
					break;
				case 3:
					showErrorMessage("登录失败,服务器内部错误");
					break;
			}
		}

		private static function onCreateHeroSuccess(data : ByteBuffer) : void
		{
			ClientGlobal.loginData = data;

			if (onCreateCharSuccessHandler != null)
			{
				onCreateCharSuccessHandler();
				onCreateCharSuccessHandler = null;
			}
		}

		/**
		 * 断线重连需要的信息
		 * UTFBytes info
		 * bytes sign
		 */
		private static function onGetAuthInfo(data : ByteBuffer) : void
		{
			var len : uint = data.readShort();
			ClientGlobal.auth = data.readUTFBytes(len);
			ClientGlobal.sign = data.readUTFBytes(data.bytesAvailable);
		}

		private static function onCreateUserByNameFail(data : ByteBuffer) : void
		{
			var errorId : int = data.readByte();
			switch (errorId)
			{
				case 1:
					showErrorMessage("名字长度错误，长度为3-16个字符");
					break;
				case 2:
					showErrorMessage("使用了非法字符");
					break;
				case 3:
					showErrorMessage("名字已经存在");
					break;
				case 4:
					showErrorMessage("服务器内部错误");
					break;
			}
		}

		private static function onCreateHeroFail(data : ByteBuffer) : void
		{
			var msg : String = "未知错误";
			var errorId : int = data.readByte();
			switch (errorId)
			{
				case 1:
					msg = "很抱歉，您创建的角色名中包含非法字符";
					break;
				case 2:
					msg = "很抱歉，您创建的角色名已经被占用";
					break;
				case 3:
					msg = "抱歉，服务器内部错误";
					break;
				case 4:
					msg = "很抱歉，职业错误";
					break;
				case 5:
					msg = "很抱歉，您的账号下已经有角色";
					break;
				case 6:
					msg = "很抱歉，角色名字须3-14个字";
					break;
				case 7:
					msg = "很抱歉，头像范围非法";
					break;
				case 8:
					msg = "很抱歉，身体范围非法";
					break;
			}
			showErrorMessage(msg);
			if (onCreateCharFailHandler != null)
			{
				onCreateCharFailHandler(msg);
				onCreateCharFailHandler = null;
			}
		}

		private static function onSocketDisconnect(data : ByteBuffer) : void
		{
			var errMsg : String = "未知";
			var errID : uint = data.readVarint32();
			switch (errID)
			{
				case 0:
					errMsg = "服务器即将重启";
					break;
				case 1:
					errMsg = "被顶号";
					break;
				case 2:
					errMsg = "聊天数据错误过多";
					break;
				case 3:
					errMsg = "心跳错误";
					break;
				case 4:
					errMsg = "心跳错误";
					break;
				case 5:
					errMsg = "未登录, 但是收到的消息不是登录模块的";
					break;
				case 6:
					errMsg = "登录但没有英雄, 但是收到的消息不是登录模块的";
					break;
				case 7:
					errMsg = "被封了";
					break;
				case 8:
				case 9:
				case 10:
				case 11:
				case 12:
				case 14:
				case 15:
				case 17:
				case 19:
				case 20:
				case 23:
				case 24:
					errMsg = "服务器bug";
					break;

				case 13:
					errMsg = "移动过快";
					break;
				case 16:
					errMsg = "GM模块，服务器踢的";
					break;
				case 18:
					errMsg = "交易错误";
					break;
				case 21:
					errMsg = "已经登录了，又发送了，登录消息";
					break;
				case 22:
					errMsg = "长时间未登录";
					break;
				case 25:
					errMsg = "机器人";
					break;
				case 26:
					errMsg = "不能使用内部模式登录";
					break;
				case 27:
					errMsg = "用户服务器数据未找到";
					break;
				case 28:
				case 29:
					errMsg = "验证未通过";
					break;
				case 30:
					errMsg = "包过大";
					break;
				case 31:
					errMsg = "解析包错误";
					break;
				case 32:
					errMsg = "未知错误";
					break;
				case 33:
					errMsg = "IP被封";
					break;
				case 34:
					errMsg = "长时间未登录";
					break;
				case 35:
					errMsg = "GM登录";
					break;
			}
			showErrorMessage("服务器连接断开，原因: " + errMsg);
			ServerConnect.stopReconnect(errMsg);
		}

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
		private static function onReconnectedFail(data : ByteBuffer) : void
		{
			var errMsg : String = "未知";
			var errID : uint = data.readVarint32();
			switch (errID)
			{
				case 1:
					errMsg = "连接失效";
					break;
				case 2:
					errMsg = "被封号";
					break;
				case 3:
					errMsg = "你要登录的区服不存在. 如果是测试阶段, 改登录时的参数. 正式时不该有这个问题";
					break;
				case 4:
					errMsg = "服务器内部错误, 稍后再试";
					break;
				case 5:
					errMsg = "IP不对，正常重连不应该出现";
					break;
				case 6:
					errMsg = "GM正在登陆你的号";
					break;
				case 7:
					errMsg = "配置版本不对";
					break;
			}
			showErrorMessage("服务器连接失败，原因: " + errMsg);
			ServerConnect.stopReconnect(errMsg);
		}

		private static function showErrorMessage(msg : String) : void
		{
			GameAlert.show(msg, "提示");
			GameLog.addShow(msg);
		}
	}
}
