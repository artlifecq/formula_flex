package com.editor.story.data.vo
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;

	public class StoryActionCameraRoleVO extends StoryActionVO
	{
		public var roleID:int;
		public var bodyRes:String;
		public var tx:int;
		public var tz:int;
		public var action:String;
		public var rotationY:int;
		public var scale:Number;
		public var posData:ByteArray = new ByteArray();
		public var cameraName:int;
		
		
		private var _posArr:Array = [];
		private var _cmpFun:Function;
		public function StoryActionCameraRoleVO()
		{
			super();
		}
		
		/**
		 * @return 
		 */		
		override public function get actionValue():String
		{
			return bodyRes + ","
				+ tx + ","
				+ tz + ","
				+ action + ","
				+ roleID;
		}
		
		override public function set actionValue(value:String):void
		{
			var valueArr:Array = value.split(",");
			bodyRes = valueArr[0];
			tx = parseInt(valueArr[1]);
			tz = parseInt(valueArr[2]);
			action = valueArr[3];
			roleID = valueArr[4];
		}
		
		/**
		 * 位移
		 * @param curTime 当前时间
		 * @return 
		 * @author 杨剑明	  2015-11-9
		 */
		public function getTransform(curTime:int):Matrix3D
		{
			if(_posArr.length == 0)
			{
				return null;
			}
			var x:Number;
			var y:Number;
			var z:Number;
			var rx:Number;
			var ry:Number;
			var rz:Number;
			var time:int;
			
			var len:int = _posArr.length;
			for (var index:int = 0; index < len; index++) 
			{
				var obj:Object = _posArr[index];
				time = obj.t;
				if(curTime >= time || curTime == 0)
				{
					x = obj.x;
					y = obj.y;
					z = obj.z;
					
					rx = obj.rx;
					ry = obj.ry;
					rz = obj.rz;
					if(curTime == 0)
					{
//						_posArr.splice(index,1);
						break;
						
					}
				}
				else
				{
//					_posArr.splice(index,1);
					break;
				}
			}
			
			var posVec3D:Vector3D = new Vector3D(x,y,z);
			var rotationVec3D:Vector3D = new Vector3D(rx,ry,rz);
			var scaleVec3D:Vector3D = new Vector3D(1,1,1);
			var components:Vector.<Vector3D> = new Vector.<Vector3D>();
			components.push(posVec3D);
			components.push(rotationVec3D);
			components.push(scaleVec3D);
			var matrix3D:Matrix3D = new Matrix3D();
			matrix3D.recompose(components);
			return matrix3D;
		}
		
		/**
		 * @author 杨剑明	  2015-11-10
		 */
		public function readData(cmpFun:Function):void
		{
			posData.uncompress();
			while(posData.bytesAvailable)
			{
				var time:int = posData.readInt();
				var x:Number = posData.readFloat();
				var y:Number = posData.readFloat();
				var z:Number = posData.readFloat();
				var rx:Number = posData.readFloat();
				var ry:Number = posData.readFloat();
				var rz:Number = posData.readFloat();
				_posArr.push({t:time,x:x,y:y,z:z,rx:rx,ry:ry,rz:rz});
				if(cmpFun != null && posData.bytesAvailable == 0)
				{
					_posArr.sortOn("t",Array.NUMERIC);
					cmpFun.apply();
				}
			}
		}
	}
}