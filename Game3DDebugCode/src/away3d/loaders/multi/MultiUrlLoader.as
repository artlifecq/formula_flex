package away3d.loaders.multi
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    
    import away3d.loaders.misc.FileValidator;
    import away3d.log.Log;

    public class MultiUrlLoader extends EventDispatcher 
    {

        private static const TIME_OUT_GAP:Number = 50;

        public static var enableTimeoutReload:Boolean = true;

        private var _urlLoader:URLLoader;
        private var _urlTimeOut:uint;
        public var isLocked:Boolean;
        public var isLoading:Boolean;
        public var rslLoadData:MultiLoadData;
        private var _data:*;
        private var _newData:Boolean;
        private var _tryIndex:int;
        private var _timeOutInterval:uint = 0;
        private var _timeOutTryCnt:uint = 0;

        public function MultiUrlLoader()
        {
            _urlLoader = new URLLoader();
        }

        public function get data():*
        {
            var byteClone:ByteArray = null;
            if (!_newData && _data is ByteArray)
            {
                byteClone = new ByteArray();
                byteClone.writeBytes(ByteArray(_data));
                Log.warn("MultiUrlLoader get data multi times, bytes len: " + byteClone.length + ", url: " + rslLoadData ? rslLoadData.url : null);
                return byteClone;
            }
            _newData = false;
            if (_data == null)
            {
                Log.error("MultiUrlLoader get data null,url=" + rslLoadData ? rslLoadData.url : null);
            }
            return _data;
        }

        public function get cloneData():ByteArray
        {
            var byteClone:ByteArray = null;
            if (_data is ByteArray)
            {
                byteClone = new ByteArray();
                byteClone.writeBytes(ByteArray(_data));
                return byteClone;
            }
            return null;
        }

        public function get multiData():*
        {
            return _data;
        }

        public function set data(value:*):void
        {
            _data = value;
            _newData = true;
        }

        public function load($rslLoadData:MultiLoadData):void
        {
            if ($rslLoadData == null)
            {
                _tryIndex++;
            }
            else
            {
                isLoading = true;
                data = null;
                rslLoadData = $rslLoadData;
                _urlLoader.dataFormat = rslLoadData.dataFormat || "text";
            }
            initUrlLoadEvent();
            var rslLoadDataUrl:String = rslLoadData.reqUrl;
            var ur:URLRequest = new URLRequest(rslLoadDataUrl);
            ur.method = rslLoadData.requestMethod;
            ur.data = rslLoadData.requestData;
            ur.requestHeaders = rslLoadData.requestHeaders;
            _urlLoader.load(ur);
            if (_urlTimeOut > 0)
            {
                clearTimeout(_urlTimeOut);
            }
            _urlTimeOut = setTimeout(onUrlTimeoutHandler, 500000);
        }

        private function onUrlTimeoutHandler():void
        {
            clearTimeout(_urlTimeOut);
            _urlTimeOut = 0;
            if (_timeOutInterval == 0)
            {
                onLoadTimeOut();
            }
        }

        public function stop():void
        {
            removeUrlLoadEvent();
            try
            {
                _urlLoader.close();
            }
            catch(e:Error)
            {
            }
            isLoading = false;
            clearTimeout(_timeOutInterval);
            _timeOutInterval = 0;
            clearTimeout(_urlTimeOut);
            _urlTimeOut = 0;
        }

        public function clear():void
        {
            clearTimeout(_urlTimeOut);
            _urlTimeOut = 0;
            clearTimeout(_timeOutInterval);
            _timeOutInterval = 0;
            rslLoadData = null;
            data = null;
            isLoading = false;
            _tryIndex = 0;
            _timeOutInterval = 0;
            _timeOutTryCnt = 0;
            _urlTimeOut = 0;
        }

        private function initUrlLoadEvent():void
        {
            _urlLoader.addEventListener("progress", onUrlProgress);
            _urlLoader.addEventListener("complete", onUrlComplete);
            _urlLoader.addEventListener("ioError", onUrlError);
            _urlLoader.addEventListener("securityError", onUrlError);
        }

        private function removeUrlLoadEvent():void
        {
            _urlLoader.removeEventListener("progress", onUrlProgress);
            _urlLoader.removeEventListener("complete", onUrlComplete);
            _urlLoader.removeEventListener("ioError", onUrlError);
            _urlLoader.removeEventListener("securityError", onUrlError);
        }

        private function onUrlComplete(e:Event):void
        {
            _urlLoader.close();
            clearTimeout(_timeOutInterval);
            _timeOutInterval = 0;
            clearTimeout(_urlTimeOut);
            _urlTimeOut = 0;
            var bytearray:ByteArray = _urlLoader.data;
            var url:String = rslLoadData ? rslLoadData.reqUrl : "未知的资源路径";
            if (_urlLoader.bytesTotal && _urlLoader.bytesTotal != _urlLoader.bytesLoaded)
            {
                trace("_urlLoader download error,url=" + url);
                if (rslLoadData && _tryIndex < rslLoadData.tryCount)
                {
                    load(null);
                }
                else
                {
                    onUrlError(new IOErrorEvent(("bytesTotal != bytesLoaded !!!!! url = " + url)));
                }
                return;
            }
            if (bytearray && bytearray.length == 0)
            {
                trace("bytearray is null length!!!!! url = " + url);
                onUrlError(new IOErrorEvent(("bytearray is null length!!!!! url = " + url)));
            }
            else
            {
                if (bytearray && !FileValidator.validate(bytearray, rslLoadData.type))
                {
                    trace("file data is invalid!!!!! url = " + url);
                    onUrlError(new IOErrorEvent("file data is invalid!!!!! url = " + url));
                }
                else
                {
                    if (_urlLoader.data == null)
                    {
                        Log.error("MultiUrlLoader data is null!!!!! url = " + url);
                        onUrlError(new IOErrorEvent("file data is null!!!!! url = " + url));
                    }
                    else
                    {
                        data = _urlLoader.data;
                        dispatchEvent(e);
                    }
                }
            }
        }

        private function onUrlProgress(e:ProgressEvent):void
        {
            var tm:int;
            dispatchEvent(e);
            if (!_timeOutInterval)
            {
                tm = (e.bytesTotal / 50);
                tm = Math.max(50000, tm);
                if (enableTimeoutReload)
                {
                    _timeOutInterval = setTimeout(onLoadTimeOut, tm);
                }
            }
        }

        private function onLoadTimeOut():void
        {
            var url:String = "";
            clearTimeout(_timeOutInterval);
            _timeOutInterval = 0;
            if (_timeOutTryCnt < 3)
            {
                _timeOutTryCnt++;
                stop();
                load(null);
                url = rslLoadData ? rslLoadData.reqUrl : "错误的资源路径";
                trace("加载超时，重新加载 : ", url);
            }
            else
            {
                dispatchEvent(new IOErrorEvent("networkError"));
            }
        }

        private function onUrlError(e:Event):void
        {
            clearTimeout(_urlTimeOut);
            _urlTimeOut = 0;
            clearTimeout(_timeOutInterval);
            _timeOutInterval = 0;
            if (_tryIndex < rslLoadData.tryCount)
            {
                load(null);
                return;
            }
            data = null;
            dispatchEvent(e);
        }
    }
}