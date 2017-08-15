package com.client
{
	import com.game.engine2D.Engine;
	import com.game.engine3D.config.GlobalConfig;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import away3d.Away3D;
	import away3d.containers.PlanarContainer3D;
	import away3d.debug.AwayStats;
	import away3d.enum.LoadPriorityType;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.utils.SoundUtil;
	
	import feathers.themes.GuiTheme;

	/**
	 *
	 * 引擎控制器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-9 上午10:26:37
	 *
	 */
	public class EngineSetting
	{
		public function EngineSetting()
		{
		}

		public static function init() : void
		{
			GlobalConfig.radiusForEntity = 32;
			GlobalConfig.use2DMap = true;
			ClientConfig.isMapUseAtf = true;
//			GlobalConfig.MAP_2D_CAMERA_ANGLE = 45;
			GlobalConfig.mapCameraAngle = -40;
			PlanarContainer3D.planarRotationX = GlobalConfig.mapCameraAngle;
			
			GlobalConfig.setGlobalConfig(null, VersionUtils.getVersionPath);
			
			Engine.initEngine(60,null,VersionUtils.getVersionPath,50,50,256,256);
			//初始引擎
			initAway3D();

			//初始UI引擎
			initFeathers();
			
//			ReportUtil.setup(6);
		}

		public static function initAway3D() : void
		{
			AwayStats.alertLogPanelOnError = ClientConfig.isDebug;
			Away3D.throwErrorForDeveloper = ClientConfig.isDebug;
			Away3D.LOAD_FILE_WITH_LIB = true;
			GuiTheme.ENABLE_TEXT_BATCH = true;
//			Away3D.USE_ASYNC_TEXTURES = true;
//			Away3D.MIPMAP_WITH_BITMAPDATA = false;
		
			//这里是御龙新的设置，暂时还没有确定好是否适合我们，暂时注释掉
			Away3D.PARSE_JPG_IN_WORKER = !ClientConfig.useAtfFormat && !ClientConfig.useBpgFormat;
			Away3D.PARSE_PNG_IN_WORKER = !ClientConfig.useAtfFormat && !ClientConfig.useBpgFormat;
			Away3D.USE_ATF_FOR_TEXTURES = ClientConfig.useAtfFormat;
			Away3D.ATF_ASYNC_UPLOAD = ClientConfig.useAtfFormat;
			Away3D.ENABLE_SOUND_PAN = true;

			MultiUrlLoadManager.getUrlWithVersion = VersionUtils.getVersionPath;
			
			Away3D.PURE_COLOR_PASS = false;
			Away3D.MIN_HEAP_SIZE = 188743680;
			MultiUrlLoadManager.maxQueueSize = 3;
			
			SoundUtil.volume = 1;
			SoundUtil.SOUND_REDUCTION_ALGORITHM_MIN_VOLUMN = 0.75;
			SoundUtil.SOUND_REDUCTION_ALGORITHM_RECUTION_SCOPE = 1100;
			
			LoadPriorityType.LEVEL_SOUND = 1000;
			LoadPriorityType.LEVEL_NORMALMAP = 2000;
			LoadPriorityType.LEVEL_TEXTURE = 3000;
			LoadPriorityType.LEVEL_BUNDLE = 1500;
			LoadPriorityType.LEVEL_GEOMETRY = 3500;
			LoadPriorityType.LEVEL_CUSTOM_0 = 5000;
			LoadPriorityType.LEVEL_CUSTOM_1 = 4500;
			LoadPriorityType.LEVEL_CUSTOM_2 = 4000;
			LoadPriorityType.LEVEL_CUSTOM_3 = 5000;
			SoundUtil.initConfig({
				"at":{
					"index":1,
					"count":2,
					"offset":1000,
					"name":"攻击类"
				},
				"injure":{
					"index":2,
					"count":2,
					"offset":1000,
					"name":"受击类"
				},
				"die":{
					"index":3,
					"count":2,
					"offset":1000,
					"name":"死亡类"
				},
				"hit":{
					"index":4,
					"count":2,
					"offset":1000,
					"name":"击中类"
				}
			});
		}

		private static function initFeathers() : void
		{
			GuiTheme.RES_ROOT = ClientConfig.baseDir + ClientConfig.resURL;
			GuiTheme.decodeURL = VersionUtils.getVersionPath;
			GuiTheme.useCompressedTexture = false;
			
			GuiTheme.ATFX_ROOT_PATH = "../res/ui/big_bg";
		}
	}
}
