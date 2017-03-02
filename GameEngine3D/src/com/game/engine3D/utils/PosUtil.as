package com.game.engine3D.utils
{
	import com.game.engine3D.config.GlobalConfig;
	
	import flash.geom.Vector3D;

	public class PosUtil
	{
		public function PosUtil()
		{
		}
		
		public static function to3DPos(x:Number,y:Number):Vector3D
		{
			var vec:Vector3D;
			if(GlobalConfig.use2DMap)
			{
				vec = new Vector3D(x,y,GlobalConfig.transform2dValue(y));
			}
			else
			{
				vec = new Vector3D(x,0,y);
			}
			return vec;
		}
	}
}