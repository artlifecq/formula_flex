package com.rpgGame.appModule.maps
{
	import com.game.engine3D.manager.SceneMapDataManager;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.game.engine3D.vo.MapTextureLoader;
	import com.game.engine3D.vo.SceneMapData;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.MapTeamMemberInfo;
	import com.rpgGame.coreData.info.map.MapUnitEvent;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.maps.maps_Skin;
	import org.mokylin.skin.component.text.textInput3_Skin;
	
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.textures.IStarlingTexture;
	
	
	/**
	 * 处理大地图上的 地图加载和地图上的图标显示控制
	 * @author YT
	 * 
	 */	
	public class BigMaps
	{
		private var _skin :maps_Skin;
		/**最底层容器**/
		public var skinSpr : Sprite;
		/**最底层容器**/
		
		private var baseSpr : Sprite;
		/**缩略图**/
		public var thumbnaiSpr : Sprite;
		private var thumbnaiImage : Image;
		/**主角自己**/
		private var myselfSpr : BigMapIcon;
		
		/**NPC 怪物 传送点**/
		private var roleSpr : Sprite;
		
		private var roadSpr : BigMapRoad;
		
		/**当前显示的地图编号*/
		private var _currentMapId : int;
		private var _mapWidth : int;
		private var _mapHeight : int;
		private var _scale : Number = 1;
		/**地图绝对宽高 **/
		private var absMaxWidth : int = 0;
		private var absMaxHeight : int = 0;
		/**地图缩放比例 **/
		private var scaleMapX : Number = 0;
		private var scaleMapY : Number = 0;
		/**显示大地图，加载地图数据*/
		private var _sceneMapData : SceneMapData;//地图数据
		/**地图是否下载完成*/
		private var _isMapLoadComplete : Boolean;
		//private var _loadSceneid:int;
		
		private var tips:BigMapTips;
		private var teamatesIconList:Vector.<BigMapTeamIcon>=new Vector.<BigMapTeamIcon>();
		public function BigMaps(skin:maps_Skin): void 
		{
			_skin=skin;
			_mapWidth = _skin.grp_cont.width;
			_mapHeight = _skin.grp_cont.height;
			skinSpr=new Sprite();
			skinSpr.x=0;
			skinSpr.y=0;
			this._skin.grp_cont.addChild(skinSpr);
			EventManager.addEvent(MapUnitEvent.UPDATE_MAP_TEAMMATE,updateTeamatesPoint);
		}
		public function init():void
		{
			baseSpr = new Sprite();
			skinSpr.addChild(baseSpr);
			
			thumbnaiSpr = new Sprite();
			baseSpr.addChild(thumbnaiSpr);
			roadSpr=new BigMapRoad();
			baseSpr.addChild(roadSpr);
			roleSpr=new Sprite();
			roleSpr.visible=false;
			baseSpr.addChild(roleSpr);
			myselfSpr =new BigMapIcon(SceneCharType.PLAYER);
			myselfSpr.visible = false;
			baseSpr.addChild(myselfSpr);
			var mask : Shape = new Shape();
			mask.graphics.beginFill(0x00FF00);
			mask.graphics.drawRoundRect(0, 0, _mapWidth, this._mapHeight, 5);
			mask.graphics.endFill();
			skinSpr.addChild(mask);
			baseSpr.mask = mask;
			
			tips=new BigMapTips(_mapWidth,_mapHeight);
			skinSpr.addChild(tips);
		}
		
		
		
				
		
		
		public function loadMap(sceneId:int) : void
		{
			
			///查看当前是否有地图数据，如果有则清除
			var senceData : SceneData = MapDataManager.getMapInfo(_currentMapId);
			if (senceData)
			{
				var mapUrl : String = ClientConfig.getMap(senceData.map);
				if (_sceneMapData)
				{
					SceneMapDataManager.removeMapData(this, mapUrl, onMapDataComplete, onMapDataFaild);
					SceneMapDataManager.removeMiniMap(mapUrl, onLoadBitmapDataComplete, onMapDataFaild);
					_sceneMapData = null;
				}
			}
			
			//重新加载新的地图数据
			_isMapLoadComplete = false;
			_currentMapId=sceneId;
			senceData = MapDataManager.getMapInfo(_currentMapId);
			if (senceData)
			{
				mapUrl = ClientConfig.getMap(senceData.map);
				var mapName : String = ClientConfig.getMapName(senceData.map);
				var mapDataName : String = ClientConfig.getMapDataName();
				_sceneMapData = SceneMapDataManager.addMapData(this, mapName, mapUrl + "/" + mapDataName, onMapDataComplete, onMapDataFaild);
			}
			
			
		}
		private function onMapDataComplete(sceneMapData : SceneMapData) : void
		{
			
//			if (sceneMapData.miniMapData)
//			{
//				onLoadBitmapDataComplete(sceneMapData);
//			}
//			else
//			{
				var senceData : SceneData = MapDataManager.getMapInfo(_currentMapId);
				absMaxWidth = senceData.mapConfig.width;
				absMaxHeight = senceData.mapConfig.height;
				
				var mapUrl : String = ClientConfig.getMap(senceData.map);
				var mapName : String = ClientConfig.getMapName(senceData.map);
				var miniMapName : String = ClientConfig.getMiniMapName(sceneMapData.clientMapData.miniMapRes);
				SceneMapDataManager.addMiniMap(mapName, mapUrl + "_2d/" + miniMapName, sceneMapData.clientMapData.miniMapRect, onLoadBitmapDataComplete, onMapDataFaild);
//			}
		}
		private function onMapDataFaild(loader : MapTextureLoader) : void
		{
		}
		private function onLoadBitmapDataComplete(loader : MapTextureLoader) : void
		{
			var texture : IStarlingTexture = loader.subTexture;
			
			if (!texture)
			{
				return;
			}
			updateMiniMap(texture);
		}
		private function updateMiniMap(texture : IStarlingTexture) : void
		{
			if (thumbnaiImage != null && thumbnaiImage.parent != null)
			{
				thumbnaiSpr.removeChild(thumbnaiImage);
				thumbnaiImage.dispose();
				thumbnaiImage = null;
			}
			thumbnaiImage = new Image(texture);
			thumbnaiSpr.addChild(thumbnaiImage);
			thumbnaiSpr.visible=true;
			updateGraphic();
		}
		
		private function updateGraphic() : void
		{
			if (!thumbnaiSpr || !thumbnaiImage)
			{
				return;
			}
			
			var scalex:Number= _mapWidth/thumbnaiImage.width ;
			var scaley:Number= _mapHeight/thumbnaiImage.height;
			_scale=scalex<scaley?scalex:scaley;
			var mapX:Number=(_mapWidth-thumbnaiImage.width*_scale)/2;
			var mapY:Number=(_mapHeight-thumbnaiImage.height*_scale)/2;
			baseSpr.x=mapX;
			baseSpr.y=mapY;
			
			
			thumbnaiSpr.scaleX = thumbnaiSpr.scaleY = _scale;
			scaleMapX = (thumbnaiImage.width / absMaxWidth) * _scale;
			scaleMapY = (thumbnaiImage.height / absMaxHeight) * _scale;
			loadMapEnd();
			
		}
		
		protected function loadMapEnd():void
		{
			_isMapLoadComplete = true;
			BigMapsData.isMapLoadComplete=true;
			BigMapsData.currentMapId=_currentMapId;
			BigMapsData.scaleMapX=scaleMapX;
			BigMapsData.scaleMapY=scaleMapY;
			updateMyselfPos();
			updateRolePos();
			
			
		}
		
		
		/**
		 * 更新自己的位置
		 */
		public function updateMyselfPos() : void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (player&&_isMapLoadComplete)
			{
				var pos3d : Vector3D =player.position;
				var pot:Point=getChangeSceneToMap(pos3d);
				myselfSpr.updatePos(pot.x,pot.y);
				myselfSpr.visible = true;
				roadSpr.onThrough(pot.x,pot.y);
			}
			
			
			//shiftPointFromMap();
		}
		/**
		 * 设置NPC 怪物 传送点图标
		 */
		public function updateRolePos() : void
		{
			clearAllRole();
			var i:int,length:int;
			
			length=BigMapsData.mapsMonsterData.length
			for(i=0;i<length;i++)
			{
				updateRolePosShow(BigMapsData.mapsMonsterData[i]);
			}
			length=BigMapsData.mapsNpcData.length
			for(i=0;i<length;i++)
			{
				updateRolePosShow(BigMapsData.mapsNpcData[i]);
			}
			length=BigMapsData.mapsThansData.length
			for(i=0;i<length;i++)
			{
				updateRolePosShow(BigMapsData.mapsThansData[i]);
			}
			updateTeamatesPoint();
		}
		private function updateRolePosShow(roleData:BigMapIocnDataMode) : void
		{
			if(!roleData.show)
				return;
			var point:Point;
			var pos3d : Vector3D = new Vector3D();
			pos3d.x = roleData.x;
			pos3d.z = roleData.y;
			point=getChangeSceneToMap(pos3d);
			var roleIcon:BigMapIcon=new BigMapIcon(roleData.type,roleData.name,roleData.level,point.x,point.y);
			roleIcon.icoName.x=point.x<60?point.x:0;
			roleIcon.icoName.x=point.x>(thumbnaiSpr.width-60)?(thumbnaiSpr.width-point.x-60):0;
			roleSpr.addChild(roleIcon);
			roleSpr.visible = true;
		}
		private function updateTeamatesPoint(...arg):void
		{
			var size:int=teamatesIconList.length;
			for each (var tmp:BigMapTeamIcon in teamatesIconList) 
			{
				tmp.visible=false;
			}
			var myTeammates:Vector.<MapTeamMemberInfo> = MapUnitDataManager.myTeammates;
			var len:int=myTeammates.length;
			
			var mem:MapTeamMemberInfo;
			var icon:BigMapTeamIcon;
			for (var i:int = 0; i < len; i++) 
			{
				mem=myTeammates[i];
				if (i<size) 
				{
					icon=teamatesIconList[i];
				}
				else
				{
					icon=new BigMapTeamIcon();
					teamatesIconList.push(icon);
					roleSpr.addChild(icon);
				}
				icon.updateData(mem);
				icon.visible=true;	
				var point:Point;
				var pos3d : Vector3D = new Vector3D();
				pos3d.x = mem.x;
				pos3d.z = -mem.y;
				point=getChangeSceneToMap(pos3d);
				icon.x=point.x;
				icon.y=point.y;
			}	
		}

		public function showTips(x:Number,y:Number):void
		{
			var point:Point=getChangeMapToScene((x-baseSpr.x),(y-baseSpr.y));
			if(point)
			{
				tips.show(x,y,int(point.x),int(-point.y));
			}
			
		}
		public function hideTips():void
		{
			tips.hide();
		}
		
		
		public function mapWalk(x:Number,y:Number):void
		{
			var point:Point=getChangeMapToScene((x-baseSpr.x),(y-baseSpr.y));
			if(point)
			{
				_skin.locat_x.text=""+int(point.x);
				_skin.locat_y.text=""+int(Math.abs(point.y));
				roleWalk(point.x,point.y);
			}
		}
		public function roleWalk(x:Number,y:Number,spacing:int=0):void
		{
			var position : Vector3D = new Vector3D(x, -Math.abs(y), 0);
			if(PathFinderUtil.isPointInSide(SceneManager.getDistrict(), position))
			{
				MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId,x,y,null, spacing,null);
			}
			else
			{
				MainRoleSearchPathManager.stopAutoFind();
				NoticeManager.textNotify(NoticeManager.MOUSE_FOLLOW_TIP,"该目标点不可到达");
			}
		}
		
		public function clearView():void
		{
			myselfSpr.visible=false;
			thumbnaiSpr.visible=false;
			tips.visible=false;
			clearAllRole();
		}
		public function clearAllRole():void
		{
			while(roleSpr.numChildren>0){
				roleSpr.removeChildAt(0);
			}
		}
		public function onDrawPathRoad() : void
		{
			roadSpr.onDrawPathRoad();
		}
		/**
		 * 场景上坐标换算成地图坐标
		 */
		
		public static  function getChangeSceneToMap(position : Vector3D) : Point
		{
			var mapData : ClientMapData = SceneManager.clientMapData;
			if (mapData == null)
				return new Point(0, 0);
			//absMaxWidth-thumbnaiImage.w
			//投射转换
//			var posx : int = position.x * mapData.miniScaleX * BigMapsData.scaleMapX;
//			var posy : int = -position.z* mapData.miniScaleY * BigMapsData.scaleMapY;
//			var tilt : Number = MathUtil.angleToRadian(mapData.miniCorrectTilt);
//			var pan : Number = MathUtil.angleToRadian(mapData.miniCorrectPan);
//			var roll : Number = MathUtil.angleToRadian(mapData.miniCorrectRoll);
//			var pos : Point = MathUtil.projection(posx, posy, tilt, pan, roll);
//			pos.x += mapData.miniCorrectOffsetX * mapData.miniScaleX * BigMapsData.scaleMapX;
//			pos.y += mapData.miniCorrectOffsetY * mapData.miniScaleY * BigMapsData.scaleMapY;
			var posx : int = position.x *BigMapsData.scaleMapX;
			var posy : int = -position.z*BigMapsData.scaleMapY;
			var tilt : Number = MathUtil.angleToRadian(mapData.miniCorrectTilt);
			var pos : Point =new Point(posx,posy);
			return pos;
		}
		
		//----------------------------------------------------
		/**
		 *地图坐标换算成场景上坐标
		 */
		public static  function getChangeMapToScene(posx : int, posy : int) : Point
		{
		
			//LOG.a(posx+":"+posy);
			var mapData : ClientMapData = SceneManager.clientMapData;
			if (mapData == null)
				return null;
			
			
			var offsetX : int = mapData.miniCorrectOffsetX * mapData.miniScaleX * BigMapsData.scaleMapX;
			var offsetY : int = mapData.miniCorrectOffsetY * mapData.miniScaleY * BigMapsData.scaleMapY;
			var tilt : Number = MathUtil.angleToRadian(mapData.miniCorrectTilt);
			var pan : Number = MathUtil.angleToRadian(mapData.miniCorrectPan);
			var roll : Number = MathUtil.angleToRadian(mapData.miniCorrectRoll);
			var pos : Point = MathUtil.backProjection(posx - offsetX, posy - offsetY, tilt, pan, roll);
			pos.x = pos.x / (mapData.miniScaleX * BigMapsData.scaleMapX);
			pos.y = /*absMaxHeight*/ -pos.y / (mapData.miniScaleY * BigMapsData.scaleMapY);
			
			//LOG.a(pos.x+":"+pos.y);
			return pos;
		}
		
	}
}


