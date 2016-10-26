package com.game.engine2D.scene
{
	import com.game.engine3D.scene.render.vo.ISceneCameraTarget;
	
	import flash.geom.Point;
	
	import away3d.containers.ObjectContainer3D;
	
	public class SceneCameraTarget extends ObjectContainer3D implements ISceneCameraTarget
	{
		public function SceneCameraTarget()
		{
			super();
		}
		
		public function get pos():Point
		{
			// TODO Auto Generated method stub
			return null;
		}
		
		public function set pos(value:Point):void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function get speed():Number
		{
			// TODO Auto Generated method stub
			return 0;
		}
		
		public function set speed(value:Number):void
		{
			// TODO Auto Generated method stub
			
		}
		
		
		/*override public function get y():Number
		{
			return -super.y;
		}*/
		
		override public function set y(val:Number):void
		{
			super.y = -val;
		}
	}
}