package com.rpgGame.core.utils
{
	import com.rpgGame.core.manager.tips.TipTargetManager;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;
	import starling.display.Stage;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 为一个显示对象添加鼠标事件
	 * @author luguozheng
	 * 
	 */	
	public class MouseListenerUtil
	{
		
		private static var _mouseDataMap:HashMap = new HashMap();
		
		/**
		 * 添加监听，简便的快捷的方法	慎用：这个方法不能对同一个东西加两次不同的回调的
		 * @param target
		 * @param click				点击
		 * @param mouseOver			移入、移动
		 * @param mouseOut			移出
		 * 
		 */		
		public static function addEventListener( target:DisplayObject, click:Function, mouseOver:Function = null, mouseOut:Function = null ):void
		{
			if( target == null )
				return;
			
			var mouseData:TouchMouseData = _mouseDataMap.getValue( target );
			if( mouseData == null )
			{
				mouseData = new TouchMouseData();
				target.addEventListener( TouchEvent.TOUCH, onTouch );
				
				_mouseDataMap.add( target, mouseData );
			}
			mouseData.click = click;
			mouseData.mouseOut = mouseOut;
			mouseData.mouseOver = mouseOver;
		}
		
		/**
		 * 删除
		 * @param target
		 * 
		 */		
		public static function removeEventListener( target:DisplayObject ):void
		{
			if( target == null )
				return;
			
			target.removeEventListener( TouchEvent.TOUCH, onTouch );
			
			_mouseDataMap.remove( target );
		}
		
		private static function onTouch( e:TouchEvent ):void
		{
			var currentTarget:DisplayObject = e.currentTarget as DisplayObject;
			
			var mouseData:TouchMouseData = _mouseDataMap.getValue( currentTarget );
			if( mouseData == null )
				return;
			
			var touch:Touch = e.getTouch( currentTarget );
			if( touch == null )
			{
				if( mouseData.mouseOut != null )
					mouseData.mouseOut();
				return;
			}
			
			touch = e.getTouch( currentTarget, TouchPhase.HOVER ); 
			if( touch != null )
			{
				if( mouseData.mouseOver != null )
					mouseData.mouseOver();
			}
			
			touch = e.getTouch( currentTarget, TouchPhase.BEGAN ); 
			if( touch == null )
				return;
			
			if( mouseData.click != null )
				mouseData.click();
			
			e.stopPropagation();
		}
		
		
		
		/**
		 * 判断鼠标当前是不是在这个对象上面
		 * 这个是用坐标上的判断，换句话说，就是有个东西挡在它上面也算在对象上面
		 * 
		 */		
		public static function isMouseIn( target:DisplayObject ):Boolean
		{
			return target.hitTest(target.globalToLocal(TipTargetManager.stagePoint));
		}
		
	}
}
import starling.display.DisplayObject;


class TouchMouseData
{
	public var target:DisplayObject;
	public var click:Function;
	public var mouseOver:Function;
	public var mouseOut:Function;

}
