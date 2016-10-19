package com.game.engine2D.scene.map.vo
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.utils.SceneUtil;

	/**
	 * 场景逻辑格
	 * @author Carver
	 */	
	public class MapTile
	{		
		/**
		 * 是否是障碍（角色）
		 */		
		public var isSolid:Boolean;
		/**
		 * 是否是孤岛（封闭的非障碍区域）
		 */		
		public var isIsland:Boolean;
		
		/**
		 * 是否是遮罩(角色需要做半透显示)
		 */
		public var isMask:Boolean;
		
		
		//坐标相关================================================================================================
		/**
		 * @private
		 * 像素坐标x 
		 */	
		private var _x:Number = 0;
		/*** 像素坐标x*/	
		public function get x():Number{return _x}
		/*** 像素坐标x*/	
		public function set x($value:Number):void
		{
			_x = $value;
			_tile_x = _x / SceneConfig.TILE_WIDTH;
		}
		
		/**
		 * @private
		 * 像素坐标y 
		 */	
		private var _y:Number = 0;
		/*** 像素坐标y*/	
		public function get y():Number{return _y}
		/*** 像素坐标y*/	
		public function set y($value:Number):void{
			_y = $value;
			_tile_y = _y / SceneConfig.TILE_HEIGHT;
		}
		
		/**
		 * @private
		 * 逻辑坐标x 
		 */		
		private var _tile_x:int = 0;
		/*** 逻辑坐标x*/	
		public function get tile_x():int{return _tile_x}
		/*** 逻辑坐标x*/	
		public function set tile_x($value:int):void{
			_tile_x = $value;
			_x = SceneUtil.getTileXPixel($value);//_tile_x * SceneConfig.TILE_WIDTH;
		}
		
		/**
		 * @private
		 * 逻辑坐标y
		 */	
		private var _tile_y:int = 0;
		/*** 逻辑坐标y*/	
		public function get tile_y():int{return _tile_y}
		/*** 逻辑坐标y*/	
		public function set tile_y($value:int):void{
			_tile_y = $value;
			_y = SceneUtil.getTileYPixel($value);;//_tile_y * SceneConfig.TILE_HEIGHT;
		}
		
		
		public function MapTile($tileX:int, $tileY:int, $isSolid:Boolean=false, $isIsland:Boolean=false,$isMask:Boolean=false){
			tile_x = $tileX;
			tile_y = $tileY;
			isSolid = $isSolid;
			isIsland = $isIsland;
			isMask = $isMask;
		}
		
		public function equals(mapTitle:MapTile):Boolean
		{
			if(mapTitle == null)return false;
			if(mapTitle.tile_x == _tile_x && mapTitle.tile_y == _tile_y)
			{
				return true;
			}
			return false;
		}
	}
}