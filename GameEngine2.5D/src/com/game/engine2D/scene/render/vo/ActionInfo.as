package com.game.engine2D.scene.render.vo
{
	/**
	 *
	 * 兼容风云动画资源配置信息
	 * @author fly.liuyang
	 * 创建时间：2014-3-10 下午6:36:22
	 * 
	 */
	public class ActionInfo
	{
		/** 关键帧是第几帧(0开始) 比如攻击动画的话, 
		 * 关键帧就是释放弹道或者在受击方身上播放爆点的帧. 
		 * 特效的话,天上掉个火球的, 第几帧要在受击方身上加爆点
		 * */
		public var keyFrame:int;
		
		/**
		 * 动作的名称 
		 * stand 
		 * walk
		 * jump
		 * ... 
		 */		
		public var actionName:uint;
		
		/**
		 * 动作加上朝向
		 * stand_1
		 * stand_2
		 * ...
		 */		
//		public var actionKey:String;
	
		/** 动作 **/
		public var action:uint;
		/** 朝向 **/
		public var angle:uint;
		
		/**
		 * 动作的总帧数 
		 */		
		public var totalFrame:int;
		
		/**
		 * 帧列表 
		 */		
		public var framVec:Vector.<SheetData>;
		
		/**
		 *到关键帧的时间 
		 */		
		public var keyFrameTime:uint;
		
		/**
		 *动作总时间 
		 */		
		public var totalTime:uint;
	}
}