package com.gameClient.log
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.System;
	import flash.text.TextField;
	
	/**
	 * 日志打印窗口 
	 * @author carver
	 * 
	 */	
	public class GameLogView extends Sprite
	{
		private var _txt:TextField;
		private var _bg:Sprite;
		private var _scroll:LogTextScrollBar;
		private var _dc:LogDoubleClick;
		private var _parent:DisplayObjectContainer;
		
		private var _width:Number = 300;
		private var _height:Number = 800;
		
		private var _logList:Vector.<String>;
		
		private static var _gameLogView:GameLogView;
		/**
		* 初始化 
		*/		
		public static function init( stage:Stage, keyList:Array ):void
		{
			if( _gameLogView == null )
			{
				_gameLogView = new GameLogView();
				_gameLogView.initLog();
				LogShortcutController.init( stage );//增加日志快捷键
				LogShortcutController.setKeyListFun( keyList , _gameLogView.showOrHide, [ stage ] );
			}
		}
		
		public function GameLogView(w:Number=300,h:Number=800)
		{
			_width = w;
			_height = h;
			
			_txt = new TextField();
			_txt.multiline = true;
			_txt.wordWrap = true;
			_txt.textColor = 0xCCCCCC;
			_txt.mouseEnabled = false;
			this.addChild(_txt);
			
			_bg = new Sprite();
			_bg.buttonMode = true;
			_bg.addEventListener(MouseEvent.MOUSE_DOWN,onMosDown);
			_bg.addEventListener(MouseEvent.MOUSE_UP,onMosUp);
			this.addChildAt(_bg,0);
			//
			_dc = new LogDoubleClick();
			_logList = new Vector.<String>();
			
			resize(_width,_height);
		}
		
		private function addEvent():void
		{
			this.addEventListener(MouseEvent.CLICK,onMosClick);
			_dc.addEventListener(LogDoubleClick.DOUBLE_CLICK,onDoubleClick);
		}
		
		private function removeEvent():void
		{
			_dc.removeEventListener(LogDoubleClick.DOUBLE_CLICK,onDoubleClick);
			GameLog.removeUpdateCallBack(onTxtChg);
		}
		
		public function showOrHide(parent:DisplayObjectContainer):void
		{
			if(this.parent)
			{
				hide();
			}
			else
			{
				show(parent);
			}
		}
		
		public function show(parent:DisplayObjectContainer):void
		{
			parent.addChild(this);
			//
			_parent = parent;
			initLog();
			addEvent();
		}
		
		public function hide():void
		{
			removeEvent();
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
			
			if(_parent)
			{
				_parent.removeEventListener(Event.ADDED,onAdded);
			}
		}
		
		private function onTxtChg(str:String):void
		{
			if(!this.parent)//还木加到舞台上来呢,那就先存内存里啦..
			{
				_logList.push(str);
				return;
			}
			
			if(_txt && _scroll)
			{
				_txt.appendText(str);
				_scroll.checkScroll();
			}
		}
		
		private function onTxtClear():void
		{
			_logList.length = 0;
			_txt.text = "";
			_scroll.checkScroll();
		}
		
		public function initLog():void
		{
			GameLog.addUpdateCallBack(onTxtChg);
			GameLog.addClearCallBack(onTxtClear);
			if(_parent)
			{
				_parent.addEventListener(Event.ADDED,onAdded);
			}
			
			while(_logList.length)
			{
				var str:String = _logList.shift();
				if(_txt)
				{
					_txt.appendText(str);
				}
			}
			if(_scroll)
			{
				_scroll.checkScroll();
			}
		}
		
		private function onAdded(e:Event):void
		{
			if(_parent)
			{
				_parent.addChild(this);
			}
		}
		
		private function bgSprite():Sprite
		{
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0x000000,0.8);
			sp.graphics.drawRect(0,0,350,160);
			sp.graphics.endFill();
			return sp;
		}
		
		private function onMosDown(e:MouseEvent):void
		{
			this.startDrag();
		}
		
		private function onMosUp(e:MouseEvent):void
		{
			this.stopDrag();
		}
		
		private function onMosClick(e:MouseEvent):void
		{
			_dc.trig();
		}
		
		private function onDoubleClick(e:Event):void
		{
			_txt.appendText("************添加日志到剪切板成功*************");
			_scroll.checkScroll();
			System.setClipboard(_txt.text);
		}
		
		private function setScrollBar(tf:TextField):void
		{
			var thumb:Sprite = getSpRect(20,40,0x999999);
			var track:Sprite = getSpRect(20,_height,0xcccccc);
			var upStats:Sprite = getSpRect(20,10,0x999999);
			var overStats:Sprite = getSpRect(20,10,0x999999);
			var downStats:Sprite = getSpRect(20,10,0x999999);
			var upBtn:Sprite = getSpRect(20,20,0x666666);
			var downBtn:Sprite = getSpRect(20,20,0x666666);
			
			_scroll = new LogTextScrollBar(thumb,track,upBtn,downBtn,tf,this,new Point(_width,0));
			_scroll.checkScroll();
		}
		
		public function resize(w:Number,h:Number):void
		{
			_width = w;
			_height = h;
			
			_bg.graphics.clear();
			_bg.graphics.beginFill(0x000000,0.6);
			_bg.graphics.drawRect(0,0,_width,_height);
			_bg.graphics.endFill();
			
			_txt.width = _width;
			_txt.height = _height;
			
			setScrollBar(_txt);
		}
		
		public function getSpRect(width:Number,height:Number,color:uint = 0x000000,alpha:Number = 1,ellipseValue:Number = 0,lineThickness:uint = 0,lineColor:uint = 0x0,lineAlpha:uint = 1):Sprite
		{
			var sp:Sprite = new Sprite();
			if(lineThickness)
				sp.graphics.lineStyle(lineThickness,lineColor,lineAlpha);
			sp.graphics.beginFill(color,alpha);
			if(ellipseValue)
				sp.graphics.drawRoundRect(0,0,width,height,ellipseValue,ellipseValue);
			else
				sp.graphics.drawRect(0,0,width,height);
			sp.graphics.endFill();
			return sp;
		}
	}
}