package com.game.engine2D.config
{
	/**
	 * 引擎场景配置
	 * @author Carver
	 */		
	public class SceneConfig
	{		
		/**
		 * 逻辑格宽 
		 */		
		public static var TILE_WIDTH:Number = 50;
		
		/**
		 * 逻辑格高 
		 */		
		public static var TILE_HEIGHT:Number = 50;
		
		/**
		 * 区域图宽 
		 */		
		public static var ZONE_WIDTH:Number = 200;
		
		/**
		 * 区域图高 
		 */		
		public static var ZONE_HEIGHT:Number = 200;
		
		/**
		 * 区域图和逻辑格比例 
		 */		
		public static var ZONE_SCALE_WIDTH:Number = ZONE_WIDTH/TILE_WIDTH;
		public static var ZONE_SCALE_HEIGHT:Number = ZONE_HEIGHT/TILE_HEIGHT;
		/**
		 * 设置场景尺寸配置
		 * @parm $tileWidth 逻辑格宽
		 * @parm $tileHeight 逻辑格高
		 * @parm $zoneWidth 区域图宽
		 * @parm $zoneHeight 区域图高
		 */
		public static function setSceneConfig($tileWidth:int, $tileHeight:int, $zoneWidth:int, $zoneHeight:int):void{
			TILE_WIDTH = $tileWidth;
			TILE_HEIGHT = $tileHeight;
			ZONE_WIDTH = $zoneWidth;
			ZONE_HEIGHT = $zoneHeight;
			//重新计算比例
			ZONE_SCALE_WIDTH = ZONE_WIDTH/TILE_WIDTH;
			ZONE_SCALE_HEIGHT = ZONE_HEIGHT/TILE_HEIGHT;
		}
		
		
		
		/**
		 * 场景可视区域宽 
		 */		
		public var width:Number = 1000;
		
		/**
		 * 场景可视区域高 
		 */		
		public var height:Number = 580;
		
		
		public function SceneConfig($width:Number, $height:Number){
			width = $width;
			height = $height;
		}
		/**
		 * 设置场景可是区域尺寸
		 * @parm $viewHeight 场景可视区域宽
		 * @parm $viewWidth 场景可视区域高
		 */
		public function setViewSize($viewWidth:int, $viewHeight:int):void{
			width = $viewWidth;
			height = $viewHeight;
		}
	}
}