package com.client.process
{
	import com.client.cmdlistener.LoginCmdListener;
	import com.client.sender.LoginSender;
	import com.client.ui.alert.GameAlert;
	import com.client.ui.alert.ReconnectionPanelExt;
	import com.client.view.loading.ResLoadingView;
	import com.game.engine3D.process.BaseProcess;
	import com.game.engine3D.process.ProcessStateMachine;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.adobe.Base64;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.netData.MessagePool;
	
	import flash.events.Event;
	import flash.external.ExternalInterface;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.system.ApplicationDomain;
	import flash.system.Security;
	import flash.utils.ByteArray;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.event.NetEvent;
	import org.game.netCore.net.MessageMgr;
	
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
		
		//private var _retryTimer : Timer;
		//private var _retryConnectCnt : uint = 0;
		/** 腾讯oid*/
		private var _tencentOid : int = 199;
		private var _connectDelay : int = 0;
		
		public function ServerConnect()
		{
			super();
			_reTryCount = 0;
			_connectDelay = 0;
			EventManager.addEvent("SERVER_RECONNECT", closeSocket);
			SocketConnection.messageMgr.addEventListener(MessageMgr.CLIENT_DROPS_TO_SERVER, socketDropsHandle);
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
			
			if (ClientConfig.loginIP == "0.0.0.0")
			{
				ClientConfig.isSingle = true;
				completeProcess();
				return;
			}
			loadPolicys();
			connect();
		}
		
		private function loadPolicys() : void
		{
			if (ExternalInterface.available)
			{
				Security.allowDomain("*");
				Security.allowInsecureDomain("*");
			}
			var policyFileUrl : String = "xmlsocket://" + ClientConfig.loginIP + ":" + ClientConfig.policyPort;
			Security.loadPolicyFile(policyFileUrl);
			GameLog.addShow("加载跨域文件 : ", policyFileUrl);
		}
		
		private function connect() : void
		{
			_allowReconnect = true;
			_errMsg = "";
			
			var messagePool:MessagePool = new MessagePool();
			SocketConnection.messageMgr.msgObjPool = messagePool;
			
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
			SocketConnection.messageMgr.addEventListener(MessageMgr.CLIENT_CONNECT_TO_SERVER, socketConnectHandle);
			SocketConnection.messageMgr.addEventListener(MessageMgr.CLIENT_FAILD_TO_SERVER, socketConnectFailHandle);
            
			SocketConnection.messageMgr.Connect(ClientConfig.loginIP, ClientConfig.loginPort, 5000);
//			_reTryCount = 0;
//			_retryConnectCnt = 0;
//			if (!_retryTimer)
//			{
//				_retryTimer = new Timer(1000, 0);
//			}
//			_retryTimer.addEventListener(TimerEvent.TIMER, onRetryConnect);
//			_retryTimer.reset();
//			_retryTimer.start();
		}
		
		protected function socketConnectHandle(event:NetEvent):void
		{
            GameLog.addShow("[ServerConnect] [socketConnectHandle]");
			_allowReconnect = true;
			_errMsg = "";
			GameAlert.hide();
			SocketConnection.messageMgr.removeEventListener(MessageMgr.CLIENT_CONNECT_TO_SERVER, socketConnectHandle);
			SocketConnection.messageMgr.removeEventListener(MessageMgr.CLIENT_FAILD_TO_SERVER, socketConnectFailHandle);
			
//			if (_retryTimer)
//			{
//				_retryTimer.stop();
//				_retryTimer.removeEventListener(TimerEvent.TIMER, onRetryConnect);
//				_retryTimer = null;
//			}
			//
			if (isProcessed)
			{
				sendReLogin();
			}
			else
			{
				//				HeartSender.start();
				LoginCmdListener.start();
				sendLogin();
			}
		}
		
		protected function socketConnectFailHandle(event:NetEvent):void
		{
			closeSocket(500, "错误");
		}
		
		private function onLoginSuccessHandler() : void
		{
			/*SenderReferenceSet.start();
			completeProcess();
			if (ClientConfig.mainEntry)
			{
			ClientConfig.mainEntry.reEnterGame();
			}*/
			GameLog.addShow("登录成功了...",this);
			completeProcess();
		}
		
		private var _reTryCount:int = 0;
		private function closeSocket(deley : int, msg : String) : void
		{
			_connectDelay = deley;
			GameLog.addShow("服务器连接关闭:" + msg);
			//			SenderReferenceSet.stop();
			//
//			if (_retryTimer)
//			{
//				_retryTimer.stop();
//				_retryTimer.removeEventListener(TimerEvent.TIMER, onRetryConnect);
//				_retryTimer = null;
//			}
			//
			if (_allowReconnect && (isProcessing || (!isProcessing && !ProcessStateMachine.getInstance().isProcessing)))
			{
				ResLoadingView.instance.title = "服务器连接" + msg + "，正在重新连接服务器...";
				_reTryCount++;
//				GameAlert.show("服务器连接" + msg + "，正在重新连接服务器，如果长时间未连接成功，请刷新后重新登录。", "提示", onOkFunc);
				reconnect();
				
				if(_reTryCount > 60)
				{
					GameAlert.show("服务器连接" + msg + "，正在重新连接服务器，如果长时间未连接成功，请刷新后重新登录。", "提示", onOkFunc);
				}
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
            GameLog.addShow("[ServerConnect] [reconnect]");
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
			var oid : int = getOid(ClientConfig.loginName);
			GameLog.addShow("oid:" + oid);
			if (oid == _tencentOid)
			{
				sendTGW(ClientConfig.loginIP, ClientConfig.loginPort);
			}
			if (null == ClientConfig.loginKey || 0 == ClientConfig.loginKey.length) {
				LoginSender.SendLoginMessage();
			} else {
				LoginSender.SendPlatformLoginMessage();
			}
			
			GameLog.addShow("连接socket成功,发送登录消息", ClientConfig.loginName, ClientConfig.loginKey);
		}
		
		/**
		 * 断线重链 
		 * 
		 */		
		private function sendReLogin() : void
		{
			LoginCmdListener.onLoginSuccessHandler = onLoginSuccessHandler;
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
			SocketConnection_protoBuffer.mainSocket.writeBytes(data);
			SocketConnection_protoBuffer.mainSocket.flush();
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
				ExternalInterface.call("refresh");
			}
		}
		
//		private function onRetryConnect(evt : TimerEvent = null) : void
//		{
//			_retryConnectCnt++;
//			GameLog.addShow("连接Socket，第" + _retryConnectCnt + "次尝试: ", ClientConfig.loginIP, ClientConfig.loginPort);
//			//
//			SocketConnection_protoBuffer.mainSocket.connect(ClientConfig.loginIP, ClientConfig.loginPort);
//			if (_retryConnectCnt > 60)
//			{
//				showErrorMessage("服务器连接不上，继续尝试重新连接中，请检查您的网络环境！");
//			}
//		}
		
		private var _sound:Sound;
		private var _soundTransform:SoundTransform;
		private var _soundChannel:SoundChannel;
		private function playCreateCharSound() : void
		{
			try
			{
				var obj : * = ApplicationDomain.currentDomain.getDefinition("SOUND_Create_User");
				if (obj)
				{
					var cls : Class = obj as Class;
					_sound = new cls();
				}
				if (_sound)
				{
					_soundTransform = new SoundTransform(0);
					_soundChannel = _sound.play(0, 0, _soundTransform);
					updateSoundTransFrom();
				}
			}
			catch (e : Error)
			{
				GameLog.addShow("播放创角音效error");
			}
		}
		
		private function updateSoundTransFrom() : void
		{
			ClientConfig.stage.addEventListener(Event.ENTER_FRAME, onSoundTransFromEnterFrame);
		}
		
		protected function onSoundTransFromEnterFrame(event : Event) : void
		{
			if (_soundTransform.volume < 0.8)
			{
				_soundTransform.volume += 0.01;
				_soundChannel.soundTransform = _soundTransform;
			}
			else
			{
				ClientConfig.stage.removeEventListener(Event.ENTER_FRAME, onSoundTransFromEnterFrame);
			}
		}
		
		private function socketDropsHandle(event:NetEvent):void
		{
            GameLog.addShow("[ServerConnect] [socketDropsHandle]");
			ReconnectionPanelExt.Show();
		}
		
		override public function dispose() : void
		{
			super.dispose();
		}
	}
}
