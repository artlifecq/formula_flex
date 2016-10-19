package com.rpgGame.coreData.info.map.map2d.staticMapData
{
	import com.game.engine2D.config.SceneConfig;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.map2d.TeleportProto;
	
	import flash.utils.Dictionary;

	/**
	 * 普通场景地图静态数据
	 * @author david
	 */
	public class NormalSceneData extends BaseMapData
	{
		public static const TRANSPORT_DIFF_LEVEL:int = 10;
		/**
		 * 传送门
		 */
		public var transports:Array = [];
		/**
		 * 适合等级(推荐进入等级)
		 */
		public var recommendLevel:int = -1;
		/**
		 * 进入所需等级(准入等级)
		 */		
		public var requiredLevel:int = -1;
		/**
		 * 死亡回城复活的场景id
		 */
		public var deathReturnSceneId:int = -1;
		
		public var isHideInWorldMapTitle:Boolean;
		private var _teleports:Array;
		/**<缓存场景瞬移点 key:titleX << 16 + titleY, value:TeleportProto>*/
		private var _tepleportXYDic:Dictionary;
		private var _tepleportIdDic:Dictionary;
	 
		public function NormalSceneData()
		{
			super();
		}
		
		[ArrayElementType("proto.TeleportProto")]
		public function get teleports():Array
		{
			return _teleports;
		}

		override public function setData(data:Object):void
		{
			if(data==null)return;
			super.setData(data);
			
			var singleScene:Object = data;
			if(singleScene == null)return;
			this.transports = singleScene.transports;
			this.recommendLevel = singleScene.recommendLevel;
			this.requiredLevel = singleScene.canEnterLevel;
			this.deathReturnSceneId = singleScene.deathReturnSceneId;
			this.isClustered = singleScene.isClustered;
			this.isNormalScene = true;
			this.mapType = EnumMapType.MAP_TYPE_NORMAL;
			this.isDeathReturnTown = true;
			isHideInWorldMapTitle = singleScene.isHide;
			_teleports = singleScene.teleports;
		}
		
		override public function toString():String
		{
			var str:String = super.toString() + "\n" +
				"适合等级:" + this.recommendLevel + "\n" +
				"准入等级:" + this.requiredLevel + "\n" +
				"死亡回城复活的场景id:" + this.deathReturnSceneId;
			return str;
		}
		public function getTeleportById(teleportId:int):TeleportProto
		{
			if (_tepleportIdDic) 
			{
				initTeleport();
			}
			return _tepleportIdDic[teleportId];
		}
		public function getTeleportByTile(titleX:int, titleY:int):TeleportProto
		{
			if (_tepleportXYDic == null) 
			{
				initTeleport();
			}
			var key:* = getTitleKey(titleX, titleY);
			return _tepleportXYDic[key];
		}
		public function getTeleportOnlyInStory(sceneX:int, sceneY:int):Boolean
		{
			var tileX:int = sceneX / SceneConfig.TILE_WIDTH;
			var tileY:int = sceneY / SceneConfig.TILE_HEIGHT;
			var telportPoroto:TeleportProto = getTeleportByTile(tileX, tileY);
			if (telportPoroto) 
			{
				return telportPoroto.onlyInStory;
			}
			return false;
			
		}
		private function initTeleport():void
		{
			_tepleportXYDic = new Dictionary();
			_tepleportIdDic = new Dictionary();
			if (_teleports) 
			{
				var ilen:int = _teleports.length;
				for (var i:int = 0; i < ilen; i++) 
				{
					var teleport:TeleportProto = _teleports[i];
					_tepleportIdDic[teleport.id] = teleport;
					/**<初始化瞬移点到一个dictionary，为了能够快速取到瞬移点>*/
					var radius:int = teleport.sourceRadius;
					var startX:int = teleport.sourceX - radius;
					var startY:int = teleport.sourceY - radius;
					var endX:int = teleport.sourceX + radius;
					var endY:int = teleport.sourceY + radius;
					
					var startTitleX:int = startX / SceneConfig.TILE_WIDTH;
					var startTitleY:int = startY / SceneConfig.TILE_HEIGHT;
					var endTileX:int = Math.ceil(endX / SceneConfig.TILE_WIDTH);
					var endTileY:int = Math.ceil(endY / SceneConfig.TILE_HEIGHT);
					var temp:int;
					/**<防止配置起始点和结束点>*/
					if (startTitleX > endTileX) 
					{
						temp = startTitleX;
						startTitleX = endTileX;
						endTileX = temp;
					}
					if (startTitleY > endTileY) 
					{
						temp = startTitleY;
						startTitleY = endTileY;
						endTileY = temp;
					}
					for (var j:int = startTitleX; j < endTileX; j++) 
					{
						for (var k:int = startTitleY; k < endTileY; k++) 
						{
							_tepleportXYDic[getTitleKey(j,k)] = teleport;
						}
					}
					
				}
			}
		}
		
		private function getTitleKey(titleX:int, titleY:int):*
		{
			return titleX + "_" + titleY;
		}

	}
}