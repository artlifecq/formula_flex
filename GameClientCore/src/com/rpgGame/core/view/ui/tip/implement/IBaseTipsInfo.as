package com.rpgGame.core.view.ui.tip.implement
{
	import flash.geom.Point;

	public interface IBaseTipsInfo
	{
		function get tipsType():uint;
		function get isDynamic():Boolean;
		function getData():*;
		function get point():Point;
	}
}