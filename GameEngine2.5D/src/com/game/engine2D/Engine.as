package com.game.engine2D
{
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine2D.config.SceneConfig;

	/**
	 * 引擎
	 * @author Carver
	 */		
	public class Engine
	{
		/**
		 * 初始化引擎全局数据
		 * 
		 * @param $frameRate 游戏帧频 
		 * @param $decode 解密函数 格式：function decode(bytes):ByteArray
		 * @param $version 版本函数函数 格式：function version(url):String
		 * 
		 * @parm $tileWidth 逻辑格宽
		 * @parm $tileHeight 逻辑格高
		 * @parm $zoneWidth 区域图宽
		 * @parm $zoneHeight 区域图高
		 * 注意,必须保证给与符合如下规则的尺寸配置才能正确显示:
		 * $tileWidth*mapConfig.gridH=$zoneWidth*地图横向区域格数
		 * $tileHeight*mapConfig.gridV=$zoneHeight*地图横向区域格数
		 */	
		public static function initEngine(
			$frameRate:int=30, $decode:Function=null,$version:Function=null,
			$tileWidth:int=25, $tileHeight:int=25, $zoneWidth:int=200, $zoneHeight:int=200
		):void{
			GlobalConfig2D.setGlobalConfig($frameRate,$decode,$version);
			SceneConfig.setSceneConfig($tileWidth, $tileHeight, $zoneWidth, $zoneHeight);
		}
		
		public static function initRes($resParseFunc:Function=null,$resUrlFunc:Function=null,$resAngleFunc:Function=null):void
		{
			GlobalConfig2D.resParseFunc = $resParseFunc;
			GlobalConfig2D.resUrlFunc = $resUrlFunc;
			GlobalConfig2D.resAngleFunc = $resAngleFunc;
		}
		
		/**
		 * 
		 * @param avatarResParser
		 * @param mapTileResParser
		 * @author L.L.M.Sunny 2015-5-9
		 */		
		public static function initResParser(avatarResParser:Class=null,mapTileResParser:Class=null):void
		{
			GlobalConfig2D.avatarResParser = avatarResParser;
			GlobalConfig2D.mapTileResParser = mapTileResParser;
		}
	}
}