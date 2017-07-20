package com.rpgGame.app.manager.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.vo.MapPointSet;
	import com.game.engine3D.vo.SceneMapData;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.mainCore.core.controller.KeyController;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.interfaces.IMapProcess;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.GamePerformsManager;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.SceneCameraLensEffectManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.input.InputManger;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.map.BaseMapProcess;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppInfo;
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.MazeEvent;
	import com.rpgGame.core.manager.BGMManager;
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.MapPreLoadData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.clientConfig.Q_map_preload;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangStoryDungeon;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getDefinitionByName;
	
	import app.message.MazeDungeonProto;
	import app.message.SceneProto;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *
	 * 场景切换管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class SceneSwitchManager
	{
		/**
		 * <font color=#00><b>当前地图ID</b></font></br>
		 * <font color=#00><b>此地图Id不同于MainRoleManager.actorInfo.mapID，一个是地图上的数据，一个是玩家身上的数据</b></font></br>
		 * <font color=#0000FF><b>currentMapId:</b></font> <font color=#FF0000><b>当前所在的场景编号，只有当进入场景且场景初始化完成后此编号才生效</b></font></br>
		 * <font color=#0000FF><b>MainRoleManager.actorInfo.mapID</b></font> <font color=#FF0000><b>接收从服务器传过来的场景编号，在进入场景初始化完成之前都生效</b></font></br>
		 * <font color=#0000FF><b>currentMapId:</b></font> <font color=#FF0000><b>也可以用来玩家切新地图时当做上一张地图编号的数据来使用</b></font></br>
		 *  * <font color=#00><b>currentMapId全局变量一次赋值直接调用，无需查询</b></font></br>
		 * */
		public static var currentMapId : uint = 0;
		
		/**
		 *是否去跨服地图; 
		 */
		public static var isToCrossMap:Boolean;
		
		private static var _isChangeSceneComplete : Boolean = false;
		private static var _mapRes : String = null;
		public static var needOpenNewFuncId:int;
		setup();
		
		private static function setup() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}
		
		public static function get isChangeSceneComplete() : Boolean
		{
			return _isChangeSceneComplete;
		}
		
		////////////////////////////////////////////////以下是2d场景处理//////////////////////////////////////////////
		/**地图功能类 */		
		private static var _mapPros:IMapProcess;
		private static const CLS_PATH:String = "com.rpgGame.app.map.MapProcess_";
		private static const MAP_TYPE_CLS_PATH:String = "com.rpgGame.app.map.MapTypeProcess_";
		/**上一地图ID*/
		private static var _lastMapID:uint = 0;
		/**当前地图ID*/
		private static var _curtMapID:uint = 0;
		/**上一地图资源*/
		private static var _lastMapInfo:SceneData;
		/**当前地图资源*/
		private static var _curtMapInfo:SceneData;
		
		private static var _isSameMap:Boolean = false;
		
		private static var _isReconnect:Boolean = false;
		private static var _isMapSameRes:Boolean=false;
		/**
		 * 初次登录和切场景成功后的通用逻辑
		 * @param isShowLoading
		 */
		public static function change2dMap($isReconnect:Boolean=false):void
		{
			_isReconnect = $isReconnect;
			if($isReconnect)
			{
				setLastMapID(curtMapID);
				setCurtMapInfoByID(MainRoleManager.actorInfo.mapID);
				checkIsSameResMap();
			}
			
			setCurtMapInfoByID(MainRoleManager.actorInfo.mapID);
			
			MapDataManager.getMapConfigData(curtMapInfo.sceneId,onConfigLoaded);//获取地图配置数据
		}
		
		/**
		 * 获得地形数据回调
		 * @param mapConfig
		 * 
		 */
		private static function onConfigLoaded(mapConfig:MapConfig):void
		{
			curtMapInfo.mapConfig = mapConfig;
			mapConfig.mapID = curtMapInfo.sceneId;
			var bmpData:AsyncMapTexture = MapDataManager.getCacheMiniMapBmpData(curtMapInfo.sceneId);
			
			curtMapInfo.mapConfig.smallMapTexture = bmpData;
			
			onEnterScene();
		}
		
		private static var needLoadCmpCnt : int = 0;
		private static var onLoadSceneCmpParam : GameScene3D = null;
		private static function onEnterScene():void
		{	
			if (0 != needLoadCmpCnt) {
				return;
			}
			if(_isSameMap)
			{
				onCfgCmp();
			}
			else
			{
				var mapUrl : String = ClientConfig.getMap(_mapRes);
				var mapName : String = ClientConfig.getMapName(_mapRes);
				var mapDataName : String = ClientConfig.getMapDataName();
				
				needLoadCmpCnt = 2;
				if (_isMapSameRes) 
				{
					needLoadCmpCnt=1;
					Scene.scene.gameScene3d.sceneMapLayer.resetSceneMapData(null);
				}
				onLoadSceneCmpParam = null;
				if (!_isMapSameRes) 
				{
					Scene.scene.switchScene(
						curtMapInfo.sceneId,
						curtMapInfo.mapConfig,null,
						ClientConfig.getMapZoneDir(curtMapInfo.mapNameResource),
						mapUrl + "/" +mapName,
						onCfgCmp,
						enterSceneSuccessed,false);
				}
				
				Scene.scene.gameScene3d.loadMapData(mapName, mapUrl + "/" +mapDataName,onMapDataComplete);
			}
		}
		
		private static function dealWithLastMap():void
		{
			var isDesMap:Boolean = false;
			if(_isReconnect)
			{
				isDesMap = !_isSameMap;
			}
			if(isDesMap)//销毁上一地图的操作 
			{
				destroy();
			}
			else
			{
				
			}
			
			onMapProcess();
		}
		
		private static function onMapProcess():void
		{
			try
			{
				var cls:Class = getDefinitionByName(CLS_PATH + curtMapInfo.sceneId) as Class;
				if(cls)
				{
					_mapPros = new cls();
					_mapPros.setup();
				}
			}
			catch(e:Error)
			{
				_mapPros = new BaseMapProcess();
				_mapPros.setup();
				GameLog.add("##----------------没有找到对应的地图功能类----------" + curtMapInfo.sceneId);
			}
		}
		
		private static function onCfgCmp():void
		{
			var isResetData:Boolean = false;
			if(_isReconnect)
			{
				isResetData = !_isSameMap;
			}
			if(isResetData)//不是切线
			{
				
				Scene.scene.updateCameraNow();
				//强制刷新下切片图
				Scene.scene.sceneZoneMapLayer.strongLoadMap = true;
				
				Scene.scene.sceneRender.startRender(true);
				
			}
			//前面有上张地图的死亡状态判断，所以复活要在这里处理
			mapSwitchComplete();//地图切换结束
			//
			_isReconnect = false;
		}
		
		/**地图切换结束*/
		private static function mapSwitchComplete():void
		{
			//加载马赛克小地图
			MapDataManager.getMiniMapBmpData(curtMapInfo.sceneId,onMiniMapCmp);
		}
		
		private static function onMiniMapCmp(bmpData:AsyncMapTexture,mapID:uint):void
		{
			Scene.scene.mapConfig.smallMapUrl = ClientConfig.getSmallMap(curtMapInfo.mapNameResource);
			Scene.scene.mapConfig.smallMapTexture = bmpData;
			Scene.scene.drawSmallMap();
			onSmallMapCmp(bmpData);
		}
		
		/**小地图加载完成*/
		private static function onSmallMapCmp(bmpData:AsyncMapTexture):void
		{
			//			EventManager.dispatchEvent(MapEvent.LOAD_SMALL_MAP_COMPLETE,{mapID:curtMapInfo.id,mapBG:bmpData});
		}
		
		private static function destroy():void
		{
			if(_mapPros)
			{
				_mapPros.destroy();
				_mapPros = null;
			}
			//
			//关闭用户操作
			KeyController.instance.clear();
		}
		
		//判断当前场景地图ID是否与上一场景地图ID相同，相同为换线。
		//不同为换地图，换地图判断当前资源名称，是否与上一场景资源名称相同，不同则加载配置文件，进行切地图相关逻辑，
		//资源相同则不处理加载逻辑，但是切场景的相关逻辑继续。
		private static function checkIsSameResMap():void
		{
			_isSameMap = false;
			if(lastMapID == curtMapID)//是否与上一场景是同一地图
			{
				_isSameMap = true;
			}
			else
			{
				if(lastMapID)
				{
					if(lastMapInfo.map == curtMapInfo.map)
					{
						_isSameMap = true;
					}
				}
			}
		}
		
		public static function get lastMapID():uint
		{
			return _lastMapID;
		}
		
		private static function setLastMapID(lastMapID:uint):void
		{
			_lastMapID = lastMapID;
			_lastMapInfo = MapDataManager.getMapInfo(lastMapID);
		}
		
		public static function get curtMapID():uint
		{
			return _curtMapID;
		}
		
		public static function get currMapName():String
		{
			return MapDataManager.getMapName(_curtMapID);
		}
		
		private static function setCurtMapInfoByID(mapID:uint):void
		{
			var preMapPackName:String;
			if (_curtMapInfo) 
			{
				preMapPackName = _curtMapInfo.mapNameResource;
			}
			_curtMapID = mapID;
			_curtMapInfo = MapDataManager.getMapInfo(mapID);
			
			if (preMapPackName) 
			{
				MapDataManager.checkDelayDisposeMap(preMapPackName);
			}
			MapDataManager.cancelDelayDisposeMap(_curtMapInfo.mapNameResource);
		}
		
		public static function get lastMapInfo():SceneData
		{
			return _lastMapInfo;
		}
		
		public static function get curtMapInfo():SceneData
		{
			return _curtMapInfo;
		}
		public static function get currMapWidth():int
		{
			if (_curtMapInfo) 
			{
				return  _curtMapInfo.mapConfig.width;
			}
			return 0;
		}
		public static function get currMapHeight():int
		{
			if (_curtMapInfo) 
			{
				return  _curtMapInfo.mapConfig.height;
			}
			return 0;
		}
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		/**
		 *清理场景 
		 * 
		 */
		private static function clearScene(clearScene:Boolean=true):void
		{
			GamePerformsManager.pause();
			MapUnitDataManager.clear();
			SceneRoleSelectManager.clearSelect();
			ClientTriggerManager.sceneClear();
			SceneCameraLensEffectManager.sceneClear();
			TaskManager.storyTaskInfo=null;
			if(MainRoleManager.actor){
				MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
			}
			
			InputManger.getInstance().closeOperate();
			
			SceneTimeOfTheDayManager.clear();
			if (clearScene) 
			{
				SceneManager.getScene().clear();
				SceneManager.getScene().clearAreaMap(1);
				
			}
			SceneManager.getScene().removeAllSceneObj();
			TaskAutoManager.getInstance().stopSwitchAll();
			TrusteeshipManager.getInstance().stopAll();
		}
		
		/**
		 * 初次登录和切场景成功后的通用逻辑
		 */
		public static function changeMap(isReal3D:Boolean = false) : void
		{
			GameLog.addShow("开始切换场景...");
			var mapID : int = MainRoleManager.actorInfo.mapID;
			if (1 == mapID) {
				mapID = 1001;
				MainRoleManager.actorInfo.mapID = 1001;
			}
			_isChangeSceneComplete = false;
			
			CONFIG::netDebug {
				NetDebug.LOG("[SceneSwitchManager] [ChangeMap] sceneID:" + currentMapId + ", mapID:" + mapID);
			}
				
			var currMapInfo : SceneData = MapDataManager.getMapInfo(currentMapId); //获取地图配置数据
			var mapInfo : SceneData = MapDataManager.getMapInfo(mapID); //获取地图配置数据
			CONFIG::netDebug {
				if (null == mapInfo) {
					NetDebug.LOG("[SceneSwitchManager] [ChangeMap] mapID:" + mapID + " config data not exists");
				} else {
					NetDebug.LOG("[SceneSwitchManager] [ChangeMap] mapID:" + mapID + " config data exists");
				}
			}
			MapDataManager.currentScene = mapInfo;
			_isMapSameRes=mapInfo && currMapInfo && (mapInfo.map == currMapInfo.map);
			clearScene(!_isMapSameRes);
			EventManager.dispatchEvent(MapEvent.MAP_SWITCH_START);
			if (_isMapSameRes)
			{
				//sendSceneLoaded();
				change2dMap();
				
			}
			else
			{
				//clearScene();
				EventManager.dispatchEvent(MapEvent.MAP_LOAD_START);
				if (ClientConfig.isSingle)
				{
					if (mapInfo)
					{
						MainRoleManager.actorInfo.x = 2700;
						MainRoleManager.actorInfo.y = 1400;
						_mapRes = mapInfo.map;
					}
				}
				else
				{
					if (mapInfo)
					{
						_mapRes = mapInfo.map;
					}
					else
					{
						ResLoadingView.instance.title = "地图" + mapID + "数据不存在";
					}
				}
				if (_mapRes)
				{
					var mapUrl : String = ClientConfig.getMap(_mapRes);
					var mapName : String = ClientConfig.getMapName(_mapRes);
					var mapDataName : String = ClientConfig.getMapDataName();
					CONFIG::netDebug {
						NetDebug.LOG("[SceneSwitchManager] [ChangeMap] mapID:" + mapID + " mapUrl:" + mapUrl + " mapName:" + mapName + " mapDataName:" + mapDataName);
					}
						
						if(isReal3D)
						{
							SceneManager.getScene().switchScene(mapUrl + "/" +mapName, enterSceneSuccessed);
						}
						else
						{
							change2dMap();
						}
				}
			}
			currentMapId = mapID;
		}
		
		private static function enterSceneSuccessed(scene : GameScene3D) : void
		{
			--needLoadCmpCnt;
			onLoadSceneCmpParam = scene;
			onLoadSceneComplete();
			//			if (SceneManager.clientMapData)
			//			{
			//				var obstacleAreas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getObstacleAreas();
			//				var mapPointSets : Vector.<MapPointSet> = new Vector.<MapPointSet>();
			//				for each (var areaData : ClientMapAreaData in obstacleAreas)
			//				{
			//					mapPointSets.push(new MapPointSet("MapDataObstacleArea" + areaData.id, areaData.getVector3Ds()));
			//				}
			//				scene.sceneMapLayer.addObstaclePoints(mapPointSets);
			//				AreaMapManager.updateCameraAreaMap();
			//				SceneTimeOfTheDayManager.initScene(SceneManager.clientMapData.timeOfTheDayData, scene);
			//
			//				BGMManager.playMusic(SceneManager.clientMapData.bgSoundRes);
			//			}
			//
			//			sendSceneLoaded();
		}
		
		private static function onMapDataComplete(mapData : SceneMapData) : void
		{
			--needLoadCmpCnt;
			onLoadSceneComplete();
			//			if (SceneManager.clientMapData)
			//			{
			//				var mapUrl : String = ClientConfig.getMap(_mapRes);
			//				var miniMapName : String = ClientConfig.getMiniMapName(SceneManager.clientMapData.miniMapRes);
			//				SceneManager.getScene().loadMiniMap(mapUrl, miniMapName, SceneManager.clientMapData.miniMapRect, onMiniMapComplete);
			//				var radarMapName : String = ClientConfig.getRadarMapName(SceneManager.clientMapData.radarMapRes);
			//				SceneManager.getScene().loadRadarMap(mapUrl, radarMapName, SceneManager.clientMapData.radarMapRect, onRadarMapComplete);
			//			}
		}
		
		private static function onLoadSceneComplete() : void {
			if (0 != needLoadCmpCnt) {
				return;
			}
			
			if (SceneManager.clientMapData)
			{
				//var obstacleAreas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getObstacleAreas();
				var obstacleAreas : Vector.<ClientMapAreaData> = AreaCfgData.getObstacleAreas(curtMapID);
				if(obstacleAreas!=null&&obstacleAreas.length>0)
				{
					var mapPointSets : Vector.<MapPointSet> = new Vector.<MapPointSet>();
					for each (var areaData : ClientMapAreaData in obstacleAreas)
					{
						mapPointSets.push(new MapPointSet("MapDataObstacleArea" + areaData.id, areaData.getVector2Ds()));
					}
					onLoadSceneCmpParam.sceneMapLayer.addObstaclePoints(mapPointSets);
				}
				AreaMapManager.updateCameraAreaMap();
				SceneTimeOfTheDayManager.initScene(SceneManager.clientMapData.timeOfTheDayData, onLoadSceneCmpParam);
				
				BGMManager.playMusic(SceneManager.clientMapData.bgSoundRes);
			}
			
			if (SceneManager.clientMapData)
			{
				var mapUrl : String = ClientConfig.getMap(_mapRes);
				var miniMapName : String = ClientConfig.getMiniMapName(SceneManager.clientMapData.miniMapRes);
				SceneManager.getScene().loadMiniMap(mapUrl, miniMapName, SceneManager.clientMapData.miniMapRect, onMiniMapComplete);
				var radarMapName : String = ClientConfig.getRadarMapName(SceneManager.clientMapData.radarMapRes);
				SceneManager.getScene().loadRadarMap(mapUrl, radarMapName, SceneManager.clientMapData.radarMapRect, onRadarMapComplete);
			}
			
			sendSceneLoaded();
		}
		
		private static function onMiniMapComplete(scene : GameScene3D) : void
		{
			EventManager.dispatchEvent(MapEvent.MINI_MAP_COMPLETE);
		}
		
		private static function onRadarMapComplete(scene : GameScene3D) : void
		{
			EventManager.dispatchEvent(MapEvent.RADAR_MAP_COMPLETE);
		}
		
		private static function sendSceneLoaded() : void
		{
			//trace("!!!!!!!sendSceneLoaded:MainRoleManager.isTakeZhanChe=", MainRoleManager.isTakeZhanChe, "CountryWarZhanCheManager.zhanCheSceneLoaded=", CountryWarZhanCheManager.zhanCheSceneLoaded);
			if (ClientConfig.isSingle)
			{
				EventManager.dispatchEvent(MapEvent.MAP_SWITCH_COMPLETE);
			}
				//			else if (MainRoleManager.isTakeZhanChe)
				//			{
				//				if (CountryWarZhanCheManager.zhanCheSceneLoaded)
				//				{
				//					SceneSender.sceneLoaded(SceneManager.viewDistance);
				//				}
				//				CountryWarZhanCheManager.sceneLoadedWhenTakeZhanChe = true;
				//			}
				//			else if(CountryWarWatchManager.isWatching)
				//			{
				//				CountryWarWatchManager.reqEnterWatchSceneToServer();
				//			}
			else
			{
				//				SceneSender.sceneLoaded(SceneManager.viewDistance);老的代码
				var mapId:int=MainRoleManager.actorInfo.mapID;
				var preInfo:Q_map_preload=MapPreLoadData.getPreLoadInfo(mapId);
				if(preInfo){//存在需要预加载的图集
					var loadUrl : String = ClientConfig.getUI(preInfo.q_res_name);
					AppLoadManager.instace().loadByUrl(loadUrl, "预加载图集", 	onLoadComplete, onError);
				}else{
					onLoadComplete();
				}
			}
		}
		
		private static function onLoadComplete(_appUrl:* = null) : void
		{
			SceneSender.SendLoadFinishMessage();
		}
		
		private static function onError(url : String) : void
		{
			GameLog.addShow("加载资源"+url+"出错");
		}
		
		private static function onSwitchCmp() : void
		{
			if(SceneSwitchManager.isToCrossMap){//前往跨服地图成功切换状态
				SceneSwitchManager.isToCrossMap=false;
			}
			
			Stage3DLayerManager.frameRate = 60;
			_isChangeSceneComplete = true;
			generateSceneEntities();
			MainRoleManager.updateActorStatus(); //更新主角状态
			GameCameraManager.updateProperty();
			GameCameraManager.tryUseCameraProperty();
//			updateSceneSound();
			
			GamePerformsManager.resume();
			
			//开启用户操作
			InputManger.getInstance().openOperate();
			TaskAutoManager.getInstance().startSwitchTaskAuto();
			
			
			//检测用户死亡
			ReliveManager.checkPlayerDie();
			
			
			showSceneTips();
			showSceneEffect();
			MapDataManager.lastScene = MapDataManager.currentScene;
			showScenePanel();
		}
		
		
		private static function showScenePanel():void
		{
			var mapId:int=MainRoleManager.actorInfo.preMapID;
			var sceneData:SceneData=MapDataManager.getMapInfo(mapId);
		/*	if(mapId==600){
				AppManager.showApp(AppConstant.MULTY_PANL);
				TweenLite.delayedCall(5,function():void{
					DungeonSender.reqEnterDungeon(7001);
				});
				 return;
			}else if(sceneData&&sceneData.mapType==0){
				TweenLite.delayedCall(3,function():void{
					DungeonSender.reqQuitDungeon();
				});
			}*/
			if(!sceneData){
				return;
			}
			switch(sceneData.mapType){
				case EnumMapType.MAP_TYPE_LUNJIAN://打开论剑
					AppManager.showApp(AppConstant.SWORD_PANL);
					break;
			}
			
			if(needOpenNewFuncId>0)
			{
				FunctionOpenManager.openAppPaneById(needOpenNewFuncId.toString());
				needOpenNewFuncId = 0;
			}
		}
		
		private static function generateSceneEntities() : void
		{
			SceneManager.generateClientSceneNpcs();
			//SceneManager.generateSceneNpcs();//不再使用客户端生成，服务器方案已改！
			SceneManager.generateSceneCollects();
			SceneManager.generateSceneTransports();
			SceneManager.generateSceneJumppoint();
			SceneManager.generateEventArea();
			
		}
		
		/**
		 * 场景提示
		 *
		 */
		private static function showSceneTips() : void
		{
			var sceneData : SceneData = MapDataManager.currentScene;
			if (!sceneData)
				return;
			var sceneSequence : int = MainRoleManager.actorInfo.sceneSequence;
			var sceneName : String = sceneData.name;
			if (sceneData.isStoryDungeonScene)
			{
				NoticeManager.showNotify(LangStoryDungeon.STORY_DUNGEON_START, sceneName);
			}
			else if (sceneData.isMazeScene)
			{
				var proto : MazeDungeonProto = (sceneData.getData() as SceneProto).mazeDungeon;
				if (!proto)
					return;
				EventManager.dispatchEvent(MazeEvent.SHOW_MAZE_RANDOM);
			}
			else
			{
				var countryName : String = sceneSequence > 0 ? CountryNameCfgData.getCountryNameById(sceneSequence) : "";
				if (countryName)
					NoticeManager.showNotify(LangText.SCENE_ENTER_COUNTRY_NOTIFY_TEXT, countryName, sceneName);
				else
					NoticeManager.showNotify(LangText.SCENE_ENTER_NOTIFY_TEXT, sceneName);
			}
		}
		
		private static function showSceneEffect() : void
		{
			if (MapDataManager.currentScene)
			{
				if (MapDataManager.currentScene.isStoryDungeonScene)
				{
					SceneCameraLensEffectManager.playEffectOnce(EffectUrl.SWITCH_SCENE_EFFECT, 200, 0.5);
				}
				else if (MapDataManager.lastScene && MapDataManager.lastScene.isStoryDungeonScene)
				{
					SceneCameraLensEffectManager.playEffectOnce(EffectUrl.SWITCH_SCENE_EFFECT, 200, 0.5);
				}
				else
				{
					SceneCameraLensEffectManager.playEffectOnce(EffectUrl.SWITCH_SCENE_EFFECT, 200, 0.5);
				}
			}
		}
	}
}
