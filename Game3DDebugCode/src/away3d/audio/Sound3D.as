//Created by Action Script Viewer - http://www.buraks.com/asv
package away3d.audio
{
    import away3d.containers.ObjectContainer3D;
    import flash.geom.Vector3D;
    import away3d.audio.drivers.ISound3DDriver;
    import flash.media.Sound;
    import flash.utils.setTimeout;
    import flash.utils.clearTimeout;
    import away3d.events.Object3DEvent;
    import away3d.events.Event;

    [Event(name="soundComplete", type="away3d.events.Event")]
    public class Sound3D extends ObjectContainer3D 
    {

        private var _refv:Vector3D;
        protected var _driver:ISound3DDriver;
        private var _reference:ObjectContainer3D;
        private var _sound:Sound;
        private var _paused:Boolean;
        private var _playing:Boolean;
        private var _offsetTimeOut:uint;
        private var _startPos:Number = NaN;

        public function Sound3D(sound:Sound, reference:ObjectContainer3D, driver:ISound3DDriver=null, volume:Number=1, scale:Number=1000, meshVolume:Number=0, reducationAlgorithm:int=1)
        {
            _sound = sound;
            _reference = reference;
            _driver = driver;
            _driver.sourceSound = _sound;
            _driver.volume = volume;
            _driver.scale = scale;
            _driver.meshVolume = meshVolume;
            _driver.reducationAlgorithm = reducationAlgorithm;
            _driver.addEventListener("soundComplete", onSoundComplete);
            addEventListener("positionChanged", onSceneChanged);
            addEventListener("scenetransformChanged", onSceneTransformChanged);
            if (_reference)
            {
                _reference.addEventListener("scenetransformChanged", onSceneTransformChanged);
            };
            update();
        }

        public function get reference():ObjectContainer3D
        {
            return (_reference);
        }

        public function set reference(value:ObjectContainer3D):void
        {
            if ((_reference == value))
            {
                return;
            };
            if (_reference)
            {
                _reference.removeEventListener("scenetransformChanged", onSceneTransformChanged);
            };
            _reference = value;
            if (_reference)
            {
                _reference.addEventListener("scenetransformChanged", onSceneTransformChanged);
            };
            update();
        }

        public function get driver():ISound3DDriver
        {
            return (_driver);
        }

        public function get sound():Sound
        {
            return (_sound);
        }

        public function set sound(value:Sound):void
        {
            if (!((_sound == value)))
            {
                _sound = value;
                _driver.sourceSound = _sound;
            };
        }

        public function get volume():Number
        {
            return (_driver.volume);
        }

        public function set volume(val:Number):void
        {
            _driver.volume = val;
        }

        public function get scaleDistance():Number
        {
            return (_driver.scale);
        }

        public function set scaleDistance(val:Number):void
        {
            _driver.scale = val;
        }

        public function get meshVolume():Number
        {
            return (_driver.meshVolume);
        }

        public function set meshVolume(value:Number):void
        {
            _driver.meshVolume = value;
        }

        public function set reducationAlgorithm(value:int):void
        {
            _driver.reducationAlgorithm = value;
        }

        public function get playing():Boolean
        {
            return (_playing);
        }

        public function get paused():Boolean
        {
            return (_paused);
        }

        public function play(pos:Number=NaN):void
        {
            if (!(isNaN(pos)))
            {
                _startPos = pos;
            };
            if (_driver)
            {
                clearOffsetTimeOut();
                if (_playing)
                {
                    _driver.stop();
                };
                _playing = true;
                _paused = false;
                if (((!(isNaN(_startPos))) && ((_startPos < 0))))
                {
                    _offsetTimeOut = setTimeout(onOffsetTimeOut, -(_startPos));
                }
                else
                {
                    _driver.play(_startPos);
                };
            };
        }

        private function onOffsetTimeOut():void
        {
            _offsetTimeOut = 0;
            _driver.play(0);
        }

        private function clearOffsetTimeOut():void
        {
            if (_offsetTimeOut)
            {
                (clearTimeout(_offsetTimeOut));
                _offsetTimeOut = 0;
            };
        }

        public function pause():void
        {
            clearOffsetTimeOut();
            _playing = false;
            _paused = true;
            _driver.pause();
        }

        public function stop():void
        {
            if (((_driver) && (_playing)))
            {
                clearOffsetTimeOut();
                _playing = false;
                _paused = false;
                _driver.stop();
            };
        }

        public function togglePlayPause():void
        {
            if (_playing)
            {
                this.pause();
            }
            else
            {
                this.play();
            };
        }

        private function onSceneChanged(ev:Object3DEvent):void
        {
            (trace("scene changed"));
            _driver.mute = (_scene == null);
            update();
            _driver.updateReferenceVector(_refv, scenePosition);
        }

        override protected function invalidateSceneTransform():void
        {
            super.invalidateSceneTransform();
        }

        private function update():void
        {
            if (_reference)
            {
                if (!(_refv))
                {
                    _refv = new Vector3D();
                };
                _refv.copyFrom(_reference.scenePosition);
                _driver.updateReferenceVector(_refv, scenePosition);
            };
        }

        private function onSceneTransformChanged(ev:Object3DEvent):void
        {
            update();
        }

        private function onSoundComplete(ev:Event):void
        {
            dispatchEvent(ev);
        }

        override public function dispose():void
        {
            if (_driver)
            {
                stop();
                _driver.dispose();
                _driver.removeEventListener("soundComplete", onSoundComplete);
                removeEventListener("sceneChanged", onSceneChanged);
                removeEventListener("scenetransformChanged", onSceneTransformChanged);
                if (_reference)
                {
                    _reference.removeEventListener("scenetransformChanged", onSceneTransformChanged);
                };
                _driver = null;
                _sound = null;
                _reference = null;
            };
            super.dispose();
        }

        public function get startPos():Number
        {
            return (_startPos);
        }

        public function set startPos(value:Number):void
        {
            _startPos = value;
        }


    }
}//package away3d.audio
