package com.game.mainCore.libCore.sound
{
    import com.game.mainCore.libCore.cache.Cache;
    import __AS3__.vec.Vector;
    import org.client.mainCore.utils.ClassConstruct;
    import com.game.mainCore.libCore.utils.LoadBlackListUtils;
    import flash.net.URLRequest;
    import flash.media.SoundTransform;
    import flash.events.Event;

    public class SoundThread 
    {

        private static var _soundCache:Cache = new com.game.mainCore.libCore.cache.Cache("SoundThread.soundCache", 32);

        private var _soundList:Vector.<SoundData>;
        private var _mute:Boolean = false;
        private var _pause:Boolean = false;
        private var _volume:Number = 1;

        public function SoundThread()
        {
            _soundList = new Vector.<SoundData>();
            super();
        }

        public static function setSoundCacheSize($size:int):void
        {
            _soundCache.resize($size);
        }


        public function getSoundsNum():int
        {
            return (_soundList.length);
        }

        public function getVolume():Number
        {
            return (_volume);
        }

        public function setVolume($value:Number):void
        {
            var sd = null;
            if ($value < 0)
            {
                $value = 0;
            };
            if ($value > 1)
            {
                $value = 1;
            };
            if (!((_volume == $value)))
            {
                _volume = $value;
                for each (sd in _soundList)
                {
                    sd.setVolume(_volume);
                };
            };
        }

        public function getMute():Boolean
        {
            return (_mute);
        }

        public function setMute($value:Boolean):void
        {
            var sd = null;
            if (!((_mute == $value)))
            {
                _mute = $value;
                for each (sd in _soundList)
                {
                    sd.setMute(_mute);
                };
            };
        }

        public function getPause():Boolean
        {
            return (_pause);
        }

        public function setPause($value:Boolean):void
        {
            var sd = null;
            if (!((_pause == $value)))
            {
                _pause = $value;
                for each (sd in _soundList)
                {
                    sd.setPause(_pause);
                };
            };
        }

        public function hasSound($soundData:SoundData):Boolean
        {
            return (!((_soundList.indexOf($soundData) == -1)));
        }

        public function removeSound($soundData:SoundData):void
        {
            var sd = null;
            var index:int;
            for each (sd in _soundList)
            {
                if ((sd == $soundData))
                {
                    sd.removeEventListener("SoundData.LOOP_COMPLETE", soundLoopCompleteHandler);
                    sd.stopAndDispose();
                    index = _soundList.indexOf(sd);
                    if (!((index == -1)))
                    {
                        _soundList.splice(index, 1);
                    };
                    return;
                };
            };
        }

        public function removeAllSounds():void
        {
            var sd = null;
            for each (sd in _soundList)
            {
                sd.removeEventListener("SoundData.LOOP_COMPLETE", soundLoopCompleteHandler);
                sd.stopAndDispose();
            };
            _soundList.length = 0;
        }

        public function playSound($soundUrl:String, $startTime:Number=0, $loops:int=0, $selfVolume:Number=-1):SoundData
        {
            var sd = null;
            var sound = null;
            var Instance = null;
            var re1 = null;
            var re2 = null;
            var str1True:Boolean;
            var str2True:Boolean;
            var is404Error:Boolean;
            var selfVolume:Number;
            var nowSoundTransform = null;
            var channel = null;
            if (_soundCache.has($soundUrl))
            {
                sound = (_soundCache.getCache($soundUrl) as SingleSound);
            }
            else
            {
                Instance = ClassConstruct.getClass($soundUrl);
                if (Instance)
                {
                    sound = (ClassConstruct.construct(Instance) as SingleSound);
                };
                if (sound)
                {
                    _soundCache.push(sound, $soundUrl);
                }
                else
                {
                    re1 = new RegExp("^.+.mp3$");
                    re2 = new RegExp("^.+.wmv$");
                    str1True = re1.test($soundUrl);
                    str2True = re2.test($soundUrl);
                    is404Error = LoadBlackListUtils.getIs404Error($soundUrl, 3);
                    if (!(is404Error))
                    {
                        if (((str1True) || (str2True)))
                        {
                            sound = new SingleSound();
                            sound.resUrl = $soundUrl;
                            sound.addEventListener("complete", soundLoadHandler);
                            sound.addEventListener("ioError", soundLoadHandler);
                            sound.load(new URLRequest($soundUrl));
                        };
                    };
                };
            };
            if ((sound == null))
            {
                return (sd);
            };
            try
            {
                selfVolume = ((((($selfVolume >= 0)) && (($selfVolume <= 1)))) ? $selfVolume : _volume);
                nowSoundTransform = new SoundTransform(selfVolume);
                channel = sound.play($startTime, 0, nowSoundTransform);
                if (!((channel == null)))
                {
                    sd = new SoundData(sound, channel, ($loops - 1));
                    sd.addEventListener("SoundData.LOOP_COMPLETE", soundLoopCompleteHandler);
                    _soundList.push(sd);
                    if (_mute)
                    {
                        sd.setMute(true);
                    };
                    if (_pause)
                    {
                        sd.setPause(true);
                    };
                };
            }
            catch(e:Error)
            {
            };
            return (sd);
        }

        private function soundLoadHandler(e:*):void
        {
            var len:int;
            var sd = null;
            var sound:SingleSound = e.currentTarget;
            switch (e.type)
            {
                case "complete":
                    _soundCache.push(sound, sound.resUrl);
                    LoadBlackListUtils.removeLoadUrl(sound.resUrl);
                    return;
                case "ioError":
                    len = _soundList.length;
                    while (len-- > 0)
                    {
                        sd = _soundList[len];
                        if ((sd.sound == sound))
                        {
                            sd.removeEventListener("SoundData.LOOP_COMPLETE", soundLoopCompleteHandler);
                            sd.stopAndDispose();
                            _soundList.splice(len, 1);
                        };
                    };
                    LoadBlackListUtils.addLoadUrl(sound.resUrl);
                    return;
            };
        }

        private function soundLoopCompleteHandler(e:Event):void
        {
            var sd = null;
            var index:int;
            var currentSd:SoundData = (e.currentTarget as SoundData);
            for each (sd in _soundList)
            {
                if ((sd == currentSd))
                {
                    sd.removeEventListener("SoundData.LOOP_COMPLETE", soundLoopCompleteHandler);
                    sd.stopAndDispose();
                    index = _soundList.indexOf(sd);
                    if (!((index == -1)))
                    {
                        _soundList.splice(index, 1);
                    };
                    return;
                };
            };
        }
    }
}