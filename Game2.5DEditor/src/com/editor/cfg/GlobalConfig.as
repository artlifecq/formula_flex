package com.editor.cfg
{

	/**
	 *
	 * 全局配置
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-17 上午10:30:12
	 *
	 */
	public class GlobalConfig
	{
		public function GlobalConfig()
		{
		}

		public static function get mapPath() : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/map";
		}

		public static function get avatarPath() : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/avatar";
		}

		public static function get effectPath() : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/effect";
		}

		public static function get soundPath() : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/sound";
		}

		public static function get configFileName() : String
		{
			return "config.data";
		}

		public static function getCameraConfigPath(storyID : int) : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/config/camera/" + storyID + ".camera";
		}

		public static function getUIAppStory(name : String) : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/icon/story/" + name + ".png";
		}

		public static function getMapUrl(mapRes : String) : String
		{
			return mapPath + "/" + mapRes + "/" + mapRes + ".awd";
		}

		public static function getMapFilePath(mapRes : String) : String
		{
			return "file://" + getMapUrl(mapRes);
		}

		public static function getMiniMapName(miniRes : String) : String
		{
			return mapPath + "/mini/" + (miniRes ? miniRes : "mini.png");
		}

		public static function getMiniMapFileName(miniRes : String) : String
		{
			return "file://" + getMiniMapName(miniRes);
		}

		public static function getRadarMapName(radarRes : String) : String
		{
			return mapPath + "/mini/" + (radarRes ? radarRes : "radar.png");
		}

		public static function getRadarMapFileName(radarRes : String) : String
		{
			return "file://" + getRadarMapName(radarRes);
		}

		public static function getMapDataFilePath(dataRes : String) : String
		{
			return "file://" + getMapDataPath(dataRes);
		}

		public static function getMapDataPath(dataRes : String) : String
		{
			return mapPath + "/" + dataRes + ".dat";
		}

		public static function getDynTexture(name : String) : String
		{
			return ProjectConfig.getResPath(ProjectConfig.clientResPath) + "/dynTexture/" + name + ".jpg";
		}

		public static function getDynTextureFilePath(name : String) : String
		{
			return "file://" + getDynTexture(name);
		}

		public static function getAvatarFilePath(avatarId : String) : String
		{
			var path : String = avatarPath + "/" + avatarId + ".awd";
			return "file://" + path;
		}

		public static function getAvatarTextureFilePath(textureId : String) : String
		{
			var path : String = avatarPath + "/" + textureId;
			return "file://" + path;
		}

		public static function getEffectFilePath(effectId : String) : String
		{
			var path : String = effectPath + "/" + effectId + ".awd";
			return "file://" + path;
		}

		public static function getSoundFilePath(soundId : String) : String
		{
			var path : String = soundPath + "/" + soundId + ".mp3";
			return "file://" + path;
		}

		public static function getBlockPath(mapName : String) : String
		{
			return mapPath + "/block/" + mapName + ".awd";
		}

		public static function getBlockData(mapName : String) : String
		{
			return mapPath + "/block/" + mapName.substring(0, mapName.lastIndexOf("/")) + mapName.substring(mapName.lastIndexOf("/")) + ".data";
		}
	}
}
