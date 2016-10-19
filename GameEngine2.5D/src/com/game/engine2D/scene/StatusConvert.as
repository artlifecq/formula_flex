package com.game.engine2D.scene
{
	/**
	 * 动作状态字符串到数字的映射类，重构代码使用的中间类，最终会被去除 
	 * @author 康露 2014年9月12日
	 * 
	 */
	public class StatusConvert
	{
		public static function getIdByNum(status:uint, angle:int, frame:int) : uint
		{
			return (status<<24) + (angle<<16) + frame;
		}
	}
}
