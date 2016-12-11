package com.game.engine3D.core.interfaces
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;

	/**
	 *
	 * 3D显示对象接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public interface IDisplayObject3D
	{
		function get alpha():Number;
		function set alpha(value:Number):void;
		function get blendMode():String;
		function set blendMode(value:String):void;
		function get graphicDis() : ObjectContainer3D;
		function set graphicDis(value : ObjectContainer3D) : void;
		function get parent() : ObjectContainer3D;
		function set parent(value : ObjectContainer3D) : void;
		function get visible() : Boolean;
		function set visible(value : Boolean) : void;
		function get x() : Number;
		function set x(value : Number) : void;
		function get y() : Number;
		function set y(value : Number) : void;
		function get z() : Number;
		function set z(value : Number) : void;
		function get scaleX() : Number;
		function set scaleX(value : Number) : void;
		function get scaleY() : Number;
		function set scaleY(value : Number) : void;
		function get scaleZ() : Number;
		function set scaleZ(value : Number) : void;
		function set scale(value : Vector3D) : void;
		function get scale() : Vector3D;
		function setScale(value : Number) : void;
		function set rotation(value : Vector3D) : void;
		function get rotation() : Vector3D;
		function get rotationX() : Number;
		function set rotationX(value : Number) : void;
		function get rotationY() : Number;
		function set rotationY(value : Number) : void;
		function get rotationZ() : Number;
		function set rotationZ(value : Number) : void;
		function set position(value : Vector3D) : void;
		function get position() : Vector3D;
		function get transform() : Matrix3D;
		function get sceneTransform() : Matrix3D;
		function get offsetX() : Number;
		function set offsetX(value : Number) : void;
		function get offsetY() : Number;
		function set offsetY(value : Number) : void;
		function get offsetZ() : Number;
		function set offsetZ(value : Number) : void;
		function destroy() : void;
	}
}
