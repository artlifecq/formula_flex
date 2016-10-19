package com.rpgGame.app.map
{
	import com.rpgGame.app.interfaces.IMapProcess;

	public class BaseMapProcess implements IMapProcess
	{
		public function BaseMapProcess()
		{
		}
		
		/**
		 * 开始进到这个某个地图时是自动调用 
		 * 
		 */		
		public function setup():void
		{
			
		}
		
		/**
		 * 场景资源初始化完成后自动调用
		 * 
		 */		
		public function init():void
		{
			
		}
		
		/**
		 * 离开场景时自动调用
		 * 
		 */		
		public function destroy():void
		{
			
		}
	}
}