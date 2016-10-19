package com.game.engine2D.utils
{
	

	/**
	 *
	 * Avatar 资源角度转换
	 * @author fly.liuyang
	 * 创建时间：2014-2-17 下午3:36:40
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-4-21 上午10:33:37
	 */
	public class RenderItemAngleUtil
	{
		/**
		 * 
		 * 引擎角度示意图
		 * 3    4    5
		 * 2         6
		 * 1    0    7
		 * -------------------------
		
		/**
		 *  获取此角度的avatar资源是否需要水平翻转 
		 * @param angle
		 * @return 
		 * 
		 */		
		public static function isNeedScaleX(angle:int):Boolean
		{
			// 哪个更快？ return angle == 1 || angle == 2 || angle == 3;
			return (angle>=1) && (angle<=3);
		}
		
		/**
		 *  获取此角度的avatar资源是否需要水平翻转 
		 * 1 2 3方向的avatar资源由5 6 7 水平翻转
		 * @param angle
		 * @return 
		 * 
		 */		
		public static function getAngleScaleX(angle:int):int
		{
			var scaleX:int = 1;
			if(isNeedScaleX(angle))
			{
				scaleX = -1;
			}
			return scaleX;
		}
		
		public static function getResourceKey(actionName:String,angle:int,frameIndex:int):String
		{
			var sourceAngle:int = angle;
			return actionName + "_" + sourceAngle + "_" + frameIndex;
		}
	}
}