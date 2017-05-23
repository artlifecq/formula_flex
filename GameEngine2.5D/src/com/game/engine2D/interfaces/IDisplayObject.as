package com.game.engine2D.interfaces
{
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import away3d.events.Event;

	public interface IDisplayObject
	{
		/**显示坐标X*/
		function get x():Number;
		function set x(value:Number):void;
		
		/**显示坐标Y*/
		function get y():Number;
		function set y(value:Number):void;

		function get width():Number;
		function set width(value:Number):void;

		function get height():Number;
		function set height(value:Number):void;
		
		/**是否显示 */
		function get visible():Boolean;
		function set visible(value:Boolean):void;
		
		/**透明度 */
		function get alpha():Number;
		function set alpha(value:Number):void;
		
		/**X缩放 */
		function get scaleX():Number;
		function set scaleX(value:Number):void;
		
		/**Y缩放 */
		function get scaleY():Number;
		function set scaleY(value:Number):void;
		
		/**角度 */
		function get rotation():Number;
		function set rotation(value:Number):void;
		
		/**是否启用鼠标(区别于AS3中的mouseEnabled，此mouseEnabled=AS3中的mouseEnabled+mouseChildren)*/
		function get touchable():Boolean;
		function set touchable(value:Boolean):void;
		
		/**所属显示对象(显示对象容器)*/
		function get parent():DisplayObjectContainer;
		function addEventListener(type:String, listener:Function):void
		function removeEventListener(type:String, listener:Function):void
		function removeEventListeners(type:String=null):void
		function dispatchEvent(event:Event):void
		function hitTest(localPoint:Point):DisplayObject
		/**销毁显示对象 */
		function dispose():void;
	}
}