package com.rpgGame.app.cmdlistener.scene
{
	import com.game.engine3D.events.MapLoadEvent;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.ui.ResLoadingView;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppInfo;
	import com.rpgGame.core.app.AppLoadManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 地图切换控制器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-15 上午10:26:37
	 *
	 */
	public class SceneSwitchCmdListener extends BaseBean
	{
		public static var fromPercent : Number = 0;
		public static var toPercent : Number = 1;
		private static var _showSceneDelay : TweenLite;

		public function SceneSwitchCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			EventManager.addEvent(MapEvent.MAP_LOAD_START, onLoadStart);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
			EventManager.addEvent(MapLoadEvent.MAP_RESOURCE_COMPLETE, onMapResourceComplete);
			EventManager.addEvent(MapLoadEvent.MAP_LOAD_COMPLETE, onMapLoadComplete);
			EventManager.addEvent(MapLoadEvent.MAP_LOAD_PROGRESS, onMapLoadProgress);
			EventManager.addEvent(MapLoadEvent.MAP_LOAD_ERROR, onMapLoadError);
			EventManager.addEvent(MapLoadEvent.MAP_PARSE_PROGRESS, onMapParseProgress);
			EventManager.addEvent(MapLoadEvent.MAP_PARSE_ERROR, onMapParseError);
			EventManager.addEvent(MapLoadEvent.MAP_DATA_ERROR, onMapDataError);
			EventManager.addEvent(MapLoadEvent.MAP_MINI_MAP_ERROR, onMiniMapError);
			EventManager.addEvent(MapLoadEvent.MAP_RADAR_MAP_ERROR, onRadarMapError);
			//
			finish();
		}

		private static function onMapResourceComplete() : void
		{
			ResLoadingView.instance.percent = fromPercent + (toPercent - fromPercent) * 0.85;
		}

		private static function onMapLoadComplete() : void
		{
			ResLoadingView.instance.percent = toPercent;
			fromPercent = 0;
			toPercent = 1;
		}

		private static function onMapLoadProgress(progress : Number) : void
		{
			ResLoadingView.instance.percent = fromPercent + (toPercent - fromPercent) * (progress * 0.2);
		}

		private static function onMapParseProgress(progress : Number) : void
		{
			ResLoadingView.instance.percent = fromPercent + (toPercent - fromPercent) * (0.2 + progress * 0.6);
		}

		private static function onLoadStart() : void
		{
			if (_showSceneDelay)
			{
				_showSceneDelay.kill();
				_showSceneDelay = null;
			}
			ResLoadingView.instance.show();
			ResLoadingView.instance.title = "进入场景...";
			GameLog.addShow("开始加载场景...");
		}

		private static function onSwitchCmp() : void
		{
			GameLog.addShow("加载场景完成...");
			_showSceneDelay = TweenLite.delayedCall(0.2, onShowScene);
		}
		
		private static function onError(url : String) : void
		{
			GameLog.addShow("加载资源"+url+"出错");
		}
		
		private static function onLoadComplete(_appUrl : String = null) : void
		{
			_showSceneDelay = TweenLite.delayedCall(0.2, onShowScene);
		}
		
		private static function onMapLoadError() : void
		{
			var mapRes : String = "";
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			if (cfg)
			{
				mapRes = cfg.map;
			}
			var mapUrl : String = ClientConfig.getMap(mapRes);
			ResLoadingView.instance.title = "加载地图失败！" + mapUrl;
			GameLog.addShow("=======加载地图失败！" + mapUrl);
		}

		private static function onMapParseError() : void
		{
			var mapRes : String = "";
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			if (cfg)
			{
				mapRes = cfg.map;
			}
			var mapUrl : String = ClientConfig.getMap(mapRes);
			ResLoadingView.instance.title = "解析地图失败！" + mapUrl;
			GameLog.addShow("=======解析地图失败！" + mapUrl);
		}

		private static function onMapDataError() : void
		{
			var mapRes : String = "";
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			if (cfg)
			{
				mapRes = cfg.map;
			}
			var mapUrl : String = ClientConfig.getMap(mapRes);
			ResLoadingView.instance.title = "加载地图数据失败！" + mapUrl;
			GameLog.addShow("=======加载地图数据失败！！" + mapUrl);
		}

		private static function onMiniMapError() : void
		{
			var mapRes : String = "";
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			if (cfg)
			{
				mapRes = cfg.map;
			}
			var mapUrl : String = ClientConfig.getMap(mapRes);
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.onMiniMapError, mapUrl);
			GameAlert.showAlert(alertSet);
			GameLog.addShow("=======加载小地图失败！！！" + mapUrl);
		}

		private static function onRadarMapError() : void
		{
			var mapRes : String = "";
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			if (cfg)
			{
				mapRes = cfg.map;
			}
			var mapUrl : String = ClientConfig.getMap(mapRes);
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.onRadarMapError, mapUrl);
			GameAlert.showAlert(alertSet);
			GameLog.addShow("=======加载雷达地图失败！！！" + mapUrl);
		}

		private static function onShowScene() : void
		{
			ResLoadingView.instance.hide();
			var mapID : int = SceneSwitchManager.currentMapId;
			var cfg : SceneData = MapDataManager.getMapInfo(mapID);
			var qmap:Q_map=cfg.getData();
			if(qmap.q_enter_autofight==1&&cfg.getData().q_autofight_seat){//进入后自动战斗
				var p:Array=JSONUtil.decode(cfg.getData().q_autofight_seat);
				//MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, p[0], p[1],finishWalk, 0);
				TrusteeshipManager.getInstance().startAutoFightToPos([SceneSwitchManager.currentMapId,p[0],p[1]],1,-1);
			}
		}
		
		/*private static function finishWalk(data:Object):void
		{
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}*/
	}
}
