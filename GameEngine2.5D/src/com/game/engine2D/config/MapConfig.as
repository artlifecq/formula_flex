package com.game.engine2D.config
{
	import com.game.engine2D.core.AsyncMapTexture;
	import com.game.engine2D.scene.map.vo.MapTile;
	
	import flash.display.BitmapData;

	/**
	 * 场景地图配置
	 * @author Carver
	 */		
	public class MapConfig
	{
		/**
		 * 地图ID
		 */		
		public var mapID:int;

		/**
		 * 地图横向格子总数 
		 */		
		public var gridH:int;//(宽)
		
		/**
		 * 地图纵向格子总数 
		 */		
		public var gridV:int;//(高)

		/**
		 * 地图宽
		 */		
		public var width:int;
		
		/**
		 * 地图高
		 */		
		public var height:int;

		/**
		 * 缩略图宽
		 */		
		public var smallWidth:int;
		
		/**
		 * 缩略图高
		 */		
		public var smallHeight:int;
		
		/**
		 * 缩略大图宽
		 */		
		public var smallTextureWidth:int;
		
		/**
		 * 缩略大图高
		 */		
		public var smallTextureHeight:int;
		
		
		/**
		 * 场景区域块图地址
		 * 井号(#)作为占位符
		 */		
		public var zoneMapUrl:String;
		
		/**
		 * 场景小地图文件地址
		 */		
		public var smallMapUrl:String;

		/**障碍数据是否被改变过*/
		public var mapSolidChanged:Boolean;
		/**
		 * 场景小地图BD
		 */		
		public var smallMapDB:BitmapData;
		/**
		 * 场景小地图Texture
		 */		
		public var smallMapTexture:AsyncMapTexture;
		
		/**
		 * 地图逻辑格数据
		 * 类型:com.zcp.engine.vo.map.MapTile
		 */
		public var mapTiles:Vector.<Vector.<MapTile>>;
		
		/**
		 * 地图逻辑格障碍数据（专门用来存放障碍点信息，比用mapTiles更加快速）
		 * 类型:1 or 0
		 */
		public var mapSolids:Vector.<Vector.<uint>>;

		public function MapConfig(){}
		
		public function dispose():void
		{
			mapSolidChanged = false;
			zoneMapUrl = null;
			smallMapUrl = null;
			if(mapTiles)
			{
				mapTiles.length = 0;
			}
			mapTiles = null;
			if(mapSolids)
			{
				mapSolids.length = 0;
			}
			mapSolids = null;
			if(smallMapTexture)
			{
				smallMapTexture.dispose();
			}
			smallMapTexture = null;
		}
	}
}