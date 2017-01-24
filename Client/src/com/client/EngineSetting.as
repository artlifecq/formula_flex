package com.client
{
	import com.game.engine2D.Engine;
	import com.game.engine3D.config.GlobalConfig;
	import com.gameClient.utils.VersionUtils;
	
	import away3d.Away3D;
	import away3d.loaders.multi.MultiUrlLoadManager;
	import away3d.textures.TextureFormatEnum;
	
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
			GlobalConfig.use25DMap = true;
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
			Away3D.LOAD_FILE_WITH_LIB = true;
//			Away3D.USE_ASYNC_TEXTURES = true;
//			Away3D.MIPMAP_WITH_BITMAPDATA = false;
			Away3D.PARSE_JPG_IN_WORKER = true;
			Away3D.PARSE_PNG_IN_WORKER = true;
//			Away3D.PARSE_TERRAIN_WITH_WORKER = true;
			Away3D.EVIL3D_VERSION = Math.random() * int.MAX_VALUE;
			MultiUrlLoadManager.getUrlWithVersion = VersionUtils.getVersionPath;
			Away3D.USE_TEXTURES_BPG_FORMAT = ClientGlobal.useBpgFormat;
			if (ClientGlobal.uiCompressed)
			{
				GuiTheme.defaultTextureFormat = TextureFormatEnum.BPG;
			}
			Away3D.PLANAR_STENCIL_AVAILABLE = true;
//			Away3D.USE_ATF_FOR_TEXTURES = true;
		}

		private static function initFeathers() : void
		{
			GuiTheme.RES_ROOT = ClientGlobal.baseDir + ClientGlobal.resURL;
			GuiTheme.decodeURL = VersionUtils.getVersionPath;
			GuiTheme.useWorkerLoadTextureBytes = true;
			GuiTheme.useCompressedTexture = false; //ClientGlobal.uiCompressed;
		}
	}
}
