package com.game.engine2D.scene.render.vo
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	
	import flash.display.Shape;
	
	public class GraphicShape extends Shape implements IPoolClass
	{
		public function GraphicShape()
		{
			super();
		}
		
		public function dispose():void
		{
		}
		
		public function reSet($parameters:Array):void
		{
		}
	}
}