package com.game.engine3D.utils
{
	import com.game.mainCore.libCore.utils.ZMath;

	import flash.geom.Point;
	import flash.geom.Vector3D;

	import away3d.containers.ObjectContainer3D;
	import away3d.tools.utils.Bounds;

	/**
	 *
	 * 数学工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-8 下午19:05:12
	 *
	 */
	public class MathUtil
	{
		public function MathUtil()
		{
		}

		public static function clamp(min : Number, max : Number, value : Number) : Number
		{
			if (value < min)
			{
				return min;
			}
			else if (value > max)
			{
				return max;
			}
			else
			{
				return value;
			}
		}
		
		public static function getAngle(ax : Number, ay : Number, bx : Number, by : Number) : Number
		{
			var dx : Number = bx - ax;
			var dy : Number = by - ay;
			var angle : Number = Math.round(Math.atan2(dy, dx) * 57.33);
			angle = angle % 360;
			return angle;
		}
		
		public static function getRadian(ax : Number, ay : Number, bx : Number, by : Number) : Number
		{
			var dx : Number = bx - ax;
			var dy : Number = by - ay;
			return Math.atan2(dy, dx);
		}
		
		public static function angleToRadian(angle : Number) : Number
		{
			return angle * 0.0175;
		}
		
		public static function getDxByAngle(value : Number, angle : Number) : Number
		{
			return cosd(angle) * value;
		}
		
		public static function getDyByAngle(value : Number, angle : Number) : Number
		{
			return sind(angle) * value;
		}
		
		public static function sind(angle : Number) : Number
		{
			return Math.sin(0.0175 * angle);
		}
		
		public static function cosd(angle : Number) : Number
		{
			return Math.cos(0.0175 * angle);
		}
		
		public static function getDistance(ax : Number, ay : Number, bx : Number, by : Number) : Number
		{
			return Math.sqrt(((ax - bx) * (ax - bx)) + ((ay - by) * (ay - by)));
		}
		
		public static function getDistanceNoSqrt(ax : Number, ay : Number, bx : Number, by : Number) : Number
		{
			return ((ax - bx) * (ax - bx)) + ((ay - by) * (ay - by));
		}
		
		public static function getOffsetByAngle(angle : int) : Array
		{
			angle = (angle + 360) % 360;
			if (angle <= 22 || angle >= 338)
				return [1, 0];
			else if (angle >= 23 && angle <= 67)
				return [1, 1];
			else if (angle >= 68 && angle <= 112)
				return [0, 1];
			else if (angle >= 113 && angle <= 157)
				return [-1, 1];
			else if (angle >= 158 && angle <= 202)
				return [-1, 0];
			else if (angle >= 203 && angle <= 247)
				return [-1, -1];
			else if (angle >= 248 && angle <= 292)
				return [0, -1];
			else if (angle >= 293 && angle <= 337)
				return [1, -1];
			return [0, 0];
		}
		
		public static function containerBounds(oc : ObjectContainer3D, sceneBased : Boolean = true) : Vector.<Number>
		{
			Bounds.getObjectContainerBounds(oc, sceneBased);
			return Vector.<Number>([Bounds.minX, Bounds.minY, Bounds.minZ, Bounds.maxX, Bounds.maxY, Bounds.maxZ]);
		}
		
		public static function clockwiseSortPoints(vertexList : Vector.<Point>) : Point
		{
			var center : Point = getPolygonCenter(vertexList);
			vertexList.sort(pointCmp);
			function pointCmp(a : Point, b : Point) : Number
			{
				if (a.x >= 0 && b.x < 0)
					return 1;
				if (a.x == 0 && b.x == 0)
					return a.y > b.y ? 1 : a.y < b.y ? -1 : 0;
				var det : int = (a.x - center.x) * (b.y - center.y) - (b.x - center.x) * (a.y - center.y);
				if (det < 0)
					return 1;
				if (det > 0)
					return -1;
				var d1 : int = (a.x - center.x) * (a.x - center.x) + (a.y - center.y) * (a.y - center.y);
				var d2 : int = (b.x - center.x) * (b.x - center.y) + (b.y - center.y) * (b.y - center.y);
				return d1 > d2 ? 1 : d1 < d2 ? -1 : 0;
			}
			/*var pLen : int = vertexList.length;
			for (var i : int = 0; i < pLen - 1; i++)
			{
			for (var j : int = 0; j < pLen - i - 1; j++)
			{
			if (pointCmp(vertexList[j], vertexList[j + 1], center))
			{
			var tmp : Point = vertexList[j];
			vertexList[j] = vertexList[j + 1];
			vertexList[j + 1] = tmp;
			}
			}
			}*/
			return center;
		}
		
		public static function getPolygonCenter(vertexList : Vector.<Point>) : Point
		{
			var center : Point = new Point();
			var x : Number = 0;
			var y : Number = 0;
			var pLen : int = vertexList.length;
			for (var i : int = 0; i < pLen; i++)
			{
				var p : Point = vertexList[i];
				x += p.x;
				y += p.y;
			}
			center.x = int(x / pLen);
			center.y = int(y / pLen);
			return center;
		}
		
		/**
		 * 延伸多边形
		 * @author L.L.M.Sunny 20161008
		 * @param points
		 * @param extend 负数则为缩小
		 *
		 */
		public static function extendPolygon(points : Vector.<Point>, extend : int) : void
		{
			var center : Point = getPolygonCenter(points);
			for each (var pos : Point in points)
			{
				var dist : int = getDistance(center.x, center.y, pos.x, pos.y) + extend;
				var angle : Number = getAngle(center.x, center.y, pos.x, pos.y);
				var dx : Number = getDxByAngle(dist, angle);
				var dy : Number = getDyByAngle(dist, angle);
				pos.x = center.x + dx;
				pos.y = center.y + dy;
			}
		}
		
		private static function pointCmp(a : Point, b : Point, center : Point) : Boolean
		{
			if (a.x >= 0 && b.x < 0)
				return true;
			if (a.x == 0 && b.x == 0)
				return a.y > b.y;
			var det : int = (a.x - center.x) * (b.y - center.y) - (b.x - center.x) * (a.y - center.y);
			if (det < 0)
				return true;
			if (det > 0)
				return false;
			var d1 : int = (a.x - center.x) * (a.x - center.x) + (a.y - center.y) * (a.y - center.y);
			var d2 : int = (b.x - center.x) * (b.x - center.y) + (b.y - center.y) * (b.y - center.y);
			return d1 > d2;
		}
		
		public static function pointInPolygon(vertexList : Vector.<Point>, p : Point) : Boolean
		{
			if (vertexList == null)
				return false;
			if (p.x < 0 || p.y < 0)
				return false;
			
			var n : int = vertexList.length;
			var i : int = 0;
			var p1 : Point;
			var p2 : Point;
			var counter : int = 0;
			var xinters : int = 0;
			p1 = vertexList[0];
			
			for (i = 1; i <= n; i++)
			{
				p2 = vertexList[i % n];
				if (p.y > Math.min(p1.y, p2.y))
				{
					if (p.y <= Math.max(p1.y, p2.y))
					{
						if (p.x <= Math.max(p1.x, p2.x))
						{
							if (p1.y != p2.y)
							{
								xinters = (p.y - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x;
								if (p1.x == p2.x || p.x <= xinters)
									counter++;
							}
						}
					}
				}
				p1 = p2;
			}
			return counter % 2 != 0;
		}
		
		public static function getPolygonBounds(vertexList : Vector.<Point>) : Array
		{
			if (vertexList.length > 1)
			{
				var minX : int = int.MAX_VALUE;
				var minY : int = int.MAX_VALUE;
				var maxX : int = int.MIN_VALUE;
				var maxY : int = int.MIN_VALUE;
				
				for each (var vp : Point in vertexList)
				{
					if (vp.x < minX)
						minX = vp.x;
					if (vp.y < minY)
						minY = vp.y;
					if (vp.x > maxX)
						maxX = vp.x;
					if (vp.y > maxY)
						maxY = vp.y;
				}
				return [minX, minY, maxX, maxY];
			}
			return null;
		}
		
		public static function polygonToGrids(vertexList : Vector.<Point>, width : int, height : int, isInside : Boolean = false) : Array
		{
			var grids : Array = [];
			var p : Point;
			if (vertexList.length > 1)
			{
				var bounds : Array = getPolygonBounds(vertexList);
				
				var minX : int = bounds[0];
				var minY : int = bounds[1];
				var maxX : int = bounds[2];
				var maxY : int = bounds[3];
				
				var lenX : int = maxX - minX;
				var lenY : int = maxY - minY;
				var stepX : int = lenX / width;
				var stepY : int = lenY / height;
				var halfWidth : int = width * 0.5;
				var halfHeight : int = height * 0.5;
				
				var tempPoint : Point = new Point();
				for (var i : int = 0; i < lenX; i += width)
				{
					for (var j : int = 0; j < lenY; j += height)
					{
						p = new Point(minX + i, minY + j);
						if (isInside)
						{
							tempPoint.setTo(p.x - halfWidth, p.y - halfHeight);
							if (!pointInPolygon(vertexList, tempPoint))
							{
								continue;
							}
							tempPoint.setTo(p.x + halfWidth, p.y - halfHeight);
							if (!pointInPolygon(vertexList, tempPoint))
							{
								continue;
							}
							tempPoint.setTo(p.x + halfWidth, p.y + halfHeight);
							if (!pointInPolygon(vertexList, tempPoint))
							{
								continue;
							}
							tempPoint.setTo(p.x - halfWidth, p.y + halfHeight);
							if (!pointInPolygon(vertexList, tempPoint))
							{
								continue;
							}
							grids.push(p);
						}
						else
						{
							if (pointInPolygon(vertexList, p))
							{
								grids.push(p);
							}
						}
					}
				}
			}
			else if (vertexList.length == 1)
			{
				p = vertexList[0];
				grids.push(p);
			}
			return grids;
		}
		
		/**
		 * 球面转直角
		 * @param tilt
		 * @param pan
		 * @param r
		 * @return
		 * @author L.L.M.Sunny 20150928
		 *
		 */
		public static function sphericalToRectangular(tilt : Number, pan : Number, radius : Number, result:Vector3D = null) : Vector3D
		{
			var ts : Number = Math.sin(tilt);
			var pc : Number = Math.cos(pan);
			var ps : Number = Math.sin(pan);
			var tc : Number = Math.cos(tilt);
			var x : Number = radius * ts * pc;
			var y : Number = radius * ts * ps;
			var z : Number = radius * tc;
			
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function projectionRotateX(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var x : Number = ix;
			var y : Number = iy * m - iz * n;
			var z : Number = iy * n + iz * m;
			
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function backProjectionRotateX(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var x : Number = ix;
			var y : Number = (iy + iz * n / m) / (n * n / m + m);
			var z : Number = (iz - y * n) / m;
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function projectionRotateY(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var x : Number = ix * m + iz * n;
			var y : Number = iy;
			var z : Number = iz * m - ix * n;
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function backProjectionRotateY(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var z : Number = (iz + ix * n / m) / (m + n * n / m);
			var y : Number = iy;
			var x : Number = (ix - z * n) / m;
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function projectionRotateZ(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var x : Number = ix * m - iy * n;
			var y : Number = ix * n + iy * m;
			var z : Number = iz;
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		private static function backProjectionRotateZ(ix : Number, iy : Number, iz : Number, rotate : Number, result:Vector3D = null) : Vector3D
		{
			var n : Number = Math.sin(rotate);
			var m : Number = Math.cos(rotate);
			var x : Number = (ix + iy * n / m) / (n * n / m + m);
			var y : Number = (iy - x * n) / m;
			var z : Number = iz;
			result ||= new Vector3D();
			result.setTo(x, y, z);
			return result;
		}
		
		/**
		 * 投影
		 * @param x
		 * @param y
		 * @param tilt
		 * @param pan
		 * @param roll
		 * @return
		 * @author L.L.M.Sunny 20150928
		 *
		 */
		public static function projection(x : Number, y : Number, tilt : Number, pan : Number, roll : Number) : Point
		{
			var vec : Vector3D = Vector3DUtil.vec0;
			vec.setTo(x, y, 0);
			vec = projectionRotateX(x, y, 0, tilt, vec);
			vec = projectionRotateY(vec.x, vec.y, vec.z, pan, vec);
			vec = projectionRotateZ(vec.x, vec.y, vec.z, roll, vec);
			var p : Point = new Point(vec.x, vec.y);
			return p;
		}
		
		/**
		 * 反投影
		 * @param x
		 * @param y
		 * @param tilt
		 * @param pan
		 * @param roll
		 * @return
		 * @author L.L.M.Sunny 20150929
		 *
		 */
		public static function backProjection(ix : Number, iy : Number, tilt : Number, pan : Number, roll : Number) : Point
		{
			var z : Number = 0;
			var n1 : Number = Math.sin(tilt);
			var m1 : Number = Math.cos(tilt);
			var n2 : Number = Math.sin(pan);
			var m2 : Number = Math.cos(pan);
			var iz : Number = (iy * n1 * m2 - ix * n2 - z) / (m1 * m2);
			var vec : Vector3D = Vector3DUtil.vec0;;
			vec = backProjectionRotateZ(ix, iy, iz, roll, vec);
			vec = backProjectionRotateY(vec.x, vec.y, vec.z, pan, vec);
			vec = backProjectionRotateX(vec.x, vec.y, vec.z, tilt, vec);
			var p : Point = new Point(vec.x, vec.y);
			return p;
		}
		
		public static function getAnglePos(startPos : Point, angle : Number, dist : Number, result:Point = null) : Point
		{
			var pos : Point = result ||= new Point();
			var radian : Number = angle / 180 * Math.PI;
			pos.x = startPos.x + dist * Math.cos(radian);
			pos.y = startPos.y + dist * Math.sin(radian);
			return pos;
		}
		
		public static function get2PosDisPos(startPos : Point, endPos : Point, dist : Number) : Point
		{
			var pos : Point;
			if (dist <= 0)
			{
				pos = new Point(startPos.x, startPos.y);
				return pos;
			}
			else
			{
				var posDist : Number = Point.distance(startPos, endPos);
				if (dist > posDist)
				{
					pos = new Point(endPos.x, endPos.y);
					return pos;
				}
			}
			var angle : Number = ZMath.getTowPointsAngle(startPos, endPos);
			pos = getAnglePos(startPos, angle, dist);
			return pos;
		}
		
		public static function pointInArea(vertexList : Vector.<Point>, p : Point) : Boolean
		{
			if (vertexList == null)
				return false;
			if (vertexList.length<3)
				return false;
			var n : int = vertexList.length;
			var i : int = 0;
			var p1 : Point;
			var p2 : Point;
			var counter : int = 0;
			var xinters : int = 0;
			p1 = vertexList[0];
			
			for (i = 1; i <= n; i++)
			{
				p2 = vertexList[i % n];
				if (p.y > Math.min(p1.y, p2.y))
				{
					if (p.y <= Math.max(p1.y, p2.y))
					{
						if (p.x <= Math.max(p1.x, p2.x))
						{
							if (p1.y != p2.y)
							{
								xinters = (p.y - p1.y) * (p2.x - p1.x) / (p2.y - p1.y) + p1.x;
								if (p1.x == p2.x || p.x <= xinters)
									counter++;
							}
						}
					}
				}
				p1 = p2;
			}
			return counter % 2 != 0;
		}

	}
}
