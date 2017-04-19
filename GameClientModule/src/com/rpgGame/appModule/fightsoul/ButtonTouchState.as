package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.appModule.systemset.TouchToState;
	
	import starling.display.DisplayObject;
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;


	public class ButtonTouchState extends TouchToState
	{
		public function ButtonTouchState(target:DisplayObject = null, callback:Function = null)
		{
			super(target,callback);
		}
		override protected function target_touchHandler(event:TouchEvent):void
		{
			if(this._touchPointID >= 0)
			{
				//a touch has begun, so we'll ignore all other touches.
				var touch:Touch = event.getTouch(this._target, null, this._touchPointID);
				this.triggeredHandler(touch);
				if(!touch)
				{
					return;
				}
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