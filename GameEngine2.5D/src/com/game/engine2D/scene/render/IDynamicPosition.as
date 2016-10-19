package com.game.engine2D.scene.render
{
	import flash.geom.Point;
	
	/**
	 * 换装动态位置接口(主要用于换装动态位置的控制)
	 * @author Carver
	 */	
	public interface IDynamicPosition
	{
		/**
		 * 返回动态目标位置
		 * */
		function update($dnyObj:*):Point;
	}
}