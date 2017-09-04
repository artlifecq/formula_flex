package away3d.audio.drivers
{
    import flash.events.Event;
    import flash.geom.Vector3D;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    
    import away3d.Away3D;
    import away3d.cameras.Camera3D;
    import away3d.core.math.Matrix3DUtils;
    import away3d.tick.Tick;
    import away3d.utils.SoundUtil;

    public class CameraPanVolumnDriver extends AbstractSound3DDriver implements ISound3DDriver 
    {

        private var _sound_chan:SoundChannel;
        private var _pause_position:Number;
        private var _stf:SoundTransform;
        private var _camera:Camera3D;
        private var _soundPos:Vector3D;
        private var _reducationAlgorithm:int = 1;

        public function CameraPanVolumnDriver(camera:Camera3D, algorithm:int=1)
        {
            _ref_v = new Vector3D();
            _stf = new SoundTransform();
            _camera = camera;
        }

        public function get camera():Camera3D
        {
            return (_camera);
        }

        public function set camera(value:Camera3D):void
        {
            if (!((_camera == value)))
            {
                _camera = value;
            };
        }

        override public function set sourceSound(val:Sound):void
        {
            if ((_src == val))
            {
                return;
            };
            _src = val;
            if (_playing)
            {
                pause();
                if (_src)
                {
                    play();
                };
            };
        }

        public function play(pos:Number=NaN):void
        {
            if (!(_src))
            {
                return;
            };
            if ((_src.length == 0))
            {
                return;
            };
            if ((pos >= _src.length))
            {
                return;
            };
            if ((((((_reducationAlgorithm == 1)) && (_ref_v))) && ((_refLength > (_scale + _meshVolume)))))
            {
                return;
            };
            _playing = true;
            Tick.instance.addCallBack(updateSoundTransform);
            if (isNaN(pos))
            {
                pos = ((_paused) ? _pause_position : 0);
            };
            _sound_chan = _src.play(pos, 0, _stf);
            if (_sound_chan)
            {
                _sound_chan.addEventListener("soundComplete", onSoundComplete);
            };
            _paused = false;
        }

        public function pause():void
        {
            if (_sound_chan)
            {
                _playing = false;
                _paused = true;
                _pause_position = _sound_chan.position;
                _sound_chan.stop();
                _sound_chan.removeEventListener("soundComplete", onSoundComplete);
                Tick.instance.removeCallBack(updateSoundTransform);
            };
        }

        public function stop():void
        {
            if (_sound_chan)
            {
                _playing = false;
                _paused = false;
                _sound_chan.stop();
                _sound_chan.removeEventListener("soundComplete", onSoundComplete);
                Tick.instance.removeCallBack(updateSoundTransform);
            };
        }

        override public function set volume(val:Number):void
        {
            _volume = val;
        }

        override public function set scale(val:Number):void
        {
            _scale = val;
        }

        override public function set meshVolume(value:Number):void
        {
            _meshVolume = value;
        }

        public function set reducationAlgorithm(value:int):void
        {
            _reducationAlgorithm = value;
        }

        override public function updateReferenceVector(v:Vector3D, soundPos:Vector3D):void
        {
            super.updateReferenceVector(v, soundPos);
            _soundPos = soundPos;
        }

        private function updateSoundTransform(deltaTime:int=0):void
        {
            var soundPosInCamera:Vector3D = null;
            var refPosInCamera:Vector3D = null;
            var projectVector:Vector3D = null;
            var pan:Number;
            var r:Number;
            if (!(_playing))
            {
                return;
            };
            if (((((((Away3D.ENABLE_SOUND_PAN) && (_camera))) && (_soundPos))) && (_ref_v)))
            {
                soundPosInCamera = Matrix3DUtils.CALCULATION_VECTOR3D;
                Matrix3DUtils.transformVector(_camera.inverseSceneTransform, _soundPos, soundPosInCamera);
                refPosInCamera = Matrix3DUtils.CALCULATION_VECTOR3D2;
                Matrix3DUtils.transformVector(_camera.inverseSceneTransform, _ref_v, refPosInCamera);
                soundPosInCamera.decrementBy(refPosInCamera);
                if ((soundPosInCamera.z < 0))
                {
                    soundPosInCamera.z = -(soundPosInCamera.z);
                };
                soundPosInCamera.z = (soundPosInCamera.z + refPosInCamera.z);
                projectVector = _camera.lens.project(soundPosInCamera, Matrix3DUtils.CALCULATION_VECTOR3D2);
                pan = projectVector.x;
                if ((pan > 1))
                {
                    pan = 1;
                }
                else
                {
                    if (pan < -1)
                    {
                        pan = -1;
                    };
                };
                if ((pan > 0))
                {
                    if ((pan < 0.2))
                    {
                        pan = (pan * 0.5);
                    }
                    else
                    {
                        pan = (0.5 + (0.5 * ((pan - 0.2) / 0.8)));
                    };
                }
                else
                {
                    if (pan < 0)
                    {
                        if ((pan > -0.2))
                        {
                            pan = (pan * 0.5);
                        }
                        else
                        {
                            pan = (-0.5 + (0.5 * ((pan + 0.2) / 0.8)));
                        };
                    };
                };
                _stf.pan = pan;
            };
            if (_ref_v)
            {
                r = _refLength;
                if ((_reducationAlgorithm == 1))
                {
                    r = (r - meshVolume);
                    if ((r <= 0))
                    {
                        r = 1;
                    }
                    else
                    {
                        r = ((r / scale) + 0.28209479);
                        r = ((r * r) * 12.566);
                        r = (1 / r);
                        if (r > 1)
                        {
                            r = 1;
                        };
                    };
                }
                else
                {
                    if ((r > SoundUtil.SOUND_REDUCTION_ALGORITHM_RECUTION_SCOPE))
                    {
                        r = SoundUtil.SOUND_REDUCTION_ALGORITHM_MIN_VOLUMN;
                    }
                    else
                    {
                        r = ((r / SoundUtil.SOUND_REDUCTION_ALGORITHM_RECUTION_SCOPE) + 0.28209479);
                        r = ((r * r) * 12.566);
                        r = ((1 / r) * (1 - SoundUtil.SOUND_REDUCTION_ALGORITHM_MIN_VOLUMN));
                        r = (r + SoundUtil.SOUND_REDUCTION_ALGORITHM_MIN_VOLUMN);
                        if (r > 1)
                        {
                            r = 1;
                        };
                    };
                };
                _stf.volume = (r * _volume);
            };
            if (_sound_chan)
            {
                _sound_chan.soundTransform = _stf;
            };
        }

        private function onSoundComplete(ev:Event):void
        {
            this.dispatchEventWith(ev.type);
        }

        public function get position():Number
        {
            if (_sound_chan)
            {
                return (_sound_chan.position);
            };
            return (0);
        }

        public function dispose():void
        {
            if (_sound_chan)
            {
                _sound_chan.removeEventListener("soundComplete", onSoundComplete);
                _sound_chan = null;
            };
            _camera = null;
            Tick.instance.removeCallBack(updateSoundTransform);
        }
    }
}