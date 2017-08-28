package com.rpgGame.core.manager
{
    import com.app.AudioInterface;
    import com.app.infos.AudioInfo;
    import com.rpgGame.core.events.GameSettingEvent;
    import com.rpgGame.coreData.cfg.ClientConfig;
    
    import away3d.utils.SoundUtil;
    
    import org.client.mainCore.manager.EventManager;

    public class BGMManager 
    {
        private static var _soundSet:Object;
        private static var _currEnv2D:String = null;
        private static var _currMusic:String = null;

        public static function initProtoC(soundSet:Object):void
        {
			_soundSet = soundSet || new Object();
            applySetting();
        }

        private static function applySetting():void
        {
            soundMute = !_soundSet.openSound;
            musicMute = !_soundSet.openMusic;
            soundVolume = _soundSet.soundVolume;
            musicVolume = _soundSet.musicVolume;
        }
		
		public static function defaultSetting():void
		{
			BGMManager.soundMute = false;
			BGMManager.musicMute = false;
			BGMManager.soundVolume = 100;
			BGMManager.musicVolume = 100;
		}

        public static function playEnv2D(fileName:String, isReset:Boolean=false):void
        {
            if (!isReset && _currEnv2D == fileName)
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
			var info : AudioInfo = new AudioInfo(soundUrl);
			info.fadeInTime = 500;
			info.fadeOutTime = 500;
			info.loops = 0;
			AudioInterface.setAudioInfo(AudioConfigType.ENV2D_CHANNEL,info);
            AudioInterface.playAudio(AudioConfigType.ENV2D_CHANNEL, soundUrl);
        }

        public static function playMusic(fileName:String, isReset:Boolean=false):void
        {
            if (!isReset && _currMusic == fileName)
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
			var info : AudioInfo = new AudioInfo(soundUrl);
			info.fadeInTime = 500;
			info.fadeOutTime = 500;
			info.loops = 1;
			AudioInterface.setAudioInfo(AudioConfigType.MUSIC_CHANNEL,info);
            AudioInterface.playAudio(AudioConfigType.MUSIC_CHANNEL, soundUrl);
        }

        public static function playUIEffectSound(fileName:String):void
        {
            if (!fileName)
            {
                AudioInterface.stopAudio(AudioConfigType.MUSIC_CHANNEL);
                return;
            }
            var soundUrl:String = ClientConfig.getSound(fileName);
			var info : AudioInfo = new AudioInfo(soundUrl);
			info.fadeInTime = 0;
			info.fadeOutTime = 0;
			info.loops = 1;
			AudioInterface.setAudioInfo(AudioConfigType.UI_EFFECT_CHANNEL,info);
            AudioInterface.playSoundEffect(AudioConfigType.UI_EFFECT_CHANNEL, soundUrl);
        }

        public static function get isMuteAll():Boolean
        {
            return musicMute && soundMute;
        }

        public static function get musicMute():Boolean
        {
            return !_soundSet.openMusic;
        }

        public static function set musicMute(value:Boolean):void
        {
            if (_soundSet.openMusic != !value)
            {
				_soundSet.openMusic = !value;
//                ClientSettingGameSetMananger.saveMainToServer();
            }
            if (musicMute)
            {
                AudioInterface.setAudioVolume(AudioConfigType.MUSIC_CHANNEL, 0);
            }
            else
            {
                AudioInterface.setAudioVolume(AudioConfigType.MUSIC_CHANNEL, (musicVolume / 100));
            }
            EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ONE);
        }

        public static function get soundMute():Boolean
        {
            return !_soundSet.openSound;
        }

        public static function set soundMute(value:Boolean):void
        {
            var mute:Number;
            if (_soundSet.openSound != !value)
            {
				_soundSet.openSound = !value;
//                ClientSettingGameSetMananger.saveMainToServer();
            }
            if (!soundMute)
            {
				mute = (soundVolume / 100);
            }
            else
            {
				mute = 0;
            }
            SoundUtil.volume = mute;
            AudioInterface.setAudioVolume(AudioConfigType.UI_EFFECT_CHANNEL, mute);
            AudioInterface.setAudioVolume(AudioConfigType.ENV2D_CHANNEL, mute);
            EventManager.dispatchEvent(GameSettingEvent.SOUND_MUTE_ONE);
        }

        public static function get musicVolume():uint
        {
            return _soundSet.musicVolume;
        }

        public static function set musicVolume(value:uint):void
        {
            if (_soundSet.musicVolume != value)
            {
				_soundSet.musicVolume = value;
//                ClientSettingGameSetMananger.saveMainToServer();
            }
            if (!musicMute)
            {
                AudioInterface.setAudioVolume(AudioConfigType.MUSIC_CHANNEL, (musicVolume / 100));
            }
        }

        public static function get soundVolume():uint
        {
            return _soundSet.soundVolume;
        }

        public static function set soundVolume(value:uint):void
        {
            var volume:Number;
            if (_soundSet.soundVolume != value)
            {
				_soundSet.soundVolume = value;
//                ClientSettingGameSetMananger.saveMainToServer();
            }
            if (!soundMute)
            {
				volume = soundVolume / 100;
                SoundUtil.volume = volume;
                AudioInterface.setAudioVolume(AudioConfigType.UI_EFFECT_CHANNEL, volume);
                AudioInterface.setAudioVolume(AudioConfigType.ENV2D_CHANNEL, volume);
            }
        }
    }
}