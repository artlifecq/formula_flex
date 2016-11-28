package com.game.mainCore.core.manager
{
    import com.game.mainCore.libCore.sound.SoundData;
    import com.game.mainCore.libCore.sound.SoundThread;
    
    import flash.events.Event;

    public class SoundManager 
    {

        private static var _defaultSoundThread:SoundThread = new SoundThread();
        private static var _soundThreadArr:Array = [_defaultSoundThread];

        public function SoundManager()
        {
            throw new Event("静态类");
        }

        public static function getSoundThreadsNum():int
        {
            return _soundThreadArr.length;
        }

        public static function get soundsNum():int
        {
            var st:SoundThread = null;
            var num:int = 0;
            for each (st in _soundThreadArr)
            {
                num = num + st.getSoundsNum();
            }
            return num;
        }

        public static function creatNewSoundThread():SoundThread
        {
			var st:SoundThread = new SoundThread();
            _soundThreadArr[_soundThreadArr.length] = st;
            return st;
        }

        public static function playSound($soundClass:String, $startTime:Number=0, $loops:int=0, $selfVolume:Number=-1, $soundThread:SoundThread=null):SoundThread
        {
            var soundThread:SoundThread = null;
            if ($soundThread != null)
            {
                soundThread = $soundThread;
                if (!(hasSoundThread(soundThread)))
                {
                    _soundThreadArr.push(soundThread);
                }
            }
            else
            {
                soundThread = _defaultSoundThread;
            }
            soundThread.playSound($soundClass, $startTime, $loops, $selfVolume);
            return soundThread;
        }

        public static function setVolume($value:Number):void
        {
            var st:SoundThread = null;
            for each (st in _soundThreadArr)
            {
                st.setVolume($value);
            }
        }

        public static function setMute($value:Boolean):void
        {
            var st:SoundThread = null;
            for each (st in _soundThreadArr)
            {
                st.setMute($value);
            }
        }

        public static function setPause($value:Boolean):void
        {
            var st:SoundThread = null;
            for each (st in _soundThreadArr)
            {
                st.setPause($value);
            }
        }

        public static function getDefaultSoundThread():SoundThread
        {
            return _defaultSoundThread;
        }

        public static function removeAllSoundThreads():void
        {
            removeAllSounds();
            _soundThreadArr = [];
        }

        public static function removeAllSounds():void
        {
            var st:SoundThread = null;
            for each (st in _soundThreadArr)
            {
                st.removeAllSounds();
            }
        }

        public static function removeSoundThread($soundThread:SoundThread):void
        {
            var st:SoundThread = null;
            if (!$soundThread)
            {
                return;
            }
            for each (st in _soundThreadArr)
            {
                if (st == $soundThread)
                {
                    st.removeAllSounds();
                    _soundThreadArr.splice(_soundThreadArr.indexOf(st), 1);
                    return;
                }
            }
        }

        public static function removeSound($soundData:SoundData):void
        {
            var st:SoundThread = null;
            if ($soundData == null)
            {
                return;
            }
            for each (st in _soundThreadArr)
            {
                st.removeSound($soundData);
            }
        }

        public static function hasSoundThread($soundThread:SoundThread):Boolean
        {
            return _soundThreadArr.indexOf($soundThread) != -1;
        }

        public static function hasSound($soundData:SoundData):Boolean
        {
            var st:SoundThread = null;
            for each (st in _soundThreadArr)
            {
                if (st.hasSound($soundData))
                {
                    return true;
                }
            }
            return false;
        }
    }
}