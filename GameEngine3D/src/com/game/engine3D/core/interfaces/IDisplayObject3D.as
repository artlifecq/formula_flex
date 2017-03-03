package com.game.engine3D.core.interfaces
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	/**
	 *
	 * 3D显示对象接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public interface IDisplayObject3D extends IObject
	{
		function get z() : Number;
		function set z(value : Number) : void;
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
		function get offsetZ() : Number;
		function set offsetZ(value : Number) : void;
	}
}
