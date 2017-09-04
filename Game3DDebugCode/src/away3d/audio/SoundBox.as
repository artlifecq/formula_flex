package away3d.audio
{
    import __AS3__.vec.Vector;
    
    import away3d.arcane;
    import away3d.animators.IAnimator;
    import away3d.animators.IAnimatorOwner;
    import away3d.animators.SoundBoxAnimator;
    import away3d.audio.drivers.CameraPanVolumnDriver;
    import away3d.cameras.Camera3D;
    import away3d.containers.ObjectContainer3D;
    import away3d.containers.Scene3D;
    import away3d.core.base.Object3D;
    import away3d.events.Event;
    import away3d.utils.SoundUtil;
	
	use namespace arcane;

    public class SoundBox extends ObjectContainer3D implements IAnimatorOwner 
    {

        private var _soundAlbum:SoundAlbum;
        private var _animator:SoundBoxAnimator;
        private var _reference:ObjectContainer3D;
        private var _camera:Camera3D;
        private var _sound3Ds:Vector.<Sound3D>;
        private var _playingSound3Ds:Vector.<Sound3D>;
        private var _volume:Number;
        private var _globalVolume:Number = 1;
        private var _scaleDistance:Number;
        private var _meshVolume:Number;
        private var _reducationAlgorithm:int = 1;
        private var _playing:Boolean;
        private var _duration:Number;
        private var _interruptAble:Boolean = true;

        public function SoundBox(soundAlbum:SoundAlbum, reference:ObjectContainer3D, volume:Number=1, scaleDistance:Number=2000, meshVolume:Number=0)
        {
            _sound3Ds = new Vector.<Sound3D>();
            _playingSound3Ds = new Vector.<Sound3D>();
            super();
            _reference = reference;
            _volume = volume;
            _scaleDistance = scaleDistance;
            _meshVolume = meshVolume;
            this.soundAlbum = soundAlbum;
        }

        public function get duration():Number
        {
            return _duration;
        }

        public function set duration(value:Number):void
        {
            _duration = value;
        }

        public function get scaleDistance():Number
        {
            return _scaleDistance;
        }

        public function set scaleDistance(value:Number):void
        {
            var i:int;
            if (_scaleDistance != value)
            {
                _scaleDistance = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].scaleDistance = _scaleDistance;
                    i++;
                }
            }
        }

        public function get meshVolume():Number
        {
            return _meshVolume;
        }

        public function set meshVolume(value:Number):void
        {
            var i:int;
            if (_meshVolume != value)
            {
                _meshVolume = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].meshVolume = _meshVolume;
                    i++;
                }
            }
        }

        public function get reducationAlgorithm():int
        {
            return _reducationAlgorithm;
        }

        public function set reducationAlgorithm(value:int):void
        {
            var i:int;
            if (_reducationAlgorithm != value)
            {
                _reducationAlgorithm = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].reducationAlgorithm = _reducationAlgorithm;
                    i++;
                }
            }
        }

        public function get volume():Number
        {
            return _volume;
        }

        public function set volume(value:Number):void
        {
            var i:int;
            if (_volume != value)
            {
                _volume = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].volume = _volume * _globalVolume;
                    i++;
                }
            }
        }

        public function get globalVolume():Number
        {
            return _globalVolume;
        }

        public function set globalVolume(value:Number):void
        {
            var i:int;
            if (_globalVolume != value)
            {
                _globalVolume = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].volume = _volume * _globalVolume;
                    i++;
                }
            }
        }

        override public function set scene(value:Scene3D):void
        {
            super.scene = value;
            if (value)
            {
                if (!(_reference))
                {
                    reference = scene.view.camera;
                }
                setCamera(scene.view.camera);
            }
            else
            {
                if ((_reference is Camera3D))
                {
                    reference = null;
                }
                setCamera(null);
            }
        }

        public function get reference():ObjectContainer3D
        {
            return _reference;
        }

        public function set reference(value:ObjectContainer3D):void
        {
            var i:int;
            if (_reference != value)
            {
                _reference = value;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    _sound3Ds[i].reference = _reference;
                    i++;
                }
            }
        }

        private function setCamera(camera:Camera3D):void
        {
            var i:int;
            if (_camera != camera)
            {
                _camera = camera;
                i = 0;
                while (_soundAlbum && _soundAlbum.randomSoundGroups && i < _soundAlbum.randomSoundGroups.length)
                {
                    CameraPanVolumnDriver(_sound3Ds[i].driver).camera = camera;
                    i++;
                }
            }
        }

        public function get soundAlbum():SoundAlbum
        {
            return _soundAlbum;
        }

        public function set soundAlbum(value:SoundAlbum):void
        {
            if (_soundAlbum != value)
            {
                if (_playing)
                {
                    stop();
                }
                if (_soundAlbum)
                {
                    _soundAlbum.removeEventListener("change", onSoundAlbumChange);
                    _soundAlbum.refs.removeRef(this);
                }
                _soundAlbum = value;
                if (_soundAlbum)
                {
                    _soundAlbum.addEventListener("change", onSoundAlbumChange);
                    _soundAlbum.refs.addRef(this);
                }
                createSound3Ds();
            }
        }

        private function onSoundAlbumChange(e:Event):void
        {
            createSound3Ds();
        }

        private function createSound3Ds():void
        {
            var i:int;
            if (_playing)
            {
                stop();
            }
            if (!(_soundAlbum))
            {
                _sound3Ds.splice(0, _sound3Ds.length);
                return;
            }
            _duration = 0;
            i = 0;
            while (i < _soundAlbum.randomSoundGroups.length)
            {
                if ((_sound3Ds.length < (i + 1)))
                {
                    _sound3Ds.push(new Sound3D(_soundAlbum.randomSoundGroups[i].currentSoundAsset.sound, _reference, new CameraPanVolumnDriver(_camera), (_volume * _globalVolume), _scaleDistance, _meshVolume, _reducationAlgorithm));
                }
                else
                {
                    _sound3Ds[i].sound = _soundAlbum.randomSoundGroups[i].currentSoundAsset.sound;
                }
                if (!(_sound3Ds[i].parent))
                {
                    this.addChild(_sound3Ds[i]);
                }
                if (_soundAlbum.randomSoundGroups[i].currentSoundAsset.sound)
                {
                    _duration = Math.max(_duration, (_soundAlbum.randomSoundGroups[i].currentSoundAsset.sound.length + _soundAlbum.randomSoundGroups[i].offset));
                }
                i++;
            }
            if (this.hasEventListener("change"))
            {
                this.dispatchEvent(new Event("change"));
            }
        }

        public function set animator(value:IAnimator):void
        {
            if ((value == _animator))
            {
                return;
            }
            if (_animator)
            {
                _animator.owner = null;
                _animator.refs.removeRef(this);
            }
            var newAnimator:SoundBoxAnimator = (value as SoundBoxAnimator);
            if (newAnimator)
            {
                if (newAnimator.owner)
                {
                    newAnimator.owner.animator = null;
                }
                newAnimator.owner = this;
                newAnimator.refs.addRef(this);
            }
            _animator = newAnimator;
        }

        public function get animator():IAnimator
        {
            return _animator;
        }

        override public function get assetType():String
        {
            return "soundBox";
        }

        public function play(pos:Number=NaN):void
        {
            var i:int;
            var soundAsset:SoundAsset = null;
            var index:Number;
            if (!(_interruptAble))
            {
                pos = 0;
            }
            if (!(_soundAlbum))
            {
                return;
            }
            if (_playing)
            {
                stop();
            }
            if ((Math.random() < _soundAlbum.probability))
            {
                i = 0;
                while (i < _soundAlbum.randomSoundGroups.length)
                {
                    soundAsset = _soundAlbum.randomSoundGroups[i].getSound();
                    if (soundAsset)
                    {
                        _sound3Ds[i].sound = soundAsset.sound;
                        _sound3Ds[i].startPos = (pos - _soundAlbum.randomSoundGroups[i].offset);
                        index = _playingSound3Ds.indexOf(_sound3Ds[i]);
                        if (!((index == -1)))
                        {
                            _playingSound3Ds[index] = _sound3Ds[i];
                        }
                        else
                        {
                            _playingSound3Ds.push(_sound3Ds[i]);
                        }
                    }
                    i++;
                }
                if ((_playingSound3Ds.length == 0))
                {
                    return;
                }
                if (SoundUtil.judgeSoundBox(this))
                {
                    playSounds();
                }
            }
            _playing = true;
        }

        private function stopSounds():void
        {
            var i:int;
            i = 0;
            while (i < _playingSound3Ds.length)
            {
                _playingSound3Ds[i].stop();
                _playingSound3Ds[i].removeEventListener("soundComplete", onSoundComplete);
                i++;
            }
            _playingSound3Ds.splice(0, _playingSound3Ds.length);
            if (this.hasEventListener("soundComplete"))
            {
                dispatchEventWith("soundComplete");
            }
        }

        private function playSounds():void
        {
            var i:int;
            i = 0;
            while (i < _playingSound3Ds.length)
            {
                _playingSound3Ds[i].play();
                _playingSound3Ds[i].addEventListener("soundComplete", onSoundComplete);
                i++;
            }
        }

        protected function onSoundComplete(event:Event):void
        {
            var sound3D:Sound3D = (event.currentTarget as Sound3D);
            sound3D.removeEventListener("soundComplete", onSoundComplete);
            _playingSound3Ds.splice(_playingSound3Ds.indexOf(sound3D), 1);
            if (_playingSound3Ds.length == 0)
            {
                _playing = false;
                dispatchEventWith(event.type);
            }
        }

        public function stop():void
        {
            var i:int;
            if (_interruptAble)
            {
                _playing = false;
                i = 0;
                while (_sound3Ds && i < _sound3Ds.length)
                {
                    _sound3Ds[i].stop();
                    i++;
                }
                stopSounds();
            }
        }

        override public function set visible(value:Boolean):void
        {
            super.visible = value;
            if (!visible)
            {
                stop();
            }
        }

        override public function clone():Object3D
        {
            var clo:SoundBox = new SoundBox(_soundAlbum, _reference, _volume, _scaleDistance);
            clo.fillFrom(this);
            return clo;
        } 
		
		override arcane function fillFrom(target:Object3D):void
		{
			super.fillFrom(target);
			this.meshVolume = SoundBox(target).meshVolume;
			if(SoundBox(target).animator)
			{
				var cloneAnimator:SoundBoxAnimator = SoundBox(target).animator.clone() as SoundBoxAnimator;
				this.animator = cloneAnimator;
			}
		}

        override public function dispose():void
        {
            var i:int;
            i = 0;
            while (_sound3Ds && i < _sound3Ds.length)
            {
                _sound3Ds[i].dispose();
                i++;
            }
            _sound3Ds = null;
            if (_animator)
            {
                _animator.refs.removeRef(this);
                _animator.dispose();
                _animator = null;
            }
            if (_soundAlbum)
            {
                _soundAlbum.refs.removeRef(this);
                _soundAlbum.removeEventListener("change", onSoundAlbumChange);
                _soundAlbum = null;
            }
            _reference = null;
            super.dispose();
        }

        public function get playingSound3Ds():Vector.<Sound3D>
        {
            return _playingSound3Ds;
        }
    }
}