package com.rpgGame.app.manager.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.MapConfig;
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.vo.MapPointSet;
	import com.game.engine3D.vo.SceneMapData;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.mainCore.core.controller.KeyController;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.interfaces.IMapProcess;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.SceneCameraLensEffectManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.countryWar.CountryWarWatchManager;
	import com.rpgGame.app.manager.countryWar.CountryWarZhanCheManager;
	import com.rpgGame.app.manager.input.InputManger;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.map.BaseMapProcess;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.MazeEvent;
	import com.rpgGame.core.manager.BGMManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.ClientSceneCfgData;
	import com.rpgGame.coreData.cfg.country.CountryNameCfgData;
	import com.rpgGame.coreData.clientConfig.ClientScene;
	import com.rpgGame.coreData.info.Map2dDataManager;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.map.map2d.EnterSceneInfo;
	import com.rpgGame.coreData.info.map.map2d.MapDataInfo;
	import com.rpgGame.coreData.info.map.map2d.MapInfo;
	import com.rpgGame.coreData.info.map.map2d.SceneInfo;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.IMapData;
	import com.rpgGame.coreData.info.map.map2d.staticMapData.NormalSceneData;
	import com.rpgGame.coreData.lang.LangStoryDungeon;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.utils.getDefinitionByName;
	
	import app.message.MazeDungeonProto;
	import app.message.SceneProto;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;

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

		private static var _isChangeSceneComplete : Boolean = false;
		private static var _mapRes : String = null;
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
		private static var _lastMapInfo:MapInfo;
		/**当前地图资源*/
		private static var _curtMapInfo:MapInfo;
		
		private static var _isChgLine:Boolean = false;
		private static var _isSameResMap:Boolean = false;
		private static var _currMapType:int;
		
		private static var _isReconnect:Boolean = false;
		/**
		 * 初次登录和切场景成功后的通用逻辑
		 * @param isShowLoading
		 */
		public static function change2dMap($isReconnect:Boolean=false):void
		{
			_isReconnect = $isReconnect;
			var tips:String = "场景切换中...";
			if($isReconnect)
			{
				tips = "掉线重连中..."
				setLastMapID(curtMapID);
				setCurtMapInfoByID(MainRoleManager.actorInfo.mapID);
				checkIsSameResMap();
			}
			
			///此行是测试代码，临时加上去的，也不知道服务器跟客户端是怎么通讯的，先暂时这么写a
			Map2dDataManager.setSceneConfig(new SceneInfo());
			
			setCurtMapInfoByID(MainRoleManager.actorInfo.mapID);//初次登录，mapID来自登录协议
			
			Map2dDataManager.getMapConfigData(curtMapInfo.id,onConfigLoaded);//获取地图配置数据
			
//			EventManager.dispatchEvent(MapEvent.MAP_SWITCH_OPEN,curtMapInfo);//广播开始切场景消息
		}
		
		/**
		 * 获得地形数据回调
		 * @param mapConfig
		 * 
		 */
		private static function onConfigLoaded(mapConfig:MapConfig,mapDataInfo:MapDataInfo):void
		{
			curtMapInfo.mapConfig = mapConfig;
			curtMapInfo.mapDataInfo = mapDataInfo;
			mapConfig.mapID = curtMapInfo.id;
			var bmpData:AsyncMapTexture = Map2dDataManager.getCacheMiniMapBmpData(curtMapInfo.id);
			
			curtMapInfo.mapConfig.smallMapTexture = bmpData;
//			EventManager.dispatchEvent(MapEvent.LOAD_CONFIG_COMPLETE,curtMapInfo);

			//			SocketConnection.addCmdListener(Mod003_SceneMessages.S2C_SCENE_ENTER,onEnterScene);
			//			SceneSender.enterScene();
			
			//测试代码
			onEnterScene();
		}
		
		private static function onEnterScene(/*buffer:ByteBuffer*/):void
		{
			
			//			SocketConnection.removeCmdListener(Mod003_SceneMessages.S2C_SCENE_ENTER,onEnterScene);
			var info:EnterSceneInfo = new EnterSceneInfo(/*buffer,MainManager.actorID*/);//解析场景信息
			dealWithLastMap(info);//处理上张场景的逻辑。
			//
			/*var bodyAp:RenderUnit = MainManager.actor.getBodyAp(false);
			if(bodyAp)
			{
			var colorTF:ColorTransform = MapDataManager.getColorTransform(MapManager.curtMapID);
			if(colorTF)
			{
			bodyAp.addColorTransform(colorTF);//根据地图叠加环境颜色
			}
			else
			{
			bodyAp.removeColorTransform();
			}
			}*/
			
			if(_isSameResMap)
			{
				if(_isChgLine)
				{
//					EventManager.dispatchEvent(MapEvent.LINE_CHANGE);
				}
				onCfgCmp(info);
			}
			else
			{
				var mapUrl : String = ClientConfig.getMap(_mapRes);
				var mapName : String = ClientConfig.getMapName(_mapRes);
				var mapDataName : String = ClientConfig.getMapDataName();

				Scene.scene.switchScene(
					curtMapInfo.id,
					curtMapInfo.mapConfig,
					ClientConfig.getMapZoneDir(curtMapInfo.mapData.mapPackName),
					mapUrl + "/" +mapName,
					onCfgCmp,
					enterSceneSuccessed,false,[info]);
				Scene.scene.gameScene3d.loadMapData(mapName, mapUrl + "/" +mapDataName,onMapDataComplete);
			}
		}
		
		private static function dealWithLastMap($info:EnterSceneInfo):void
		{
			
//			Scene_CursorCharHelper.hideCursor();
			//
			/*if(curtMapInfo.lineID != $info.lineID &&  _lastMapID == _curtMapID)//线路不一样，同时场景ID一样，才算换线。
			{
			_isChgLine = true;
			}
			curtMapInfo.lineID = $info.lineID;*/
			var isDesMap:Boolean = !_isChgLine;
			if(_isReconnect)
			{
				isDesMap = !_isSameResMap;
			}
			if(isDesMap)//销毁上一地图的操作 
			{
				destroy();
			}
			else
			{
				
			}
			//如果不是普通地图，清空自动寻路
			if(curtMapInfo.mapData.mapType != EnumMapType.MAP_TYPE_NORMAL)
			{
//				EventManager.dispatchEvent(MapEvent.CLEAR_SEARCH_PATH);
			}
			onMapProcess();
		}
		
		private static function onMapProcess():void
		{
			try
			{
				var cls:Class = getDefinitionByName(CLS_PATH + curtMapInfo.id) as Class;
				if(cls)
				{
					_mapPros = new cls();
					_mapPros.setup();
//					EventManager.dispatchEvent(MapEvent.MAP_INIT,curtMapInfo);
				}
			}
			catch(e:Error)
			{
				_mapPros = new BaseMapProcess();
				_mapPros.setup();
				GameLog.add("##----------------没有找到对应的地图功能类----------" + curtMapInfo.id);
			}
		}
		
		private static function onCfgCmp(info:EnterSceneInfo):void
		{
			var isResetData:Boolean = !_isChgLine;
			if(_isReconnect)
			{
				isResetData = !_isSameResMap;
			}
			if(isResetData)//不是切线
			{

				Scene.scene.updateCameraNow();
					//强制刷新下切片图
				Scene.scene.sceneZoneMapLayer.strongLoadMap = true;
				
				Scene.scene.sceneRender.startRender(true);
				
				/*if(_blockerSP)
				{
					_blockerSP.graphics.clear();
				}
				_isDarwBlocker = false;*/
			}
			//前面有上张地图的死亡状态判断，所以复活要在这里处理
			mapSwitchComplete();//地图切换结束
			//
			_isReconnect = false;
		}
		
		/**地图切换结束*/
		private static function mapSwitchComplete():void
		{
			/*if(!_isChgLine && !_isReconnect)
			{
			MapLoadManager.initAfterMapSwitchComplete();
			SceneCharPatrolManager.init();
			}
			_isMapSwitchComplete = true;
			if (MapDataManager.isNormalScene(MapManager.curtMapInfo.id))
			{
			if (!isInLayerStory) 
			{
			SceneSender.reqSceneLineInfo();
			}
			}*/
			
			//加载马赛克小地图
			Map2dDataManager.getMiniMapBmpData(curtMapInfo.id,onMiniMapCmp);
		}
		
		private static function onMiniMapCmp(bmpData:AsyncMapTexture,mapID:uint):void
		{
			var mapdata:IMapData;
			if(curtMapInfo.mapData is NormalSceneData)
				mapdata = curtMapInfo.mapData as NormalSceneData;
			else
				mapdata = curtMapInfo.mapData;
			
			Scene.scene.mapConfig.smallMapUrl = ClientConfig.getSmallMap(mapdata.mapPackName);
			Scene.scene.mapConfig.smallMapTexture = bmpData;
			Scene.scene.drawSmallMap();
			onSmallMapCmp(bmpData);
		}
		
		/**小地图加载完成*/
		private static function onSmallMapCmp(bmpData:AsyncMapTexture):void
		{
			//客户端加载地图XML成功
//			EventManager.dispatchEvent(MapEvent.LOAD_SMALL_MAP_COMPLETE,{mapID:curtMapInfo.id,mapBG:bmpData});
		}
		
		private static function destroy():void
		{
			//			MapLoadManager.clear();
			//			SceneCharPatrolManager.clear();
			if(_mapPros)
			{
				_mapPros.destroy();
				_mapPros = null;
			}
			//
//			Scene_CursorCharHelper.hideCursor();
			//关闭用户操作
			KeyController.instance.clear();
			//停掉所有音乐
			/*if(_resetBgSound)
			{
			TSoundManager.stopAllSound();
			}*/
			//
//			Scene.scene.sceneRender.stopRender();
		}
		
		//判断当前场景地图ID是否与上一场景地图ID相同，相同为换线。
		//不同为换地图，换地图判断当前资源名称，是否与上一场景资源名称相同，不同则加载配置文件，进行切地图相关逻辑，
		//资源相同则不处理加载逻辑，但是切场景的相关逻辑继续。
		private static function checkIsSameResMap():void
		{
			_isSameResMap = false;
			if(lastMapID == curtMapID)//是否与上一场景是同一地图
			{
				_isSameResMap = true;
			}
			else
			{
				if(lastMapID)
				{
					if(lastMapInfo.mapData.map == curtMapInfo.mapData.map)
					{
						_isSameResMap = true;
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
			_lastMapInfo = Map2dDataManager.getMapInfo(lastMapID);
		}
		
		public static function get curtMapID():uint
		{
			return _curtMapID;
		}
		public static function get currMapType():int
		{
			return _currMapType;	
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
				preMapPackName = _curtMapInfo.mapData.mapPackName;
			}
			_curtMapID = mapID;
			_currMapType = Map2dDataManager.getMapType(_curtMapID);
			_curtMapInfo = Map2dDataManager.getMapInfo(mapID);
//			MapAreaManager.currCheckMapId = _curtMapID;
//			MapAreaManager.checkAreaEvent();
			if (preMapPackName) 
			{
				Map2dDataManager.checkDelayDisposeMap(preMapPackName);
			}
		}
		
		public static function get lastMapInfo():MapInfo
		{
			return _lastMapInfo;
		}
		
		public static function get curtMapInfo():MapInfo
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
		 * 初次登录和切场景成功后的通用逻辑
		 */
		public static function changeMap(isReal3D:Boolean = false) : void
		{
			GameLog.addShow("开始切换场景...");
			MapUnitDataManager.clear();
			ClientTriggerManager.sceneClear();
			SceneCameraLensEffectManager.sceneClear();
			TaskManager.storyTaskInfo = null;
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true);
			var mapID : int = MainRoleManager.actorInfo.mapID;
			_isChangeSceneComplete = false;
			SocketConnection_protoBuffer.excuteAll();
			InputManger.getInstance().closeOperate(); //关闭用户输入
			SceneManager.getScene().clearAreaMap(1);
			SceneManager.getScene().removeAllSceneObj();
			TrusteeshipManager.getInstance().stopAll();
			var currMapInfo : SceneData = MapDataManager.getMapInfo(currentMapId); //获取地图配置数据
			var mapInfo : SceneData = MapDataManager.getMapInfo(mapID); //获取地图配置数据
			MapDataManager.currentScene = mapInfo;
			if (mapInfo && currMapInfo && (mapInfo.map == currMapInfo.map))
			{
				EventManager.dispatchEvent(MapEvent.MAP_SWITCH_START);
				sendSceneLoaded();
			}
			else
			{
				SceneTimeOfTheDayManager.clear();
				SceneManager.getScene().clear();
				EventManager.dispatchEvent(MapEvent.MAP_LOAD_START);
				EventManager.dispatchEvent(MapEvent.MAP_SWITCH_START);
				if (ClientConfig.isSingle)
				{
					var cfg : ClientScene = ClientSceneCfgData.getSceneInfo(mapID);
					if (cfg)
					{
						MainRoleManager.actorInfo.x = 1000;//2700;//cfg.enter_x;
						MainRoleManager.actorInfo.y = -1000;//-1400;//cfg.enter_y;
						_mapRes = cfg.map_name_resource;
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
			if (SceneManager.clientMapData)
			{
				var obstacleAreas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getObstacleAreas();
				var mapPointSets : Vector.<MapPointSet> = new Vector.<MapPointSet>();
				for each (var areaData : ClientMapAreaData in obstacleAreas)
				{
					mapPointSets.push(new MapPointSet("MapDataObstacleArea" + areaData.id, areaData.getVector3Ds()));
				}
				scene.sceneMapLayer.addObstaclePoints(mapPointSets);
				AreaMapManager.updateCameraAreaMap();
				SceneTimeOfTheDayManager.initScene(SceneManager.clientMapData.timeOfTheDayData, scene);

				BGMManager.playMusic(SceneManager.clientMapData.bgSoundRes);
			}
			MainRoleManager.actor.avatar.lightPicker = SceneManager.getScene().entityLightPicker;
			var speed:int = MainRoleManager.actorInfo.spriteStat.moveSpeed;
			MainRoleManager.actorInfo.spriteStat.moveSpeed = 200;
			sendSceneLoaded();
		}

		private static function onMapDataComplete(mapData : SceneMapData) : void
		{
			if (SceneManager.clientMapData)
			{
				var mapUrl : String = ClientConfig.getMap(_mapRes);
				var miniMapName : String = ClientConfig.getMiniMapName(SceneManager.clientMapData.miniMapRes);
				SceneManager.getScene().loadMiniMap(mapUrl, miniMapName, SceneManager.clientMapData.miniMapRect, onMiniMapComplete);
				var radarMapName : String = ClientConfig.getRadarMapName(SceneManager.clientMapData.radarMapRes);
				SceneManager.getScene().loadRadarMap(mapUrl, radarMapName, SceneManager.clientMapData.radarMapRect, onRadarMapComplete);
			}
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
			else if (MainRoleManager.isTakeZhanChe)
			{
				if (CountryWarZhanCheManager.zhanCheSceneLoaded)
				{
					SceneSender.sceneLoaded(SceneManager.viewDistance);
				}
				CountryWarZhanCheManager.sceneLoadedWhenTakeZhanChe = true;
			}
			else if(CountryWarWatchManager.isWatching)
			{
				CountryWarWatchManager.reqEnterWatchSceneToServer();
			}
			else
			{
				SceneSender.sceneLoaded(SceneManager.viewDistance);
			}
		}

		private static function onSwitchCmp() : void
		{
			_isChangeSceneComplete = true;
			generateSceneEntities();
			MainRoleManager.updateActorStatus(); //更新主角状态
			GameCameraManager.updateProperty();
			GameCameraManager.tryUseCameraProperty();

			//开启用户操作
			InputManger.getInstance().openOperate();
			TaskManager.updateMainTaskInfo();

			//检测用户死亡
			ReliveManager.checkPlayerDie();
			showSceneTips();
			showSceneEffect();
			MapDataManager.lastScene = MapDataManager.currentScene;
		}

		private static function generateSceneEntities() : void
		{
			SceneManager.generateClientSceneNpcs();
			//SceneManager.generateSceneNpcs();//不再使用客户端生成，服务器方案已改！
			SceneManager.generateSceneCollects();
			//SceneManager.generateSceneTransports();
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
			}
		}
	}
}
