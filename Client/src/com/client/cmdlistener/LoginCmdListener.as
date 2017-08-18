package com.client.cmdlistener
{
	import com.client.EnumErrorConst;
	import com.client.ui.alert.GameAlert;
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.netData.login.message.ResCreateCharacterMessage;
	import com.rpgGame.netData.login.message.ResErrorMessage;
	import com.rpgGame.netData.login.message.ResHeartMessage;
	import com.rpgGame.netData.login.message.ResLoginSuccessMessage;
	import com.rpgGame.netData.login.message.ResSubstituteMessage;
	import com.rpgGame.netData.player.message.ResMyPlayerInfoMessage;
	
	import away3d.log.Log;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.MessageMgr;

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
		
		public static var onGetMyPlayerInfoHandler:Function;

		public function LoginCmdListener()
		{
		}
		
		public static function RecvHeartMessage(msg:ResHeartMessage):void
		{
			/*_serverTime = msg.time;
			
			var needReset:Boolean = ( msg.reset == 1 || ( msg.reset == 0 && msg.time2 >= serverTimeCheck ) )
			if (msg.time2 != 0 && needReset )
			{
				_serverTimeCheck = msg.time2;
				_clientTimeCheck = 1;
				
				_clientTimePass = ( new Date() ).getTime();
			
			}*/
		}

		public static function start() : void
		{
			SocketConnection.addCmdListener(100102, RecvLoginSuccessMessage);
			SocketConnection.addCmdListener(100101, RecvCreateCharacterMessage);
			SocketConnection.addCmdListener(100103, RecvResSubstituteMessage);
			SocketConnection.addCmdListener(100104, RecvErrorMessage);
//			SocketConnection.addCmdListener(100106, RecvHeartMessage);
			SocketConnection.addCmdListener(103101, RecvMyPlayerInfoMessage);
		}
		
		private static function RecvResSubstituteMessage(msg:ResSubstituteMessage):void
		{
			// TODO Auto Generated method stub
			SocketConnection.messageMgr.isReplace=true;
			SocketConnection.messageMgr.replaceIP=msg.ip;
		}
		
		public static function RecvMyPlayerInfoMessage(msg:ResMyPlayerInfoMessage):void
		{
			ClientConfig.loginData = msg.myPlayerInfo;
			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
			}
			
			if(onGetMyPlayerInfoHandler)
			{
				onGetMyPlayerInfoHandler();
				onGetMyPlayerInfoHandler = null;
			}
			
			if(MessageMgr.Ins.isCrossSocket){//跨服登陆
				ClientConfig.mainEntry.updateLogindata();
			}else{
				GameLog.addShow("收到主玩家消息");
			}
		}
		
		public static function RecvLoginSuccessMessage(msg:ResLoginSuccessMessage):void
		{
			/*if (loginRoleCreatePanel) 
			{
				MCUtil.removeSelf(loginRoleCreatePanel);
				loginRoleCreatePanel=null;
			}
			ToolBase.Log("收到登录成功消息 ");
			_isLoginSuccess = true;
			Mgr.enter.SetConnectLoginReady(msg.mapModelId);
			prepareFilterWords();
			// 这里启动心跳吧
			StartHeart();*/
			GameLog.addShow("收到登录成功消息 ");
//			ClientConfig.loginData.mapModelId=msg.mapModelId;
			ClientConfig.hasHero = true;
			onCreateHeroSuccess();
		}
		
		public static function RecvErrorMessage(msg:ResErrorMessage):void
		{
			var str:String=EnumErrorConst.getErrorStr(msg.reason);
			showErrorMessage(str);
			if (onCreateCharFailHandler != null)
			{
				onCreateCharFailHandler(msg);
				onCreateCharFailHandler = null;
			}
		}
		
		public static function RecvCreateCharacterMessage(msg:ResCreateCharacterMessage):void
		{
			GameLog.addShow("收到需要创建角色消息,没有角色，需要创建！完成选服的流程，进入创角的流程 ");
			ClientConfig.hasHero = false;
			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
			}
		}

		private static function onCreateHeroSuccess() : void
		{
			if (onCreateCharSuccessHandler != null)
			{
				onCreateCharSuccessHandler();
				onCreateCharSuccessHandler = null;
			}
		}

		private static function showErrorMessage(msg : String) : void
		{
			GameAlert.show(msg, "提示");
			GameLog.addShow(msg);
		}
	}
}
