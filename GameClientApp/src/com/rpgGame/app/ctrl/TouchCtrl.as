package  com.rpgGame.app.ctrl
{
	import away3d.events.Event;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *starling 鼠标事件统一接口，减少冗余代码 
	 * @author yfl
	 * 
	 */	
	public class TouchCtrl
	{
		private var _overCall:Function;
		private var _outCall:Function;
		private var _clickCall:Function;
		private var _target:DisplayObject;
		private  var isMouseOut : Boolean = true;
		public function TouchCtrl(target:DisplayObject,click:Function=null,over:Function=null,out:Function=null)
		{
			this._target=target;
			this._clickCall=click;
			this._overCall=over;
			this._outCall=out;
			_target.touchable=true;
			_target.addEventListener(TouchEvent.TOUCH, onTouch);
			_target.addEventListener(Event.REMOVED_FROM_STAGE,onRemoved);
		}
		
		private function onRemoved(eve:Event):void
		{
			// TODO Auto Generated method stub
			isMouseOut=true;
		}
		private function onTouch(e:TouchEvent):void
		{
			var target : DisplayObject = e.currentTarget as DisplayObject;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null)
			{
				isMouseOut = true;
				if (_outCall) 
				{
					_outCall();
				}
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null && isMouseOut)
			{
				isMouseOut = false;
				if (_overCall) 
				{
					_overCall();
				}
				return;
			}
			touch = e.getTouch(target, TouchPhase.ENDED);
			if (touch != null)
			{
				isMouseOut = false;
				if (_clickCall) 
				{
					_clickCall();
				}
				return;
			}
		}
	}
}