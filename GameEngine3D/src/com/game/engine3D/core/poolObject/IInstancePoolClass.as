package com.game.engine3D.core.poolObject
{

	/**
	 *
	 * 实例对象池接口.对象回收必定会先调用recycle再顺序putInPool
	 * <br>如果回收对象数量大于设定数量会调用instanceDestroy此对象不会进入池了
	 * @author L.L.M.Sunny
	 * 创建时间：2016-11-7 上午10:26:35
	 *
	 */
	public interface IInstancePoolClass
	{
		/**
		 * 只是简单地销毁，从显示列表中去掉 ，会放入池
		 * 
		 */		
		function putInPool() : void;
		/**
		 *对象被销毁是调用,从池中移除
		 * 
		 */		
		function instanceDestroy() : void;
		function reSet(parameters : Array) : void;
		function get isInPool() : Boolean;
		function get isDestroyed() : Boolean;
	}
}
