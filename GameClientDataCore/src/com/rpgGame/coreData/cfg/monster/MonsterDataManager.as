package com.rpgGame.coreData.cfg.monster
{
	import com.game.engine3D.utils.TemplateUtil;
	import com.netease.protobuf.Int64;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.role.MonsterBornData;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import app.message.MonsterConfig;
	import app.message.MonsterDataProto;
	import app.message.MonsterDataProto.MonsterType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 怪物静态数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-24 上午10:30:12
	 *
	 */
	public class MonsterDataManager
	{
		private static var _map : HashMap = new HashMap();
		private static var _monsterPosMap : HashMap = new HashMap();
		private static var INDEX_SCENEID : String = "sceneId"
		private static var INDEX_ID : String = "id"
		private static var INDEX_ARR : Array = [INDEX_SCENEID];
		private static var UNIQ_INDEX : Array = [INDEX_SCENEID, INDEX_ID];
		private static var INDEX_DIC : Dictionary;
		private static var SCENE_ID_UNIQ_INDEX : Array = [INDEX_SCENEID, INDEX_ID];
		private static var SCENE_ID_UNIQ_DIC : Dictionary;

		public static function setConfig(cfg : MonsterConfig) : void
		{
			for each (var dataProto : MonsterDataProto in cfg.monsters)
			{
				parseMonster(dataProto);
				if (dataProto.npc)
				{
					NpcCfgData.parseNpcData(dataProto);
				}
				_map.add(dataProto.id, dataProto);
			}
			INDEX_DIC = TemplateUtil.createIndexFromArr(cfg.monsters, INDEX_ARR);
			SCENE_ID_UNIQ_DIC = TemplateUtil.createUniqIndexFromArr(cfg.monsters, SCENE_ID_UNIQ_INDEX);
		}

		private static function parseMonster(dataProto : MonsterDataProto) : void
		{
			var posLen : int = dataProto.pos.length;
			var pos : Number;
			var pt : Point;
			var ptList : Array = [];
			for (var k : int = 0; k < posLen; k++)
			{
				pos = dataProto.pos[k];
				pt = new Point();
				pt.x = pos >>> 16;
				pt.y = pos & 0xffff;
				ptList.push(pt);
			}
			_monsterPosMap.add(dataProto.id, ptList);
		}

		public static function get map() : HashMap
		{
			return _map;
		}

		/**
		 * 如果不是特别需要，
		 * 请不要把这个方法暴露出去，就是不要把整个proto暴露出去
		 * 需要获得具体某个怪物的具体某个属性，
		 * 请像getMonsterName方法一样传值获取
		 * @param id
		 * @return
		 */
		public static function getData(id : uint) : MonsterDataProto
		{
			var data : MonsterDataProto = _map.getValue(id);
			return data;
		}

		public static function getMonsterName(id : uint) : String
		{
			var data : MonsterDataProto = getData(id);
			if (data)
			{
				return data.name.toString();
			}
			return "未知怪物";
		}

		public static function getMonsterType(id : uint) : int
		{
			var data : MonsterDataProto = getData(id);
			if (data)
			{
				return data.monsterType;
			}
			return MonsterType.NORMAL;
		}

		/**
		 * 判断怪物是否是boss
		 * @param id
		 */
		public static function isBoss(id : uint) : Boolean
		{
			return getMonsterType(id) == MonsterType.BOSS;
		}

		/**
		 * 后去某场景下所有怪物的集合
		 * @param sceneID
		 * @return
		 */
		public static function getSceneMonsterProtos(sceneID : uint) : Array
		{
			var arr : Array;
			if (INDEX_DIC && INDEX_DIC[INDEX_SCENEID])
			{
				arr = INDEX_DIC[INDEX_SCENEID][sceneID];
			}
			arr = arr == null ? [] : arr;
			var vo : MonsterDataProto;
			var monsters : Array = [];
			for (var i : int = 0; i < arr.length; i++)
			{
				vo = arr[i];
				if (vo.npc == null)
				{
					monsters.push(vo);
				}
			}
			return monsters;
		}

		public static function getSceneMonsterDatas(sceneID : uint) : Array
		{
			var arr : Array;
			if (INDEX_DIC && INDEX_DIC[INDEX_SCENEID])
			{
				arr = INDEX_DIC[INDEX_SCENEID][sceneID];
			}
			arr = arr == null ? [] : arr;
			var vo : MonsterDataProto;
			var monsters : Array = [];
			for (var i : int = 0; i < arr.length; i++)
			{
				vo = arr[i];
				if (vo.npc == null)
				{
					var monsterData : MonsterBornData = new MonsterBornData();
					monsterData.setProtocData(vo);
					monsters.push(monsterData);
				}
			}
			return monsters;
		}

		/**根据怪物配置ID取怪物刷新点*/
		public static function getMonsterPositionByCfgID(id:int) : Point
		{
			var monsterDataProto : MonsterDataProto = getData(id);
			if(monsterDataProto)
			{
				return getMonsterPosition(monsterDataProto);
			}
			return null;
		}
		
		/**取怪物刷新点*/
		public static function getMonsterPosition(monsterDataProto : MonsterDataProto) : Point
		{
			var pt : Point = new Point();
			if (monsterDataProto)
			{
				var pos : Int64;
				pos = monsterDataProto.pos[0];
				if (pos)
				{
					pt.x = pos.high;
					pt.y = pos.low;
				}
			}
			return pt;
		}

		/**
		 * 获取怪物所在场景id
		 */
		public static function getMonsterSceneId(monsterId : int) : int
		{
			var monsterDataProto : MonsterDataProto = getData(monsterId);
			return monsterDataProto.sceneId;
		}
	}
}
