package com.rpgGame.coreData.info.map
{
	import com.game.engine2D.config.MapConfig;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.enum.SceneReliveEnum;


	/**
	 * 普通场景地图静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-07-27 上午10:05:12
	 */
	public class SceneData
	{
		private var _data : Q_map;
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
		
		public var mapConfig:MapConfig;//引擎地图配置信息。

		public function SceneData()
		{
			super();
		}

		public function setData($scene : Q_map) : void
		{
			if ($scene == null)
				return;
			_data = $scene;
			if (_data.q_map_public == 1)
			{
				_mapType = EnumMapType.MAP_TYPE_NORMAL;
				this.isNormalScene = true;

				this.recommendLevel = _data.q_map_min_level;
				this.requiredLevel = _data.q_map_min_level;

				this.isClustered = false;
//				isHideInWorldMapTitle = _data.isHide;
//				selfCountryDeathReturnSceneId = _data.selfCountryDeathReturnSceneId;
//				otherCountryDeathReturnSceneId = _data.otherCountryDeathReturnSceneId;
//				isCountryWarMap = _data.isCountryWarMap;
//				isCountryMilitarySubsibyMap = _data.isCountryMilitarySubsibyMap;
			}else if(_data.q_map_zones==1){//副本地图
				_mapType=_data.q_mapzone_type;//需要和EnumMapType里面的枚举类型值一一对应
				this.recommendLevel = _data.q_map_min_level;
				this.requiredLevel = _data.q_map_min_level;
				this.isClustered = false;
				this.isNormalScene = false;
			}
			_sceneId = _data.q_map_id;
			_map = _data.q_mapres;
			_name = _data.q_map_name;
			if (_data/*.hasPoet*/)
			{
				_poet = "诗一般的场景呀";//_data.poet.toString();
			}
			else
			{
				_poet = null;
			}
//			_fixedPkMode = _data.fixedPkMode;
//			_isHeroLevelProtect = _data.isHeroLevelProtect;
//			_isNewHeroProtect = _data.isNewHeroProtect;
//			_isDeathProtect = _data.isDeathProtect;
//			_isNightAutoProtect = _data.isNightAutoProtect;
//			_isMountLimit = _data.isMountLimit;
			_mapNameResource = _data.q_mapres;
			_sound = _data.q_music;
//			isReliveLimit = _data.isReliveLimit;
			
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

		public function getData() : Q_map
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
