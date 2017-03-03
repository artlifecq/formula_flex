package com.game.engine3D.pathFinding
{
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.HeightMapHelper;

	/**
	 * HeightMapHelper的再一次封装 
	 * @author NEIL
	 * 
	 */	
	public class HeightMapHelperProxy
	{
		public static const MODE_XY : int = 0;
		public static const MODE_XZ : int = 1;
		public static var _instance:HeightMapHelperProxy;
		public function HeightMapHelperProxy()
		{
			
		}
		
		public static function traslateVector3Ds(heightMapHelper:HeightMapHelper,vecs:Vector.<Vector3D>, xyzMode : int = MODE_XZ):void
		{
			for each(var vec:Vector3D in vecs)
			{
				if (MODE_XZ == xyzMode) {
					vec.y = heightMapHelper.queryHeightAt(vec.x,vec.z);
				} else if (MODE_XY == xyzMode) {
					vec.z = heightMapHelper.queryHeightAt(vec.x,vec.y);
				}
			}
		}
	}
}