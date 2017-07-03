package com.gameClient.log 
{
	
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.StatusEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.text.TextField;
	
	/**
	 * YT的日志打印窗口   
	 * 写一个自用打印窗口  系统通用的太多信息 不方便使用
	 * @author yt
	 * 
	 */	
	public class Lyt extends Sprite
	{
		private var _txt:TextField;
		private var _bg:Sprite;
		private var _scroll:LogTextScrollBar;
		private var _dc:LogDoubleClick;
		private var _parent:DisplayObjectContainer;
		
		private var _width:Number = 300;
		private var _height:Number = 300;
		
		private var _logList:Vector.<String>;
		
		private static var _gameLogView:Lyt;
		
		private var _replyKeyList:Array;
		private var _replyKeyFun:Function;
		private var _replyKeyFunArgs:Array;
		private var _keyDownList:Array = [];
		/**
		* 初始化 
		*/		
		public static function init( stage:Stage):void
		{
			if( _gameLogView == null )
			{
				_gameLogView = new Lyt();
				_gameLogView.initLog(stage);
				
				//LogShortcutController.setKeyListFun(  , _gameLogView.showOrHide, [ stage ] );
			}
		}
		
		public static function a(str:String,color:uint = 0xFEFEFE):void
		{
			/*if(message==null)
			{
				return send ( LOG_OPERATION,"------------null------------", color ) ;
			}
			var str:String= getNowTime()+"::"+JSON.stringify( message );*/
			//GameLog.log(str);
			str=getNowTime()+"::"+str;
			_gameLogView.onTxtChg(str);
			send ( LOG_OPERATION, str, color ) ;
		}
		private static function clear():void
		{
			_gameLogView.onTxtClear();
		}
		
		public function Lyt(w:Number=300,h:Number=300)
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
			initLog(null);
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
			str=str+"\n";
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
		
		public function initLog( stage:Stage):void
		{
			//GameLog.addUpdateCallBack(onTxtChg);
			//GameLog.addClearCallBack(onTxtClear);
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
			if(stage)
			{
				setKeyListFun( [188, 190, 191] , showOrHide, [ stage ] )
				stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
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
		private function setKeyListFun(keyCodeList:Array,fun:Function,funArgs:Array=null):void
		{
			_replyKeyList = keyCodeList;
			_replyKeyFun = fun;
			_replyKeyFunArgs = funArgs;
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			var index:int = _keyDownList.indexOf(e.keyCode);
			if(index != -1)
			{
				return;
			}
			var cnt:uint = 0;
			_keyDownList.push(e.keyCode);
			for each(var keyCode:uint in _keyDownList)
			{
				index = _replyKeyList.indexOf(keyCode);
				if(index != -1)
				{
					cnt++;
				}
			}
			//			GameLog.add(cnt,_keyDownList.length);
			if(cnt == _replyKeyList.length)
			{
				if(_replyKeyFun != null)
				{
					_replyKeyFun.apply(null,_replyKeyFunArgs);
				}
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void
		{
			var index:int = _keyDownList.indexOf(e.keyCode);
			if(index != -1)
			{
				_keyDownList.splice(index,1);
			}
		}
		
		
		
		private static function lsend ( message:*, color:uint = 0xFEFEFE ) :Boolean {
			if(message==null)
			{
				return send ( LOG_OPERATION,"------------null------------", color ) ;
			}
			var str:String= getNowTime()+"::"+JSON.stringify( message );
			//GameLog.log(str);
			return send ( LOG_OPERATION, str, color ) ;
		}
		
		//private static var date:Date = new Date();
		// 显示当前日期时间
		private static function getNowTime():String
		{
			var date:Date = new Date();
			var minutes:String="00"+date.minutes;
			minutes=minutes.substr(minutes.length-2,2);
			var seconds:String="00"+date.seconds;
			seconds=seconds.substr(seconds.length-2,2);
			var milliseconds:String="00"+date.milliseconds;
			milliseconds=milliseconds.substr(milliseconds.length-3,3);
			
			var text:String= minutes+":"+seconds+":"+milliseconds;
			return text;
		}
		/**
		 * Version control
		 */
		private static const NAME		:String = 'Debug';
		private static const VERSION		:String = '0.74';
		
		/**
		 * Privacy
		 * By setting this password, you need to enter the
		 * same in "Arthropod -> Settings -> Connection Password"
		 * to be able to see the traces.
		 * 
		 * default: 'CDC309AF';
		 */
		private static var password		:String = 'CDC309AF';
		
		/**
		 * Predefined colors
		 */
		private static var RED			:uint = 0xCC0000;
		private static var GREEN			:uint = 0x00CC00;
		private static var BLUE			:uint = 0x6666CC;
		private static var PINK			:uint = 0xCC00CC;
		private static var YELLOW		:uint = 0xCCCC00;
		private static var LIGHT_BLUE	:uint = 0x00CCCC;
		
		/**
		 * Status event
		 * If false, arthropod will trace error messages.
		 */
		private static var ignoreStatus		:Boolean = true;
		
		/**
		 * Security (not tested)
		 * If secure is true, only the <code>secureDomain</code> will be accepted.
		 */
		private static var secure			:Boolean = false;
		
		/**
		 * A single domain to be used as the secure domain. (not tested)
		 */
		private static var secureDomain		:String	 = '*';
		
		/**
		 * Switches tracing on/off.
		 * TIP: Set this switch to false before release of AIR applications.
		 */
		private static var allowLog			:Boolean = true;
		
		/**
		 * DO NOT CHANGE THESE VALUES! IF CHANGED, ARTHROPOD MIGHT NOT WORK PROPERLY!
		 */
		private static const DOMAIN			:String = 'com.carlcalderon.Arthropod';
		private static const CHECK			:String = '.161E714B6C1A76DE7B9865F88B32FCCE8FABA7B5.1';
		private static const TYPE			:String = 'app';
		private static const CONNECTION		:String = 'arthropod';
		
		private static const LOG_OPERATION		:String = 'debug';
		private static const ERROR_OPERATION	:String = 'debugError';
		private static const WARNING_OPERATION	:String = 'debugWarning';
		private static const ARRAY_OPERATION	:String = 'debugArray';
		private static const BITMAP_OPERATION	:String = 'debugBitmapData';
		private static const OBJECT_OPERATION	:String = 'debugObject';
		private static const MEMORY_OPERATION	:String = 'debugMemory';
		private static const CLEAR_OPERATION	:String = 'debugClear';
		
		private static var lc					:LocalConnection 	= new LocalConnection();
		private static var hasEventListeners	:Boolean 			= false;
		
		/**
		 * Traces a message to Arthropod
		 * 
		 * @param	message		Message to be traced
		 * @param	color		opt. Color of the message
		 * @return				True if successful
		 */
		
		
		/**
		 * Traces a warning to Arthropod.
		 * The message will be displayed in yellow.
		 * 
		 * @param	message		Message to be traced
		 * @return				True if successful
		 */
		private static function error ( message:* ) :Boolean {
			return send ( ERROR_OPERATION, String ( message ) , 0xCC0000 ) ;
		}
		
		/**
		 * Traces an error to Arthropod.
		 * The message will be displayed in red.
		 * 
		 * @param	message		Message to be traced
		 * @return				True if successful
		 */
		private static function warning ( message:* ) :Boolean {
			return send ( WARNING_OPERATION, String ( message ) , 0xCCCC00 ) ;
		}
		
		/**
		 * Clears all the traces, including arrays and bitmaps
		 * from the Arthropod application window.
		 * 
		 * @return				True if successful
		 */
		private static function clearsend ( ) :Boolean {
			return send ( CLEAR_OPERATION, 0, 0x000000 ) ;
		}
		
		/**
		 * Traces an array to Arthropod.
		 * 
		 * If no earlier arrays have been traced,
		 * Arthropod will open up the array-window
		 * automatically. For each array that is traced,
		 * the array-window will clear and display the
		 * new one. This is useful for buffer-arrays, etc.
		 * 
		 * @param	arr			Array to be traced
		 * @return				True if successful
		 */
		private static function array ( arr:Array ) :Boolean {
			return send ( ARRAY_OPERATION, arr,null ) ;
		}
		
		/**
		 * Traces a thumbnail of the specified BitmapData
		 * to Arthropod.
		 * 
		 * The internal connection between Arthropod and
		 * the Debug class only accept calls less than
		 * 40Kb. The bitmap method converts the specified
		 * BitmapData to an acceptable size for the call.
		 * 
		 * @param	bmd			Any IBitmapDrawable
		 * @param	label		Label
		 * @return				True if successful
		 */
		private static function bitmap ( bmd:*, label:String = null ) :Boolean {
			var bm:BitmapData = new BitmapData ( 100, 100, true, 0x00FFFFFF ) ;
			var mtx:Matrix = new Matrix ( ) ;
			var s:Number = 100 / (( bmd.width >= bmd.height ) ? bmd.width : bmd.height ) ;
			mtx.scale ( s, s ) ;
			bm.draw ( bmd, mtx,null,null,null,true ) ;
			var bounds:Rectangle = new Rectangle ( 0, 0, Math.floor ( bmd.width * s ) , Math.floor ( bmd.height * s ) ) ;
			return send ( BITMAP_OPERATION, bm.getPixels ( bounds ), { bounds:bounds, lbl:label } ) ;
		}
		
		/**
		 * Traces a snapshot of the current stage state.
		 * 
		 * @param	stage		Stage
		 * @param	label		Label
		 * @return				True if successful
		 */
		private static function snapshot ( stage:Stage, label:String=null ) :Boolean {
			if ( stage )
				return bitmap ( stage, label ) ;
			return false;
		}
		
		/**
		 * Traces an <code>object</code> to Arthropod.
		 * The first level of arguments are traced as follows:
		 * 
		 * trace:
		 * Debug.object( { name: Carl, surname: Calderon } );
		 * 
		 * output:
		 * object
		 * name: Carl
		 * surname: Calderon
		 * 
		 * @param	obj			Object to be traced
		 * @return				True if successful
		 */
		private static function object ( obj:* ) :Boolean {
			return send ( OBJECT_OPERATION, obj, null ) ;
		}
		
		/**
		 * Traces the current memory size used by Adobe Flash Player.
		 * Observe that this also includes AIR applications (such as
		 * Arthropod). Use with care.
		 * 
		 * @return				True if successful
		 */
		private static function memory ( ) :Boolean {
			return send ( MEMORY_OPERATION, System.totalMemory, null ) ;
		}
		
		/**
		 * [internal-use]
		 * Sends the message
		 * 
		 * @param	operation	Operation name
		 * @param	value		Value to send
		 * @param	color		opt. Color of the message
		 */
		private static function send( operation:String, value:*, prop:* ):Boolean {
			if (!secure) 	lc.allowInsecureDomain('*');
			else 			lc.allowDomain(secureDomain);
			if (!hasEventListeners) {
				if ( ignoreStatus ) lc.addEventListener(StatusEvent.STATUS, ignore);
				else 				lc.addEventListener(StatusEvent.STATUS, status);
				hasEventListeners = true;
			}
			if(allowLog){
				try {
					lc.send ( TYPE + '#' + DOMAIN + CHECK + ':' + CONNECTION , operation, password, value, prop ) ;
					return true;
				} catch (e:*) {
					return false;
				}
			}
			return false;
		}
		
		/**
		 * [internal-use]
		 * Traces the status of the Debugger.
		 * 
		 * @see		ignoreStatus
		 * @param	e			StatusEvent
		 */
		private static function status(e:StatusEvent):void {
			trace( 'Arthropod status:\n' + e.toString() );
		}
		
		/**
		 * [internal-use]
		 * Method used to ignore StatusEvent's if an error occurs.
		 * 
		 * @see		ignoreStatus
		 * @param	e			StatusEvent
		 */
		private static function ignore(e:StatusEvent):void { }
		
	}
	
}