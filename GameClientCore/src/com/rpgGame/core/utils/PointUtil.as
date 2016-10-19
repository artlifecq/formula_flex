package com.rpgGame.core.utils
{
	import com.game.engine3D.utils.MathUtil;
	import com.game.mainCore.libCore.utils.ZMath;

	import flash.geom.Point;

	public class PointUtil
	{
		public function PointUtil()
		{
		}

		/**
		 * 求 第三个点 到前两个点所在直线的距离
		 * params
		 * @author 张圣洁 2014-6-13
		 */
		public static function pointToLineDis(p1 : Point, p2 : Point, p0 : Point) : Number
		{
			var dx : int = p2.x - p1.x;
			var dy : int = p2.y - p1.y;
			var upValue : Number = Math.abs(dy * p0.x - dx * p0.y - p1.x * p2.y + p2.x * p1.y);
			var downValue : Number = Math.sqrt(dx * dx + dy * dy);
			return upValue / downValue;
		}

		/**
		 *
		 * @param p0  已知方向的点
		 * @param angle 方向（和x轴的角度）
		 * @param dis p0沿着此方向移动的距离
		 * @param p 已知点 到 直线的距离
		 * @return
		 *
		 */
		public static function pointToVerticalLine(p0 : Point, angle : Number, dis : Number, p : Point) : Number
		{
			var p1 : Point = MathUtil.getAnglePos(p0, angle, dis);
			var p2 : Point = ZMath.getRotPoint(p0, p1, 90);
			return pointToLineDis(p1, p2, p);
		}

		/**
		 *
		 * @param p0  已知方向的点
		 * @param angle 方向（和x轴的角度）
		 * @param dis p0沿着此方向移动的距离
		 * @param p 已知点 到 直线的距离
		 * @return 和直线的交点
		 *
		 */
		public static function verticalLineCrossPoint(p0 : Point, angle : Number, dis : Number, p : Point) : Point
		{
			var p1 : Point = MathUtil.getAnglePos(p0, angle, dis);
			var p2 : Point = ZMath.getRotPoint(p0, p1, 90);

			//求p和 p1 p2所在直线的交点   ax + by + c = 0  下面求 a，b，c
			var a : Number = p2.y - p1.y;
			var b : Number = p1.x - p2.x;
			var c : Number = p1.y * (p2.x - p1.x) - p1.x * (p2.y - p1.y);

			var downNum : Number = a * a + b * b;

			var x : Number = (b * b * p.x - a * b * p.y - a * c) / downNum;
			var y : Number = (a * a * p.y - a * b * p.x - b * c) / downNum;

			var point : Point = new Point(x, y);
			return point;
		}

	}
}
