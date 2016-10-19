package com.game.engine2D.scene.render.vo
{
	/**
	 *
	 * 兼容风云动画资源配置信息
	 * 
	 * 每一帧的资源信息
	 * @author fly.liuyang
	 * 创建时间：2014-3-10 下午6:30:18
	 * 
	 */
	public class SheetData
	{
		/**
		 * 动作的名称 
		 * stand 
		 * walk
		 * jump
		 * ... 
		 */		
		public var actionName:uint;
		/**
		 * 动作角度
		 * 资源角度示意图
		 * 7    0    1
		 * 6         2
		 * 5    4    3 
		 */		
		public var angle:int;
		
		/** 帧资源对应的反射名   */		
		public var className:String;
		/** x轴偏移量 */		
		public var tx:int;
		/** y轴偏移量 */		
		public var ty:int;
		/** 播放持续的时间  */		
		public var duration:int;
		/** 资源位图的宽*/
		public var width:int;
		/** 资源位图的高*/
		public var height:int;
	}
}