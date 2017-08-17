package com.rpgGame.coreData.cfg.npc
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.info.move.TrailPathPoint;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 载具路径静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-24 下午9:32:15
	 *
	 */
	public class VehiclePathCfgData
	{
		public function VehiclePathCfgData()
		{
		}
		private static var _map : HashMap = new HashMap();

//		public static function setConfig(data : VehiclePathDataProto) : void
//		{
//			if(data)
//				_map.add(data.id, data);
//			else
//				GameLog.addShow("找不到VehiclePathCfgData配置");
//		}
//
//		public static function getData(id : uint) : VehiclePathDataProto
//		{
//			var data : VehiclePathDataProto = _map.getValue(id);
//			return data;
//		}
//
//		public static function createPaths(data : VehiclePathDataProto) : Vector.<TrailPathPoint>
//		{
//			var paths : Vector.<TrailPathPoint> = new Vector.<TrailPathPoint>();
//			if (data)
//			{
//				for each (var pointData : VehiclePathPointDataProto in data.points)
//				{
//					var pathPoint : TrailPathPoint = new TrailPathPoint(pointData.x, pointData.y, pointData.z, pointData.speed, pointData.tiltAngle, pointData.baseActionSpeed, String(pointData.statusType));
//					paths.push(pathPoint);
//				}
//			}
//			return paths;
//		}
	}
}
