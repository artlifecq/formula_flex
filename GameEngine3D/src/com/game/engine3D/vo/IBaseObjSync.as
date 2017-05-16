package com.game.engine3D.vo
{
	import flash.geom.Vector3D;

	/**
	 *
	 * 基础对象绑定接口
	 * @author L.L.M.Sunny
	 * 创建时间：2017-04-20 上午11:12:28
	 *
	 */
	public interface IBaseObjSync
	{
		function syncInfo(initiator : BaseObj3D, position : Vector3D, rotation : Vector3D, visible : Boolean) : void;
	}
}
