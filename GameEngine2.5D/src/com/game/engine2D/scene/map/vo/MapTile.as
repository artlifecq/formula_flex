package com.game.engine2D.scene.map.vo
{
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
		
		/**
		 * 像素坐标x 
		 */	
		public var x:int = 0;
		/**
		 * 像素坐标y 
		 */	
		public var y:int = 0;
		
		/*** 逻辑坐标x*/	
		public var tile_x:int;
		/*** 逻辑坐标y*/	
		public var tile_y:int;
		
		public function MapTile($tileX:int, $tileY:int, $isSolid:Boolean=false, $isIsland:Boolean=false,$isMask:Boolean=false){
			this.tile_x = $tileX;
			this.x = SceneUtil.getTileXPixel($tileX);
			this.tile_y = $tileY;
			this.y = SceneUtil.getTileYPixel($tileY);
			this.isSolid = $isSolid;
			this.isIsland = $isIsland;
			this.isMask = $isMask;
		}
		
		static public function equals(tile1:MapTile,tile2:MapTile):Boolean
		{
			if(tile1 == null)return false;
			if(tile1.tile_x == tile2.tile_x && tile1.tile_y == tile2.tile_y)
			{
				return true;
			}
			return false;
		}
	}
}