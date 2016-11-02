//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.multi.loader
{
    import flash.events.EventDispatcher;
    import flash.net.URLLoader;
    import org.client.load.loader.multi.vo.LoadData;
    import flash.net.URLRequest;
    import flash.utils.clearTimeout;
    import flash.events.Event;
    import flash.utils.setTimeout;
    import flash.events.ProgressEvent;

    public class UrlLoader extends EventDispatcher 
    {

        private static const TIME_OUT_GAP:Number = 5;

        public static var enableTimeoutReload:Boolean = true;

        private var _urlLoader:URLLoader;
        public var isLocked:Boolean;
        public var isLoading:Boolean;
        public var rslLoadData:LoadData;
        public var data;
        private var _tryIndex:int;
        private var _timeOutInterval:uint = 0;
        private var _timeOutTryCnt:uint = 0;

        public function UrlLoader()
        {
            _urlLoader = new URLLoader();
        }

        public function load($rslLoadData:LoadData):void
        {
            if (($rslLoadData == null))
            {
                _tryIndex++;
            }
            else
            {
                isLoading = true;
                data = null;
                rslLoadData = $rslLoadData;
                _urlLoader.dataFormat = ((rslLoadData.dataFormat) || ("text"));
            };
            initUrlLoadEvent();
            var ur:URLRequest = new URLRequest(rslLoadData.url);
            ur.method = rslLoadData.requestMethod;
            ur.data = rslLoadData.requestData;
            ur.requestHeaders = rslLoadData.requestHeaders;
            _urlLoader.load(ur);
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
            };
            isLoading = false;
            (clearTimeout(_timeOutInterval));
            _timeOutInterval = 0;
        }

        public function clear():void
        {
            rslLoadData = null;
            data = null;
            isLoading = false;
            _tryIndex = 0;
            _timeOutInterval = 0;
            _timeOutTryCnt = 0;
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
            (clearTimeout(_timeOutInterval));
            _timeOutInterval = 0;
            data = _urlLoader.data;
            _urlLoader.data = null;
            dispatchEvent(e);
        }

        private function onUrlProgress(e:ProgressEvent):void
        {
            var tm:int;
            dispatchEvent(e);
            if (!(_timeOutInterval))
            {
                tm = (e.bytesTotal / 5);
                tm = Math.max(5000, tm);
                if (enableTimeoutReload)
                {
                    _timeOutInterval = setTimeout(onLoadTimeOut, tm);
                };
            };
        }

        private function onLoadTimeOut():void
        {
            var url = null;
            if ((_timeOutTryCnt < 3))
            {
                _timeOutTryCnt++;
                stop();
                load(null);
                url = ((rslLoadData) ? (rslLoadData.url) : "错误的资源路径");
                (trace("加载超时，重新加载 : ", url));
            }
            else
            {
                dispatchEvent(new Event("ioError"));
            };
        }

        private function onUrlError(e:Event):void
        {
            (clearTimeout(_timeOutInterval));
            _timeOutInterval = 0;
            if ((_tryIndex < rslLoadData.tryCount))
            {
                load(null);
                return;
            };
            data = null;
            dispatchEvent(e);
        }


    }
}//package org.client.load.loader.multi.loader
