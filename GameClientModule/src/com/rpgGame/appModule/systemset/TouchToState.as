/*
Feathers
Copyright 2012-2017 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package com.rpgGame.appModule.systemset
{
	import starling.display.DisplayObject;
	import starling.display.Stage;
	import away3d.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class TouchToState
	{
		public function TouchToState(target:DisplayObject = null, callback:Function = null)
		{
			this.target = target;
			this.callback = callback;
		}
		
		public var data:*;
		protected var _target:DisplayObject;

		public function get target():DisplayObject
		{
			return this._target;
		}

		/**
		 * @private
		 */
		public function set target(value:DisplayObject):void
		{
			if(this._target == value)
			{
				return;
			}
			if(this._target !== null)
			{
				this._target.removeEventListener(TouchEvent.TOUCH, target_touchHandler);
				this._target.removeEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStageHandler);
			}
			this._target = value;
			if(this._target !== null)
			{
				//if we're changing targets, and a touch is active, we want to
				//clear it.
				this._touchPointID = -1;
				this._target.addEventListener(TouchEvent.TOUCH, target_touchHandler);
				this._target.addEventListener(Event.REMOVED_FROM_STAGE, target_removedFromStageHandler);
			}
		}
		protected function target_removedFromStageHandler(event:Event):void
		{
			this.resetTouchState();
		}
		/**
		 * @private
		 */
		protected function resetTouchState():void
		{
			this._touchPointID = -1;
		}
		protected var _touchPointID:int = -1;
		/**
		 * @private
		 */
		protected var _callback:Function;

		/**
		 * The function to call when the state is changed.
		 * 
		 * <p>The callback is expected to have the following signature:</p>
		 * <pre>function(currentState:String):void</pre>
		 */
		public function get callback():Function
		{
			return this._callback;
		}

		/**
		 * @private
		 */
		public function set callback(value:Function):void
		{
			if(this._callback === value)
			{
				return;
			}
			this._callback = value;
		}
		
		protected function triggeredHandler(touch:Touch):void
		{
			switch(this._callback.length)
			{
				case 0:
					this._callback();
					break;
				case 1:
					this._callback(touch);
					break;
				case 2:
					this._callback(touch,this);
					break;
			}
		}
		/**
		 * @private
		 */
		protected function target_touchHandler(event:TouchEvent):void
		{
			if(this._touchPointID >= 0)
			{
				//a touch has begun, so we'll ignore all other touches.
				var touch:Touch = event.getTouch(this._target, null, this._touchPointID);
				if(!touch)
				{
					return;
				}
				this.triggeredHandler(touch);
				var stage:Stage = this._target.stage;
				if(stage !== null && touch.phase === TouchPhase.ENDED)
				{
					this.resetTouchState();
					return;
				}
			}
			else
			{
				touch = event.getTouch(this._target, TouchPhase.BEGAN);
				if(touch !== null)
				{
					this.triggeredHandler(touch);
					this._touchPointID = touch.id;
					return;
				}
			}
		}
	}
}