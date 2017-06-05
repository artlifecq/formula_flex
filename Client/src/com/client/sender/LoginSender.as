package com.client.sender
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.netData.login.message.ReqCreateCharacterMessage;
	import com.rpgGame.netData.login.message.ReqLoginForPlatformMessage;
	import com.rpgGame.netData.login.message.ReqLoginMessage;
	
	import org.game.netCore.connection.SocketConnection;
	
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
		//		public static function login(auth : String, loginKey : String) : void
		//		{
		//			var data : ByteBuffer = new ByteBuffer();
		//			data.writeUTF(auth);
		//			var signBy : ByteBuffer = new ByteBuffer();
		//			signBy.writeUTFBytes(loginKey);
		//			data.writeBytes(signBy);
		//			SocketConnection_protoBuffer.send(ClientCmdID.C2S_WEB_LOGIN, data);
		//			//
		//			SocketConnection_protoBuffer.mainSocket.easyProtocolOffset = signBy[0];
		//			GameLog.addShow("easyProtocolOffset : ", signBy[0]);
		//		}
		
		/**
		 * 玩家注册，选择帐号
		 */
		public static function register(sex : int,  nickName : String, job : int) : void
		{
			/* if(job < 1 || job > 4)
			{
			job = int(Math.random() * 3);
			}*/
			var msg:ReqCreateCharacterMessage = new ReqCreateCharacterMessage();
			msg.name=nickName;
			msg.job=job;
			msg.sex=sex;
			msg.auto=0;
			msg.win_high = ClientConfig.stage.height;
			msg.win_width = ClientConfig.stage.width;
			SocketConnection.send(msg);
			//
			GameLog.addShow("发送创建角色：", nickName);
		}
		
		public static function SendLoginMessage(relogin:int=0):void
		{
			var msg:ReqLoginMessage = new ReqLoginMessage();
			msg.name = ClientConfig.loginName;
			msg.password = ClientConfig.loginKey;
			msg.serverId = ClientConfig.loginAreaId;
			msg.agent = ClientConfig.agent;
			msg.win_width = ClientConfig.stage.width;
			msg.win_high = ClientConfig.stage.height;
			msg.relogin=relogin;
			SocketConnection.send(msg);
		}
		
		public static function SendPlatformLoginMessage():void
		{
			var msg:ReqLoginForPlatformMessage = new ReqLoginForPlatformMessage();
			msg.serverId = ClientConfig.loginAreaId + "";
			msg.username = ClientConfig.loginName;
			msg.agent = ClientConfig.agent;
			msg.ad = "";
			msg.time = ClientConfig.loginTime + "";
			msg.isadult = "1";
			msg.sign = ClientConfig.loginKey;
			msg.localref = "";
			msg.reserva1 = "";
			msg.reserva2 = "";
			msg.logintype = "1";
			msg.agentPlusdata = "";
			msg.agentColdatas = "";
			msg.adregtime = "";
			msg.win_width = ClientConfig.stage.width;
			msg.win_high = ClientConfig.stage.height;
			SocketConnection.send(msg);
		}
	}
}
