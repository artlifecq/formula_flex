package org.game.netCore.net
{
	import com.gameClient.utils.JSONUtil;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import org.game.netCore.event.NetEvent;

	/**
	 * 端口检查 
	 * @author NEIL
	 * 
	 */
	public class PortChecker extends EventDispatcher
	{
		private var _ports:Array = [];
		private var _curPort:int = 8000;
		
		private var curTestSocket:Socket;
		private var _configIP:String = '';
		
		public var ip:String;
		public var isdebug:Boolean = false;
		
		private var runDefault:Boolean = true;
		private var onlyOnce:Boolean = true;
		
		function PortChecker()
		{
			
		}

		public function startTest(ip:String,ports:Array):void
		{
			this.ip = ip;
			ports = ports || []; 
			_ports = _ports.concat(ports);
			
			doTest(_ports.shift());
		}
		
		public function start(ip:String,portArr:Array):void
		{
			this.ip = ip;
			runDefault = false;
			onlyOnce = true;
			startTest(ip,portArr);
		}
		
		/**
		 * 从端口号列表中找到可以连接的 
		 * @param ports
		 * @return 
		 * 
		 */
		private function doTest(port:int):void
		{
			_curPort = port;
			
			clearSocket();
			
			curTestSocket = new Socket();
			curTestSocket.timeout = 5000;
			curTestSocket.addEventListener(Event.CONNECT, connectHandler);
			curTestSocket.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			curTestSocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
			curTestSocket.connect(ip, _curPort);
		}
		protected function errorHandler(event:Event):void
		{
			if (event.target == curTestSocket)
			{
				if (_ports.length == 0)
				{
					if(onlyOnce){
						if(runDefault)
						{
							getIpMsg();						
						}else{
							var evt:NetEvent = new NetEvent(NetEvent.GAME_CHANGE_IP);
							var obj:Object = new Object()
							obj.type = '连接服务器失败twice,请检测服务器IP/端口';
							evt.data = obj;
							dispatchEvent(evt);
						}
						onlyOnce = false;
					}
					
					//_curPort = 8000;
					//noticeOk();
					//dispatchEvent(new GameEvent(GameEvent.GAME_CHANGE_IP));
								
				}
				else
				{
					doTest(_ports.shift());
				}
			}
		}
		
		protected function connectHandler(event:Event):void
		{
			noticeOk();
		}
		
		private function noticeOk():void
		{
			clearSocket();
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		private function clearSocket():void
		{
			if (curTestSocket != null)
			{
				if(curTestSocket.connected)
					curTestSocket.close();
				curTestSocket = null;
			}
		}
		
		public function get curPort():int
		{
			return _curPort;
		}
		
		private function getIpMsg():void
		{
			var nodse:PortChecker = this;
			var url:String="http://qmrcdn.moloong.com/dns2ip/dns2ip.php?domain=" + String(this.ip) ;
			
			var _request:URLRequest=new URLRequest();
			_request.url=url;
			_request.method=URLRequestMethod.GET;
			
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,completeHandler);
			var obj:Object = new Object();
			var evt:NetEvent;
			function completeHandler(e:Event):void
			{
				var data:* = JSONUtil.decode(e.target.data);
				if(true)
				{
					if(data.debug_svrip == null || data.debug_svrip == '')
					{
						evt = new NetEvent(NetEvent.GAME_CHANGE_IP);
						obj.type ="获取ip失败"; 
					}
					else
					{
						evt = new NetEvent(NetEvent.GAME_CHANGE_IP);
						_configIP = this.ip;
						obj.oldIP = _configIP;
						obj.newIP = data.debug_svrip;
						obj.type = '0';
						this.ip = data.debug_svrip;	
					}
				}
				else
				{
					if(data.ip == null || data.ip == '')
					{
						evt = new NetEvent(NetEvent.GAME_CHANGE_IP);
						obj.type = "获取ip失败";
					}
					else
					{
						evt = new NetEvent(NetEvent.GAME_CHANGE_IP);
						_configIP = this.ip;
						obj.oldIP = _configIP;
						obj.newIP = data.ip;
						obj.type = '0';
						this.ip = data.debug_svrip;
					}
				}
				evt.data = obj;
				nodse.dispatchEvent(evt);
			}
			
			function getIpErrHandler(event:Event):void
			{
				evt = new NetEvent(NetEvent.GAME_CHANGE_IP);
				obj.type = "连接服务器失败使用的php地址请求无返回"; 
				evt.data = obj;
				nodse.dispatchEvent(evt);
				//AlertSuperPanelExt.showMsg( "[获取ip失败：" + errorInfo +  "]",  Mgr.layerMgr.alertLayer, true);
			}
			
			loader.addEventListener(ErrorEvent.ERROR, getIpErrHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR , getIpErrHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, getIpErrHandler);
			loader.load(_request);
		}
	}
}