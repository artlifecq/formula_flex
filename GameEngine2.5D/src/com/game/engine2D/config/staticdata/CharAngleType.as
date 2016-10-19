package com.game.engine2D.config.staticdata
{
	/**
	 * 角色角度类型(0方向为6点钟方向, 顺时针旋转)
	 * 
	 * 引擎角度示意图
	 * 3    4    5
	 * 2         6
	 * 1    0    7
	 * @author Carver
	 */		
	public class CharAngleType
	{
		/**  0方向（6点钟方向）  */		
		public static const ANGEL_0:int = 0;
		/** 45方向  */	
		public static const ANGEL_45:int = 1;
		/**  90方向 */	
		public static const ANGEL_90:int = 2;
		/** 135方向 */	
		public static const ANGEL_135:int = 3;
		/** 180方向 */	
		public static const ANGEL_180:int = 4;
		/** 225方向   */	
		public static const ANGEL_225:int = 5;
		/**  270方向 */	
		public static const ANGEL_270:int = 6;
		/**  315方向  */	
		public static const ANGEL_315:int = 7;
	}
}