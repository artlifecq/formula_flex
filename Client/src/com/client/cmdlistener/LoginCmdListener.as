package com.client.cmdlistener
{
	import com.client.ClientGlobal;
	import com.client.ui.alert.GameAlert;
	import com.game.login.message.ResCreateCharacterMessage;
	import com.game.login.message.ResErrorMessage;
	import com.game.login.message.ResHeartMessage;
	import com.game.login.message.ResLoginSuccessMessage;
	import com.gameClient.log.GameLog;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net_protobuff.ByteBuffer;

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
			SocketConnection.addCmdListener(100102,RecvLoginSuccessMessage);
			SocketConnection.addCmdListener(100101, RecvCreateCharacterMessage);
			SocketConnection.addCmdListener(100104, RecvErrorMessage);
			SocketConnection.addCmdListener(100106, RecvHeartMessage);
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
			ClientGlobal.hasHero = true;
			ClientGlobal.loginData = data;
			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
			}
		}
		
		public static function RecvErrorMessage(msg:ResErrorMessage):void
		{
			var str:String="创建角色错误";
			switch(msg.reason)
			{
				case 10202:
				{
					str="名字不能少于两个汉字";
					break;
				}
				case 10203:
				{
					str="名字长度不能大于6个汉字";
					break;
				}
				case 10204:
				{
					str="名字已被使用";
					break;
				}
				case 10205:
				case 10206:
				{
					str="名字包含非法字符";
					break;
				}
			}
			showErrorMessage(str);
			if (onCreateCharFailHandler != null)
			{
				onCreateCharFailHandler(msg);
				onCreateCharFailHandler = null;
			}
		}
		
		public static function RecvCreateCharacterMessage(msg:ResCreateCharacterMessage):void
		{
			GameLog.addShow("收到需要创建角色消息 ");
			ClientGlobal.hasHero = false;
			if (onLoginSuccessHandler != null)
			{
				onLoginSuccessHandler();
				onLoginSuccessHandler = null;
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

		private static function showErrorMessage(msg : String) : void
		{
			GameAlert.show(msg, "提示");
			GameLog.addShow(msg);
		}
	}
}
