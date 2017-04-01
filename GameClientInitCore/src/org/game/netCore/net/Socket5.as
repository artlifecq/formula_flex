package org.game.netCore.net
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	/**
	 * 代理socket实现
	 * @author masefee
	 * 2013-03-04
	 */
	public class Socket5
	{
		/** 初始状态 **/
		public static const ST_INIT:uint = 0x00;
		/** 检测校验状态 **/
		public static const ST_CHECKING:uint = 0x01;
		/** 登录状态 **/
		public static const ST_LOGIN:uint = 0x02;
		/** 进入状态 **/
		public static const ST_ENTERADDR:uint = 0x03;
		/** 连接完毕状态 **/
		public static const ST_READY:uint = 0x04;
		
		/** 套接字对象 **/
		private var _socket:Socket;
		/** 当前状态 **/
		private var _curStatus:uint;
		/** 发送数据缓存 **/
		private var _dataBuff:ByteArray;
		
		/** 真实地址 **/
		private var _host:String;
		/** 真实端口 **/
		private var _port:uint;
		/** 用户名 **/
		private var _user:String;
		/** 密码 **/
		private var _password:String;
		
		/** 就绪回调 **/
		private var _readyHandler:Function;
		/** 数据回调 **/
		private var _dataHandler:Function;
		/** 错误回调 **/
		private var _errorHandler:Function;
		/** 关闭回调 **/
		private var _closeHandler:Function;
		
		/**
		 * 构造函数
		 * @param host 要连接的真实地址
		 * @param port 要连接的真实端口
		 */
		public function Socket5( host:String, port:uint )
		{
			_host = host;
			_port = port;
			_curStatus = ST_INIT;
			_socket = new Socket();
			_dataBuff = new ByteArray();
			
			_readyHandler = null;
			_dataHandler  = null;
			_errorHandler = null;
			_closeHandler = null;
			
			addListener();
		}
		
		/**
		 * 设置相关毁掉 
		 * @param readyHandler 就绪回调，原型 function():void{}
		 * @param dataHandler  数据回调，原型 function( bytes:ByteArray ):void{}
		 * @param errorHandler 错误回调，原型 function( event:&#42; ):void{}
		 * @param closeHandler 关闭回调，原型 function( event:Event ):void{} 
		 */		
		public function setHandler( readyHandler:Function, dataHandler:Function, errorHandler:Function, closeHandler:Function ):void
		{
			_readyHandler = readyHandler;
			_dataHandler  = dataHandler;
			_errorHandler = errorHandler;	
			_closeHandler = closeHandler;
		}

		/**
		 * 连接指定地址 
		 * @param host 地址
		 * @param part 端口
		 */		
		public function connect( host:String, port:uint, user:String, pwd:String ):void
		{
			_user = user;
			_password = pwd;
			_socket.connect( host, port );
		}
		
		/**
		 * 发送消息 
		 * @param bytes 发送消息序列
		 */		
		public function send( bytes:ByteArray ):void
		{
			if ( _socket.connected )
			{
				if ( _curStatus == ST_READY )
				{
					_socket.writeBytes( bytes );
					_socket.flush();
				}
			}
			else
			{
				_dataBuff.writeBytes( bytes );
			}			
		}
		
		/**
		 * 关闭套接字
		 */		
		public function close():void
		{
			if ( _socket != null && _socket.connected )
			{
				_socket.removeEventListener( Event.CLOSE, closeHandler );
				_socket.removeEventListener( IOErrorEvent.IO_ERROR, errorHandler );
				_socket.removeEventListener( ProgressEvent.SOCKET_DATA, errorHandler );
				
				_socket.close();
				_socket = null;
			}
		}
		
		/**
		 * socket可用字节数
		 */		
		public function get bytesAvailable():uint
		{
			return _socket.bytesAvailable;
		}
		
		/**
		 * 添加相关监听
		 */
		private function addListener():void
		{
			_socket.addEventListener( Event.CONNECT, connectHandler );
			_socket.addEventListener( ProgressEvent.SOCKET_DATA, dataHandler );
			_socket.addEventListener( Event.CLOSE, closeHandler );
			_socket.addEventListener( IOErrorEvent.IO_ERROR, errorHandler );
			_socket.addEventListener( SecurityErrorEvent.SECURITY_ERROR, errorHandler );
		}
		
		/**
		 * 连接回调 
		 */		
		private function connectHandler( event:Event ):void
		{
			_curStatus = ST_CHECKING;
			_socket.removeEventListener( Event.CONNECT, connectHandler );
			
			checkingProxy();
		}
		
		/**
		 * 数据回调 
		 */		
		private function dataHandler( event:ProgressEvent ):void
		{
			var rst:uint = 0;
			var bytes:ByteArray = new ByteArray();

			if ( _curStatus == ST_CHECKING )
			{
				if ( _socket.bytesAvailable < 2 )
					return;
				
				rst = _socket.readShort() & 0x0f;
				
				if ( rst == 0x00 )
				{
					_curStatus = ST_ENTERADDR;
					connectRealAddress();					
				}
				else if ( rst == 0x02 ) // 要求用户名和密码
				{        
					_curStatus = ST_LOGIN;
					login();
				}
				else
				{
					trace( "unknown socket5 result, id: " + rst + ", current state: ST_CHECKING"  );
				}
				
			}
			else if ( _curStatus == ST_LOGIN )
			{
				if ( _socket.bytesAvailable < 2 )
					return;
				
				rst = _socket.readShort() & 0x0f;
				
				if ( rst == 0x00 )
				{
					_curStatus = ST_ENTERADDR;
					connectRealAddress();
				}
				else
				{
					trace( "unknown socket5 result, id: " + rst + ", current state: ST_LOGIN"  );
				}
				
			}
			else if ( _curStatus == ST_ENTERADDR )
			{
				_socket.readBytes( bytes, 0, _socket.bytesAvailable );
				
				rst = bytes.readShort() & 0x0f;
				
				if ( rst == 0x00 ) // success
				{  
					_curStatus = ST_READY;

					rst = bytes.readByte() & 0x0f;
					
					if ( rst == 0x01 ) // ipv4
					{
						
					}
					else if ( rst == 0x03 ) // domain name
					{
						
					}
					else if ( rst == 0x04 ) // ipv6
					{
						
					}
					
					if ( _dataBuff.length > 0 )
					{
						_socket.writeBytes( _dataBuff );
						_socket.flush();
					}
					
					// 这里必须在dataBuff发送之后，确保顺序的正确
					if ( _readyHandler != null )
						_readyHandler();
				}
				else
				{
					// 0x01 普通的SOCKS服务器请求失败
					// 0x02 现有的规则不允许的连接
					// 0x03 网络不可达
					// 0x04 主机不可达
					// 0x05 连接被拒
					// 0x06 TTL超时
					// 0x07 不支持的命令
					// 0x08 不支持的地址类型
					_errorHandler( new IOErrorEvent( IOErrorEvent.NETWORK_ERROR, false, false, "socket5 recv error result, id: " + rst ) );
				}
			}
			else if ( _curStatus == ST_READY )
			{
				_socket.readBytes( bytes, 0, _socket.bytesAvailable );
				if ( _dataHandler != null )
					_dataHandler( bytes );
			}
		}
		
		/**
		 * 关闭回调 
		 */		
		private function closeHandler( event:Event ):void
		{
			_closeHandler( event );
			
			if ( _socket.connected )
				_socket.close();
		}
		
		/**
		 * 错误回调 
		 */		
		private function errorHandler( event:* ):void
		{
			if ( _errorHandler == null )
				_errorHandler( event );
		}
		
		/**
		 * 检测校验代理 
		 */		
		private function checkingProxy( bytes:ByteArray = null ):void
		{
			if ( _curStatus != ST_CHECKING )
				return;
			
			if ( bytes == null )
			{
				bytes = new ByteArray();
				bytes.writeByte( 0x05 );
				bytes.writeByte( 0x02 ); // 支持几种模式
				bytes.writeByte( 0x00 ); // 支持无验证模式
				bytes.writeByte( 0x02 ); // 用户名与密码验证模式
			}

			_socket.writeBytes( bytes );
			_socket.flush();
		}
		
		/** 
		 * 连接真实的网络地址<br>
		 * 
		 * VER CMD  RSV   ATYP  DST.ADDR  DST.PROT <br>
		 *   1   1   0x00    1   Variable     2<br>
		 *<br>
		 * VER:  		version 0x05<br>
		 * CMD:  		CONNECT 0x01, BIND 0x02, UDP_ASSOCIATE 0x03<br>
		 * RSV:  		reserve<br>
		 * ATYP: 		IPV4 0x01, domain name 0x03, IPV6 0x04<br>
		 * DST.ADDR: 	dest address<br>
		 * DST.PORT:    dest port<br>
		 * ATYP:		IPV4 0x01, domain name 0x03, IPV6 0x04<br>
		 */
		private function connectRealAddress():void
		{
			if ( _curStatus != ST_ENTERADDR )
				return;
			
			var reg:RegExp = /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/;
			var arrAddr:Array = reg.exec( _host );
			var bytes:ByteArray = new ByteArray();
			var hostBytes:ByteArray = new ByteArray();
			var hostLen:uint = 0;
			
			bytes.writeByte( 0x05 );
			bytes.writeByte( 0x01 );
			bytes.writeByte( 0x00 );
			
			if ( arrAddr == null )
			{
				bytes.writeByte( 0x03 );
				hostBytes.writeMultiByte( _host, "gb2312" );
				bytes.writeByte( hostBytes.length );
				bytes.writeBytes( hostBytes );
			}
			else
			{
				var tmpad:Array = _host.split( "." );
				
				bytes.writeByte( 0x01 );
				bytes.writeByte( tmpad[ 0 ] );
				bytes.writeByte( tmpad[ 1 ] );
				bytes.writeByte( tmpad[ 2 ] );
				bytes.writeByte( tmpad[ 3 ] );
			}
			
			bytes.writeShort( _port );
			
			_socket.writeBytes( bytes );
			_socket.flush();
		}
		
		/**
		 * 登录到代理服务器
		 * <li>0x01 | 用户名长度（1字节）| 用户名（长度根据用户名长度域指定） | 口令长度（1字节） | 口令（长度由口令长度域指定）
		 */
		private function login():void
		{
			if ( _curStatus != ST_LOGIN )
				return;
			
			var bytes:ByteArray = new ByteArray();
			bytes.writeByte( 0x05 );
			bytes.writeByte( _user.length );
			bytes.writeMultiByte( _user, "gb2312" );
			bytes.writeByte( _password.length );
			bytes.writeMultiByte( _password, "gb2312" );

			_socket.writeBytes( bytes );
			_socket.flush();
		}
	}
}
