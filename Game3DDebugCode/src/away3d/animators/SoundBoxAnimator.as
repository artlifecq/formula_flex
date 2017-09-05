package away3d.animators
{
    import away3d.audio.SoundBox;
    import away3d.containers.ObjectContainer3D;
    import away3d.utils.SoundUtil;
    import away3d.tick.Tick;
    import away3d.events.Event;

    public class SoundBoxAnimator extends AnimatorBase implements IAnimator 
    {

        private var soundBox:SoundBox;
        private var soundBoxTime:int;
        private var soundBoxPlaying:Boolean;
        private var soundBoxPlayingTime:int;
        private var _globalVolume:Number;
        private var _reference:ObjectContainer3D;

        public function SoundBoxAnimator()
        {
            super(null);
            SoundUtil.addSoundAnimator(this);
        }

        override public function get duration():uint
        {
            if (soundBox)
            {
                return (soundBox.duration);
            };
            return (_duration);
        }

        public function set looping(value:Boolean):void
        {
            _looping = value;
        }

        override public function set owner(value:IAnimatorOwner):void
        {
            super.owner = value;
            soundBox = (value as SoundBox);
            if (((soundBox) && (!(isNaN(_globalVolume)))))
            {
                soundBox.globalVolume = _globalVolume;
            };
            if (((soundBox) && (_reference)))
            {
                soundBox.reference = _reference;
            };
        }

        public function set reference(value:ObjectContainer3D):void
        {
            if (!((_reference == value)))
            {
                _reference = value;
                if (soundBox)
                {
                    soundBox.reference = value;
                };
            };
        }

        public function set globalVolume(value:Number):void
        {
            if (!((_globalVolume == value)))
            {
                if (soundBox)
                {
                    soundBox.globalVolume = value;
                    if ((((value == 0)) && (soundBoxPlaying)))
                    {
                        soundBox.stop();
                    }
                    else
                    {
                        if ((((_globalVolume == 0)) && (soundBoxPlaying)))
                        {
                            soundBox.play(_time);
                        };
                    };
                };
                _globalVolume = value;
            };
        }

        override protected function updateState(time:int):void
        {
            soundBoxTime = time;
            if (((!(soundBoxPlaying)) || ((Math.abs((soundBoxPlayingTime - time)) > 250))))
            {
                if ((((soundBox.volume > 0)) && ((soundBox.globalVolume > 0))))
                {
                    soundBox.play(time);
                };
                soundBoxPlayingTime = time;
                soundBoxPlaying = true;
                Tick.instance.addCallBack(onBoxTick);
            };
        }

        private function onBoxTick(interval:int):void
        {
            soundBoxPlayingTime = (soundBoxPlayingTime + interval);
            soundBoxTime = (soundBoxTime + interval);
            if (((soundBoxTime - _time) > 250))
            {
                soundBox.stop();
                soundBoxPlaying = false;
                Tick.instance.removeCallBack(onBoxTick);
            };
        }

        override public function stop(resetTime:Boolean=false):void
        {
            super.stop(resetTime);
            if (soundBox)
            {
                Tick.instance.removeCallBack(onBoxTick);
                soundBox.stop();
                soundBoxPlaying = false;
            };
        }

        public function clone():IAnimator
        {
            var result:SoundBoxAnimator = new SoundBoxAnimator();
            result.playbackSpeed = this.playbackSpeed;
            result.looping = this.looping;
            return (result);
        }

        override public function hasAnimationSet():Boolean
        {
            return (false);
        }

        override public function hasAnimationNode():Boolean
        {
            return (false);
        }

        override public function dispose():void
        {
            _reference = null;
            Tick.instance.removeCallBack(onBoxTick);
            if (soundBox)
            {
                soundBox = null;
            };
            this.dispatchEvent(new Event("dispose"));
            super.dispose();
        }


    }
}//package away3d.animators
