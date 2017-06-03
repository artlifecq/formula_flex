package com.client
{
	import com.game.engine2D.Engine;
	import com.game.engine3D.config.GlobalConfig;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import away3d.Away3D;
	import away3d.debug.AwayStats;
	import away3d.enum.LoadPriorityType;
	import away3d.loaders.multi.MultiUrlLoadManager;
	
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
//			GlobalConfig.MAP_2D_CAMERA_ANGLE = 45;
			GlobalConfig.mapCameraAngle = -40;
			
			GlobalConfig.setGlobalConfig(null, VersionUtils.getVersionPath);
			
			Engine.initEngine(60,null,VersionUtils.getVersionPath,50,50,256,256);
			//初始引擎
			initAway3D();

			//初始UI引擎
			initFeathers();
		}

		private static function initAway3D() : void
		{
			AwayStats.alertLogPanelOnError = ClientConfig.isDebug;
			Away3D.LOAD_FILE_WITH_LIB = true;
//			Away3D.USE_ASYNC_TEXTURES = true;
//			Away3D.MIPMAP_WITH_BITMAPDATA = false;
		
			//这里是御龙新的设置，暂时还没有确定好是否适合我们，暂时注释掉
//			Away3D.PARSE_JPG_IN_WORKER = !ClientConfig.useAtfFormat && !ClientConfig.useBpgFormat;
//			Away3D.PARSE_PNG_IN_WORKER = !ClientConfig.useAtfFormat && !ClientConfig.useBpgFormat;
//			Away3D.USE_ATF_FOR_TEXTURES = ClientConfig.useAtfFormat;
//			Away3D.ATF_ASYNC_UPLOAD = ClientConfig.useAtfFormat;
			Away3D.ENABLE_SOUND_PAN = true;
			
			Away3D.PARSE_JPG_IN_WORKER = true;
			Away3D.PARSE_PNG_IN_WORKER = true;

			MultiUrlLoadManager.getUrlWithVersion = VersionUtils.getVersionPath;
			Away3D.USE_TEXTURES_BPG_FORMAT = ClientGlobal.useBpgFormat;
			if (ClientGlobal.uiCompressed)
			{
//				GuiTheme.defaultTextureFormat = TextureFormatEnum.BPG;
			}
			Away3D.PLANAR_STENCIL_AVAILABLE = true;
			
			Away3D.PURE_COLOR_PASS = false;
			Away3D.MIN_HEAP_SIZE = 188743680;
			MultiUrlLoadManager.maxQueueSize = 5;
			
			LoadPriorityType.LEVEL_SOUND = 1000;
			LoadPriorityType.LEVEL_NORMALMAP = 2000;
			LoadPriorityType.LEVEL_TEXTURE = 3000;
			LoadPriorityType.LEVEL_BUNDLE = 1500;
			LoadPriorityType.LEVEL_GEOMETRY = 3500;
			LoadPriorityType.LEVEL_CUSTOM_0 = 5000;
			LoadPriorityType.LEVEL_CUSTOM_1 = 4500;
			LoadPriorityType.LEVEL_CUSTOM_2 = 4000;
		}

		private static function initFeathers() : void
		{
			GuiTheme.RES_ROOT = ClientGlobal.baseDir + ClientGlobal.resURL;
			GuiTheme.decodeURL = VersionUtils.getVersionPath;
//			GuiTheme.useWorkerLoadTextureBytes = true;
			GuiTheme.useCompressedTexture = false; //ClientGlobal.uiCompressed;
			GuiTheme.ENABLE_TEXT_BATCH = true;
			GuiTheme.ATFX_ROOT_PATH = "../res/ui/big_bg";
		}
	}
}
