package com.game.engine2D.utils
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.config.staticdata.CharAngleType;
	import com.game.mainCore.libCore.utils.ZMath;
	
	import flash.geom.Point;

	/**
	 * 转换器
	 * @author Carver
	 */	
	public class Transformer
	{
		//坐标相关
		//====================================================================================================
		/**
		 * 将“逻辑点坐标”转换为“区域块图坐标” 
		 * @param $tilePoint
		 * @param $SceneConfig
		 * @return 
		 * 
		 */
		public static function transTilePoint2ZonePoint($tilePoint:Point):Point {
			return new Point(int($tilePoint.x/SceneConfig.ZONE_SCALE_WIDTH), int($tilePoint.y/SceneConfig.ZONE_SCALE_HEIGHT));
		}
		
		
		
		/**
		 * 将“逻辑点坐标”转换为“像素坐标” 
		 * @param $tilePoint
		 * @param $SceneConfig
		 * @return 
		 * 
		 */
		public static function transTilePoint2PixelPoint($tilePoint:Point):Point {
			return new Point($tilePoint.x * SceneConfig.TILE_WIDTH, $tilePoint.y * SceneConfig.TILE_HEIGHT);
		}
		/**
		 * 将“像素坐标”转换为“逻辑点坐标” 
		 * @param $tilePoint
		 * @param $SceneConfig
		 * @return 
		 * 
		 */
		public static function transPixelPoint2TilePoint($pixelPoint:Point):Point {
			return new Point(int($pixelPoint.x / SceneConfig.TILE_WIDTH), int($pixelPoint.y / SceneConfig.TILE_HEIGHT));
		}
		
		
		
		/**
		 * 将“区域逻辑点坐标”转换为“像素坐标” 
		 * @param $zoneTilePoint
		 * @param $SceneConfig
		 * @return 
		 * 
		 */
		public static function transZoneTilePoint2ZonePixelPoint($zoneTilePoint:Point):Point {
			return new Point($zoneTilePoint.x * SceneConfig.ZONE_WIDTH, $zoneTilePoint.y * SceneConfig.ZONE_HEIGHT);
		}
		//====================================================================================================
		
		//角度相关
		//====================================================================================================
		/**
		 * 将“角度”转换为“逻辑角度” 
		 * @param $angle
		 * @return 
		 * 
		 */
		public static function transAngle2LogicAngle($angle:Number, $average:int=8):int {
			var angle:Number = ZMath.getNearAngel($angle-90, $average);
			return CharAngleType["ANGEL_"+angle];
		}
		/**
		 * 将“逻辑角度”转换为“角度” 
		 * @param $angle
		 * @return 
		 * 
		 */
		public static function transLogicAngle2Angle($logicAngle:int, $average:int=8):Number {
			var an:Number = 360/$average;//每份角度
			return $logicAngle*an%360+90;
		}
		
		/**
		 * 将“逻辑角度”转换为“角度”，这个版本只支持八方向
		 * @param $logicAngle 逻辑角度
		 * @return 返回角度（360°为一周）
		 * @author 康露 2014年11月25日
		 */
		public static function transLogicAngle2Angle8($logicAngle:int) : Number
		{
			switch ($logicAngle)
			{
				case 0:
					return 90;
				case 1:
					return 135;
				case 2:
					return 180;
				case 3:
					return 225;
				case 4:
					return 270;
				case 5:
					return 315;
				case 6:
					return 0;
				case 7:
					return 45;
			}
			return 0;
		}
		//====================================================================================================
	}
}