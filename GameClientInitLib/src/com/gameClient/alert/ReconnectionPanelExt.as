package com.gameClient.alert
{
	import com.game.mainCore.core.timer.GameTimer;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import feathers.controls.text.Fontter;
	
	import org.game.netCore.net.MessageMgr;
	
	public class ReconnectionPanelExt extends Sprite
	{
		private var perContiainer:DisplayObjectContainer = null;
		private static var _stage:Stage;
		
		private var _title:TextField;
		private var _text:TextField;
		private var _countdownText:TextField;
		private var _texttemp:TextField;
		private var _btnReconnection:Sprite;
		private var _textFormat:TextFormat;
		private var _time:Number;
		
		public var _callBackFunc:Function = null;
		
		private var _timer:GameTimer;
		
		private var trySocket:Socket = null;
		private var tryCount:int = 0;
		private var maxTryCount:int = 10;
		
		private static var _reconnectionPanel:ReconnectionPanelExt=null;
		
		public function ReconnectionPanelExt()
		{
			super();
		}
		
		private function init():void
		{
			this.graphics.clear();
			this.graphics.beginFill( 0x202020, 0.9 );
			this.graphics.drawRect( 0, 0, 350, 265 );
			this.graphics.endFill();
			
			this.graphics.lineStyle( 2, 0x000000 );
			this.graphics.drawRect( 4, 4, 342,  257 );
			
			this.visible=false;
			_btnReconnection=new Sprite();
			
			_textFormat=new TextFormat(Fontter.FONT_Hei);
			_textFormat.size = 16;
			_textFormat.color = 0xdde2b1;
			_textFormat.letterSpacing = 0;
			
			_title=new TextField();
			_title.type=TextFieldType.DYNAMIC;
			_title.selectable = false;
			_title.multiline = false;
			_title.wordWrap =  false;
			_title.defaultTextFormat = _textFormat;
			_title.thickness = Fontter.DEFAULT_THICKNESS;
			_title.embedFonts = true;
			_title.gridFitType = GridFitType.NONE;
			_title.antiAliasType = AntiAliasType.ADVANCED;
			_title.autoSize=TextFieldAutoSize.CENTER;
			_title.width = 100;
			_title.x=this.width/2;
			_title.y=5;
			this.addChild(_title);
			
			_textFormat=new TextFormat(Fontter.FONT_Hei);
			_textFormat.size = 14;
			_textFormat.color = 0xbea757;
			_textFormat.letterSpacing = 0;
			_text=new TextField();
			_text.type=TextFieldType.DYNAMIC;
			_text.selectable = false;
			_text.multiline = false;
			_text.wordWrap =  false;
			_text.defaultTextFormat = _textFormat;
			_text.thickness = Fontter.DEFAULT_THICKNESS;
			_text.embedFonts = true;
			_text.gridFitType = GridFitType.NONE;
			_text.antiAliasType = AntiAliasType.ADVANCED;
			_title.autoSize=TextFieldAutoSize.LEFT;
			_text.width = 320;
			_text.height=100;
			_text.x=15;
			_text.y=40;
			this.addChild(_text);
			
			_textFormat=new TextFormat(Fontter.FONT_Hei);
			_textFormat.size = 12;
			_textFormat.color = 0xbea757;
			_textFormat.letterSpacing = 0;
			_countdownText=new TextField();
			_countdownText.type=TextFieldType.DYNAMIC;
			_countdownText.selectable = false;
			_countdownText.multiline = false;
			_countdownText.wordWrap =  false;
			_countdownText.defaultTextFormat = _textFormat;
			_countdownText.thickness = Fontter.DEFAULT_THICKNESS;
			_countdownText.embedFonts = true;
			_countdownText.gridFitType = GridFitType.NONE;
			_countdownText.antiAliasType = AntiAliasType.ADVANCED;
			_countdownText.autoSize=TextFieldAutoSize.CENTER;
			_countdownText.width = 100;
			_countdownText.x=this.width/2-25;
			_countdownText.y=145;
			this.addChild(_countdownText);
			
			_textFormat=new TextFormat(Fontter.FONT_Hei);
			_textFormat.size = 14;
			_textFormat.color = 0xcfc6ae;
			_textFormat.letterSpacing = 0;
			_btnReconnection.x=this.width/2-25;
			_btnReconnection.y=this.height-50;
			_texttemp = new TextField();
			_texttemp.defaultTextFormat = _textFormat;
			_texttemp.thickness = Fontter.DEFAULT_THICKNESS;
			_texttemp.embedFonts = true;
			_texttemp.gridFitType = GridFitType.NONE;
			_texttemp.antiAliasType = AntiAliasType.ADVANCED;
			_texttemp.text = "确定";
			_texttemp.selectable = false;
			_texttemp.width = _texttemp.textWidth + 5;
			_texttemp.height = _texttemp.textHeight + 5;
			_btnReconnection.addChild( _texttemp );
			this.addChild(_btnReconnection);
			_btnReconnection.addEventListener(MouseEvent.CLICK, btnReconnectionHandler );
		}
		
		private function tryReconnect():void{
			if (MessageMgr.Ins.isReplace)
			{
				return;
			}
			if (trySocket != null)
			{
				return;
			}
			_timer.stop();
			_texttemp.text = "重连中";
			tryCount++;
			_countdownText.text = (((tryCount)>0) ? "(已尝试重连"+ tryCount+"次)" : "");
			trySocket = new Socket();
			trySocket.addEventListener("connect", tryConnectHandler);
			trySocket.addEventListener("ioError", tryIoErrorHandler);
			trySocket.addEventListener("securityError", trySecurityErrorHandler);
			trySocket.addEventListener("close", tryCloseHandler, false, 0, true);
			trySocket.connect(MessageMgr.Ins.ip, MessageMgr.Ins.port);
		}
		
		protected function tryConnectHandler(event:Event):void
		{
			if (!MessageMgr.Ins.isReplace)
			{
				clearTrySocket();
				
				//				reloadMeFunc();
			}
			else
			{
				//				OpenErrorBackUrl();
			}
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
		}
		
		protected function tryIoErrorHandler(event:IOErrorEvent):void
		{
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
		
		protected function trySecurityErrorHandler(event:SecurityErrorEvent):void
		{
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
		
		protected function tryCloseHandler(event:Event):void
		{
			if (event.target == trySocket)
			{
				resetTime();
			}
		}
		
		protected function btnReconnectionHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub	
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
			if (MessageMgr.Ins.isReplace)
			{
				if(this.parent)
				{
					this.parent.removeChild(this);
				}
				//				MCUtil.removeSelf(this);
				//				OpenErrorBackUrl();
				return;
			}
			else
			{
				if (trySocket!=null&&event!=null)
				{
					return;
					//					FloatingText.showUp(TextUtil.FormatStr("已经处于重连状态，请耐心等待"));
				}
				else
				{
					tryReconnect();
				}
			}
		}
		
		//		private function reloadMeFunc():void
		//		{
		//			PlatformUtil.reloadMeFunc();
		//		}
		
		private function resetTime():void
		{
			clearTrySocket();
			_time = 5;
			_timer.start();
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
				trySocket = null;
			}
		}
		
		public static function initStage(stage:Stage):void
		{
			_stage = stage;
		}
		
		public static function showPanel(par:DisplayObjectContainer = null,title:String="提示",text:String="",countdownText:String="",time:int=0):void
		{
			if(par==null)
			{
				par=_stage;
			}
			
			if(_reconnectionPanel==null){
				_reconnectionPanel=new ReconnectionPanelExt();
				_reconnectionPanel.init();
			}
			_reconnectionPanel._time=time;
			_reconnectionPanel._title.text=title;
			_reconnectionPanel._text.text=text;
			_reconnectionPanel._countdownText.text="("+time.toString()+"s)"+countdownText;
			_reconnectionPanel.show(par);
		}
		
		public function show( par:DisplayObjectContainer ):void
		{
			perContiainer=par;
			this.visible=true;
			perContiainer.addChild(this);
			
			this.x = perContiainer.stage.stageWidth / 2 - ( this.width / 2 );
			this.y = perContiainer.stage.stageHeight / 2 - this.height / 2;
			if(_time>0)
			{
				_timer=new GameTimer("ReconnectionPanelExt",1000,0,onTimer);
				_timer.start();	
			}
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			if(_time>0) 
			{
				_texttemp.text = "确定("+_time+"s ····)";
				_time--;
			}
			else{
				btnReconnectionHandler(null);
				_timer.stop();
			}
		}
	}
}