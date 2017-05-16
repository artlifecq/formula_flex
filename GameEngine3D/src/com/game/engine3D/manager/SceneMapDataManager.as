package com.game.engine3D.manager
{
	import com.game.engine3D.vo.SceneMapData;
	import com.game.engine3D.vo.share.CountShare;
	
	import flash.geom.Rectangle;
	
	/**
	 *
	 * 场景地图数据管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-13 下午1:26:38
	 *
	 */
	public class SceneMapDataManager
	{
		public static var sceneMapDataCountShare : CountShare = new CountShare(120000);
		
		public function SceneMapDataManager()
		{
		}
		
		public static function get countShareCnt() : uint
		{
			return sceneMapDataCountShare.getAllCacheKeyList().length;
		}
		
		public static function getMapData(mapName : String) : SceneMapData
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			return sceneMapData;
		}
		
		public static function addMapData(refObj : Object, mapName : String, mapDataUrl : String, completeHandler : Function = null, errorHandler : Function = null, useBitmapData : Boolean = false) : SceneMapData
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				if (sceneMapData.isLoaded)
				{
					if (completeHandler != null)
					{
						completeHandler(sceneMapData);
					}
				}
				else
				{
					if (completeHandler != null)
					{
						sceneMapData.addCompleteHandler(completeHandler);
						sceneMapData.addErrorHandler(errorHandler);
					}
				}
			}
			else
			{
				sceneMapData = new SceneMapData(mapName, mapDataUrl, useBitmapData);
				sceneMapData.addCompleteHandler(completeHandler);
				sceneMapData.addErrorHandler(errorHandler);
				sceneMapData.load();
				sceneMapDataCountShare.addShareData(mapName, sceneMapData);
			}
			sceneMapDataCountShare.installShareData(mapName, refObj);
			return sceneMapData;
		}
		
		public static function addMiniMap(mapName : String, miniMapUrl : String, rect : Rectangle = null, completeHandler : Function = null, errorHandler : Function = null) : void
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				if (sceneMapData.isMiniMapLoaded)
				{
					if (completeHandler != null)
					{
						completeHandler(sceneMapData.miniMapLoader);
					}
				}
				else
				{
					sceneMapData.addMiniMapCompleteHandler(completeHandler);
					sceneMapData.addMiniMapErrorHandler(errorHandler);
					if (!sceneMapData.isMiniMapLoading)
					{
						sceneMapData.loadMiniMap(miniMapUrl, rect);
					}
				}
			}
		}
		
		public static function removeMiniMap(mapName : String, completeHandler : Function = null, errorHandler : Function = null) : void
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				sceneMapData.removeMiniMapCompleteHandler(completeHandler);
				sceneMapData.removeMiniMapErrorHandler(errorHandler);
			}
		}
		
		public static function addRadarMap(mapName : String, radarMapUrl : String, rect : Rectangle = null, completeHandler : Function = null, errorHandler : Function = null) : void
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				if (sceneMapData.isRadarMapLoaded)
				{
					if (completeHandler != null)
					{
						completeHandler(sceneMapData.radarMapLoader);
					}
				}
				else
				{
					sceneMapData.addRadarMapCompleteHandler(completeHandler);
					sceneMapData.addRadarMapErrorHandler(errorHandler);
					if (!sceneMapData.isRadarMapLoading)
					{
						sceneMapData.loadRadarMap(radarMapUrl, rect);
					}
				}
			}
		}
		
		public static function removeRadarMap(mapName : String, completeHandler : Function = null, errorHandler : Function = null) : void
		{
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				sceneMapData.removeRadarMapCompleteHandler(completeHandler);
				sceneMapData.removeRadarMapErrorHandler(errorHandler);
			}
		}
		
		public static function removeMapData(refObj : Object, mapName : String, completeHandler : Function = null, errorHandler : Function = null) : void
		{
			sceneMapDataCountShare.uninstallShareData(mapName, refObj);
			var sceneMapData : SceneMapData = sceneMapDataCountShare.getShareData(mapName) as SceneMapData;
			if (sceneMapData)
			{
				sceneMapData.removeCompleteHandler(completeHandler);
				sceneMapData.removeErrorHandler(errorHandler);
				if (sceneMapData.count <= 0 && !sceneMapData.isLoaded)
				{
					sceneMapDataCountShare.removeShareData(mapName);
				}
			}
		}
	}
}
