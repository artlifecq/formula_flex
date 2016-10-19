package com.game.engine2D.scene.layers
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine2D.scene.map.MapCache;
	import com.game.engine2D.scene.map.vo.MapZone;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.vo.PoolContainer;
	import com.game.mainCore.libCore.utils.ZMath;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import away3d.materials.TextureMaterial;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 * @private
	 * 场景区块地图层
	 * @author Carver
	 * @modifier L.L.M.Sunny
	 * 修改时间：2015-5-11 下午16:19:35
	 */
	public class SceneZoneMapLayer extends PoolContainer
	{
		/**
		 * 缓存中保存的地图图片的距离当前摄像机镜头的最大zone格x范围
		 */
		private static const MAX_ZONE_CACHE_X : int = 0;
		/**
		 * 缓存中保存的地图图片的距离当前摄像机镜头的最大zone格y范围
		 */
		private static const MAX_ZONE_CACHE_Y : int = 0;
		
		private static const DISPOSE_TM_GAP : uint = 60 * 3;

		public var strongLoadMap : Boolean = false;
	
		/**场景*/
		private var _scene : Scene;
		private var _camera : SceneCamera;
		/**
		 * 缓存场景的每个格子地图容器
		 */
		private var _mapZones : HashMap = new HashMap();
		/**
		 * 旧的摄像机的位置
		 */
		private var _currCameraPos : Point = new Point(int.MAX_VALUE, int.MAX_VALUE);
		/**
		 * 旧的镜头当前的区域块图
		 */
		private var _currentMapZone : MapZone;
		private var _loadMapZoneList : Vector.<MapZone> = new Vector.<MapZone>;
		private var _isNeedSortZone : Boolean = true;
		private var _isQueueDraw : Boolean = true;
		private var _immedDispose : Boolean = false;
		private var _drawZoneList : Vector.<MapZone> = new Vector.<MapZone>();
		
		private var _disposeTmCnt : uint = 0;
		private var _disposeTimer : int = 0;

		public function SceneZoneMapLayer($scene : Scene)
		{
			_scene = $scene;
			_camera = $scene.sceneCamera;
		}

		/**
		 * 获取指定位置的MapZone
		 * $param $zoneX
		 * $param $zoneY
		 */
		final private function getMapZone($zoneX : int, $zoneY : int) : MapZone
		{
			//判断范围合法性
			var hNum : int = Math.ceil(_scene.mapConfig.gridH / SceneConfig.ZONE_SCALE_WIDTH);
			var vNum : int = Math.ceil(_scene.mapConfig.gridV / SceneConfig.ZONE_SCALE_HEIGHT);
			if ($zoneX < 0 || $zoneX >= hNum)
				return null;
			if ($zoneY < 0 || $zoneY >= vNum)
				return null;

			//直接在缓存中读取
			var key : * = MapZone.getKey($zoneX, $zoneY);
			var mapZone : MapZone = _mapZones.getValue(key);
			if (mapZone == null)
			{
				//新建
				mapZone = new MapZone();
				mapZone.tile_x = $zoneX;
				mapZone.tile_y = $zoneY;
				//缓存起来
				_mapZones.add(key, mapZone);
			}
			return mapZone;
		}
		
		final public function getDrawMapZoneNum():int
		{
			var num:int = 0;
			_mapZones.forEach(function(key : *, mZone : MapZone) : void
			{
				if (mZone && mZone.hasDraw)
				{
					num++;
				}
				key = null;
			});
			return num;
		}

		/**
		 * 运行
		 */
		final public function run() : void
		{
			if (!_scene.mapConfig) //没有地图配置信息的时候，直接返回吧。。。
			{
				_isNeedSortZone = true;
				return;
			}

			queueLoad();

			if (_isQueueDraw)
			{
				queueDraw();
			}
			//如果位置没有变化则直接返回
			if (!strongLoadMap)
			{
				var tmOut:Boolean;//显存超了
				var nowTime:int = GlobalConfig2D.nowTime;
				var isTimeout:Boolean = nowTime - _disposeTimer > 20000;
				var isStop:Boolean = _currCameraPos.x == _camera.posX && _currCameraPos.y == _camera.posY;
				if ( isStop)
				{
					_disposeTmCnt++;
					if (_disposeTmCnt > DISPOSE_TM_GAP) //5S钟内没动,就开干...
					{
						_disposeTmCnt = 0;
						_disposeTimer = nowTime;
						MapCache.getInstance().disposeCacheZone(_camera);
					}
					return;
				}
				else if (isTimeout) //刷地图超过20s，开干
				{
					_disposeTmCnt = 0;
					_disposeTimer = nowTime;
					MapCache.getInstance().disposeCacheZone(_camera);
					return;
				}
			}
			_currCameraPos.x = _camera.posX;
			_currCameraPos.y = _camera.posY;

			_disposeTmCnt = 0;

			//加载地图
			loadMap();
		}

		//加载地图
		//===================================================================================================
		private var _cameraZone : MapZone;
		private var _curtMapZoneMap : Dictionary = new Dictionary();
		private var _cameraTilePoint : Point = new Point();
		private var _cameraZonePoint : Point = new Point();

		/**
		 * @private
		 * 加载地图
		 */
		final private function loadMap() : void
		{
			var tempMapZone : MapZone;

			//拿到摄像机(注意不是摄像机跟随元素)所在的区域图块
			_cameraTilePoint.x = (_camera.posX / SceneConfig.TILE_WIDTH) >> 0;
			_cameraTilePoint.y = (_camera.posY / SceneConfig.TILE_HEIGHT) >> 0;
			//
			_cameraZonePoint.x = (_cameraTilePoint.x / SceneConfig.ZONE_SCALE_WIDTH) >> 0;
			_cameraZonePoint.y = (_cameraTilePoint.y / SceneConfig.ZONE_SCALE_HEIGHT) >> 0;
			//新的MapZone
			var newMapZone : MapZone = getMapZone(_cameraZonePoint.x, _cameraZonePoint.y);
			if (!newMapZone)
			{
				return; //注意这个，可防止快速变换窗口大小摄像机位置来不及变换的BUG
			}
			_cameraZone = newMapZone;
			//当前镜头块图有变化则更新地图
			if (strongLoadMap || _currentMapZone != newMapZone)
			{
				if (strongLoadMap)
				{
					_isNeedSortZone = true;
				}
				//还原标识
				strongLoadMap = false;

				var cameraZoneRangeX : uint = _camera.zoneRangeXY.x;
				var cameraZoneRangeY : uint = _camera.zoneRangeXY.y;
				//得到新区域的可视点数组
				var pointArr : Array = SceneUtil.findViewZonePoints(newMapZone.tile_x, newMapZone.tile_y, cameraZoneRangeX, cameraZoneRangeY);
				var zoneMaxX : int = Math.ceil(_scene.mapConfig.gridH / SceneConfig.ZONE_SCALE_WIDTH); //注意这个是向上取整
				var zoneMaxY : int = Math.ceil(_scene.mapConfig.gridV / SceneConfig.ZONE_SCALE_HEIGHT); //注意这个是向上取整
				var p : Point;
				var key : *;
				var newMapZoneMap : Dictionary = new Dictionary();
				var i : uint = 0;
				var pointNum:uint = pointArr.length;
				for (i = 0; i < pointNum; i++)
				{
					p = pointArr[i];
					//超过边界的直接跳过
					if (p.x < 0 || p.x >= zoneMaxX || p.y < 0 || p.y >= zoneMaxY)
					{
						continue; //注意是有两个是大于等于
					}
					key = MapZone.getKey(p.x, p.y);
					//从缓存里找是否有图块，如果没有加新添加一个，有就移到新数组里
					tempMapZone = getMapZone(p.x, p.y);
					//添加进场景
					tempMapZone.setContainer(this, tempMapZone.piexl_x, tempMapZone.piexl_y);
					
					if (!tempMapZone.isLoaded && !tempMapZone.isLoading) //还没有渲染。。。
					{
						var hasBmpData : Boolean = MapCache.getInstance().hasZoneBmpData(key);
						if (hasBmpData) //已经有了，不需要加载了。
						{
							if (_isQueueDraw)
							{
								_drawZoneList.push(tempMapZone);
							}
							else
							{
								tempMapZone.draw(MapCache.getInstance().getZoneBmpData(key));
							}
						}
						else
						{
							//如果不存在于等待加载的列表中,则新建一个加载
							if (!MapCache.getInstance().isWaitingLoad(key))
							{
								if (_loadMapZoneList.indexOf(tempMapZone) == -1)
									_loadMapZoneList.push(tempMapZone);
							}
						}
					}
					else
					{
						MapCache.getInstance().removeDisposeCacheZone(key); //移除。
					}
					delete _curtMapZoneMap[key]; //存在的就不用了。。。
					//
					newMapZoneMap[key] = tempMapZone;
				}

				if (_isNeedSortZone)
				{
					_loadMapZoneList.sort(sortOnMapZone);
					_isNeedSortZone = false;
				}

				var mZone : MapZone;
				var len : int;
				var removeZone : MapZone;
				//再检查一下看原数组是否还有图块，有就说明要清除
				for (key in _curtMapZoneMap)
				{
					removeZone = _curtMapZoneMap[key];
					//对于横向或纵向距离较大的图块释放掉内存
					if (Math.abs(removeZone.tile_x - newMapZone.tile_x) > cameraZoneRangeX + MAX_ZONE_CACHE_X || Math.abs(removeZone.tile_y - newMapZone.tile_y) > cameraZoneRangeY + MAX_ZONE_CACHE_Y)
					{
						removeZone.clear();
						//
						len = _loadMapZoneList.length;
						while (len-- > 0)
						{
							mZone = _loadMapZoneList[len];
							if (mZone.tile_x == removeZone.tile_x && mZone.tile_y == removeZone.tile_y)
							{
								_loadMapZoneList.splice(len, 1);
								break;
							}
						}
						//
						if (_immedDispose)
							MapCache.getInstance().disposeZone(removeZone);
						else
							MapCache.getInstance().addDisposeCacheZone(key, removeZone);

						if (_isQueueDraw)
						{
							len = _drawZoneList.length;
							while (len-- > 0)
							{
								mZone = _drawZoneList[len];
								if (mZone.tile_x == removeZone.tile_x && mZone.tile_y == removeZone.tile_y)
								{
									_drawZoneList.splice(len, 1);
									break;
								}
							}
						}
					}
					else //否则存入新的纪录
					{
						MapCache.getInstance().removeDisposeCacheZone(key);
					}
				}
				_curtMapZoneMap = newMapZoneMap;
			}
			//最后重新赋值新图块数组和中心图块
			_currentMapZone = newMapZone;
		}

		final private function sortOnMapZone($zoneA : MapZone, $zoneB : MapZone) : int
		{
			if (_cameraZone)
			{
				var priorityA : int = ZMath.getDisSquare($zoneA.piexl_x, $zoneA.piexl_y, _cameraZone.piexl_x, _cameraZone.piexl_y);
				var priorityB : int = ZMath.getDisSquare($zoneB.piexl_x, $zoneB.piexl_y, _cameraZone.piexl_x, _cameraZone.piexl_y);
				if (priorityA > priorityB)
				{
					return -1;
				}
				else if (priorityA < priorityB)
				{
					return 1;
				}
			}
			return 0;
		}

		/**
		 * 显示添加一个新的区域图块
		 * @param $mapZone
		 * @param $$priority 加载优先级
		 */
		final private function addMapZone($mapZone : MapZone, $priority : int) : Boolean
		{
			var key : String = MapZone.getKey($mapZone.tile_x, $mapZone.tile_y);
			//如果该图块内没有图，则需要添加
			var hasData : Boolean = MapCache.getInstance().hasZoneBmpData(key);
			if (!$mapZone.isLoaded && !$mapZone.isLoading && !hasData)
			{
				var filePath : String = _scene.mapConfig.zoneMapUrl.replace("#", key);
				//版本
				if (GlobalConfig2D.version != null)
				{
					filePath = GlobalConfig2D.version(filePath);
				}
				var userData : Object = {};
				userData.zoneKey = key;
				userData.mapZone = $mapZone;
				//注意这里
				$mapZone.load(filePath, $priority, userData, onZoneCompleteHandler);
				return true;
			}
			return false;
		}

		final private function onZoneCompleteHandler(mapZone : MapZone) : void
		{
			var key : * = MapZone.getKey(mapZone.tile_x, mapZone.tile_y);
			if (_isQueueDraw)
			{
				_drawZoneList.push(mapZone);
			}
			else
			{
				mapZone.draw(MapCache.getInstance().getZoneBmpData(key));
			}
		}

		final private function queueLoad() : void
		{
			var cnt : uint = 0;
			var t : uint = getTimer();
			while (_loadMapZoneList.length)
			{
				var mZone : MapZone = _loadMapZoneList.pop();
				if (addMapZone(mZone, 0))
				{
					var key : * = MapZone.getKey(mZone.tile_x, mZone.tile_y);
					MapCache.getInstance().addWaitingLoad(key);
				}
				if (getTimer() - t > 5 || cnt > 5)
				{
					break;
				}
				cnt++;
			}
		}

		final private function queueDraw() : void
		{
			var mapZone : MapZone;
			var tm : uint = getTimer();
			while (_drawZoneList.length)
			{
				mapZone = _drawZoneList.pop();
				var key : * = MapZone.getKey(mapZone.tile_x, mapZone.tile_y);
				var texture:TextureMaterial = MapCache.getInstance().getZoneBmpData(key);
				mapZone.draw(texture);
				if (getTimer() - tm > 5)
				{
					return;
				}
			}
		}
		
		/** 释放 */
		override public function dispose() : void
		{
			_drawZoneList.length = 0;
			_loadMapZoneList.length = 0;
			MapCache.getInstance().clearWaitingLoadDatas();
			MapCache.getInstance().clearDisposeCacheZone();
			MapCache.getInstance().disposeAllZoneBmpData();
			_mapZones.forEach(function(key : *, mZone : MapZone) : void
			{
				if (mZone)
				{
					mZone.clear();
					mZone = null;
				}
				key = null;
			});
			//清空
			_mapZones.clear();
			
			_currCameraPos = new Point(int.MAX_VALUE, int.MAX_VALUE);
			_currentMapZone = null;
			
			_curtMapZoneMap = new Dictionary();
			
			strongLoadMap = false;
		}
	}
}
