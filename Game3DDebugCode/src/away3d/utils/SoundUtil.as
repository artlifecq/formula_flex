package away3d.utils
{
    import __AS3__.vec.Vector;
    
    import away3d.animators.SoundBoxAnimator;
    import away3d.audio.SoundBox;
    import away3d.containers.ObjectContainer3D;
    import away3d.events.Event;

    public class SoundUtil 
    {

        public static const SOUND_REDUCTION_ALGORITHM_NORMAL:int = 1;
        public static const SOUND_REDUCTION_ALGORITHM_MAIN_ROLE:int = 2;

        public static var SOUND_REDUCTION_ALGORITHM_MIN_VOLUMN:Number = 0.8;
        public static var SOUND_REDUCTION_ALGORITHM_RECUTION_SCOPE:Number = 800;
        private static var _soundReference:ObjectContainer3D;
        private static var _soundAnimators:Vector.<SoundBoxAnimator> = new Vector.<SoundBoxAnimator>();
        private static var _volume:Number = 1;
        private static var soundType:Object = {
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
        };
        public static var playingSoundBox:Array = [];


        public static function get volume():Number
        {
            return _volume;
        }

        public static function set volume(value:Number):void
        {
            var i:int;
            if (isNaN(value))
            {
                value = 0;
            }
            if (value < 0)
            {
                value = 0;
            }
            if (!((value == _volume)))
            {
                _volume = value;
                i = 0;
                while (i < _soundAnimators.length)
                {
                    _soundAnimators[i].globalVolume = value;
                    i++;
                }
            }
        }

        public static function get soundReference():ObjectContainer3D
        {
            return _soundReference;
        }

        public static function set soundReference(value:ObjectContainer3D):void
        {
            var i:int;
            if (value != _soundReference)
            {
                _soundReference = value;
                i = 0;
                while (i < _soundAnimators.length)
                {
                    _soundAnimators[i].reference = value;
                    i++;
                }
            }
        }

        public static function initConfig(params:Object=null):void
        {
            var arr:*;
            var obj:Object = null;
            if (params != null)
            {
                soundType = params;
            }
            playingSoundBox[0] = {
                "name":"未分类",
                "index":0
            };
            for each (var type:Object in soundType)
            {
                arr = new Vector.<SoundBox>();
                obj = type;
                obj.arr = arr;
                playingSoundBox[type["index"]] = obj;
            }
        }

        public static function judgeSoundBox(soundBox:SoundBox):Boolean
        {
            if (playingSoundBox.length == 0)
            {
                return true;
            }
            if (!(isSoundAlbumCountOut(soundBox)))
            {
                soundBox.addEventListener("soundComplete", onSoundComplete);
                addSoundBox(soundBox);
                return true;
            }
            return false;
        }

        protected static function onSoundComplete(event:Event):void
        {
            var soundBox:SoundBox = (event.currentTarget as SoundBox);
            soundBox.removeEventListener("soundComplete", onSoundComplete);
            removeSoundBox(soundBox);
        }

        private static function isSoundAlbumCountOut(sb:SoundBox):Boolean
        {
            var i:int;
            var soundbox:SoundBox = null;
            var obj:Object = playingSoundBox[sb.soundAlbum.soundType];
            var arr:Vector.<SoundBox> = obj.arr;
            var count:Number = obj.count;
            var offset:Number = obj.offset;
            var num:int = 0;
            if (arr == null)
            {
                return false;
            }
            if (arr.length == 0)
            {
                return false;
            }
            i = 0;
            while (i < arr.length)
            {
                soundbox = arr[i];
                if ((sb.soundAlbum == soundbox.soundAlbum))
                {
                    if ((Math.abs((sb.animator.time - soundbox.animator.time)) < offset))
                    {
                        num++;
                    }
                    if (num >= count)
                    {
                        return true;
                    }
                }
                i++;
            }
            return false;
        }

        private static function addSoundBox(soundBox:SoundBox):void
        {
            var obj:Object = playingSoundBox[soundBox.soundAlbum.soundType];
            var arr:Vector.<SoundBox> = (obj.arr as Vector.<SoundBox>);
            if (arr)
            {
                arr.push(soundBox);
            }
        }

        private static function removeSoundBox(soundBox:SoundBox):void
        {
            var obj:Object = playingSoundBox[soundBox.soundAlbum.soundType];
            var arr:Vector.<SoundBox> = (obj.arr as Vector.<SoundBox>);
            if (arr)
            {
                arr.splice(arr.indexOf(soundBox), 1);
            }
        }

        public static function addSoundAnimator(soundAnimator:SoundBoxAnimator):void
        {
            if ((_soundAnimators.indexOf(soundAnimator) == -1))
            {
                _soundAnimators.push(soundAnimator);
                soundAnimator.globalVolume = _volume;
                soundAnimator.reference = _soundReference;
                soundAnimator.addEventListener("dispose", onSoundAnimatorDisposed);
            }
        }

        private static function onSoundAnimatorDisposed(event:Event):void
        {
            var soundAnimator:SoundBoxAnimator = (event.currentTarget as SoundBoxAnimator);
            soundAnimator.removeEventListener("dispose", onSoundAnimatorDisposed);
            _soundAnimators.splice(_soundAnimators.indexOf(soundAnimator), 1);
        }
    }
}