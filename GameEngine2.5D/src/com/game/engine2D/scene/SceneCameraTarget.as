package com.game.engine2D.scene
{
	import away3d.containers.ObjectContainer3D;
	
	public class SceneCameraTarget extends ObjectContainer3D
	{
		public function SceneCameraTarget()
		{
			super();
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