package com.client.ui.alert
{
	import com.client.sender.LoginSender;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.mainCore.core.timer.GameTimer;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	
	import org.game.netCore.connection.SocketConnection;
	import org.mokylin.skin.loading.AlertSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class ReconnectionPanelExt extends Sprite
	{
		private var _skin:AlertSkin; 
		private static var _ins:ReconnectionPanelExt;
		
		private var _str:String="掉线时不会获得任何收益喔";
		private var trySocket:Socket = null;
		private var tryCount:int = 0;
		private var maxTryCount:int = 10;
		
		private var _time:int=5;
		private var _timer:GameTimer;
		public function ReconnectionPanelExt()
		{
			_skin = new AlertSkin();
			_skin.toSprite(this);
			_skin.btnClose.visible=false;
			_skin.btnCancel.visible=false;
			_skin.btnOk.x=155;
			this.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		protected function onTouch(e:TouchEvent):void
		{
			var t:Touch = e.getTouch(this, TouchPhase.ENDED);
			if(t != null && t.target != null)
			{
				onTouchTarget(t.target);
			}
		}
		
		protected function onTouchTarget(target : DisplayObject) : void
		{
			switch (target)
			{
				case _skin.btnOk:
					btnReconnectionHandler();
					break;
			}
		}
		
		public static function Show():void
		{
			if(!_ins) _ins = new ReconnectionPanelExt();
			_ins.tryCount=0;
			_ins.ShowPanel();
			_ins.showText();
			Stage3DLayerManager.starlingLayer.getLayer("alert").addChild(_ins);
			_ins.x = int((_ins.stage.stageWidth - _ins.width) / 2);
			_ins.y = int((_ins.stage.stageHeight - _ins.height) / 2);
		}
		
		public function ShowPanel():void
		{		
		
			if(_time>0)
			{
				if(_timer!=null) _timer.destroy();
				_timer=new GameTimer("ReconnectionPanelExt",1000,0,onTimer);
				_timer.start();	
			}
		}
		
		public function showText():void
		{
			_skin.lbTip.text=_str+"\r\n"+_time+"s后自动重连";
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			if(_time>0) 
			{
				_skin.btnOk.label = "确定 ("+_time+"s)";
				_time--;
			}
			else{
				btnReconnectionHandler();
				
			}
		}
		
		private function resetTime():void
		{
			clearTrySocket();
			_time = 5;
			ShowPanel();
		}
		
		protected function clearTrySocket():void
		{
			try
			{
				if (trySocket.connected)
				{
					trySocket.close();
				}
			}
			catch(err:Error)
			{
			}
			finally
			{
				trySocket.removeEventListener(Event.CONNECT,tryConnectHandler);
				trySocket = null;
			}
		}
		
		private function tryReconnect():void{
			if (SocketConnection.messageMgr.isReplace)
			{
				return;
			}
			if (trySocket != null)
			{
				return;
			}
			_timer.stop();
			tryCount++;
			_skin.lbTip.text=_str+"\r\n"+ (((tryCount)>0) ? "(已尝试重连"+ tryCount+"次)" : "");
			trySocket = new Socket();
			trySocket.addEventListener("connect", tryConnectHandler);
			trySocket.addEventListener("ioError", tryIoErrorHandler);
			trySocket.addEventListener("securityError", trySecurityErrorHandler);
			trySocket.addEventListener("close", tryCloseHandler, false, 0, true);
			trySocket.connect(SocketConnection.messageMgr.ip, SocketConnection.messageMgr.port);
		}
		
		protected function btnReconnectionHandler():void
		{
			// TODO Auto-generated method stub	
			_timer.stop();
			if (tryCount > maxTryCount)
			{
				if(this.parent)
				{
					this.parent.removeChild(this);
				}
				//				OpenErrorBackUrl();
				return;
			}
			//顶号，关服,不重连
			if (SocketConnection.messageMgr.isReplace)
			{
				if(this.parent)
				{
					this.parent.removeChild(this);
				}
				//				OpenErrorBackUrl();
				return;
			}
			else
			{
				if (trySocket!=null)
				{
					return;
				}
				else
				{
					tryReconnect();
				}
			}
		}
		
		protected function tryConnectHandler(event:Event):void
		{
			if (!SocketConnection.messageMgr.isReplace)
			{
				SocketConnection.messageMgr.SetSocket(trySocket,0);
				LoginSender.SendLoginMessage(1);
			}
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		protected function tryIoErrorHandler(event:IOErrorEvent):void
		{
			var socket:Socket=event.target as Socket;
			if (socket) 
			{
				socket.removeEventListener(IOErrorEvent.IO_ERROR,tryIoErrorHandler);
			}
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
		
		protected function trySecurityErrorHandler(event:SecurityErrorEvent):void
		{
			var socket:Socket=event.target as Socket;
			if (socket) 
			{
				socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,trySecurityErrorHandler);
			}
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
		
		protected function tryCloseHandler(event:Event):void
		{
			var socket:Socket=event.target as Socket;
			if (socket) 
			{
				socket.removeEventListener(Event.CLOSE,tryCloseHandler);
			}
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
	}
}
