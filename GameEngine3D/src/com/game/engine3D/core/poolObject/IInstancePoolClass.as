package com.game.engine3D.core.poolObject
{

	/**
	 *
	 * 实例对象池接口
	 * @author L.L.M.Sunny
	 * 创建时间：2016-11-7 上午10:26:35
	 *
	 */
	public interface IInstancePoolClass
	{
		/**
		 * 只是简单地销毁，从显示列表中去掉 
		 * 
		 */		
		function instanceDispose() : void;
		function instanceDestroy() : void;
		function reSet(parameters : Array) : void;
	}
}
