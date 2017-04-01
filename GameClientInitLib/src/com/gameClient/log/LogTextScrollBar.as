package com.gameClient.log
{
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	/**
	 * 文本滚动条
	 * @author carver
	 * 
	 */	
	public class LogTextScrollBar
	{
		private var _tf:TextField;
		//
		private var _container:Sprite;
		//
		private var _thumb:Sprite;
		private var _track:InteractiveObject;
		private var _upBtn:InteractiveObject;
		private var _downBtn:InteractiveObject;
		//
		private var _scrollRect:Rectangle;
		private var _upNum:Number = 0;
		private var _downNum:Number = 0;
		private var _maxCount:int;
		
		public function LogTextScrollBar(thumb:Sprite,track:InteractiveObject,upBtn:InteractiveObject,downBtn:InteractiveObject,tf:TextField,parent:DisplayObjectContainer = null,pos:Point = null)
		{
			_thumb = thumb;
			_track = track;
			_upBtn = upBtn;
			_downBtn = downBtn;
			_tf = tf;
			//
			_container = new Sprite();
			_container.addChild(_track);
			_container.addChild(_thumb);
			_container.addChild(_upBtn);
			_container.addChild(_downBtn);
			//
			if(parent)
			{
				parent.addChild(_container);
			}
			else if(tf.parent)
			{
				tf.parent.addChild(_container);
			}
			if(pos)
			{
				_container.x = pos.x;
				_container.y = pos.y;
			}
			//
			if (_upBtn)
			{
				_upNum = _upBtn.height;
				_upBtn.x = _track.x;
				_upBtn.y = _track.y;
				_upBtn.mouseEnabled = false;
			}
			if (_downBtn)
			{
				_downNum = _downBtn.height;
				_downBtn.x = _track.x;
				_downBtn.y = _track.y + _track.height - _downBtn.height;
				_downBtn.mouseEnabled = false;
			}
			//
			_thumb.buttonMode = true;
			_thumb.mouseEnabled = false;
			upDateScroll();
			_thumb.x = _scrollRect.x;
			_thumb.y = _scrollRect.y;
			_thumb.visible = false;
			//
			_maxCount = _tf.height/16;
		}
		
		public function checkScroll():void
		{
			if(_tf.maxScrollV>1)
			{
				_tf.scrollV = _tf.maxScrollV;
				onTxtScroll(null);
				if(!_thumb.mouseEnabled)
				{
					_thumb.mouseEnabled = true;
					_thumb.visible = true;
					_thumb.addEventListener(MouseEvent.MOUSE_DOWN,onBarBallDown);
					_track.addEventListener(MouseEvent.MOUSE_DOWN,onBackDown);
					_tf.addEventListener(Event.SCROLL,onTxtScroll);
					if (_upBtn)
					{
						_upBtn.mouseEnabled = true;
						_upBtn.addEventListener(MouseEvent.MOUSE_DOWN, onUpDown);
					}
					if (_downBtn)
					{
						_downBtn.mouseEnabled = true;
						_downBtn.addEventListener(MouseEvent.MOUSE_DOWN, onDownDown);
					}
				}
			}else{
				if(_thumb.mouseEnabled)
				{
					_thumb.mouseEnabled = false;
					_thumb.visible = false;
					_thumb.y = _scrollRect.y;
					_thumb.removeEventListener(MouseEvent.MOUSE_DOWN,onBarBallDown);
					_track.removeEventListener(MouseEvent.MOUSE_DOWN,onBackDown);
					_tf.removeEventListener(Event.SCROLL,onTxtScroll);
					if (_upBtn)
					{
						_upBtn.mouseEnabled = false;
						_upBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onUpDown);
						_upBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onUpUp);
					}
					if (_downBtn)
					{
						_downBtn.mouseEnabled = false;
						_downBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onDownDown);
						_downBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onDownUp);
					}
				}
			}
		}
		
		public function destroy():void
		{
			if(_tf.maxScrollV>1)
			{
				_thumb.removeEventListener(MouseEvent.MOUSE_DOWN,onBarBallDown);
				_track.removeEventListener(MouseEvent.MOUSE_DOWN,onBackDown);
				_tf.removeEventListener(Event.SCROLL,onTxtScroll);
			}
			if (_upBtn)
			{
				_upBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onUpDown);
				_upBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onUpUp);
				_upBtn = null;
			}
			if (_downBtn)
			{
				_downBtn.removeEventListener(MouseEvent.MOUSE_DOWN, onDownDown);
				_downBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onDownUp);
				_downBtn = null;
			}
			_tf = null;
			_thumb = null;
			_track = null;
			_scrollRect = null;
		}
		
		//--------------------------------------------------------
		// private
		//--------------------------------------------------------
		
		private function upDateScroll():void
		{
			_scrollRect = new Rectangle(_track.x - (_thumb.width - _track.width) / 2, _track.y + _upNum, 0, _track.height - _thumb.height - _upNum - _downNum);
		}
		
		//--------------------------------------------------------
		// event
		//--------------------------------------------------------
		
		private function onBarBallDown(e:MouseEvent):void
		{
			_thumb.startDrag(false,_scrollRect);
			_thumb.stage.addEventListener(MouseEvent.MOUSE_MOVE,onBarBlockMove);
			_thumb.stage.addEventListener(MouseEvent.MOUSE_UP,onBarBallUp);
			_thumb.removeEventListener(MouseEvent.MOUSE_DOWN,onBarBallDown);
			_tf.removeEventListener(Event.SCROLL,onTxtScroll);
		}
		private function onBarBlockMove(e:MouseEvent):void
		{
			_tf.scrollV = Math.round((_thumb.y-_scrollRect.y)/_scrollRect.height*_tf.maxScrollV);
		}
		private function onBarBallUp(e:MouseEvent):void
		{
			_thumb.stopDrag();
			_tf.addEventListener(Event.SCROLL,onTxtScroll);
			_thumb.addEventListener(MouseEvent.MOUSE_DOWN,onBarBallDown);
			_thumb.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onBarBlockMove);
			_thumb.stage.removeEventListener(MouseEvent.MOUSE_UP,onBarBallUp);
		}
		private function onTxtScroll(e:Event):void
		{
			var sv:Number;
			if(_tf.scrollV==1)
			{
				sv = 0;
			}else{
				sv = _tf.scrollV/_tf.maxScrollV;
			}
			
			_thumb.y = _scrollRect.y+_scrollRect.height*sv;
		}
		private function onBackDown(e:MouseEvent):void
		{
			_thumb.y = (_track.parent.mouseY-_scrollRect.y)/_track.height*_scrollRect.height+_scrollRect.y;
			onBarBlockMove(null);
		}
		
		
		/**
		 * 上
		 * @param e
		 *
		 */
		private function onUpDown(e:MouseEvent):void
		{
			_upBtn.addEventListener(Event.ENTER_FRAME, onUpEnter);
			_upBtn.stage.addEventListener(MouseEvent.MOUSE_UP, onUpUp);
		}
		
		private function onUpUp(e:MouseEvent):void
		{
			_upBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onUpUp);
			_upBtn.removeEventListener(Event.ENTER_FRAME, onUpEnter);
		}
		
		private function onUpEnter(e:Event):void
		{
			if (_thumb.y >= _scrollRect.y)
			{
				_thumb.y -= 3;
				onBarBlockMove(null);
			}
			else
			{
				_thumb.y = _scrollRect.y;
				_upBtn.removeEventListener(Event.ENTER_FRAME, onUpEnter);
			}
		}
		
		/**
		 * 下
		 * @param e
		 *
		 */
		private function onDownDown(e:MouseEvent):void
		{
			_downBtn.addEventListener(Event.ENTER_FRAME, onDownEnter);
			_downBtn.stage.addEventListener(MouseEvent.MOUSE_UP, onDownUp);
		}
		
		private function onDownUp(e:MouseEvent):void
		{
			_downBtn.stage.removeEventListener(MouseEvent.MOUSE_UP, onDownUp);
			_downBtn.removeEventListener(Event.ENTER_FRAME, onDownEnter);
		}
		
		private function onDownEnter(e:Event):void
		{
			if (_thumb.y <= _scrollRect.bottom)
			{
				_thumb.y += 3;
				onBarBlockMove(null);
			}
			else
			{
				_thumb.y = _scrollRect.bottom;
				_downBtn.removeEventListener(Event.ENTER_FRAME, onDownEnter);
			}
		}
	}
}