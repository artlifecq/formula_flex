package com.rpgGame.app.interfaces
{
	/**
	 *
	 * 地图处理类接口
	 * @author fly.liuyang
	 * 创建时间：2014-6-11 下午9:30:41
	 * 
	 */
	public interface IMapProcess
	{
		/** 开始进到这个某个地图时是自动调用  */		
		function setup():void;
		/** 场景资源初始化完成后自动调用  */		
		function init():void;
		/** 离开场景时自动调用 */		
		function destroy():void;
	}
}