package org.game.netCore.net
{
	import com.gameClient.log.GameLog;
	
	import flash.events.Event;
	
	import org.game.netCore.data.long;

	public class CrossMgr
	{
		public static const CROSS_CONNECT_OK:String = "cross_connect_ok";
		public static const CROSS_CONNECT_ERROR:String = "cross_connect_error";
		
		private var _crossIP:String;
		private var _crossPort:int;
		private var _crossSSLPort:int;
		
		private var _userId:long;
		private var _playerId:long;
		private var _oldKey:int;
		private var _crossKey:int;
		
		public var crossTimes:int;
		public var needclear:Boolean = false;
		private  var messageMgr:MessageMgr;
		
		public function CrossMgr()
		{
			messageMgr = MessageMgr.Ins;
		}
		
		public function get crossIP():String
		{
			return _crossIP;
		}
		
		public function get crossPort():int
		{
			return _crossPort;
		}
		
		public function get crossSSLPort():int
		{
			return _crossSSLPort;
		}
		
		public function recCrossServer( msg:ResChangeServerGameToClientMessage ):void
		{
			_userId = msg.userId;
			_playerId = msg.playerId;
			_oldKey = msg.oldserverKey;
			_crossKey = msg.fightServerKey;
			_crossIP = msg.serverIp;
			_crossPort = msg.serverPort;
			_crossSSLPort = msg.serverSSLPort;
			
//			Mgr.mapObjMgr.clearMingrenTangMsg();//成功开始跨服时清空
			switch ( msg.fighttype )
			{
				default:
					recChangeServer( msg.fighttype );
					break;
			}
		}
		
		protected function connectCorssErrorHand(event:Event):void
		{
			messageMgr.removeEventListener(CROSS_CONNECT_OK, connectCorssOkHand);
			messageMgr.removeEventListener(CROSS_CONNECT_ERROR, connectCorssErrorHand);
			
//			DebugFunction.traceCheckDbg(LanUtil.l( LanID.ID_354 ));
		}
		
		protected function connectCorssOkHand(event:Event):void
		{
			messageMgr.removeEventListener(CROSS_CONNECT_OK, connectCorssOkHand);
			messageMgr.removeEventListener(CROSS_CONNECT_ERROR, connectCorssErrorHand);
			reqCrossServer();
		}
		
		public function reqCrossServer():void
		{
		/*	var msg:ReqLoginFightServerClientToFightMessage = new ReqLoginFightServerClientToFightMessage();
			msg.userId = _userId;
			msg.playerId = _playerId;
			msg.oldserverKey = _oldKey;
			msg.fightServerKey = _crossKey;
			messageMgr.send( msg );*/
			GameLog.addShow("reqCrossServer");
		}
		
		/**
		 * 前端请求退出跨服
		 * */
		public function reqQuitClientToFight():void
		{
			GameLog.addShow("退出跨服");
			/*var msg:ReqQuitClientToFightMessage = new ReqQuitClientToFightMessage();
			messageMgr.send( msg );
			FrameDispatcher.setTimeout( Mgr.messageMgr.clearCorssSocket, 500 );*/
		}
		
		/**
		 * 
		 * 统一特殊处理的一些东西，在退出跨服的时候。没办法，发了请求就断了socket，后面也收不到消息了，GG了哎呀
		 */
		public function doWhenClearCorssSocket():void
		{
			/*if (Mgr.mainPlayer != null)
			{
				if ( Mgr.onHookMgr.isAutoFight )
					Mgr.onHookMgr.recAutoStateChange(0);//请求取消下面又断开了连接就GG，所以直接手动设置
				Mgr.sitMgr.showSitInfoPanel(false);//为啥没有打坐状态的缓存？？？
				if (Mgr.chatMgr.chatPanel)
					Mgr.chatMgr.changeTalkChannel(EnumChatChannelType.NORMAL, false);
				needclear = true;
			}*/
		}
		
		public function clearCallBack():void
		{
			if (needclear)
			{
				needclear = false;
			}
		}
		
		/**
		 * 服务器通知跨服之后前端操作完毕进行跨服
		 * */
		public function recChangeServer( type:int ):void
		{
			/*switch ( type )
			{
				case 2:
					Mgr.promptMgr.removeFuncPromptType(FunctionPrompt.TYPE_HUMANS_ZONE);
					break;
				default:
					break;
			}*/
			
			crossTimes = 3;
			messageMgr.connectCrossServer();
			messageMgr.addEventListener(CROSS_CONNECT_OK, connectCorssOkHand);
			messageMgr.addEventListener(CROSS_CONNECT_ERROR, connectCorssErrorHand);
		}
	}
}