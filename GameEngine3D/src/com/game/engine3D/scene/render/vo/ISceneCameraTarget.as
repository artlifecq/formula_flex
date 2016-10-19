package com.game.engine3D.scene.render.vo
{
	import flash.geom.Point;

	public interface ISceneCameraTarget
	{
		function get speed():Number;
		function set speed(value:Number):void;
		
		function get pos():Point;
		function set pos(value:Point):void;
	}
}