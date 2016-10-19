package com.client.process
{
	import com.client.ClientCmdID;
	import com.client.ClientGlobal;
	import com.client.cmdlistener.LoginCmdListener;
	import com.client.sender.HeartSender;
	import com.client.sender.LoginSender;
	import com.client.ui.alert.GameAlert;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.game.engine3D.vo.SenderReferenceSet;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.adobe.Base64;

	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.external.ExternalInterface;
	import flash.system.Security;
	import flash.utils.ByteArray;
	import flash.utils.Timer;

	import gs.TweenLite;

	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;

	/**
	 *
	 * 服务器连接
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-3 下午6:05:12
	 *
	 */
	public class ServerConnect extends BaseProcess
	{
		private static var _allowReconnect : Boolean = true;
		private static var _errMsg : String = "";

		public static function stopReconnect(errMsg : String) : void
		{
			_errMsg = errMsg;
			_allowReconnect = false;
		}

		private var _retryTimer : Timer;
		private var _retryConnectCnt : uint = 0;
		/** 腾讯oid*/
		private var _tencentOid : int = 199;
		private var _connectDelay : int = 0;

		public function ServerConnect()
		{
			super();
			_connectDelay = 0;
			EventManager.addEvent("SERVER_RECONNECT", closeSocket);
		}

		override public function getState() : String
		{
			return ProcessState.STATE_SERVER_CONNECT;
		}

		override public function startProcess() : void
		{
			super.startProcess();
			ResLoadingView.instance.show();
			if (isProcessed)
			{
				ResLoadingView.instance.title = "正在重新连接服务器...";
				GameLog.addShow("重新连接socket");
			}
			else
			{
				ResLoadingView.instance.title = "正在连接服务器...";
				GameLog.addShow("连接socket");
			}

			if (ClientGlobal.loginIP == "0.0.0.0")
			{
				ClientGlobal.isSingle = true;
				completeProcess();
				return;
			}
			//
			loadPolicys();
			//
			connect();
		}

		private function connect() : void
		{
			_allowReconnect = true;
			_errMsg = "";
			TweenLite.killDelayedCallsTo(onConnect);
			if (_connectDelay > 0)
			{
				TweenLite.delayedCall(_connectDelay * 0.001, onConnect);
			}
			else
			{
				onConnect();
			}
		}

		private function onConnect() : void
		{
			SocketConnection.mainSocket.addEventListener(Event.CONNECT, onMainSocketConnect);
			SocketConnection.mainSocket.addEventListener(IOErrorEvent.IO_ERROR, onConnectError);
			SocketConnection.mainSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onConnectError);
			SocketConnection.mainSocket.addEventListener(Event.CLOSE, onSocketClose);
			SocketConnection.mainSocket.connect(ClientGlobal.loginIP, ClientGlobal.loginPort);
			//
			_retryConnectCnt = 0;
			if (!_retryTimer)
			{
				_retryTimer = new Timer(1000, 0);
			}
			_retryTimer.addEventListener(TimerEvent.TIMER, onRetryConnect);
			_retryTimer.reset();
			_retryTimer.start();
		}

		private function loadPolicys() : void
		{
			if (ExternalInterface.available)
			{
				Security.allowDomain("*");
				Security.allowInsecureDomain("*");
			}
			//
			var policyFileUrl : String = "xmlsocket://" + ClientGlobal.loginIP + ":" + ClientGlobal.policyPort;
			Security.loadPolicyFile(policyFileUrl);
			//
			GameLog.addShow("加载跨域文件 : ", policyFileUrl);
		}

		private function onMainSocketConnect(e : Event = null) : void
		{
			_allowReconnect = true;
			_errMsg = "";
			GameAlert.hide();
			SocketConnection.mainSocket.removeEventListener(Event.CONNECT, onMainSocketConnect);
			SocketConnection.mainSocket.removeEventListener(IOErrorEvent.IO_ERROR, onConnectError);
			SocketConnection.mainSocket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, onConnectError);
			//
			if (_retryTimer)
			{
				_retryTimer.stop();
				_retryTimer.removeEventListener(TimerEvent.TIMER, onRetryConnect);
				_retryTimer = null;
			}
			//
			if (isProcessed)
			{
				sendReLogin();
			}
			else
			{
				HeartSender.start();
				LoginCmdListener.start();
				sendLogin();
			}
		}

		private function onLoginSuccessHandler() : void
		{
			SenderReferenceSet.start();
			completeProcess();
			if (ClientGlobal.mainEntry)
			{
				ClientGlobal.mainEntry.reEnterGame();
			}
		}

		private function closeSocket(deley : int, msg : String) : void
		{
			_connectDelay = deley;
			GameLog.addShow("服务器连接" + msg);
			SocketConnection.mainSocket.removeEventListener(Event.CLOSE, onSocketClose);
			SenderReferenceSet.stop();
			SocketConnection.mainSocket.close(); //关闭原来的socket
			//
			if (_retryTimer)
			{
				_retryTimer.stop();
				_retryTimer.removeEventListener(TimerEvent.TIMER, onRetryConnect);
				_retryTimer = null;
			}
			//
			if (_allowReconnect && (isProcessing || (!isProcessing && !ProcessStateMachine.getInstance().isProcessing)))
			{
				ResLoadingView.instance.title = "服务器连接" + msg + "，正在重新连接服务器...";
				GameAlert.show("服务器连接" + msg + "，正在重新连接服务器，如果长时间未连接成功，请刷新后重新登录。", "提示", onOkFunc);
				reconnect();
			}
			else
			{
				ResLoadingView.instance.title = "服务器连接" + msg + "，原因：" + _errMsg + "，请刷新后重新登录。";
				GameAlert.show("服务器连接" + msg + "，原因：" + _errMsg + "，请刷新后重新登录。", "提示", onOkFunc);
			}
		}

		/**
		 * 服务器关闭连接
		 * @param e
		 *
		 */
		private function onSocketClose(e : Event) : void
		{
			closeSocket(500, "断开");
		}

		/**
		 * 服务器连接错误
		 * @param e
		 *
		 */
		private function onConnectError(e : Event) : void
		{
			closeSocket(500, "错误");
		}

		private function reconnect() : void
		{
			if (isProcessing)
			{
				connect();
			}
			else
			{
				if (!ProcessStateMachine.getInstance().isProcessing)
				{
					ProcessStateMachine.getInstance().addPreProcess(ProcessState.STATE_SERVER_CONNECT, 0, 0.5);
					ProcessStateMachine.getInstance().run();
				}
			}
		}

		private function getOid(key : String) : int
		{
			var parseStar : String = Base64.decode(key);
			GameLog.addShow("parseStar:" + parseStar);
			var parseArr : Array = parseStar.split("&");
			for each (var str : String in parseArr)
			{
				var strArr : Array = str.split("=");
				if (strArr[0] == "oid" && strArr.length > 1)
				{
					return strArr[1];
				}
			}
			return 0;
		}

		private function sendLogin() : void
		{
			LoginCmdListener.onLoginSuccessHandler = onLoginSuccessHandler;
			//
			var oid : int = getOid(ClientGlobal.loginName);
			GameLog.addShow("oid:" + oid);
			if (oid == _tencentOid)
			{
				sendTGW(ClientGlobal.loginIP, ClientGlobal.loginPort);
			}
			var ret : ByteArray = new ByteArray();
			if (!ClientGlobal.loginKey)
			{
				trace(ClientGlobal.loginName);
				ret.writeUTF(ClientGlobal.loginName);
				SocketConnection.send(ClientCmdID.C2S_CREATE_OR_LOGIN_BY_NAME, ret);
			}
			else
			{
				LoginSender.login(ClientGlobal.loginName, ClientGlobal.loginKey);
			}
			//
			GameLog.addShow("连接socket成功,发送登录消息", ClientGlobal.loginName, ClientGlobal.loginKey);
		}

		private function sendReLogin() : void
		{
			LoginCmdListener.onLoginSuccessHandler = onLoginSuccessHandler;
			var auth : String = ClientGlobal.auth;
			var sign : String = ClientGlobal.sign;
			//
			var signBy : ByteArray = new ByteArray();
			signBy.writeUTF(auth);
			signBy.writeUTFBytes(sign);

			var by : ByteArray = new ByteArray();
			by.writeUTFBytes(sign);
			//
			SocketConnection.mainSocket.easyProtocolOffset = 0;
			SocketConnection.send(ClientCmdID.C2S_RECONNECTED, signBy);
			SocketConnection.mainSocket.easyProtocolOffset = by[0];
		}

		/**
		 * 发送腾讯tgw
		 * @param domainName
		 * @param port
		 *
		 */
		public function sendTGW(domainName : String, port : int) : void
		{
			var str : String = "tgw_l7_forward\r\nHost:" + domainName + ":" + port + "\r\n\r\n";
			var data : ByteArray = new ByteArray();
			data.writeUTFBytes(str);
			GameLog.addShow("===========================TGW=================== ");
			GameLog.addShow(str);
			GameLog.addShow("===========================TGW=================== ");
			GameLog.addShow("data.length:" + data.length);
			SocketConnection.mainSocket.writeBytes(data);
			SocketConnection.mainSocket.flush();
		}

		private function showErrorMessage(msg : String) : void
		{
			GameAlert.show(msg, "提示");
			GameLog.addShow(msg);
		}

		private function onOkFunc() : void
		{
			if (ExternalInterface.available)
			{
				ExternalInterface.call("reload");
			}
		}

		private function onRetryConnect(evt : TimerEvent = null) : void
		{
			_retryConnectCnt++;
			GameLog.addShow("连接Socket，第" + _retryConnectCnt + "次尝试: ", ClientGlobal.loginIP, ClientGlobal.loginPort);
			//
			SocketConnection.mainSocket.connect(ClientGlobal.loginIP, ClientGlobal.loginPort);
			if (_retryConnectCnt > 60)
			{
				showErrorMessage("服务器连接不上，继续尝试重新连接中，请检查您的网络环境！");
			}
		}

//		private function playCreateCharSound() : void
//		{
//			try
//			{
//				var obj : * = ApplicationDomain.currentDomain.getDefinition("SOUND_Create_User");
//				if (obj)
//				{
//					var cls : Class = obj as Class;
//					_sound = new cls();
//				}
//				if (_sound)
//				{
//					_soundTransform = new SoundTransform(0);
//					_soundChannel = _sound.play(0, 0, _soundTransform);
//					updateSoundTransFrom();
//				}
//			}
//			catch (e : Error)
//			{
//				GameLog.addShow("播放创角音效error");
//			}
//		}

//		private function updateSoundTransFrom() : void
//		{
//			ClientGlobal.stage.addEventListener(Event.ENTER_FRAME, onSoundTransFromEnterFrame);
//		}
//
//		protected function onSoundTransFromEnterFrame(event : Event) : void
//		{
//			if (_soundTransform.volume < 0.8)
//			{
//				_soundTransform.volume += 0.01;
//				_soundChannel.soundTransform = _soundTransform;
//			}
//			else
//			{
//				ClientGlobal.stage.removeEventListener(Event.ENTER_FRAME, onSoundTransFromEnterFrame);
//			}
//		}

		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
