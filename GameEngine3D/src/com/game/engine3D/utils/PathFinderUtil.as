package com.game.engine3D.utils
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.mainCore.libCore.utils.ZMath;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.core.math.Matrix3DUtils;
	import away3d.pathFinding.DistrictWithPath;
	
	/**
	 *
	 * 寻路工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 下午2:17:33
	 *
	 */
	public class PathFinderUtil
	{
		public function PathFinderUtil()
		{
		}
		
		/**
		 * 客户端自己模拟寻路
		 * @param position 当前站立的地方
		 * @param targetPos 寻路的目的地
		 * @return 寻路节点
		 */
		public static function findPath(district : DistrictWithPath, position : Vector3D, targetPos : Vector3D) : Vector.<Vector3D>
		{
			if (district)
			{
				var path : Vector.<Vector3D>;
				var pathBak : Vector.<Vector3D> = new Vector.<Vector3D>;
				var pathCoordList : Vector.<Number>;
				//兼容2.5D 对3d寻路没有影响
				if (GlobalConfig.use2DMap)
				{
					position.y = position.z;
				}
				if (isPointInSide(district, targetPos))
					pathCoordList = district.findPath(position, targetPos);
				
				if (pathCoordList && pathCoordList.length > 1)
				{
					var coordCount : int = pathCoordList.length / 2;
					path = new Vector.<Vector3D>();
					path.length = coordCount / 2 - 1;
					
					for (var i : int = 0; i < coordCount; i++)
					{
						if (pathBak.length - 1 < i)
						{
							pathBak.length = i;
							pathBak[i] = new Vector3D();
						}
						
						pathBak[i].setTo(pathCoordList[i * 2], 0, pathCoordList[i * 2 + 1]);
						path[i] = pathBak[i];
					}
					return path;
				}
			}
			return null;
		}
		
		public static function isPointInSide(district : DistrictWithPath, position : Vector3D) : Boolean
		{
			if (district && district.isPointInSide(position, district.radiusForEntity))
			{
				return true;
			}
			return false;
		}
		
		public static function isSolid(district : DistrictWithPath, targetPos : Vector3D) : Boolean
		{
			if (district && district.isPointInSide(targetPos, district.radiusForEntity))
			{
				return false;
			}
			return true;
		}
		
		public static function getFarthestWalkablePosByStraight(district : DistrictWithPath, position : Vector3D, offsetPos : Vector3D, dist : int = 100, step : int = 32) : Vector3D
		{
			var resultPos : Vector3D;
			var len : int = dist / step;
			var pos3d : Vector3D = new Vector3D();
			for (var i : int = 1; i <= len; i++)
			{
				pos3d.setTo(position.x + offsetPos.x * i * step, 0, position.z + offsetPos.z * i * step);
				var vec : Vector.<Vector3D> = PathFinderUtil.findPath(district, position, pos3d);
				if (vec && vec.length >= 2)
				{
					resultPos = vec.pop();
				}
				else
				{
					break;
				}
			}
			return resultPos;
		}
		
		public static function getWalkablePosByOffset(district : DistrictWithPath, position : Vector3D, offsetPos : Vector3D, dist : int, stepDist : int = 32) : Vector3D
		{
			if (district)
			{
				var targetPos : Vector3D = new Vector3D();
				offsetPos.y = 0;
				offsetPos.normalize();
				var targetPos3d : Vector3D = Matrix3DUtils.CALCULATION_VECTOR3D;
				targetPos3d.setTo(position.x + offsetPos.x * dist, 0, position.z + offsetPos.z * dist);
				targetPos.setTo(targetPos3d.x, 0, targetPos3d.z);
				var dx : Number = 0;
				var dz : Number = 0;
				var targetDist : Number = MathUtil.getDistance(position.x, position.z, targetPos.x, targetPos.z);
				if (targetDist > stepDist)
				{
					var angle : Number = getTowPointsAngle(position.x, position.z, targetPos.x, targetPos.z);
					var angleRad : Number = angle * Math.PI / 180;
					var cosV : Number = Math.cos(angleRad);
					var sinV : Number = Math.sin(angleRad);
					
					var doubleStepDist : int = stepDist * stepDist;
					var tmpPos3d : Vector3D = new Vector3D();
					tmpPos3d.setTo(position.x, position.z, position.z);
					var pos3d : Vector3D = new Vector3D();
					pos3d.setTo(tmpPos3d.x, tmpPos3d.z, tmpPos3d.z);
					//循环递增
					while (true)
					{
						//如果新位置不是障碍则继续寻找
						if (isPointInSide(district, tmpPos3d))
						{
							pos3d.setTo(tmpPos3d.x, tmpPos3d.z, tmpPos3d.z);
							//如果两点距离小于一个跨度，则认定为同一点,直接返回起始点
							dx = targetPos.x - tmpPos3d.x;
							dz = targetPos.z - tmpPos3d.z;
							if (dx * dx + dz * dz < doubleStepDist)
							{
								break;
							}
							//递增
							tmpPos3d.x += stepDist * cosV;
							tmpPos3d.z += stepDist * sinV;
							tmpPos3d.y = tmpPos3d.z;
						}
						else
						{
							break;
						}
					}
					return pos3d;
				}
				return position.clone();
			}
			return null;
		}
		
		/**
		 * 获取前方非障碍点
		 * @param district
		 * @param position
		 * @param targetPos
		 * @param step
		 * @return
		 *
		 */
		public static function getForwardPointInSide(district : DistrictWithPath, position : Vector3D, targetPos : Vector3D, stepDist : int = 32) : Vector3D
		{
			if (district)
			{
				var dx : Number = 0;
				var dz : Number = 0;
				var targetDist : Number = MathUtil.getDistance(position.x, position.z, targetPos.x, targetPos.z);
				if (targetDist > stepDist)
				{
					var angle : Number = getTowPointsAngle(position.x, position.z, targetPos.x, targetPos.z);
					var angleRad : Number = angle * Math.PI / 180;
					var cosV : Number = Math.cos(angleRad);
					var sinV : Number = Math.sin(angleRad);
					
					var doubleStepDist : int = stepDist * stepDist;
					var tmpPos3d : Vector3D = new Vector3D();
					tmpPos3d.setTo(position.x, 0, position.z);
					var pos3d : Vector3D = new Vector3D();
					pos3d.setTo(tmpPos3d.x, 0, tmpPos3d.z);
					//循环递增
					while (true)
					{
						//如果新位置不是障碍则继续寻找
						if (isPointInSide(district, tmpPos3d))
						{
							pos3d.setTo(tmpPos3d.x, 0, tmpPos3d.z);
							//如果两点距离小于一个跨度，则认定为同一点,直接返回起始点
							dx = targetPos.x - tmpPos3d.x;
							dz = targetPos.z - tmpPos3d.z;
							if (dx * dx + dz * dz < doubleStepDist)
							{
								break;
							}
							//递增
							tmpPos3d.x += stepDist * cosV;
							tmpPos3d.z += stepDist * sinV;
						}
						else
						{
							break;
						}
					}
					return pos3d;
				}
				return position.clone();
			}
			return null;
		}
		
		public static function getDistPos(district : DistrictWithPath, position : Vector3D, targetPos : Vector3D, dist : int, stepDist : int = 32) : Vector3D
		{
			if (district)
			{
				var dx : Number = 0;
				var dz : Number = 0;
				var targetDist : Number = MathUtil.getDistance(position.x, position.z, targetPos.x, targetPos.z);
				if (targetDist > dist)
				{
					var angle : Number = getTowPointsAngle(position.x, position.z, targetPos.x, targetPos.z);
					var angleRad : Number = angle * Math.PI / 180;
					var cosV : Number = Math.cos(angleRad);
					var sinV : Number = Math.sin(angleRad);
					
					var pos3d : Vector3D = new Vector3D();
					pos3d.setTo(position.x + dist * cosV, 0, position.z + dist * sinV);
					if (isPointInSide(district, pos3d))
					{
						return pos3d;
					}
					//
					var doubleStepDist : int = stepDist * stepDist;
					if (targetDist > stepDist)
					{
						//循环递减
						while (true)
						{
							//如果新位置不是障碍则返回该位置
							if (isPointInSide(district, pos3d))
							{
								return pos3d;
							}
							//如果两点距离小于一个跨度，则认定为同一点,直接返回起始点
							dx = position.x - pos3d.x;
							dz = position.z - pos3d.z;
							if (dx * dx + dz * dz < doubleStepDist)
							{
								return position.clone();
							}
							//递减
							pos3d.x -= stepDist * cosV;
							pos3d.z -= stepDist * sinV;
						}
					}
				}
				return position.clone();
			}
			return null;
		}
		
		public static function getNearestPos(district : DistrictWithPath, position : Vector3D, targetPos : Vector3D, stepDist : int = 32) : Vector3D
		{
			if (district)
			{
				if (isPointInSide(district, targetPos))
				{
					return targetPos;
				}
				
				var dx : Number = 0;
				var dz : Number = 0;
				var targetDist : Number = MathUtil.getDistance(position.x, position.z, targetPos.x, targetPos.z);
				if (targetDist > stepDist)
				{
					var angle : Number = getTowPointsAngle(position.x, position.z, targetPos.x, targetPos.z);
					var angleRad : Number = angle * Math.PI / 180;
					var cosV : Number = Math.cos(angleRad);
					var sinV : Number = Math.sin(angleRad);
					
					var pos3d : Vector3D = new Vector3D();
					pos3d.setTo(position.x + targetDist * cosV, 0, position.z + targetDist * sinV);
					//
					var doubleStepDist : int = stepDist * stepDist;
					//循环递减
					while (true)
					{
						//如果新位置不是障碍则返回该位置
						if (isPointInSide(district, pos3d))
						{
							return pos3d;
						}
						//如果两点距离小于一个跨度，则认定为同一点,直接返回起始点
						dx = position.x - pos3d.x;
						dz = position.z - pos3d.z;
						if (dx * dx + dz * dz < doubleStepDist)
						{
							return position.clone();
						}
						//递减
						pos3d.x -= stepDist * cosV;
						pos3d.z -= stepDist * sinV;
					}
				}
				return position.clone();
			}
			return null;
		}
		
		public static function getRoundPoses(district : DistrictWithPath, targetPos : Vector3D, dist : int = 200, stepDist : int = 32) : Vector.<Vector3D>
		{
			if (district)
			{
				var poses : Vector.<Vector3D> = new Vector.<Vector3D>();
				if (isPointInSide(district, targetPos))
				{
					poses.push(targetPos.clone());
				}
				else
				{
					//寻找距离目标点距离的最优非障碍点
					var posList : Vector.<Point> = new Vector.<Point>;
					for (var i : Number = targetPos.x - dist; i < targetPos.x + dist; i += stepDist)
					{
						for (var j : Number = targetPos.z - dist; j < targetPos.z + dist; j += stepDist)
						{
							posList.push(new Point(i, j));
						}
					}
					HELP_POINT1.setTo(targetPos.x, targetPos.z);
					posList.sort(onPosSortFunc);
					var len : int = posList.length;
					var pos : Point;
					while (len-- > 0)
					{
						pos = posList[len];
						HELP_VECTOR3D1.setTo(pos.x, 0, pos.y);
						if (isPointInSide(district, HELP_VECTOR3D1))
							poses.push(HELP_VECTOR3D1.clone());
					}
				}
				return poses;
			}
			return null;
		}
		
		private static var HELP_VECTOR3D1:Vector3D = new Vector3D();
		private static var HELP_VECTOR3D2:Vector3D = new Vector3D();
		private static var HELP_POINT1:Point = new Point();
		private static var HELP_POINT2:Point = new Point();
		public static function onPosSortFunc(posA : Point, posB : Point) : int
		{
			var disA : Number = Point.distance(posA, HELP_POINT1);
			var disB : Number = Point.distance(posB, HELP_POINT1);
			if (disA > disB)
				return -1;
			else if (disA < disB)
				return 1;
			return 0;
		}
		
		private static function getTowPointsAngle(px:Number,py:Number,tx:Number,ty:Number):Number
		{
			HELP_POINT1.setTo(px,py);
			HELP_POINT2.setTo(tx,ty);
			var angle : Number = ZMath.getTowPointsAngle(HELP_POINT1, HELP_POINT2);
			return angle;
		}
	}
}
