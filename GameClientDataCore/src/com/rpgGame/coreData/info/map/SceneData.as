package com.rpgGame.coreData.info.map
{
	import com.rpgGame.coreData.cfg.BaZhenTuCfgData;
	import com.rpgGame.coreData.cfg.country.CountryTaoNiCfgData;
	import com.rpgGame.coreData.enum.SceneReliveEnum;
	
	import app.message.FamilyAnimalBarSceneProto;
	import app.message.NormalSceneProto;
	import app.message.SceneProto;


	/**
	 * 普通场景地图静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-07-27 上午10:05:12
	 */
	public class SceneData
	{
		private var _data : SceneProto;
		/**
		 * 地图类型(与EnumMapType一致)
		 */
		private var _mapType : int = -1;
		/**
		 * 场景ID
		 */
		private var _sceneId : int = -1;
		/**
		 * 地图资源名称
		 */
		private var _map : String = "";
		/**
		 * 地图名称(中文)
		 */
		private var _name : String = "";
		/**
		 * 诗
		 */
		private var _poet : String = "";
		/**
		 * 固定PK模式
		 */
		private var _fixedPkMode : int = -1;
		/**
		 * 是否英雄等级差pk保护
		 */
		private var _isHeroLevelProtect : Boolean = false;
		/**
		 * 是否新手pk保护
		 */
		private var _isNewHeroProtect : Boolean = false;
		/**
		 * 是否死亡保护
		 */
		private var _isDeathProtect : Boolean = false;
		/**
		 * 是否夜晚挂机pk保护
		 */
		private var _isNightAutoProtect : Boolean = false;
		/**
		 * 是否不准骑马
		 */
		private var _isMountLimit : Boolean = false;
		/** 小地图名字文本资源配置[可能为空]*/
		private var _mapNameResource : String;
		/**音效*/
		private var _sound : String;
		/**
		 * true表示连服场景（连服场景不能扔物品）
		 */
		public var isClustered : Boolean = false;
		/**
		 * 是否普通场景
		 */
		public var isNormalScene : Boolean = false;
		/**
		 * 是否神兽场景
		 */
		public var isAnimalBarScene : Boolean = false;
		/**
		 * 是否讨逆场景
		 */
		public var isTaoNiScene : Boolean = false;
		/**
		 * 是否是迷宫副本
		 */
		public var isMazeScene : Boolean = false;
		/**
		 * 是否剧情副本
		 */
		public var isStoryDungeonScene : Boolean = false;
		/**
		 * 是否是八阵图 
		 */		
		public var isBaZhenTuScene : Boolean = false;
		/**
		 * 适合等级(推荐进入等级)
		 */
		public var recommendLevel : int = -1;
		/**
		 * 进入所需等级(准入等级)
		 */
		public var requiredLevel : int = -1;
		/**
		 *是否原地复活限制，为true表示本场景只可以安全复活 
		 */		
		public var isReliveLimit : Boolean;

		public var isHideInWorldMapTitle : Boolean;

		/** 在自己国家的场景死亡回城复活的场景id**/
		public var selfCountryDeathReturnSceneId : int;
		/** 在别人国家的场景死亡回城复活的场景id**/
		public var otherCountryDeathReturnSceneId : int;
		/** 是否是国战地图**/
		public var isCountryWarMap : Boolean;
		/** 是否是军费补贴地图**/
		public var isCountryMilitarySubsibyMap : Boolean;
		/** 神兽Boss的ID**/
		public var animalBarBossId : int;
		/**场景复活类型**/
		private var _sceneReliveType : int = SceneReliveEnum.NORMAL_SCENE;
		/**特殊场景复活CD**/
		public var reliveCd : Number;
		/**迷宫第几层**/
		public var floor : int;
		/**迷宫是否是随机层**/
		public var isRandomFloor : Boolean;
		/**是否有迷宫奖励NPC**/
		public var hasMazePrizeNpc : Boolean;

		public function SceneData()
		{
			super();
		}

		public function setData($data : SceneProto) : void
		{
			if ($data == null)
				return;
			_data = $data;
			if (_data.normalScene)
			{
				_mapType = EnumMapType.MAP_TYPE_NORMAL;
				this.isNormalScene = true;

				var singleScene : NormalSceneProto = _data.normalScene;
				this.recommendLevel = singleScene.recommendLevel;
				this.requiredLevel = singleScene.canEnterLevel;

				this.isClustered = singleScene.isClustered;
				isHideInWorldMapTitle = singleScene.isHide;
				selfCountryDeathReturnSceneId = singleScene.selfCountryDeathReturnSceneId;
				otherCountryDeathReturnSceneId = singleScene.otherCountryDeathReturnSceneId;
				isCountryWarMap = singleScene.isCountryWarMap;
				isCountryMilitarySubsibyMap = singleScene.isCountryMilitarySubsibyMap;
			}
			else if (_data.jailScene)
			{
				_mapType = EnumMapType.MAP_TYPE_JAIL_DUNGEON;
			}
			else if (_data.baZhenTuDungeon)
			{
				_mapType = EnumMapType.MAP_TYPE_BAZHENTU_SCENE;
				isBaZhenTuScene = true;
				BaZhenTuCfgData.setConfig(_data.baZhenTuDungeon);
			}
//			else if (_data is FamilyDungeonProto)
//			{
//				_mapType = EnumMapType.MAP_TYPE_FAMILY_DUNGEON;
//			}
			else if (_data.kingWarDungeon)
			{
				_mapType = EnumMapType.MAP_TYPE_FAMILY_BATTLE_SCENE;
				_sceneReliveType = SceneReliveEnum.DUNGEON_SCENE;
				reliveCd = _data.kingWarDungeon.reliveCd.toNumber();
			}
			else if (_data.familyAnimalBarScene)
			{
				_mapType = EnumMapType.MAP_TYPE_FAMILY_ANIMAL_SCENE;
				isAnimalBarScene = true;
				var animalBarScene : FamilyAnimalBarSceneProto = _data.familyAnimalBarScene as FamilyAnimalBarSceneProto;
				animalBarBossId = animalBarScene.monsterId;
			}
			else if (_data.taoNiDungeon)
			{
				_mapType = EnumMapType.MAP_TYPE_TAO_NI_DUNGEON;
				isTaoNiScene = true;
				CountryTaoNiCfgData.setSceneConfig(_data.taoNiDungeon);
			}
			else if (_data.mazeDungeon)
			{
//				_mapType = EnumMapType.
				isMazeScene = true;
				isRandomFloor = _data.mazeDungeon.isRandomFloor;
				floor = _data.mazeDungeon.floor;
				hasMazePrizeNpc = _data.mazeDungeon.hasHasMazePrizeNpc;
			}
			else if (_data.storyDungeon)
			{
				_mapType = EnumMapType.MAP_TYPE_STORY_DUNGEON;
				isStoryDungeonScene = true;
			}
			_sceneId = _data.sceneId;
			_map = _data.map;
			_name = _data.name.toString();
			if (_data.hasPoet)
			{
				_poet = _data.poet.toString();
			}
			else
			{
				_poet = null;
			}
			_fixedPkMode = _data.fixedPkMode;
			_isHeroLevelProtect = _data.isHeroLevelProtect;
			_isNewHeroProtect = _data.isNewHeroProtect;
			_isDeathProtect = _data.isDeathProtect;
			_isNightAutoProtect = _data.isNightAutoProtect;
			_isMountLimit = _data.isMountLimit;
			_mapNameResource = _data.mapNameResource;
			_sound = _data.sound;
			isReliveLimit = _data.isReliveLimit;
			
		}

		public function get sceneReliveType() : int
		{
			return _sceneReliveType;
		}

		public function get mapType() : int
		{
			return _mapType;
		}

		public function get poet() : String
		{
			return _poet;
		}

		public function get fixedPkMode() : int
		{
			return _fixedPkMode;
		}

		public function get isHeroLevelProtect() : Boolean
		{
			return _isHeroLevelProtect;
		}

		public function get isNewHeroProtect() : Boolean
		{
			return _isNewHeroProtect;
		}

		public function get isDeathProtect() : Boolean
		{
			return _isDeathProtect;
		}

		public function get isNightAutoProtect() : Boolean
		{
			return _isNightAutoProtect;
		}

		public function get isMountLimit() : Boolean
		{
			return _isMountLimit;
		}
		/**
		 * 是否是特殊副本 
		 * @return 
		 * 
		 */		
		public function get isSpecialDungeon():Boolean
		{
			return isStoryDungeonScene || isBaZhenTuScene;
		}

		/**音效*/
		public function get sound() : String
		{
			return _sound;
		}

		/** 小地图名字文本资源配置[可能为空]*/
		public function get mapNameResource() : String
		{
			return _mapNameResource;
		}

		public function getData() : Object
		{
			return _data;
		}

		public function get sceneId() : int
		{
			return _sceneId;
		}

		public function get map() : String
		{
			return _map;
		}

		public function get name() : String
		{
			return _name;
		}

		public function toString() : String
		{
			var str : String = //
				"场景ID:" + this.sceneId + "\n" + //
				"场景名称:" + this.name + "\n" + //
				"场景诗:" + this.poet + "\n" + //
				"场景地图图片名称:" + this.map + "\n" + //
				"是否普通场景:" + this.isNormalScene + "\n" + //
				"是否英雄等级差pk保护:" + this.isHeroLevelProtect + "\n" + //
				"是否新手pk保护:" + this.isNewHeroProtect + "\n" + //
				"是否死亡保护:" + this.isDeathProtect + "\n" + //
				"是否夜晚挂机pk保护:" + this.isNightAutoProtect + "\n" + //
				"是否不准骑马:" + this.isMountLimit;
			return str;
		}
	}
}
