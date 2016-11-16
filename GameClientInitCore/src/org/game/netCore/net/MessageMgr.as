package org.game.netCore.net
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.external.ExternalInterface;
	import flash.net.Socket;
	import flash.system.Security;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import avmplus.getQualifiedClassName;
	
	/**
	 * 消息管理，支持socket代理
	 * @author masefee
	 * 2013-03-04
	 */
	public class MessageMgr extends EventDispatcher 
    {
		/** 客户端成功连接服务器 **/
		public static const CLIENT_CONNECT_TO_SERVER:String = "client_connect_to_server";
		/** 客户端连接服务器失败 **/
		public static const CLIENT_FAILD_TO_SERVER:String = "client_faild_to_server";
		
		/** 单例对象 **/
        private static var _inst:MessageMgr;
		/** 消息流缓存 **/
		private static var _msgBuff:ByteArray;
		/** 跨服消息流缓存 **/
		private static var _msgCrossBuff:ByteArray;
		/** 上次消息名 **/
		private static var _lastMessageName:String;
		
		/** 套接字 **/
		private var _socket:*;
		/** 是否为代理socket **/
		private var _isSocket5:Boolean;
		
		/** 顶号的IP **/
		private var _replaceIP:String;
		/** 每秒消息数量 **/
		private var _msgPerSceCount:int;
		/** php端口 **/
		private var _phpPort:int;
		/** php端口key **/
		private var _phpPortErrKey:String;
		/** 连接时间计时 **/
		private var _connectTime:int;
		/** 消息类型池 **/
		private var _msgTypeMap:Dictionary;
		/** 消息对象池 **/
		private var _msgObjPool:MessagePool;
		/** 是否连接 **/
		private var _isConnected:Boolean;
		/** 是否重连 **/
		private var _isReconnect:Boolean;
		/** 是否顶号 **/
		private var _isReplace:Boolean;
		/** 上次剩余字节 **/
		private var _remainBytesCnt:int;
		/** 上次剩余字节 **/
		private var _remainCrossBytesCnt:int;
		/** 上次统计消息数量的时间点 **/
		private var _msgPerSecondTime:int;
		/** 统计消息量是否过大的时间点 **/
		private var _lastCheckMsgCntTime:int;
		private var _sendMsgCnt:int;
		/** 消息量最大的消息类型 **/
		private var _maxCntMsgType:int;
		/** 消息量最大值 **/
		private var _maxMsgCnt:int;
		/** 上次收到的消息ID **/
		private var _lastMsgID:int;
		
		
		private var _orgSendMsgNum:int;
		private var _crossMsgNum:int;
		
		private var crossSocket:Socket;
		public var isCrossSocket:Boolean = false;
		
		/**
		 * 获得单例对象 
		 */
		public static function get Ins():MessageMgr
		{
			if ( _inst == null )
				_inst = new MessageMgr();
			return _inst;
		}
		
		/**
		 * 构造函数 
		 */		
		public function MessageMgr()
		{
			_replaceIP = "";
			_phpPortErrKey = "tmp";
			
			_msgBuff = new ByteArray();
			_msgCrossBuff = new ByteArray();
			_lastMessageName = "";
			
			_msgTypeMap = new Dictionary();
			_msgObjPool = new MessagePool();
			
			_isConnected = false;
			_isReconnect = false;
			_isReplace = false;
			_isSocket5 = false;
			
			_msgPerSceCount = 0;
			_connectTime = 0;
			_phpPort = -1;
			
			initCrossHash();
		}

		/**  消息序号  **/
		public function get orgSendMsgNum():int
		{
			return _orgSendMsgNum;
		}
		
		/**
		 * 是否是顶号 
		 */
		public function get isReplace():Boolean
		{
			return _isReplace;
		}

		/**
		 * 是否是顶号 
		 */		
		public function set isReplace(value:Boolean):void
		{
			_isReplace = value;
		}

		/**
		 * 是否重连 
		 */
		public function set isReconnect(value:Boolean):void
		{
			_isReconnect = value;
		}

		/**
		 * 是否重连 
		 */
		public function get isReconnect():Boolean
		{
			return _isReconnect;
		}

		/**
		 * 消息池 
		 */
		public function get msgObjPool():MessagePool
		{
			return _msgObjPool;
		}
		
		/**
		 * socket可用字节数 
		 */
		public function get socketByesAvailable():uint
		{
			if ( _socket != null )
				return _socket.bytesAvailable;
			
			return 0;
		}
		
		/**
		 * 每秒消息数量
		 */
		public function get msgPerSceCount():uint
		{
			return _msgPerSceCount;
		}
		
		/**
		 * 顶号的IP
		 */
		public function set replaceIP( ip:String ):void
		{
			_replaceIP = ip;
		}
		
		/**
		 * php端口
		 */
		public function get phpPort():uint
		{
			return _phpPort;
		}
		
		/**
		 * php端口key
		 */
		public function get phpPortErrKey():String
		{
			return _phpPortErrKey;
		}
		
		/**
		 * 连接时间计时
		 */
		public function get connectTime():int
		{
			return _connectTime;
		}
		
		
		/**
		 * 直接设置好socket 
		 * @param skt
		 * 
		 */
		public function SetSocket(skt:Socket, msgnum:int):void
		{
			_socket = skt;
			_socket.addEventListener( Event.CLOSE, closeHandler, false, 0, true );
			_socket.addEventListener( ProgressEvent.SOCKET_DATA, recv );
			_orgSendMsgNum = msgnum;
			_isConnected = true;
			_connectTime = ToolBase.GetTimer();
		}
		

		/**
		 * 开始连接
		 */
		public function Connect():void 
		{
			Security.allowDomain( "*" );
			
			_phpPortErrKey = "phpsandboxerror";
//			_phpPortErrKey += Mgr.stageMgr.STAGE.loaderInfo.parameters[ "agent" ];
//			_phpPortErrKey += Mgr.stageMgr.STAGE.loaderInfo.parameters[ "account" ];
//			_phpPortErrKey += Mgr.stageMgr.STAGE.loaderInfo.parameters[ "zoneid" ];

//			if ( Mgr.stageMgr.STAGE.loaderInfo.parameters[ "svrsport" ] != null && Mgr.stageMgr.STAGE.loaderInfo.parameters[ "svrsport" ] != "" )
//			{
//				try
//				{
//					if (Mgr.cacheMgr.GetValue(_phpPortErrKey) == "1")
//					{
//						Mgr.cacheMgr.SetValue(_phpPortErrKey, "0");
//					}
//					else
//					{
//						_phpPort = parseInt( Mgr.stageMgr.STAGE.loaderInfo.parameters[ "svrsport" ] );
//						if ( _phpPort >= 0 )
//							GameConfig.SANDBOX_PORT = _phpPort;
//					}
//	
//				}
//				catch ( err:Error )
//				{
//					trace( "svrsport error" );
//				}
//			}
			
			trace( "GAME_SERVER_IP:" + GameConfig.GAME_SERVER_IP + ":" + GameConfig.GAME_SERVER_PORT + " " + GameConfig.SANDBOX_PORT + "     GameConfig.gameline " + GameConfig.GAME_LINE );
			
			var policyPath:String = "xmlsocket://" + GameConfig.GAME_SERVER_IP + ":" + GameConfig.SANDBOX_PORT.toString();
			Security.loadPolicyFile( policyPath );
			createSocketAndConnect();
			
//			var portchecker:PortChecker = new PortChecker();
//			portchecker.startTest( GameConfig.GAME_SERVER_PORT_ARR );
//			portchecker.addEventListener( GameEvent.GAME_CHANGE_IP, changeIPConnectHandler );
//			portchecker.addEventListener( Event.COMPLETE, portCheckerOKHandler );
		}
		
		protected function portCheckerOKHandler(event:Event):void
		{
			var portChecker:PortChecker = event.target as PortChecker;
			GameConfig.GAME_SERVER_PORT = portChecker.curPort;
			createSocketAndConnect();
		}
		
		protected function changeIPConnectHandler(event:GameEvent):void
		{
			var obj:Object = event.data;
			if (obj.type == "0")
			{
				var vect:PortChecker = event.currentTarget as PortChecker;
				//" 与服务器["+ PlatformUtil.platformName + GameConfig.GAME_LINE +"区:" +GameConfig.GAME_SERVER_PORT_ARR+"]deactivate 连接断开！尝试连接"+obj.newIP+"的地址?"
				AlertSuperPanelExt.showMsg( "与服务器断开连接", Mgr.layerMgr.alertLayer, false,vect.start);
				//				AlertSuperPanelExt.showMsg(" 与服务器["+obj.oldIP+":"+GameConfig.GAME_SERVER_PORT_ARR+"]deactivate 连接断开！尝试连接"+obj.newIP+"的地址?", Mgr.layerMgr.alertLayer, false,vect.start);
			}
			else
			{
				//TextUtil.changeDateToDateStr(new Date()) +" 与" + PlatformUtil.platformName + "服务器["+ GameConfig.GAME_LINE +"区:"+GameConfig.GAME_SERVER_PORT_ARR+"]deactivate 连接断开,请重新登录！"
				AlertSuperPanelExt.showMsg( "连接断开,请重新登录！", Mgr.layerMgr.alertLayer, false, flushPage); 			
			}		
		}
		
		/**
		 * 重新连接 
		 */		
		public function reconnect( useProxy:Boolean = false ):void
		{
			_isReconnect = true;
			if ( _socket != null && _socket.connected )
			{
				_socket.close();
				//DebugFunction.traceCheckDbg("重连");
				_socket = null;
			}
			
			_isSocket5 = useProxy;
			//Mgr.loginMgr.showlogin();
		}
		
		/**
		 * 页面跳转 
		 */		
		public function flushPage():void
		{
			ExternalInterface.call( "setcloseunloadmsg" );
			//navigateToURL( new URLRequest(  WebSiteConfig.WEBSITE_URL ), "_self" );
		}
		
		/**
		 * 与服务器断开连接 
		 */		
		public function closeMe():void
		{
			_socket.close();
			_isReplace = true;
			
			//Mgr.mainApp.filters = [ FilterUtil.getGrayFilter() ];
		}
		
		private function isLoginMsg( msgId:int ):Boolean
		{
			return msgId == 100202 || msgId == 100201 || msgId == 100205 || msgId == 100209;
		}
		
		private var sendCrossHash:HashMap;
		
		private function initCrossHash():void
		{
			sendCrossHash = new HashMap();
			//战斗
			var i:int;
			for( i = 102201; i <= 102208; i++ )
				sendCrossHash.put( i, 1 );
			//移动
			for( i = 101201; i <= 101215; i++ )
				sendCrossHash.put( i, 1 );
			
			//心跳
			sendCrossHash.put( 100204, 1 );
			
			//加载完成
			sendCrossHash.put( 100203, 1 );
			
			//复活 挂机
			for( i = 103201; i <= 103205; i++ )
				sendCrossHash.put( i, 1 );
			
			//查看他人
			sendCrossHash.put( 103210, 1 );
			
			//窗口改变
			sendCrossHash.put( 103211, 1 );
			
			//包裹操作
			sendCrossHash.put( 108209, 1 );
			sendCrossHash.put( 108211, 1 );
			
			//打坐
			for( i = 136201; i <= 136204; i++ )
				sendCrossHash.put( i, 1 );
			
			//上下马
			sendCrossHash.put( 144203, 1 );
			
			//GM
			sendCrossHash.put( 200201, 1 );
			
			//roll点
			sendCrossHash.put( 210201, 1 );
			
			//跨服登录
			sendCrossHash.put( 250201, 1 );
			
			//跨服退出
			sendCrossHash.put( 250202, 1 );
			
			//侍宠坐骑攻击
			sendCrossHash.put( 102208, 1 );
			sendCrossHash.put( 102209, 1 );
			
			//boss传送  跨服中不允许使用
			sendCrossHash.put( 101210, -1 );
			sendCrossHash.put( 101216, -1 );
		}
		
		private function checkUseCrossServer( msg:Message ):int
		{
			var isCross:int = 0;
//			if( isCrossSocket )
//			{
//				var msgId:int = msg.getId();
//				if( sendCrossHash.get( msgId ) )
//					isCross = sendCrossHash.get( msgId );
//				if( msgId == 112201 )
//				{
//					var type:int = (msg as ReqChatMessage).type;
//					if( type == EnumChatChannelType.PRIVATE )
//						isCross = 2;
//					else if( type == EnumChatChannelType.NORMAL )
//						isCross = 1;
//				}
//				else if( msgId == 108203 )
//				{
//					var item:Item = Mgr.backpackMgr.getItemById( (msg as ReqUseItemMessage).itemId );
//					var q_item:Q_item = Mgr.gameDataMgr.getItemModel( item.itemModelId );
//					if( ItemUtil.isMedical( q_item.q_type ) || q_item.q_type == EnumItemType.ADDBUFF )
//						isCross = 1;
//				}
//			}
			return isCross;
		}
		
		/**
		 * 发送消息 
		 */		
		public function send( msg:Message ):Boolean 
		{
//			if ( StoryMgr.Ins.isStoryType(StoryUtil.STORY_CREATE) )//哎呀呀，这里加return真蛋疼，除了这个不能再加了,目前仅创角动画return
//				return false;
			
			if ( !_isConnected )
				return false;
			
			var isCross:int = checkUseCrossServer( msg );
			
			if( isCross == -1 )
				return false;
			
			++_sendMsgCnt;
			
			if ( _msgTypeMap[ msg.getId() ] == null )
				_msgTypeMap[ msg.getId() ] = 0;
			
			_msgTypeMap[ msg.getId() ] = ( int( _msgTypeMap[ msg.getId() ] ) + 1 ); 
			
			if ( ( getTimer() - _lastCheckMsgCntTime ) > 1000 )
			{	
				_lastCheckMsgCntTime = getTimer();
				
				if ( _sendMsgCnt >= 15 )
				{
					var strLog:String = "";
					for ( var key:* in _msgTypeMap )
					{
						var count:int = int( _msgTypeMap[key] );
						strLog += ( "每秒消息量过大 id:" + key + " count:" + count );
                        if (count > _maxMsgCnt)
                        {
                            _maxMsgCnt = count;
                            _maxCntMsgType = key;
                        }
					}
                    if (_maxCntMsgType != 0)
                    {
					    ToolBase.Log( "每秒消息量过大 第一名：" + _maxCntMsgType.toString() + "数量:" + _maxMsgCnt.toString());
                        _maxCntMsgType = 0;
                        _maxMsgCnt = 0;
                    }
					ToolBase.Log( strLog );
				}
				
				_msgTypeMap = new Dictionary();
				_sendMsgCnt = 0;
			}
			
			if ( _sendMsgCnt >= 20 )
            {
				ToolBase.Log( "每秒消息量过大 抛弃消息发送:" + getQualifiedClassName(msg));
				return false;
            }
			
			sendMsg( msg, isCross == 1 );
			//私聊双向发送
			if( isCrossSocket && isCross == 2 )
				sendMsg( msg, true )
			return true;
		}
		
		private function sendMsg( msg:Message, isCross:Boolean ):void
		{
			var sendMsgNum:int;
			if( isCross )
			{
				if( _crossMsgNum == 0 && msg.getId() != 250201 )	//跨服登录消息
				{
					return;
				}
				sendMsgNum = _crossMsgNum;
			}
			else
			{
				if( ( !Mgr.loginMgr.isLoginSuccess || orgSendMsgNum == 0 ) && !isLoginMsg( msg.getId() ) )
				{
					return;
				}
				sendMsgNum = orgSendMsgNum;
			}
			
			var bytes:ByteArray = new ByteArray();
			bytes.writeInt( sendMsgNum );
			// 写入消息id
			bytes.writeInt( msg.getId() );
			
			bytes.writeInt( sendMsgNum == 0 ? 0 : Mgr.loginMgr.serverTimeCheck );
			// 序列化消息体
			msg.write( bytes );
			//			Mgr.logMgr.addClientLog( "发送消息:  " + orgSendMsgNum + " ----> " + msg.getId() );
			// 写入消息号
			bytes.position = 0;
			var magicValue:int = ( (~sendMsgNum & ( bytes.length ) ) | ( sendMsgNum & ~( bytes.length ) ) );
			
			magicValue = ( ( ~magicValue & ( 1 << 9 ) ) | ( magicValue & ~( 1 << 9 ) ) );
			
			bytes.writeInt( magicValue );
			
			var sendbuff:ByteArray = new ByteArray();
			// 写入消息长度
			sendbuff.writeInt( bytes.length );
			// 写入消息
			sendbuff.writeBytes( bytes );
			
			if ( isCross )
			{
				_crossMsgNum++;
				var len:int = crossSocket.bytesAvailable; 
				crossSocket.writeBytes( sendbuff );
				crossSocket.flush();
			}
			else
			{
				// 发送序列
				if ( _isSocket5 )
					_socket.send( sendbuff );
				else
				{
					_socket.writeBytes( sendbuff );
					_socket.flush();	
				}
				_orgSendMsgNum++;
			}
		}
		
		/**
		 * 连接回调 
		 */		
		protected function connectHandler( event:Event = null ):void
		{
			trace( "连接时间:" + ( getTimer() - _connectTime ) );
			if ( !_isSocket5 )
				_socket.removeEventListener( Event.CONNECT, connectHandler );
			clearCorssSocket();
			_isConnected = true;
			//Mgr.logMgr.addClientLog( "连接成功" );
			_orgSendMsgNum = 0;
			//Mgr.mainApp.resetServerTimeCheck();
			dispatchEvent( new GameEvent( CLIENT_CONNECT_TO_SERVER ) );
		}
		
		/**
		 * 错误回调 
		 */		
		protected function errorHandler( event:* ):void
		{
			var str:String = "";
			if ( event is SecurityErrorEvent )
			{
				_isConnected = false;
				dispatchEvent( new GameEvent( CLIENT_FAILD_TO_SERVER, event.text ) );
				
			}
			else if ( event is IOErrorEvent )
			{
				_isConnected = false;
				
				
				dispatchEvent( new GameEvent( CLIENT_FAILD_TO_SERVER, event.text ) );

			}
		}
		
		/**
		 * 关闭回调 
		 */		
		protected function closeHandler( event:Event ):void
		{
			clearOrgSocket();
//			if ( Mgr.pubLoginMgr.isCrossState )
//			{
//				DebugFunction.traceCheckDbg("完成跨服连接。。。");
//			}
//			else
			{
//				Mgr.mainApp.cacheAsBitmap = true;
//				Mgr.sceneMgr.removeEvent();
//				Mgr.mainApp.filters = [ FilterUtil.getGrayFilter() ];
				
				_isConnected = false;
				dispatchEvent( new GameEvent( CLIENT_FAILD_TO_SERVER, event.toString() ) );
				if ( !_isReconnect )
				{
					if ( !Mgr.messageMgr.isReplace )
					{
						//ReconnectPanexlExt.singleton.showPanel(30, "【连接close】");
						//暂时弹框 没filter了
						AlertSuperPanelExt.showMsg("服务器连接断开", Mgr.layerMgr.alertLayer, false);
					}
					else
					{
//						AlertSuperPanelExt.showMsg( TextUtil.changeDateToDateStr( new Date() ) 
//							+ "您的账号在IP:[" 
//							+ _replaceIP 
//							+ "]处登录上线了", 
//							Mgr.layerMgr.alertLayer, 
//							false, 
//							flushPage 
//						);
					}
				}
			}
		}
		
		/**
		 * 创建套接字并连接 
		 */		
		private function createSocketAndConnect():void
		{
			clearOrgSocket();
			if ( _isSocket5 )
			{
				_socket = new Socket5( GameConfig.GAME_SERVER_IP, GameConfig.GAME_SERVER_PORT );
				_socket.setHandler( connectHandler, recvBytes, errorHandler, closeHandler );
				_socket.connect( GameConfig.PROXY_SERVER_IP, GameConfig.PROXY_SERVER_PORT, GameConfig.PROXY_SERVER_USER, GameConfig.PROXY_SERVER_PWD );
			}
			else
			{
				_socket = new Socket();
				_socket.addEventListener( Event.CONNECT, connectHandler );
				_socket.addEventListener( IOErrorEvent.IO_ERROR, errorHandler );
				_socket.addEventListener( SecurityErrorEvent.SECURITY_ERROR, errorHandler );
				_socket.addEventListener( Event.CLOSE, closeHandler, false, 0, true );
				_socket.addEventListener( ProgressEvent.SOCKET_DATA, recv );
				_socket.connect( GameConfig.GAME_SERVER_IP, GameConfig.GAME_SERVER_PORT );	
			}
			_connectTime = getTimer();
		}
		
		public function connctOldServer():void
		{
			createSocketAndConnect();
		}

		/**
		 * 接收消息 
		 */		
		private function recv( event:Event ):void
		{
			if ( !_isConnected )
				return;
			
			var bytes:ByteArray = new ByteArray();
			if( _socket != null )
				_socket.readBytes( bytes );
			recvBytes( bytes );
		}
		
		/**
		 * 接收跨服消息 
		 */		
		private function recvCross( event:Event ):void
		{
			if ( !_isConnected )
				return;
			
			var bytes:ByteArray = new ByteArray();
			if( crossSocket != null )
				crossSocket.readBytes( bytes );
			recvCrossBytes( bytes );
		}
		
		/**
		 * 接收消息
		 */		
		private function recvBytes( bytes:ByteArray ):void
		{
			var remainBytes:ByteArray = null;
			var actionArray:Vector.< Handler > = new Vector.< Handler >();
			
			_msgBuff.position = _remainBytesCnt;
			_msgBuff.writeBytes( bytes );
			_msgBuff.position = 0;
			_remainBytesCnt = _msgBuff.bytesAvailable;
			
			while ( true ) 
            {
				if ( _remainBytesCnt >= 4 ) 
                {
					// 读取信息长度
					var length:int = _msgBuff.readInt();
					
					//     ff  			ffffff
					// 是否压缩(0,1)     长度
					var flag:int = ( ( length >> 24 ) & 0xff );
					length = ( length & 0x00ffffff );
					
					// 用来防止客户端服务器消息名字匹配，但消息长度不匹配 
                    if ( length > 10000 )
                    {
						// 异常情况
                    }
					
					if ( _remainBytesCnt >= length + 4 )
					{
						// 取出消息id
						var id:int = _msgBuff.readInt();
						var message:Message = msgObjPool.getMessage( id );
						var isPass:Boolean = false;
						
                        if ( message == null )
                        {
                            ToolBase.LogError( "客户端缺少消息 " + id + "上一个消息:" + _lastMsgID );
                            isPass = true;
                        }
                        else
                        {
                            _lastMessageName = DebugUtil.getObjectNameStr( message );
							//ToolBase.LogError( "客户端处理消息 " + id + " : " + _lastMessageName );
                        }
						
						_lastMsgID = id;
                        
                        if ( isPass )
                        {
                            var bytespass: ByteArray = new ByteArray();
							var readLen:int = length - 4; 
							if ( readLen > 0 )
                            	_msgBuff.readBytes( bytespass, 0, readLen );

                            // 缓存为空
							_remainBytesCnt = _msgBuff.bytesAvailable;
                            if ( _remainBytesCnt == 0 ) 
							{
                                _msgBuff.clear();
                                break;
                            }
							else
							{
                                continue;
                            }
                        }

						// 反序列化消息
						try 
                        {
							var bytesMsg:ByteArray = new ByteArray();
							var readMsgLen:int = length - 4; 
							if ( readMsgLen > 0 )
							{
								_msgBuff.readBytes( bytesMsg, 0, readMsgLen );
								
								// 如果存在压缩则解压
								if ( flag == 1 )
									bytesMsg.uncompress();
							}
							
							message.read( bytesMsg );

							if ( bytesMsg.bytesAvailable > 0 )
							{
//								AlertSuperPanelExt.showMsg( "客户端与服务器不匹配！！！");
								var msginfo:String = "消息错误信息：" + " length:" + length + "  remain: " + _remainBytesCnt + " buf.length:" + _msgBuff.length + " id:" + message.getId();
								AlertSuperPanelExt.showMsg(msginfo, Mgr.layerMgr.alertLayer );
								ToolBase.LogError(msginfo);
								
								//if( _socket != null )
								//	_socket.close();
								//return;
								
								_remainBytesCnt = _msgBuff.bytesAvailable;
								continue;
							}
						} 
                        catch ( error:Error )
                        {
							var loginfo:String = "客户端与服务器不匹配！！！"+"消息错误信息：" + " length:" + length + "  remain: " + _remainBytesCnt + " buf.length:" + _msgBuff.length + " id:" + _lastMsgID;
//                            if ( DebugUtil.IS_MESSAGE_SHOW && Mgr.chatMgr != null )
//                            {
//                                Mgr.chatMgr.addAllHtmlChat( TextUtil.getHtmlStr( loginfo, TextUtil.SYS_RED ) );
//                            }
							ToolBase.LogError(loginfo);
							
							AlertSuperPanelExt.showMsg( loginfo, Mgr.layerMgr.alertLayer );
							
							_remainBytesCnt = _msgBuff.bytesAvailable;
							continue;
//							if( _socket != null )
//								_socket.close();
//							return;
						}

						//DebugUtil.addMessageInfo( message );

						// 获取处理handler
						var handler:Handler = msgObjPool.getHandler( id );
						handler.message = message;
						actionArray.push( handler );
						
						_remainBytesCnt = _msgBuff.bytesAvailable;
					}
					else 
					{
						_msgBuff.position = _msgBuff.position - 4;
						remainBytes = new ByteArray();
						remainBytes.writeBytes( _msgBuff, _msgBuff.position );
						_msgBuff = remainBytes;
						break;
					}
				} 
				else 
				{
					remainBytes = new ByteArray();
					remainBytes.writeBytes( _msgBuff, _msgBuff.position );
					_msgBuff = remainBytes;
					break;
				}
				
				// 缓存为空
				if ( _remainBytesCnt == 0 )
				{
					_msgBuff.clear();
					break;
				}
			}
			
			// 统计每秒消息数
			if ( getTimer() - _msgPerSecondTime > 1000 )
			{
				_msgPerSceCount = 0;
				_msgPerSecondTime = getTimer();
			}
			
			_msgPerSceCount += actionArray.length;
			
			for each ( var handlerMsg:Handler in actionArray )
			{
            	if ( Mgr.mainPlayer == null )
				{
					var msgId:int = handlerMsg.message.getId();
					if ( int( msgId / 1000 ) != 100 && msgId != 103101 && msgId != 200101 )
					{
						ToolBase.LogError( "玩家未初始化，忽略消息:" +  msgId + ":" + DebugUtil.getObjectNameStr( handlerMsg.message ) );
						continue;
					}
				}
				
                var beginTime:int = getTimer();
				
				try
				{
					handlerMsg.action();
				}
				catch( e:Error )
				{
//					ToolBase.LogError(e.getStackTrace());
					ToolBase.LogErrorAndDebug(e.getStackTrace());
					//DebugFunction.traceCheckDbg( e.getStackTrace() );
					//Mgr.logMgr.addClientLog( e.getStackTrace() );
				}
                var delta:int = getTimer() - beginTime;
				
                if ( delta > 100 )
                {
					var msgName:String = null;
                    if ( msgName == null && handlerMsg != null )
                        msgName = getQualifiedClassName( handlerMsg );
					
                   // Mgr.logMgr.addClientLog( "[消息处理 Time]  单个函数超时"  + msgName + "  " + delta.toString() + "当前长度" + actionArray.length );
                }
			}
		}
		
		/**
		 * 接收消息
		 */		
		private function recvCrossBytes( bytes:ByteArray ):void
		{
			var remainBytes:ByteArray = null;
			var actionArray:Vector.< Handler > = new Vector.< Handler >();
			
			_msgCrossBuff.position = _remainCrossBytesCnt;
			_msgCrossBuff.writeBytes( bytes );
			_msgCrossBuff.position = 0;
			_remainCrossBytesCnt = _msgCrossBuff.bytesAvailable;
			
			while ( true ) 
			{
				if ( _remainCrossBytesCnt >= 4 ) 
				{
					// 读取信息长度
					var length:int = _msgCrossBuff.readInt();
					
					//     ff  			ffffff
					// 是否压缩(0,1)     长度
					var flag:int = ( ( length >> 24 ) & 0xff );
					length = ( length & 0x00ffffff );
					
					// 用来防止客户端服务器消息名字匹配，但消息长度不匹配 
					if ( length > 10000 )
					{
						// 异常情况
					}
					
					if ( _remainCrossBytesCnt >= length + 4 )
					{
						// 取出消息id
						var id:int = _msgCrossBuff.readInt();
						var message:Message = msgObjPool.getMessage( id );
						var isPass:Boolean = false;
						
						if ( message == null )
						{
							//Trace.tjl( "客户端缺少消息 " + id + "上一个消息:" + _lastMsgID );
							isPass = true;
						}
						else
						{
							_lastMessageName = DebugUtil.getObjectNameStr( message );
						}
						
						_lastMsgID = id;
						
						if ( isPass )
						{
							var bytespass: ByteArray = new ByteArray();
							var readLen:int = length - 4; 
							if ( readLen > 0 )
								_msgCrossBuff.readBytes( bytespass, 0, readLen );
							
							// 缓存为空
							_remainCrossBytesCnt = _msgCrossBuff.bytesAvailable;
							if ( _remainCrossBytesCnt == 0 ) 
							{
								_msgCrossBuff.clear();
								break;
							}
							else
							{
								continue;
							}
						}
						
						// 反序列化消息
						try 
						{
							var bytesMsg:ByteArray = new ByteArray();
							var readMsgLen:int = length - 4; 
							if ( readMsgLen > 0 )
							{
								_msgCrossBuff.readBytes( bytesMsg, 0, readMsgLen );
								
								// 如果存在压缩则解压
								if ( flag == 1 )
									bytesMsg.uncompress();
							}
							
							message.read( bytesMsg );
							
							if ( bytesMsg.bytesAvailable > 0 )
							{
								//								AlertSuperPanelExt.showMsg( "客户端与服务器不匹配！！！");
								AlertSuperPanelExt.showMsg( "跨服：消息错误信息：" + " length:" + length + "  remain: " + _remainCrossBytesCnt + " buf.length:" + _msgCrossBuff.length + " id:" + message.getId(), Mgr.layerMgr.alertLayer );
								if( crossSocket != null )
									crossSocket.close();
								return;
							}
						} 
						catch ( error:Error )
						{
							var loginfo:String = "跨服：客户端与服务器不匹配！！！"+"消息错误信息：" + " length:" + length + "  remain: " + _remainCrossBytesCnt + " buf.length:" + _msgCrossBuff.length + " id:" + _lastMsgID;
							//                            if ( DebugUtil.IS_MESSAGE_SHOW && Mgr.chatMgr != null )
							//                            {
							//                                Mgr.chatMgr.addAllHtmlChat( TextUtil.getHtmlStr( loginfo, TextUtil.SYS_RED ) );
							//                            }
							
							AlertSuperPanelExt.showMsg( loginfo, Mgr.layerMgr.alertLayer );
							if( crossSocket != null )
								crossSocket.close();
							return;
						}
						
						//DebugUtil.addMessageInfo( message );
						
						// 获取处理handler
						var handler:Handler = msgObjPool.getHandler( id );
						handler.message = message;
						actionArray.push( handler );
						
						_remainCrossBytesCnt = _msgCrossBuff.bytesAvailable;
					}
					else 
					{
						_msgCrossBuff.position = _msgCrossBuff.position - 4;
						remainBytes = new ByteArray();
						remainBytes.writeBytes( _msgCrossBuff, _msgCrossBuff.position );
						_msgCrossBuff = remainBytes;
						break;
					}
				} 
				else 
				{
					remainBytes = new ByteArray();
					remainBytes.writeBytes( _msgCrossBuff, _msgCrossBuff.position );
					_msgCrossBuff = remainBytes;
					break;
				}
				
				// 缓存为空
				if ( _remainCrossBytesCnt == 0 )
				{
					_msgCrossBuff.clear();
					break;
				}
			}
			
			// 统计每秒消息数
			if ( getTimer() - _msgPerSecondTime > 1000 )
			{
				_msgPerSceCount = 0;
				_msgPerSecondTime = getTimer();
			}
			
			_msgPerSceCount += actionArray.length;
			
			for each ( var handlerMsg:Handler in actionArray )
			{
				if ( Mgr.mainPlayer == null )
				{
					var msgId:int = handlerMsg.message.getId();
					if ( int( msgId / 1000 ) != 100 && msgId != 103101 && msgId != 200101 )
					{
						//Trace.tjl( "跨服：玩家未初始化，忽略消息:" +  msgId + ":" + DebugUtil.getObjectNameStr( handlerMsg.message ) );
						continue;
					}
				}
				
				var beginTime:int = getTimer();
				
				try
				{
					handlerMsg.action();
				}
				catch( e:Error )
				{
					//DebugFunction.traceCheckDbg( e.getStackTrace() );
					//Mgr.logMgr.addClientLog( e.getStackTrace() );
				}
				var delta:int = getTimer() - beginTime;
				
				if ( delta > 100 )
				{
					var msgName:String = null;
					if ( msgName == null && handlerMsg != null )
						msgName = getQualifiedClassName( handlerMsg );
					
					//Mgr.logMgr.addClientLog( "[消息处理 Time]  跨服：单个函数超时"  + msgName + "  " + delta.toString() + "当前长度" + actionArray.length );
				}
			}
		}
		
		/**
		 * 开始跨服连接 
		 * 
		 */
		public function connectCrossServer():void
		{
			if (crossSocket == null)
			{
//				var policyPath:String = "xmlsocket://" + Mgr.crossMgr.crossIP + ":" +  Mgr.crossMgr.crossSSLPort;
//				Security.loadPolicyFile( policyPath );
//				Mgr.logMgr.addClientLog("连接跨服服务器:" + Mgr.crossMgr.crossIP + ":" +  Mgr.crossMgr.crossPort );
//				crossSocket = new Socket();
//				crossSocket.timeout = 10000;
//				crossSocket.addEventListener(Event.CONNECT, corssconnectHandler);
//				crossSocket.addEventListener(IOErrorEvent.IO_ERROR, corssioErrorHandler);
//				crossSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, corsssecurityErrorHandler);
//				crossSocket.addEventListener(Event.CLOSE, corsscloseHandler, false, 0, true );
//				crossSocket.addEventListener(ProgressEvent.SOCKET_DATA, recvCross);
			}
			
			//crossSocket.connect( Mgr.crossMgr.crossIP, Mgr.crossMgr.crossPort);
		}
		
		protected function corsscloseHandler(event:Event):void
		{
			clearCorssSocket();
//			dispatchEvent(new Event(PubLoginMgr.CROSS_CONNECT_ERROR));
//			
//			if( !Mgr.pubLoginMgr.isCrossState )
			{
//				Mgr.mainApp.cacheAsBitmap = true;
//				Mgr.sceneMgr.removeEvent();
//				Mgr.mainApp.filters = [ FilterUtil.getGrayFilter() ];
//				
//				dispatchEvent( new GameEvent( CLIENT_FAILD_TO_SERVER, event.toString() ) );
//				if ( !_isReconnect )
//				{
//					if ( !Mgr.messageMgr.isReplace )
//					{
////						ReconnectPanexlExt.singleton.showPanel(30, "【连接close】");
//					}
//					else
//					{
//						AlertSuperPanelExt.showMsg( TextUtil.changeDateToDateStr( new Date() ) 
//							+ "您的账号在IP:[" 
//							+ _replaceIP 
//							+ "]处登录上线了", 
//							Mgr.layerMgr.alertLayer, 
//							false, 
//							flushPage 
//						);
//					}
//				}
			}
		}
		
		protected function corsssecurityErrorHandler(event:SecurityErrorEvent):void
		{
//			Mgr.logMgr.addClientLog("安全错误 跨服断开" );
////			AlertSuperPanelExt.showMsg( event.text );
//			clearCorssSocket();
//			if( Mgr.crossMgr.crossTimes > 0 )
//			{
//				Mgr.logMgr.addClientLog("跨服连接失败次数倒数:" + Mgr.crossMgr.crossTimes + '   ' + event.text);
//				Mgr.crossMgr.crossTimes--;
//				connectCrossServer();
//			}
//			else
//			{
//				var str:String = "【SecurityError】";
//				str += "\n端口：" + Mgr.crossMgr.crossPort;
//				str += "\n安全端口：" + Mgr.crossMgr.crossSSLPort;
//				str += "\nIP：" +Mgr.crossMgr.crossIP;
//				AlertSuperPanelExt.showMsg( str );
//				dispatchEvent(new Event(CrossMgr.CROSS_CONNECT_ERROR));
//			}
		}
		
		protected function corssioErrorHandler(event:IOErrorEvent):void
		{
//			Mgr.logMgr.addClientLog("io错误 跨服断开"); 
//			clearCorssSocket();
//			if( Mgr.crossMgr.crossTimes > 0 )
//			{
//				Mgr.logMgr.addClientLog("跨服连接失败次数倒数:" + Mgr.crossMgr.crossTimes + '   ' + event.text);
//				Mgr.crossMgr.crossTimes--;
//				connectCrossServer();
//			}
//			else
//			{
//				dispatchEvent(new Event(CrossMgr.CROSS_CONNECT_ERROR));
//			}
		}
		
		protected function corssconnectHandler(event:Event):void
		{
//			Mgr.logMgr.addClientLog("连接跨服服务器成功" );
//			isCrossSocket = true;
//			_crossMsgNum = 0;
//			Mgr.mainApp.resetServerTimeCheck();
//			Mgr.mainApp.filters = null;
//			dispatchEvent(new Event(CrossMgr.CROSS_CONNECT_OK));
		}		
		
		public function clearOrgSocket():void
		{
			if( _socket != null )
			{
				if ( !_isSocket5 )
				{
					_socket.removeEventListener( Event.CLOSE, closeHandler );
					_socket.removeEventListener( IOErrorEvent.IO_ERROR, errorHandler );
					_socket.removeEventListener( ProgressEvent.SOCKET_DATA, recv );	
					_orgSendMsgNum = 0;
				}
				_socket.close();
				_socket = null;
			}
			//Mgr.loginMgr.isLoginSuccess = false;
		}
		
		public function clearCorssSocket():void
		{
			if (crossSocket != null)
			{
				crossSocket.close();
				crossSocket.removeEventListener(Event.CONNECT, corssconnectHandler);
				crossSocket.removeEventListener(IOErrorEvent.IO_ERROR, corssioErrorHandler);
				crossSocket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, corsssecurityErrorHandler);
				crossSocket.removeEventListener(Event.CLOSE, corsscloseHandler);
				crossSocket.removeEventListener(ProgressEvent.SOCKET_DATA, recvCross);
				crossSocket = null;
				_crossMsgNum = 0;
				isCrossSocket = false;
			}
			//Mgr.loginMgr.isCrossSuccess = false;
		}

		/** 发送的消息数量 **/
		public function get sendMsgCnt():int
		{
			return _sendMsgCnt;
		}

	}
}
