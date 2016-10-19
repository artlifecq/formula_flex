package com.game.engine3D.vo
{
	import flash.geom.Vector3D;

	/**
	 *
	 * 地图点集
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-26 下午1:26:38
	 *
	 */
	public class MapPointSet
	{
		public var name : String;
		public var points : Vector.<Vector3D>;

		public function MapPointSet(name : String, points : Vector.<Vector3D>)
		{
			this.name = name;
			this.points = points;
		}
	}
}
