package com.rpgGame.coreData.cfg.monster
{
	import com.game.engine3D.utils.TemplateUtil;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.coreData.clientConfig.Q_mission_base;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.role.MonsterBornData;
	
	import flash.geom.Point;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
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
		private static var _monsterMap : HashMap = new HashMap();
		private static var _monsterPosMap : HashMap = new HashMap();
		private static var INDEX_SCENEID : String = "q_mapid"
		private static var INDEX_ID : String = "q_id"
		private static var INDEX_ARR : Array = [INDEX_ID];
		private static var UNIQ_INDEX : Array = [INDEX_SCENEID, INDEX_ID];
		private static var INDEX_DIC : Dictionary;
		private static var SCENE_ID_UNIQ_INDEX : Array = [INDEX_SCENEID, INDEX_ID];
		private static var SCENE_ID_UNIQ_DIC : Dictionary;

		private static var _monsterArea : Dictionary=new Dictionary();
		public static function setMonsterConfig(data : ByteArray) : void
		{
			var arr : Array = data.readObject();
			if (arr)
			{
				for each (var monsterData : Q_monster in arr)
				{
					if (monsterData.q_monster_type == 4)//暂时定义4为npc，因为还没定，暂时这么写,也有可能npc跟怪物表示分开的，后面再定
					{
//						NpcCfgData.parseNpcData(monsterData);
					}
					_monsterMap.add(monsterData.q_id, monsterData);
				}
			}
			else
			{
				trace("没有怪物数据！！！");
			}
			
			INDEX_DIC = TemplateUtil.createIndexFromArr(arr, INDEX_ARR);
			trace("没有怪物数据！！！");
		}
		
		public static function setSceneAreaMonsterConfig(data : ByteArray):void
		{
			var arr : Array = data.readObject();
			if (arr) 
			{
				for each(var sceneMonsterData : Q_scene_monster_area in arr)
				{
					
					_monsterArea[sceneMonsterData.q_id]=sceneMonsterData;
					parseMonster(sceneMonsterData);
				}
			}
			else
			{
				trace("没有怪物刷新相关信息！！！");
			}
			SCENE_ID_UNIQ_DIC = TemplateUtil.createUniqIndexFromArr(arr, SCENE_ID_UNIQ_INDEX);
		}

		private static function parseMonster(monsterData : Q_scene_monster_area) : void
		{
//			var posLen : int = monsterData.pos.length;
//			var pos : Number;
//			var pt : Point;
//			var ptList : Array = [];
//			for (var k : int = 0; k < posLen; k++)
//			{
//				pos = dataProto.pos[k];
//				pt = new Point();
//				pt.x = pos >>> 16;
//				pt.y = pos & 0xffff;
//				ptList.push(pt);
//			}
			
			_monsterPosMap.add(monsterData.q_monster_model, new Point(monsterData.q_center_x,monsterData.q_center_y));
		}

		public static function get monsterMap() : HashMap
		{
			return _monsterMap;
		}
		
		public static function getSceneData(id:uint):Q_scene_monster_area
		{
			var sceneData:Q_scene_monster_area = _monsterPosMap.getValue(id);
			return sceneData;
		}

		/**
		 * 如果不是特别需要，
		 * 请不要把这个方法暴露出去，就是不要把整个proto暴露出去
		 * 需要获得具体某个怪物的具体某个属性，
		 * 请像getMonsterName方法一样传值获取
		 * @param id
		 * @return
		 */
		public static function getData(id : uint) : Q_monster
		{
			var data : Q_monster = _monsterMap.getValue(id);
			return data;
		}

		public static function getMonsterName(id : uint) : String
		{
			var data : Q_monster = getData(id);
			if (data)
			{
				return data.q_name.toString();
			}
			return "未知名字";
		}

		
		
		public static function getMonsterType(id : uint) : int
		{
			var data : Q_monster = getData(id);
			if (data)
			{
				return data.q_monster_type;
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
			var vo : Q_monster;
			var monsters : Array = [];
			for (var i : int = 0; i < arr.length; i++)
			{
				vo = arr[i];
				if (vo.q_monster_type != 4)
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
			var vo : Q_monster;
			var monsters : Array = [];
			for (var i : int = 0; i < arr.length; i++)
			{
				vo = arr[i];
				if (vo.q_monster_type != 4)
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
			var monsterData : Q_scene_monster_area = getSceneData(id);
			if(monsterData)
			{
				return getMonsterPosition(monsterData);
			}
			return null;
		}
		
		/**取怪物刷新点*/
		public static function getMonsterPosition(monsterData : Q_scene_monster_area) : Point
		{
			var pt : Point = new Point();
			if (monsterData)
			{
				pt.x = monsterData.q_center_x;
				pt.y = monsterData.q_center_y;
			}
			return pt;
		}

		/**
		 * 根据刷新id获取怪物所在场景id
		 */
		public static function getMonsterSceneId(monsterId : int) : int
		{
			var monsterData : Q_scene_monster_area = getSceneData(monsterId);
			return monsterData.q_mapid;
		}
		
		
		
		//////////////////////////////////////////yuantao增加的////////////////////////////////////////////////////////////////////
		/**
			根据场景ID获取场景的怪物已经NPC列表  
		 */		
		public static function getBigMapMonsterBySceneId(sceneID : uint) :Array
		{
			var arr:Array=new Array();
			var mdata : Q_monster;
			var npcData:Object;
			if (SCENE_ID_UNIQ_DIC) 
			{
				for each(var sceneMonsterList : Vector3D.<Q_scene_monster_area> in SCENE_ID_UNIQ_DIC)
				{
					
					for each(var sceneMonsterData :Q_scene_monster_area in sceneMonsterList)
					{
						if(sceneMonsterData.q_mapid==sceneID)
						{
							mdata= getData(sceneMonsterData.q_monster_model);
							if(mdata)
							{
								npcData=new Object();
								npcData.type=mdata.q_monster_type;
								npcData.name=mdata.q_name;
								npcData.x=sceneMonsterData.q_center_x;
								npcData.y=sceneMonsterData.q_center_y;
								arr.push(npcData);
							}
							
						}
					}
				}
			}
			
			
			return arr;
		}
		/**
		 根据ID获取怪物数据
		 */		
		public static function getMonsterById(id : uint) :Q_scene_monster_area
		{
			if (SCENE_ID_UNIQ_DIC) 
			{
				for each(var sceneMonsterList : Vector3D.<Q_scene_monster_area> in SCENE_ID_UNIQ_DIC)
				{
					
					for each(var sceneMonsterData :Q_scene_monster_area in sceneMonsterList)
					{
						if(sceneMonsterData.q_id==id)
						{
							return sceneMonsterData;
						}
						
					}
				}
			}
			
			
			return null;
		}
		/**
		 根据模型ID获取怪物刷新点数据 如果有本地图的优先返回本地图 如果没有，就返回第一个
		 */		
		public static function getMonsterByModelId(id : uint,currentMapId:int) :Q_scene_monster_area
		{
			var sdata:Q_scene_monster_area;
			if (SCENE_ID_UNIQ_DIC) 
			{
				for each(var sceneMonsterList : Vector3D.<Q_scene_monster_area> in SCENE_ID_UNIQ_DIC)
				{
					
					for each(var sceneMonsterData :Q_scene_monster_area in sceneMonsterList)
					{
						if(sceneMonsterData.q_monster_model==id)
						{
							if(sdata==null)
							{
								sdata=sceneMonsterData;
							}
							if(sceneMonsterData.q_mapid==currentMapId)
							{
								return sceneMonsterData;
							}
							
						}
						
					}
				}
			}
			
			
			return sdata;
		}
		
		/**
		 * 根据刷新id获取怪物模型id
		 */
		public static function getMonsterModeidByAreaid(areaid : int) : int
		{
			var areaData : Q_scene_monster_area =getAreaByAreaID(areaid);
			if(areaData!=null)
			{
				return areaData.q_monster_model;
			}
			
			
			return 0;
		}
		/**根据任务ID获取任务信息*/
		public static function getAreaByAreaID(id : uint) : Q_scene_monster_area 
		{
			return _monsterArea[id];
		}
	}
}
