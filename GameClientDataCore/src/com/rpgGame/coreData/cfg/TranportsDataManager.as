package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneTranportData;
	
	import flash.geom.Point;
	
	import app.message.AreaDataProto;
	import app.message.SceneTransportProto;
	import app.message.SceneTransportsProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 传送数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-04 上午10:30:12
	 *
	 */
	public class TranportsDataManager
	{
		private static var _map : HashMap;

		public function TranportsDataManager()
		{
		}

		setup();

		public static function setup() : void
		{
			_map = new HashMap();
		}

		public static function setConfig(cfg : SceneTransportsProto) : void
		{
			if (cfg == null)
				return;

			for each (var data : SceneTransportProto in cfg.tranport)
			{
				_map.add(data.id, data);
			}
		}

		public static function getData(id : uint) : SceneTransportProto
		{
			return _map.getValue(id);
		}

		public static function getDataList() : Array
		{
			return _map.getValues();
		}

		/**返回制定sceneID的Transport的数据（VECTOR格式）*/
		public static function getSceneTransport(sceneID : uint, sceneCountry : uint) : Vector.<SceneTransportProto>
		{
			var list : Vector.<SceneTransportProto> = new Vector.<SceneTransportProto>();
			var dataList : Array = _map.getValues();
			for each (var data : SceneTransportProto in dataList)
			{
				if (data.sourceAreaData && data.sourceAreaData.sceneId == sceneID && (!data.hasSourceCountry || data.sourceCountry == sceneCountry))
				{
					list.push(data);
				}
			}
			return list;
		}

		/**返回制定sceneID的Transport的数据（ARRAY格式）*/
		public static function getSceneTransportProtos(sceneID : uint, sceneCountry : uint) : Array
		{
			var arr : Array = new Array();
			var dataList : Array = _map.getValues();
			for each (var data : SceneTransportProto in dataList)
			{
				if (data.sourceAreaData && data.sourceAreaData.sceneId == sceneID && (!data.hasSourceCountry || data.sourceCountry == sceneCountry))
				{
					arr.push(data);
				}
			}
			return arr;
		}

		public static function getSceneTransportDatas(sceneID : uint, sceneCountry : uint) : Array
		{
			var arr : Array = new Array();
			var dataList : Array = _map.getValues();
			for each (var data : SceneTransportProto in dataList)
			{
				if (data.sourceAreaData && data.sourceAreaData.sceneId == sceneID && (!data.hasSourceCountry || data.sourceCountry == sceneCountry))
				{
					var tranportData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
					tranportData.setProtocData(data);
					arr.push(tranportData);
				}
			}
			return arr;
		}

		public static function getPolygon(proto : SceneTransportProto) : Vector.<Point>
		{
			var polygon : Vector.<Point> = new Vector.<Point>();
			
			var pos : Array = proto.sourceAreaData.pos;
			var posLen : int = pos.length;
			for (var i : int = 0; i < posLen; i += 2)
			{
				polygon.push(new Point(pos[i], pos[i + 1]));
			}
			return polygon;
		}
	}
}
