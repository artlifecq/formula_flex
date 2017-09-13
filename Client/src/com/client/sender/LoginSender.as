package com.client.sender
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.netData.login.message.ReqCreateCharacterMessage;
	import com.rpgGame.netData.login.message.ReqLoginForPlatformMessage;
	import com.rpgGame.netData.login.message.ReqLoginMessage;
	import com.rpgGame.netData.player.message.ReqPlayerChangeNameMessage;
	import com.rpgGame.statistics.Statistics;
	
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
		public static function sendRelogin():void
		{
			if (null == ClientConfig.loginKey || 0 == ClientConfig.loginKey.length) {
				LoginSender.SendLoginMessage(1);
			} else {
				LoginSender.SendPlatformLoginMessage(1);
			}
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
			if (msg.agent=="37"&& ClientConfig.clientParams) 
			{
				var obj:Object={};
				obj["lingpai"]= ClientConfig.clientParams[ "lingpai" ];
				obj["pt_vip"]=ClientConfig.clientParams[ "pt_vip" ];
				msg.ptData=JSONUtil.encode(obj);
			}
			SocketConnection.send(msg);
			Statistics.intance.pushNode(Statistics.STEP_SEND_LOGIN_MSG,"发送登录协议");
		}
		
		public static function SendPlatformLoginMessage(relogin:int=0):void
		{
			var msg:ReqLoginForPlatformMessage = new ReqLoginForPlatformMessage();
			msg.serverId = ClientConfig.loginAreaId + "";
			msg.username = ClientConfig.loginName;
			msg.agent = ClientConfig.agent;
			msg.ad = "";
			msg.time = ClientConfig.loginTime + "";
			msg.isadult = ClientConfig.urlParmar["adult"];///"1";
			msg.sign = ClientConfig.loginKey;
			msg.localref = "";
			msg.reserva1 = "";
			msg.reserva2 = ""; 
			msg.logintype = "1";
			msg.agentPlusdata = "";
			msg.agentColdatas = "";
			msg.adregtime = "";
			msg.relogin=relogin;
			msg.win_width = ClientConfig.stage.width;
			msg.win_high = ClientConfig.stage.height;
			if (msg.agent=="37") 
			{
				var obj:Object={};
				obj["lingpai"]= ClientConfig.clientParams[ "lingpai" ];
				obj["pt_vip"]=ClientConfig.clientParams[ "pt_vip" ];
				msg.ptData=JSONUtil.encode(obj);
			}
			SocketConnection.send(msg);
		}
		
		public static function reqLoginChangeName(name:String):void
		{
			var msg:ReqPlayerChangeNameMessage=new ReqPlayerChangeNameMessage();
			msg.name=name;
			msg.sex=0;
			SocketConnection.send(msg);
		}
	}
}
