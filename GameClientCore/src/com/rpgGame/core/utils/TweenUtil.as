package com.rpgGame.core.utils
{
	import gs.TweenLite;
	
	import starling.display.DisplayObject;

	public class TweenUtil
	{
		public function TweenUtil()
		{
		}
		
		
		/**
		 * 弹出菜单
		 * @param target
		 * @param time
		 * @param startAlpha
		 * @param endAlpha
		 * @param completeCallBack
		 * 
		 */		
		public static function MenuShowAndHide( target:DisplayObject, time:Number, startAlpha:Number, endAlpha:Number, completeCallBack:Function = null ):void
		{
			target.alpha = startAlpha;
			TweenLite.to( target, time, { alpha:endAlpha, onComplete:function complete():void
			{
				if( completeCallBack != null )
					completeCallBack();
				
				TweenLite.killTweensOf( target );
			}});		
		}
		
	
	}
}