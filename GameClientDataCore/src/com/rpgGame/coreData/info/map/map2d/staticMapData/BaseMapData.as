package com.rpgGame.coreData.info.map.map2d.staticMapData
{
	import com.rpgGame.coreData.info.map.map2d.SceneBlockDataProto;

	/**
	 * 地图静态数据公共属性
	 * @author david
	 */
	public class BaseMapData implements IMapData
	{
		/**
		 * 场景ID
		 */
		private var _sceneId:int = -1;
		/**
		 * 地图资源名称
		 */
		private var _mapPackName:String = "";
		/**
		 * 地图名称(中文)
		 */
		private var _name:String = "";
		/**
		 * 诗
		 */
		private var _poet:String = "";
		/**
		 * 固定PK模式
		 */
		private var _fixedPkMode:int = -1;
		/**
		 * 是否英雄等级差pk保护
		 */
		private var _isHeroLevelProtect:Boolean = false; 
		/**
		 * 是否新手pk保护
		 */		
		private var _isNewHeroProtect:Boolean = false; 
		/**
		 * 是否死亡保护
		 */		
		private var _isDeathProtect:Boolean = false; 
		/**
		 * 是否夜晚挂机pk保护
		 */		
		private var _isNightAutoProtect:Boolean = false; 
		/**
		 * 是否不准跳
		 */		
		private var _isJumpLimit:Boolean = false; 
		/**
		 * 是否不准骑马
		 */		
		private var _isMountLimit:Boolean = false; 
		/**
		 * 是否普通场景
		 */
		private var _isNormalScene:Boolean = false;
		/**
		 * 地图类型(与EnumMapType一致)
		 */
		private var _mapType:int = -1;
		/**
		 * 是否死亡回城复活(副本特有属性,普通场景默认为true)
		 */
		private var _isDeathReturnTown:Boolean = false;
		/** 小地图名字文本资源配置[可能为空]*/
		private var _mapNameResource:String;
		/**音效*/
		private var _sound:String;
		/**
		 * true表示连服场景（连服场景不能扔物品）
		 */	
		private var _isClustered:Boolean = false;
		private var _type:int  = 0;
		private var _data:Object;
		/** 是否可以使用药品*/
		private var _isCanUseMedicine:Boolean = true;

		private var _canDaZuo:Boolean = false;
		private var _sceneBlockDataProto:SceneBlockDataProto;

		public function BaseMapData()
		{
			
		}
		
		public function get sceneBlockDataProto():SceneBlockDataProto
		{
			return _sceneBlockDataProto;
		}

		/**是否可以打坐*/
		public function get canDaZuo():Boolean
		{
			return _canDaZuo;
		}
		
		/** 是否可以使用药品*/
		public function get isCanUseMedicine():Boolean
		{
			return _isCanUseMedicine;
		}

		/**
		 * @private
		 */
		public function set isCanUseMedicine(value:Boolean):void
		{
			_isCanUseMedicine = value;
		}

		/**音效*/
		public function get sound():String
		{
			return _sound;
		}

		/** 小地图名字文本资源配置[可能为空]*/
		public function get mapNameResource():String
		{
			return _mapNameResource;
		}

		public function getData():Object
		{
			return _data;
		}
		
		public function setData($data:Object):void
		{
			_data = $data;
			if($data.hasOwnProperty("base"))
			{
				var base:Object = $data.base;
				_sceneBlockDataProto = base.sceneBlockDataProto;
				_sceneId = base.sceneId;
				_mapPackName = base.mapPackName;
				_name = base.name.toString();
				if(base.hasPoet)
				{
					_poet = base.poet.toString();
				}
				else
				{
					_poet = null;
				}
				_fixedPkMode = base.fixedPkMode;
				_isHeroLevelProtect = base.isHeroLevelProtect;
				_isNewHeroProtect = base.isNewHeroProtect;
				_isDeathProtect = base.isDeathProtect;
				_isNightAutoProtect = base.isNightAutoProtect;
				_isJumpLimit = base.isJumpLimit;
				_isMountLimit = base.isMountLimit;
				_mapNameResource = base.mapNameResource;
				_sound = base.sound;
				_isCanUseMedicine = !base.isAffectLifeMedicineLimit;
				
				_canDaZuo = base.canDaZuo;
			}
			if($data.hasOwnProperty("isClustered"))
			{
				_isClustered = $data.isClustered;
			}
			if($data.hasOwnProperty("isDeathReturnTown"))
			{
				_isDeathReturnTown = $data.isDeathReturnTown;
			}
		}
	 
		public function get sceneId():int 
		{
			return _sceneId;
		}
		
		public function get mapPackName():String 
		{
			return _mapPackName;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function get poet():String 
		{
			return _poet;
		}
		
		public function get fixedPkMode():int 
		{
			return _fixedPkMode;
		}
		
		public function get isHeroLevelProtect():Boolean 
		{
			return _isHeroLevelProtect;
		}
		
		public function get isNewHeroProtect():Boolean 
		{
			return _isNewHeroProtect;
		}
		
		public function get isDeathProtect():Boolean 
		{
			return _isDeathProtect;
		}
		
		public function get isNightAutoProtect():Boolean 
		{
			return _isNightAutoProtect;
		}
		
		public function get isJumpLimit():Boolean 
		{
			return _isJumpLimit;
		}
		
		public function get isMountLimit():Boolean 
		{
			return _isMountLimit;
		}
		
		public function get isNormalScene():Boolean 
		{
			return _isNormalScene;
		}
		
		public function set isNormalScene(value:Boolean):void 
		{
			_isNormalScene = value;
		}
		
		public function get mapType():int 
		{
			return _mapType;
		}
		
		public function set mapType(value:int):void 
		{
			_mapType = value;
		}
		
		public function get isDeathReturnTown():Boolean
		{
			return _isDeathReturnTown;
		}
		
		public function set isDeathReturnTown(value:Boolean):void 
		{
			_isDeathReturnTown = value;
		}
		
		public function toString():String
		{
			var str:String = 
				"场景ID:" + this.sceneId + "\n" +
				"场景名称:" + this.name + "\n" + 
				"场景诗:" + this.poet + "\n" + 
				"场景地图图片de目录名称:" + this.mapPackName + "\n" +
				"是否普通场景:" + this.isNormalScene + "\n" +
				"是否英雄等级差pk保护:" + this.isHeroLevelProtect + "\n" +
				"是否新手pk保护:" + this.isNewHeroProtect + "\n" +
				"是否死亡保护:" + this.isDeathProtect + "\n" +
				"是否夜晚挂机pk保护:" + this.isNightAutoProtect + "\n" +
				"是否不准跳:" + this.isJumpLimit + "\n" +
				"是否不准骑马:" + this.isMountLimit;
			return str;
		}

		public function get isClustered():Boolean
		{
			return _isClustered;
		}

		public function set isClustered(value:Boolean):void
		{
			_isClustered = value;
		}
		
		[Deprecated]
		public function isMapLockAtrea():Boolean
		{
			return false;
//			return  endX > 0 && endY > 0;
		}
	}
}