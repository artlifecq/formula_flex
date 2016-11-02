package com.client.sender
{
	import com.client.ClientCmdID;
	import com.gameClient.log.GameLog;

	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 登录发送
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class LoginSender
	{
		/**
		 * 玩家登录
		 * @param auth
		 */
		public static function login(auth : String, loginKey : String) : void
		{
			var data : ByteBuffer = new ByteBuffer();
			data.writeUTF(auth);
			var signBy : ByteBuffer = new ByteBuffer();
			signBy.writeUTFBytes(loginKey);
			data.writeBytes(signBy);
			SocketConnection.send(ClientCmdID.C2S_WEB_LOGIN, data);
			//
			SocketConnection.mainSocket.easyProtocolOffset = signBy[0];
			GameLog.addShow("easyProtocolOffset : ", signBy[0]);
		}

		/**
		 * 玩家注册，选择帐号
		 */
		public static function register(sex : Boolean, headFace : int, body : int, nickName : String, countryID : int) : void
		{
			var buf : ByteBuffer = new ByteBuffer();
			buf.writeBoolean(sex);
			buf.writeVarint32(headFace);
			buf.writeVarint32(body);
			buf.writeUTF(nickName);
			buf.writeVarint32(countryID);
			SocketConnection.send(ClientCmdID.C2S_CREATE_HERO, buf);
			//
			GameLog.addShow("发送创建角色：", nickName);
		}
	}
}
