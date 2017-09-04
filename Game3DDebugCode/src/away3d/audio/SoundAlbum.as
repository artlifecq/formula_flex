//Created by Action Script Viewer - http://www.buraks.com/asv
package away3d.audio
{
    import away3d.library.assets.NamedAssetBase;
    import away3d.library.assets.IAsset;
    import __AS3__.vec.Vector;
    import away3d.events.Event;

    public class SoundAlbum extends NamedAssetBase implements IAsset 
    {

        public var probability:Number = 1;
        public var soundType:Number = 1;
        private var _randomSoundGroups:Vector.<RandomSoundGroup>;

        public function SoundAlbum(randomSoundGroups:Vector.<RandomSoundGroup>, probability:Number=1, soundType:Number=0)
        {
            _randomSoundGroups = randomSoundGroups;
            addSoundGroupChangeEvents();
            this.probability = probability;
            this.soundType = soundType;
        }

        public function get assetType():String
        {
            return ("soundAlbum");
        }

        public function get randomSoundGroups():Vector.<RandomSoundGroup>
        {
            return (_randomSoundGroups);
        }

        public function set randomSoundGroups(value:Vector.<RandomSoundGroup>):void
        {
            removeSoundGroupChangeEvents();
            _randomSoundGroups = value;
            addSoundGroupChangeEvents();
            this.dispatchEvent(new Event("change"));
        }

        private function removeSoundGroupChangeEvents():void
        {
            var i:int;
            i = 0;
            while (((_randomSoundGroups) && ((i < _randomSoundGroups.length))))
            {
                _randomSoundGroups[i].removeEventListener("change", onSoundGroupChanged);
                _randomSoundGroups[i].refs.removeRef(this);
                i++;
            };
        }

        private function addSoundGroupChangeEvents():void
        {
            var i:int;
            i = 0;
            while (((_randomSoundGroups) && ((i < _randomSoundGroups.length))))
            {
                _randomSoundGroups[i].addEventListener("change", onSoundGroupChanged);
                _randomSoundGroups[i].refs.addRef(this);
                i++;
            };
        }

        private function onSoundGroupChanged(e:Event):void
        {
            this.dispatchEvent(new Event("change"));
        }

        override public function dispose():void
        {
            removeSoundGroupChangeEvents();
            _randomSoundGroups = null;
            super.dispose();
        }


    }
}//package away3d.audio
