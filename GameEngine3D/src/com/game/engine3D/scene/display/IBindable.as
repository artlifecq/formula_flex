package com.game.engine3D.scene.display
{
	import flash.geom.Vector3D;

	import away3d.containers.ObjectContainer3D;

	/**
	 *
	 * 可绑定接口
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 上午11:12:28
	 *
	 */
	public interface IBindable
	{
		function get bindTarget() : ObjectContainer3D;
		function set bindTarget(value : ObjectContainer3D) : void;
		function set bindOffset(value : Vector3D) : void;
		function get bindOffset() : Vector3D;
	}
}
