package com.game.engine2D.interfaces
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import away3d.containers.ObjectContainer3D;

	public interface ISDisplayObject
	{
		/**显示坐标X*/
		function get x():Number;
		function set x(value:Number):void;
		
		/**显示坐标Y*/
		function get y():Number;
		function set y(value:Number):void;
		
		/**显示偏移量X*/
		function get offsetX():Number;
		function set offsetX(value:Number):void;
		
		/**显示偏移量Y*/
		function get offsetY():Number;
		function set offsetY(value:Number):void;
		
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
		
		/**所属渲染容器*/
		function get graphicDis():ObjectContainer3D;
		function set graphicDis(value:ObjectContainer3D):void;
		
		/**所属显示对象(显示对象容器)*/
		function get parent():ObjectContainer3D;
		function set parent(value:ObjectContainer3D):void;
		
		/**是否与某个矩形发生碰撞*/
		function hitRect(rect:Rectangle):Boolean;
		
		/**是否与某个点发生碰撞*/
		function hitPoint(p:Point):Boolean;
		
		/**销毁显示对象 */
		function destroy():void;
	}
}