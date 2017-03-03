package com.game.engine2D.interfaces
{
	import com.game.engine3D.core.interfaces.IObject;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public interface ISDisplayObject extends IObject
	{
		/**角度 */
		function get rotationAngle():Number;
		function set rotationAngle(value:Number):void;
		
		/**逻辑角度 */
		function get logicAngle():uint;
		function set logicAngle(value:uint):void;
		
		function set depth(value:int):void;
		/**深度(用于深度排序)*/
		function get depth():int;
		
		function set depthIndex(value:uint):void;
		/**深度(深度索引,主要是显示列表的index值)*/
		function get depthIndex():uint;
		
		/**是否启用鼠标(区别于AS3中的mouseEnabled，此mouseEnabled=AS3中的mouseEnabled+mouseChildren)*/
		function get mouseEnabled():Boolean;
		function set mouseEnabled(value:Boolean):void;
		
		/**渲染显示坐标(一般由,(x+offsetX,y+offsetY),也可能别的接口过来赋值)*/
		function get showPos():Point;
		
		/**是否与某个矩形发生碰撞*/
		function hitRect(rect:Rectangle):Boolean;
		
		/**是否与某个点发生碰撞*/
		function hitPoint(p:Point):Boolean;
	}
}