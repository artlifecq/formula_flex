package  com.rpgGame.appModule.jingmai.sub
{

	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import gs.TweenMax;
	import gs.easing.Expo;
	
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	

	
	public class TweenScrollUtil extends Sprite
	{
		private var _tweenMax:TweenMax = null;
		private var _scrollWidth:int;
		private var _scrollHeight:int;
		private var _scrollTime:Number;
		private var _tweenX:int;
		private var _tweenY:int;
		private var _scrollObject:DisplayObject;
		private var _scrollRect:Quad;
		private var _timeOutIdx:int = 0;
		private var _isHorizon:Boolean;
		private var _times:int=0;
		public function TweenScrollUtil( scrollObject:DisplayObject, width:int, height:int, scrollWidth:int, scrollTime:Number = 0.5,isHorizon:Boolean=true)
		{
			_scrollObject = scrollObject;
			if (_scrollObject==null||_scrollObject.parent==null) 
			{
				throw new Error("TweenScrollUtil scrollObject or parent is null");
			}
			this.x=_scrollObject.x;
			this.y=_scrollObject.y;
			this._scrollObject.parent.addChildAt(this,_scrollObject.parent.getChildIndex(_scrollObject));
			_scrollObject.x=0;
			_scrollObject.y=0;
			this.addChild(_scrollObject);
			this._isHorizon=isHorizon;
			if (isHorizon) 
			{
				_scrollWidth = scrollWidth;
			}
			else
			{
				_scrollHeight = scrollWidth;
			}
			
			_scrollTime = scrollTime;
			_scrollRect = new Quad(width,height);
			_tweenX = 0;
			_tweenY = 0;
			_scrollObject.mask = _scrollRect;
			this.addChild(_scrollRect);
		}
		
		public function doLeft():void
		{
			_tweenX -= _scrollWidth;
			_times=1;
			doTweenScroll();
		}
		
		public function doRight():void
		{
			_tweenX += _scrollWidth;
			_times=1;
			doTweenScroll();
		}
		
		public function doUp():void
		{
			_tweenY -= _scrollHeight;
			_times=1;
			doTweenScroll();
		}
		
		public function doDown():void
		{
			_tweenY += _scrollHeight;
			_times=1;
			doTweenScroll();
		}
		
		private function doTweenScroll():void
		{
			if( _tweenMax != null )
			{
				_tweenMax.kill();
				_tweenMax = null;
			}
			onTweenStart();
			_tweenMax = TweenMax.to( _scrollObject, _scrollTime*_times, { x:_tweenX, y:_tweenY, onUpdate:onUpdateHandler,onComplete:onTweenEnd } );
			
//			if ( _timeOutIdx != 0 )
//			{
//				clearTimeout(_timeOutIdx);
//				_timeOutIdx = 0;
//			}
//			// 容错
//			_timeOutIdx =setTimeout( delayFunc, _scrollTime * 1000*_times, _tweenX, _tweenY );
		}
		public function onTweenStart():void
		{
			
		}
		public function onTweenEnd():void
		{
			_tweenMax=null;
		}
		private function delayFunc( x:int, y:int ):void
		{
			_scrollObject.x = x;
			_scrollObject.y = y;
			
		}
		
		private function onUpdateHandler():void
		{
			//_scrollObject.scrollRect = _scrollRect;	
		}
		
		public function scrollToX( x:int,t:int):void
		{
			_tweenX = x;
			_times=t;
			doTweenScroll();
		}
		
		public function scrollToY( y:int ,t:int):void
		{
			_tweenY = y;
			_times=t;
			doTweenScroll();
		}
		
		public function setXPos( x:int ):void
		{
			_scrollObject.x = x;
			
		}
		
		public function setYPos( y:int ):void
		{
			_scrollObject.y = y;
		}
		
		public function getTweenX():int
		{
			return _tweenX;
		}
		
		public function getTweenY():int
		{
			return _tweenY;
		}
		
		public function getXPos():Number
		{
			return _scrollRect.x;
		}
		
		public function getYPos():Number
		{
			return _scrollRect.y;
		}
		
		public function set tweenX(value:int):void
		{
			_tweenX = value;
		}
		
		public function set tweenY(value:int):void
		{
			_tweenY = value;
		}

		public function get scrollTime():Number
		{
			return _scrollTime;
		}

		public function get scrollWidth():int
		{
			return _scrollWidth;
		}

		public function get isHorizon():Boolean
		{
			return _isHorizon;
		}
		
		
	}
}