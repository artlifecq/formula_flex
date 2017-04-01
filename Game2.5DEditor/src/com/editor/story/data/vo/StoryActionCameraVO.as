package com.editor.story.data.vo
{
	import com.game.engine3D.enum.CameraModeEnum;
	

	public class StoryActionCameraVO extends StoryActionVO
	{
		public function StoryActionCameraVO()
		{
			super();
		}
		
		override public function get actionValue():String
		{
			var str:String = "m" + mode + ",";
			if(mode == CameraModeEnum.DIRECT_CAMERA)
			{
				str += cx + ","
					+ cy + ","
					+ cz + ","
					+ xDeg + ","
					+ yDeg;
			}
			else if(mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
				str += tx + ","
					+ ty + ","
					+ tz + ","
					+ cx + ","
					+ cy + ","
					+ cz;
			}
			else if(mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				str += tx + ","
					+ ty + ","
					+ tz + ","
					+ distance + ","
					+ xDeg + ","
					+ yDeg;
			}
			return str;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			if(value.indexOf("m") < 0)
			{
				valueArr.unshift("m" + CameraModeEnum.LOCK_ON_TARGET);
			}
			var modeStr:String = valueArr[0];
			modeStr = modeStr.replace("m","");
			mode = parseInt(modeStr);
			if(mode == CameraModeEnum.LOCK_ON_TARGET)
			{
				tx = parseInt(valueArr[1]);
				ty = parseInt(valueArr[2]);
				tz = parseInt(valueArr[3]);
				distance = parseInt(valueArr[4]);
				xDeg = parseInt(valueArr[5]);
				yDeg = parseInt(valueArr[6]);
			}
			else if(mode == CameraModeEnum.DIRECT_CAMERA)
			{
				cx = parseInt(valueArr[1]);
				cy = parseInt(valueArr[2]);
				cz = parseInt(valueArr[3]);
				xDeg = parseInt(valueArr[4]);
				yDeg = parseInt(valueArr[5]);
			}
			else if(mode == CameraModeEnum.FIXED_CAMERA_LOOK_AT)
			{
				tx = parseInt(valueArr[1]);
				ty = parseInt(valueArr[2]);
				tz = parseInt(valueArr[3]);
				cx = parseInt(valueArr[4]);
				cy = parseInt(valueArr[5]);
				cz = parseInt(valueArr[6]);
			}
		}
		public var mode:int;
		public var tx:int;
		public var ty:int;
		public var tz:int;
		public var cx:int;
		public var cy:int;
		public var cz:int;
		public var distance:int;
		public var xDeg:int;
		public var yDeg:int;
	}
}