package gameEngine2D {
	import com.game.engine3D.config.GlobalConfig;
	import com.game.engine3D.utils.PathFinderUtil;
	
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.DistrictWithPath;
	import away3d.pathFinding.PointsSet;
	import away3d.pathFinding.PointsSetType;

	public class PolyUtil {
		public function PolyUtil() {
		}
		
		private static var dir : Array = [1, -1, -1, -1, -1, 1, 1, 1];
		public static function findPath(district : DistrictWithPath, position : Vector3D, targetPos : Vector3D) : Vector.<Vector3D> {
			if (null == district) {
				return null;
			}
			if (GlobalConfig.use2DMap)
			{
				position.y = position.z;
			}
			if (!PathFinderUtil.isPointInSide(district, targetPos)) {
				var newTargetPos : Vector3D = getSegmentIntersect(district, position, targetPos);
                if (null == newTargetPos) {
                    newTargetPos = targetPos.clone();
                }
				if (null == newTargetPos) {
					return null;
				}
				var oldX : int = newTargetPos.x;
				var oldY : int = newTargetPos.y;
				for (var i : int = 1; i < 4; ++i) {
					var temp : int = 50 * i;
					for (var j : int = 0; j < 4; ++j) {
						newTargetPos.x = oldX + temp * dir[2 * j];
						newTargetPos.y = oldY + temp * dir[2 * j + 1];
						if (PathFinderUtil.isPointInSide(district, newTargetPos)) {
							return PathFinderUtil.findPath(district, position, newTargetPos);;
						}
					}
				}
				return null;
			}
			
			return PathFinderUtil.findPath(district, position, targetPos);
		}
		
		public static function getSegmentIntersect(district : DistrictWithPath, start : Vector3D, end : Vector3D) : Vector3D {
//			var allPolygon : Vector.<PointsSet> = district.internalPointsSets;
			var allIntersect : Vector.<Vector3D> = new Vector.<Vector3D>();
//			for each(var polygon : PointsSet in allPolygon) {
//				if (!polygon.isClosed) {
//					continue;
//				}
//				if (PointsSetType.BLOCK != polygon.type) {
//					continue;
//				}
//				var points : Vector.<Vector3D> = getSegmentIntersect0(district, start, end, polygon);
//				if (points.length > 0) {
//					for each(var point : Vector3D in points) {
//						allIntersect.push(point);
//					}
//				}
//			}
            var points : Vector.<Vector3D> = getSegmentIntersect0(district, start, end, district.boundPointsSet);
			if (points.length > 0) {
				for each(var point : Vector3D in points) {
					allIntersect.push(point);
				}
			}
			allIntersect.sort(function (a : Vector3D, b : Vector3D) : Number {
				var dx1 : Number = Math.abs(a.x - start.x);
				var dx2 : Number = Math.abs(b.x - start.x);
				return dx1 - dx2;
			});
			if (allIntersect.length > 0) {
				return allIntersect[0];
			}
			return null;
		}
		
		public static function getSegmentIntersect0(district : DistrictWithPath, start : Vector3D, end : Vector3D, polygon : PointsSet) : Vector.<Vector3D> {
			var allPoint : Vector.<Vector3D> = polygon.points;
			var allIntersectPoint : Vector.<Vector3D> = new Vector.<Vector3D>();
			for (var i : int = 0, len : int = allPoint.length; i < len; ++i) {
				var i1 : Vector3D = allPoint[i];
				var i2 : Vector3D;
				if (i == len - 1) {
					i2 = allPoint[0];
				} else {
					i2 = allPoint[i + 1];
				}
				var point : Vector3D = segmentIntersect(district, start, end, i1, i2);
				if (null != point) {
					allIntersectPoint.push(point);
				}
			}
			return allIntersectPoint;
		}
		
		public static function segmentIntersect(district : DistrictWithPath, p1 : Vector3D, p2 : Vector3D, p3 : Vector3D, p4 : Vector3D) : Vector3D {
			var p1p2p3Area : Number = cross(district, new Vector3D(p1.x - p3.x, Math.abs(p1.y) - Math.abs(p3.y), p1.z - p3.z), new Vector3D(p2.x - p3.x, Math.abs(p2.y) - Math.abs(p3.y), p2.z - p3.z));
			var p1p2p4Area : Number = cross(district, new Vector3D(p1.x - p4.x, Math.abs(p1.y) - Math.abs(p4.y), p1.z - p4.z), new Vector3D(p2.x - p4.x, Math.abs(p2.y) - Math.abs(p4.y), p2.z - p4.z));
			if ((p1p2p3Area <= 0 && p1p2p4Area <= 0) || (p1p2p3Area > 0 && p1p2p4Area > 0)) {
				return null;
			}
			var p3p4p1Area : Number = cross(district, new Vector3D(p3.x - p1.x, Math.abs(p3.y) - Math.abs(p1.y), p3.z - p1.z), new Vector3D(p4.x - p1.x, Math.abs(p4.y) - Math.abs(p1.y), p4.z - p1.z));
			var p3p4p2Area : Number = p3p4p1Area + p1p2p3Area - p1p2p4Area;
			if ((p3p4p1Area <= 0 && p3p4p2Area <= 0) || (p3p4p1Area > 0 && p3p4p2Area > 0)) {
				return null;
			}
			var t : Number = p3p4p1Area / (p1p2p4Area - p1p2p3Area);
			var dx : Number = t * (p2.x - p1.x);
			var dy : Number = t * (Math.abs(p2.y) - Math.abs(p1.y));
			var dz : Number = t * (p2.z - p1.z);
			return new Vector3D(p1.x + dx, -(Math.abs(p1.y) + dy), p1.z + dz);
		}
		
		public static function cross(district : DistrictWithPath, a : Vector3D, b : Vector3D) : Number {
			if (district.yUp) {
				return a.x * b.z - a.z * b.x;
			}
			return a.x * b.y - a.y * b.x;
		}
	}
}