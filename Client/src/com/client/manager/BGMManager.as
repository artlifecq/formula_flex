package com.client.manager
{
	import com.app.AudioInterface;
	import com.client.AudioConfigType;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.VersionUtils;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import flash.display.Stage;

	/**
	 * 游戏音乐管理器
	 * @author Seven.C
	 * 创建时间：2016-6-27 下午4:36:13
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-29 下午3:05:12
	 */
	public class BGMManager
	{
		private static var _disabledBgm:Boolean = false;
		private static var _currEnv2D:String = null;
		private static var _currMusic:String = null;
		
		
		public static function setup(stage:Stage):void
		{
			AudioInterface.init(stage);
			AudioInterface.baseDir = ClientConfig.baseDir;
			AudioInterface.getVersionPathFun = VersionUtils.getVersionPath;
			AudioInterface.debug = !ClientConfig.isRelease;
			AudioInterface.allowBackPlay = false;
			AudioInterface.createAudioSound(AudioConfigType.MUSIC_CHANNEL);
			AudioInterface.createAudioSound(AudioConfigType.ENV2D_CHANNEL);
			AudioInterface.createSoundEffect(AudioConfigType.UI_EFFECT_CHANNEL);
			GameLog.addShow("AudioInterface.baseDir \t" + AudioInterface.baseDir);
		}
		
		public static function playEnv2D(fileName:String):void
		{
			if (_disabledBgm)
			{
				return;
			}
			if (_currEnv2D == fileName)
			{
				return;
			}
			_currEnv2D = fileName;
			if (!fileName)
			{
				AudioInterface.stopAudio(AudioConfigType.ENV2D_CHANNEL);
				return;
			}
			var soundUrl:String = ClientConfig.getSound(fileName);
			AudioInterface.playAudio(AudioConfigType.ENV2D_CHANNEL, soundUrl);
		}
		
		public static function playMusic(fileName:String):void
		{
			if (_disabledBgm)
			{
				return;
			}
			if (_currMusic == fileName)
			{
				return;
			}
			_currMusic = fileName;
			if (!fileName)
			{
				AudioInterface.stopAudio(AudioConfigType.MUSIC_CHANNEL);
				return;
			}
			var soundUrl:String = ClientConfig.getSound(fileName);
			AudioInterface.playAudio(AudioConfigType.MUSIC_CHANNEL, soundUrl);
		}
		
		public static function playUIEffectSound(fileName:String):void
		{
			if (_disabledBgm)
			{
				return;
			}
			if (!fileName)
			{
				AudioInterface.stopAudio(AudioConfigType.UI_EFFECT_CHANNEL);
				return;
			}
			var soundUrl:String = ClientConfig.getSound(fileName);
			AudioInterface.playSoundEffect(AudioConfigType.UI_EFFECT_CHANNEL, soundUrl);
		}
	}
}