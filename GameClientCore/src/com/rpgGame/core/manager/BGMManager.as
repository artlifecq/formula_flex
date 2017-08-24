package com.rpgGame.core.manager
{
	import com.app.AudioInterface;
	import com.app.events.AudioEvent;
	import com.rpgGame.core.events.GameSettingEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 游戏音乐管理器
	 * @author Seven.C
	 * 创建时间：2016-6-27 下午4:36:13
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-29 下午3:05:12
	 */
	public class BGMManager
	{
		private static var _disabledBgm:Boolean = true;
		private static var _muteDic:Object = {};
		private static var _soundVolume:Number = 100;
		private static var _musicVolume:Number = 100;
		private static var _currEnv2D:String = null;
		private static var _currMusic:String = null;
		
		public function BGMManager()
		{
		}
		
		public static function defaultSetting():void
		{
			BGMManager.soundMute = false;
			BGMManager.musicMute = false;
			BGMManager.soundVolume = 100;
			BGMManager.musicVolume = 100;
		}
		
		public static function applySetting(soundSet:Object):void
		{
			if (soundSet != null)
			{
				BGMManager.soundMute = soundSet.openSound;
				BGMManager.musicMute = soundSet.openMusic;
				BGMManager.soundVolume = soundSet.soundVolume;
				BGMManager.musicVolume = soundSet.musicVolume;
			}
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
			if (musicMute)
			{
				return;
			}
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
			if (_disabledBgm||true)
			{
				return;
			}
			if (_currMusic == fileName)
			{
				return;
			}
			_currMusic = fileName;
			if (musicMute)
			{
				return;
			}
			if (!fileName)
			{
				AudioInterface.stopAudio(AudioConfigType.MUSIC_CHANNEL);
				return;
			}
			var soundUrl:String = ClientConfig.getSound(fileName);
			AudioInterface.playAudio(AudioConfigType.MUSIC_CHANNEL, soundUrl);
		}
		
//		public static function playMusic(fileName : String) : void
//		{
//			if (!fileName||!_isPlay)
//			{
//				AudioInterface.track(AudioConfigType.MUSIC_CHANNEL).stop(true);
//				return;
//			}
//			var url : String = ClientConfig.getSound(fileName);
//			var info : AudioInfo = new AudioInfo(url);
//			info.fadeInTime = 500;
//			info.fadeOutTime = 500;
//			info.loop = 0;
//			AudioInterface.track(AudioConfigType.MUSIC_CHANNEL).playAudio(info);
//		}
		
		public static function playUIEffectSound(fileName:String):void
		{
			if (_disabledBgm)
			{
				return;
			}
			if (soundMute)
			{
				return;
			}
			if (!fileName)
			{
				AudioInterface.stopAudio(AudioConfigType.MUSIC_CHANNEL);
				return;
			}
			var soundUrl:String = ClientConfig.getSound(fileName);
			AudioInterface.playSoundEffect(AudioConfigType.UI_EFFECT_CHANNEL, soundUrl);
		}
		
//		public static function playUIEffectSound(fileName : String) : void
//		{
//			if(!_isPlay) return;
//			var url : String = ClientConfig.getSound(fileName);
//			var info : AudioInfo = new AudioInfo(url);
//			info.fadeInTime = 0;
//			info.fadeOutTime = 0;
//			info.loop = 1;
//			AudioInterface.track(AudioConfigType.UI_EFFECT_CHANNEL).playAudio(info);
//		}
		
		public static function set isMuteAll(isMute:Boolean):void
		{
			musicMute = isMute;
			soundMute = isMute;
			EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ALL);
		}
		
		public static function get isMuteAll():Boolean
		{
			return musicMute && soundMute;
		}
		
		public static function get musicMute():Boolean
		{
			return _muteDic[AudioConfigType.MUSIC_CHANNEL];
		}
		
		public static function set musicMute(value:Boolean):void
		{
			AudioInterface.setAudioMute(AudioConfigType.MUSIC_CHANNEL, value);
			_muteDic[AudioConfigType.MUSIC_CHANNEL] = value;
			if (value)
			{
				AudioInterface.stopAudio(AudioConfigType.MUSIC_CHANNEL);
				AudioInterface.stopAudio(AudioConfigType.ENV2D_CHANNEL);
			}
			else
			{
				playMusic(_currMusic);
				playEnv2D(_currEnv2D);
			}
			EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ONE);
		}
		
		public static function get soundMute():Boolean
		{
			return _muteDic[AudioConfigType.UI_EFFECT_CHANNEL];
		}
		
		public static function set soundMute(value:Boolean):void
		{
			AudioInterface.setAudioMute(AudioConfigType.UI_EFFECT_CHANNEL, value);
			_muteDic[AudioConfigType.UI_EFFECT_CHANNEL] = value;
			EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ONE);
		}
		
		public static function get musicVolume():uint
		{
			return _musicVolume;
		}
		
		public static function set musicVolume(value:uint):void
		{
			_musicVolume = value;
			AudioInterface.setAudioVolume(AudioConfigType.MUSIC_CHANNEL, (value / 100));
		}
		
		public static function get soundVolume():uint
		{
			return _soundVolume;
		}
		
		public static function set soundVolume(value:uint):void
		{
			_soundVolume = value;
			AudioInterface.setAudioVolume(AudioConfigType.UI_EFFECT_CHANNEL, (value / 100));
		}
		
		//开始播放一个节点
		private static function onSubStartPlayHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "play");
		}
		
		//重复播放一个节点时
		private static function onSubRepeatHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "repeat");
		}
		
		//节点播放完成
		private static function onSubCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "complete");
		}
		
		//指定节点播放完成后发送的事件消息
		private static function onSendMsgHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "get msg");
		}
		
		//整首音乐准备重复播放
		private static function onSoundLoopCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "will repeat");
		}
		
		//整首音乐播放完成
		private static function onAllCompleteHandler(evt : AudioEvent) : void
		{
			//trace(evt.data, "play end");
		}
	}
}
