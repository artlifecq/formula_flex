package com.game.engine2D.scene.render.vo.xml
{
	import com.game.engine2D.scene.render.vo.SheetData;
	
	
	/**
	 * 某个换装部件 的 某个状态 的  原始位置配置数据VO
	 * @author Carver
	 */	
	public class RenderUnitData
	{
		/**
		 * 当前角度(从0开始)
		 */
		public var angle:int;
		/**
		 * 当前帧（从0开始）
		 */
		public var frame:int;
		/**
		 * 当前位图在原始资源位图上的位置x
		 */
		public var sx:int;
		/**
		 * 当前位图在原始资源位图上的位置y
		 */
		public var sy:int;
		
		public var width:int;
		public var height:int;
		
		/**
		 * 当前位图原始偏移量
		 * 注意：该值等于配置中的tx+ox,合并了
		 */
		public var tx:int;
		/**
		 * 当前位图原始偏移量
		 * 注意：该值等于配置中的ty+oy,合并了
		 */
		public var ty:int;
		
		public var duration:int;
		
		/**
		 * 是否是关键帧
		 * 关键帧是第几帧(0开始) 比如攻击动画的话, 
		 * 关键帧就是释放弹道或者在受击方身上播放爆点的帧. 
		 * 特效的话,天上掉个火球的, 第几帧要在受击方身上加爆点
		 * 
		 */
		private var _isKeyFrame:Boolean;
		
		public function RenderUnitData(actionName:uint,sheetData:SheetData,$frame:int,$isKeyFrame:Boolean)
		{
			_isKeyFrame = $isKeyFrame;
			if(sheetData != null)
			{
				angle = sheetData.angle;
				frame = $frame;
				width = sheetData.width;
				height = sheetData.height;
				tx = sheetData.tx;
				ty = sheetData.ty;
				duration = sheetData.duration;
			}
		}
		
		public function get valid():Boolean
		{
			return true;//	width > 1 && height > 1
		}
		
		public function toString():String
		{
			return "{key:'" + angle + "_" + frame   +", tX:" + tx +", tY:" + ty + "}"
		}
		
		/**
		 * 是否是关键帧
		 * 关键帧是第几帧(0开始) 比如攻击动画的话, 
		 * 关键帧就是释放弹道或者在受击方身上播放爆点的帧. 
		 * 特效的话,天上掉个火球的, 第几帧要在受击方身上加爆点
		 * 
		 */
		public function get isKeyFrame():Boolean
		{
			return _isKeyFrame;
		}
	}
}
