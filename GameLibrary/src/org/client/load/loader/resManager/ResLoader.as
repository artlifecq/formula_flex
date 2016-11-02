//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.resManager
{
    import flash.events.EventDispatcher;
    import flash.net.URLStream;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.display.LoaderInfo;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    public class ResLoader extends EventDispatcher 
    {

        public var resInfo:ResInfo;
        public var level:int;
        private var _streamLoader:URLStream;
        private var _loader:Loader;
        private var _isLoading:Boolean;
        private var _loaderContext:LoaderContext;
        private var _decode:Function;

        public function ResLoader(decode:Function=null)
        {
            _decode = decode;
            _streamLoader = new URLStream();
            _streamLoader.addEventListener("complete", onStreamCmp);
            _streamLoader.addEventListener("open", onOpen);
            _streamLoader.addEventListener("progress", onProgress);
            _streamLoader.addEventListener("ioError", onError);
            _streamLoader.addEventListener("securityError", onSecurityError);
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener("complete", onComplete);
            _loaderContext = new LoaderContext(false);
            _loaderContext.allowCodeImport = true;
        }

        public function get isLoading():Boolean
        {
            return (_isLoading);
        }

        public function set isLoading(b:Boolean):void
        {
            _isLoading = b;
        }

        public function get loaderInfo():LoaderInfo
        {
            return (_loader.contentLoaderInfo);
        }

        public function load(info:ResInfo):void
        {
            resInfo = info;
            level = resInfo.level;
            resInfo.isLoading = true;
            _isLoading = true;
            _streamLoader.load(new URLRequest(resInfo.url));
        }

        public function unload():void
        {
            _loader.unloadAndStop();
        }

        public function close():void
        {
            if (!(_isLoading))
            {
                return;
            };
            _isLoading = false;
            resInfo.isLoading = false;
            try
            {
                _streamLoader.close();
                _loader.close();
            }
            catch(e:Error)
            {
            };
        }

        public function destroy():void
        {
            close();
            unload();
            resInfo = null;
            _streamLoader.removeEventListener("complete", onStreamCmp);
            _streamLoader.removeEventListener("open", onOpen);
            _streamLoader.removeEventListener("progress", onProgress);
            _streamLoader.removeEventListener("ioError", onError);
            _streamLoader.removeEventListener("securityError", onSecurityError);
            _streamLoader = null;
            _loader.contentLoaderInfo.removeEventListener("complete", onComplete);
            _loader = null;
        }

        private function onStreamCmp(e:Event):void
        {
            var data:ByteArray = new ByteArray();
            _streamLoader.readBytes(data);
            if (!((_decode == null)))
            {
                data = _decode(data);
            };
            _loader.loadBytes(data, _loaderContext);
        }

        private function onComplete(e:Event):void
        {
            dispatchEvent(e);
            _isLoading = false;
        }

        private function onOpen(e:Event):void
        {
            dispatchEvent(e);
        }

        private function onProgress(e:ProgressEvent):void
        {
            dispatchEvent(e);
        }

        private function onError(e:IOErrorEvent):void
        {
            resInfo.isLoading = false;
            dispatchEvent(e);
            _isLoading = false;
        }

        private function onSecurityError(e:SecurityErrorEvent):void
        {
            dispatchEvent(e);
            throw (new SecurityError(e.text));
        }


    }
}//package org.client.load.loader.resManager
