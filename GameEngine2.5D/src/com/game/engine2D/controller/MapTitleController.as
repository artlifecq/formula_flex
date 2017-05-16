package com.game.engine2D.controller
{
	import com.game.engine2D.config.MapResInfo;
	import com.game.engine2D.scene.map.vo.MapTile;

	/**
	 *
	 * 请为我写上注释，以告诉其他小伙伴我是用来做什么的
	 * @author fly.liuyang
	 * 创建时间：2017-3-16 下午10:30:10
	 * 
	 */
	public class MapTitleController
	{
		private static var _mapResInfo:MapResInfo;
		private static var _cacheMapTitleObj:Object = {};
		private static var _userArr:Array = [];
		private static var _poolArr:Array = [];
		
		public static function getMapTile(tileX:int, tileY:int):MapTile
		{
			if(_mapResInfo == null)return null;
			if(tileX < 0 || tileY < 0)return null;
			
			if(tileX > _mapResInfo.numBlocksX || tileY > _mapResInfo.numBlocksY)return null;
			
			var key:int = tileX * 100000000 + tileY;
			var mapTile:MapTile = _cacheMapTitleObj[key];
			if(mapTile == null)
			{
				mapTile = getMapTitle();
				var isSolid:Boolean = _mapResInfo.isSolid(tileX,tileY);
				var isIsland:Boolean = _mapResInfo.isIsland(tileX,tileY);
				var isMask:Boolean = _mapResInfo.isMask(tileX,tileY);
				mapTile.setData(tileX,tileY,isSolid,isIsland,isMask);
				_cacheMapTitleObj[key] = mapTile;
				_userArr.push(mapTile);
			}
			return mapTile;
		}
		
		private static function getMapTitle():MapTile
		{
			if(_poolArr.length)
			{
				return _poolArr.pop();	
			}
			return new MapTile();
		}
		
		public static function changeMap(mapresInfp:MapResInfo):void
		{
			reset();
			_mapResInfo = mapresInfp;
		}
		
		private static function reset():void
		{
			for each (var mapTile:MapTile in _userArr) 
			{
				mapTile.clear();
				addToPool(mapTile);
			}
			_userArr.length = 0;
			_cacheMapTitleObj = {};
		}
		
		private static function addToPool(mapTile:MapTile):void
		{
			if(mapTile.isInit)
			{
				trace(1111);
			}
			_poolArr.push(mapTile);
		}
	}
}