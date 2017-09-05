//Created by Action Script Viewer - http://www.buraks.com/asv
package away3d.audio
{
    import away3d.events.EventDispatcher;
    import away3d.library.assets.ReferenceInfo;
    import __AS3__.vec.Vector;
    import away3d.events.Event;

    public class RandomSoundGroup extends EventDispatcher 
    {

        public var refs:ReferenceInfo;
        private var _soundAssets:Vector.<SoundAsset>;
        private var _probability:Number;
        private var _offset:int;
        private var _currentSoundAsset:SoundAsset;

        public function RandomSoundGroup(sounds:Vector.<SoundAsset>, probability:Number=1, offset:int=0)
        {
            refs = new ReferenceInfo(this);
            super();
            _soundAssets = sounds;
            addSoundCompleteEvents();
            _probability = probability;
            _offset = offset;
        }

        public function get soundAssets():Vector.<SoundAsset>
        {
            return (_soundAssets);
        }

        public function set soundAssets(value:Vector.<SoundAsset>):void
        {
            removeSoundCompleteEvents();
            _soundAssets = value;
            addSoundCompleteEvents();
        }

        public function get probability():Number
        {
            return (_probability);
        }

        public function set probability(value:Number):void
        {
            _probability = value;
        }

        public function get offset():int
        {
            return (_offset);
        }

        public function set offset(value:int):void
        {
            _offset = value;
        }

        public function get currentSoundAsset():SoundAsset
        {
            if (!(_currentSoundAsset))
            {
                return (getSound(true));
            };
            return (_currentSoundAsset);
        }

        public function getSound(ignoreProbability:Boolean=false):SoundAsset
        {
            if (((!(_soundAssets)) || ((_soundAssets.length == 0))))
            {
                _currentSoundAsset = null;
            }
            else
            {
                if (((((!(ignoreProbability)) && ((probability < 1)))) && ((Math.random() > _probability))))
                {
                    _currentSoundAsset = null;
                }
                else
                {
                    _currentSoundAsset = _soundAssets[int(Math.random() * _soundAssets.length)];
                };
            };
            return (_currentSoundAsset);
        }

        private function removeSoundCompleteEvents():void
        {
            var i:int;
            i = 0;
            while (((_soundAssets) && ((i < _soundAssets.length))))
            {
                _soundAssets[i].removeEventListener("complete", onSoundComplete);
                _soundAssets[i].refs.removeRef(this);
                i++;
            };
        }

        private function addSoundCompleteEvents():void
        {
            var i:int;
            i = 0;
            while (((_soundAssets) && ((i < _soundAssets.length))))
            {
                _soundAssets[i].addEventListener("complete", onSoundComplete);
                _soundAssets[i].refs.addRef(this);
                i++;
            };
        }

        private function onSoundComplete(e:Event):void
        {
            this.dispatchEventWith("change");
        }

        public function dispose():void
        {
            removeSoundCompleteEvents();
            _soundAssets = null;
            refs.dispose();
        }


    }
}//package away3d.audio
