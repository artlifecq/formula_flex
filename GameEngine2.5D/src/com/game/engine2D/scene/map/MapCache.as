package com.game.engine2D.scene.map
{
	import com.game.engine2D.core.AsyncByteTexture;
	import com.game.engine2D.scene.SceneCamera;
	import com.game.engine2D.scene.map.vo.MapZone;
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.engine2D.utils.SceneUtil;
	import com.game.engine2D.utils.Transformer;
	
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import away3d.materials.TextureMaterial;
	import away3d.materials.WriteDepthOption;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *
	 * 地图缓存
	 * @author guoqing.wen
	 * 修改时间：2017-2-17 上午10:40:35
	 *
	 */
	final public class MapCache
	{
		private static var _instance : MapCache;
		public static function getInstance() : MapCache
		{
			if (!_instance)
			{
				_instance = new MapCache();
			}
			return _instance;
		}
		
		private var _zoneBmpWriteDepth:Boolean;
		private var _zoneBmpDataMap : HashMap;
		private var _disposeMapZone : Dictionary;
		/**
		 * @private
		 * 等待加载的地图数据数组
		 * 数据类型：LoadData
		 *
		 */
		private var _waitingLoadDatas : Dictionary;
		
		public function MapCache()
		{
			_zoneBmpDataMap = new HashMap();
			_disposeMapZone = new Dictionary();
			_waitingLoadDatas = new Dictionary();
		}
		
		/**
		 * 停止所有正在加载的加载
		 *
		 */
		final public function clearWaitingLoadDatas() : void
		{
			_waitingLoadDatas = new Dictionary();
		}
		
		final public function isWaitingLoad(key : *) : Boolean
		{
			return _waitingLoadDatas[key];
		}
		
		final public function addWaitingLoad(key : *) : void
		{
			_waitingLoadDatas[key] = true;
		}
		
		/**
		 * 从等待数组中删除
		 * @param key
		 *
		 */
		final public function removeWaitingLoad(key : *) : void
		{
			_waitingLoadDatas[key] = null;
			delete _waitingLoadDatas[key];
		}
		
		/** 修改地图切片是否需要写入深度 */
		final public function updateZoneWriteDepth(value:Boolean) : void
		{
			_zoneBmpWriteDepth = value;
			_zoneBmpDataMap.eachValue(function(textureMaterial : TextureMaterial) : void
			{
				textureMaterial.writeDepth = value ? WriteDepthOption.TRUE : WriteDepthOption.FALSE;
			});
		}
		
		final public function addZoneBmpData(key : *, texture:AsyncByteTexture) : void
		{
			disposeZoneBmpData(key);
			var textureMaterial:TextureMaterial = MaterialUtils.getMaterialMapZoneByTexture(texture);
			textureMaterial.writeDepth = _zoneBmpWriteDepth ? WriteDepthOption.TRUE : WriteDepthOption.FALSE;
			_zoneBmpDataMap.add(key, textureMaterial);
		}
		
		final public function disposeCacheZone(sceneCamera : SceneCamera) : void
		{
			//拿到摄像机(注意不是摄像机跟随元素)所在的区域图块
			var tilePoint : Point = Transformer.transPixelPoint2TilePoint(new Point(sceneCamera.posX, sceneCamera.posY));
			var zonePoint : Point = Transformer.transTilePoint2ZonePoint(tilePoint);
			//得到新区域的可视点数组
			var pointArr : Array = SceneUtil.findViewZonePoints(zonePoint.x, zonePoint.y, sceneCamera.zoneRangeXY.x, sceneCamera.zoneRangeXY.y);
			//
			var zoneCnt:int = 0;
			for each (var tempMapZone : MapZone in _disposeMapZone)
			{
				var pLen : uint = pointArr.length;
				var has : Boolean = false;
				for (var i : uint = 0; i < pLen; i++)
				{
					var pos : Point = pointArr[i];
					if (tempMapZone.tile_x == pos.x && tempMapZone.tile_y == pos.y)
					{
						has = true;
						break;
					}
				}
				if (!has)
				{
					zoneCnt++;
					disposeZone(tempMapZone);
				}
			}
			_disposeMapZone = new Dictionary();
			if (zoneCnt)
			{
				trace("释放地图格子：zoneCnt=",zoneCnt);
			}
		}
		
		final public function clearDisposeCacheZone() : void
		{
			_disposeMapZone = new Dictionary();
		}
		
		final public function addDisposeCacheZone(key : *, mapZone : MapZone) : void
		{
			_disposeMapZone[key] = mapZone;
			removeWaitingLoad(key);
		}
		
		final public function removeDisposeCacheZone(key : *) : void
		{
			_disposeMapZone[key] = null;
			delete _disposeMapZone[key];
		}
		
		final public function disposeAllZoneBmpData() : void
		{
			_zoneBmpDataMap.forEach(function(key : *, textureMaterial : TextureMaterial) : void
			{
				var texture : AsyncByteTexture = (textureMaterial.texture as AsyncByteTexture); 
				if (texture){
					texture.dispose();
					textureMaterial.dispose();
				}
			});
			_zoneBmpDataMap.clear();
		}
		
		final public function disposeZone(mZone : MapZone) : void
		{
			var key : * = MapZone.getKey(mZone.tile_x, mZone.tile_y);
			disposeZoneBmpData(key);
			removeWaitingLoad(key);
			mZone.clear();
		}
		
		final private function disposeZoneBmpData(key : String) : void
		{
			var tm : TextureMaterial = _zoneBmpDataMap.getValue(key);
			if (tm == null)return;
			var texture : AsyncByteTexture = (tm.texture as AsyncByteTexture); 
			
			if (texture)
			{
				texture.dispose();
				tm.dispose();
			}
			_zoneBmpDataMap.remove(key);
		}
		
		final public function getZoneBmpData(key : *) : TextureMaterial
		{
			var bmpData : TextureMaterial = _zoneBmpDataMap.getValue(key);
			return bmpData;
		}
		
		final public function hasZoneBmpData(key : *) : Boolean
		{
			var hasBmpData : Boolean = _zoneBmpDataMap.containsKey(key);
			return hasBmpData;
		}
	}
}
