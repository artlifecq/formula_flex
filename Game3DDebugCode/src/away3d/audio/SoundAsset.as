package away3d.audio
{
    import flash.events.Event;
    import flash.media.Sound;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    
    import away3d.Away3D;
    import away3d.events.Event;
    import away3d.library.assets.IAsset;
    import away3d.library.assets.NamedAssetBase;
    import away3d.loaders.multi.MultiLoadData;
    import away3d.loaders.multi.MultiUrlLoadManager;
    import away3d.loaders.multi.MultiUrlLoader;

    public class SoundAsset extends NamedAssetBase implements IAsset 
    {

        public var url:String;
        public var sound:Sound;
        public var isEmbed:Boolean;
        public var soundBytes:ByteArray;
        private var _loadToken:MultiLoadData;
        private var _req:URLRequest;
        private var _loadComplete:Boolean;

        public function SoundAsset(sound:Sound)
        {
            this.sound = sound;
            if (sound)
            {
                _loadComplete = true;
            };
        }

        public function load(req:URLRequest, priority:int):void
        {
            _loadComplete = false;
            _req = req;
            _loadToken = new MultiLoadData(_req.url, onFileBytesLoaded, null, onFileBytesLoadError, "", "", priority, "binary");
            MultiUrlLoadManager.load(_loadToken);
        }

        public function get loadComplete():Boolean
        {
            return (_loadComplete);
        }

        private function onFileBytesLoadError(data:MultiLoadData, e:flash.events.Event):void
        {
            var errorMsg:String = null;
            errorMsg = ((("load error:" + _req.url) + "   reason:") + errorMsg);
            (trace(errorMsg));
            if (this.hasEventListener("error"))
            {
                this.dispatchEvent(new away3d.events.Event("error", false, errorMsg));
            }
        }

        private function onFileBytesLoaded(data:MultiLoadData, e:flash.events.Event):void
        {
            var loader:MultiUrlLoader = (e.target as MultiUrlLoader);
            var fileBytes:ByteArray = (loader.data as ByteArray);
            _loadToken = null;
            sound = new Sound();
            fileBytes.position = 0;
            sound.loadCompressedDataFromByteArray(fileBytes, fileBytes.length);
            if (Away3D.SOUND_HOLD_BYTES)
            {
                soundBytes = fileBytes;
            }
            _loadComplete = true;
            if (this.hasEventListener("complete"))
            {
                this.dispatchEventWith("complete");
            }
        }

        public function get assetType():String
        {
            return ("sound");
        }

        override public function dispose():void
        {
            if (sound)
            {
                sound = null;
            }
            if (_loadToken)
            {
                MultiUrlLoadManager.close(onFileBytesLoaded);
                _loadToken = null;
            }
            super.dispose();
        }
    }
}