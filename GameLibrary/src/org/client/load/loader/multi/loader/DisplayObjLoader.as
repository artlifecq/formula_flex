//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.multi.loader
{
    import flash.events.EventDispatcher;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import org.client.load.loader.multi.vo.LoadData;
    import flash.display.LoaderInfo;
    import flash.display.DisplayObject;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.utils.clearTimeout;
    import flash.utils.setTimeout;
    import flash.events.ProgressEvent;
    import flash.events.Event;

    public class DisplayObjLoader extends EventDispatcher 
    {

        private static const TIME_OUT_GAP:Number = 5;

        public static var enableTimeoutReload:Boolean = true;
        public static var isPrint:Boolean = false;

        private var _loader:Loader;
        private var _context:LoaderContext;
        public var isLocked:Boolean;
        public var isLoading:Boolean;
        public var rslLoadData:LoadData;
        private var _loaderInfo:LoaderInfo;
        private var _content:DisplayObject;
        private var _timeOutInterval:uint = 0;
        private var _timeOutTryCnt:uint = 0;
        private var _tryIndex:int;

        public function DisplayObjLoader()
        {
            _context = new LoaderContext();
            _loader = new Loader();
        }

        public function get content():DisplayObject
        {
            return (_content);
        }

        public function get loaderInfo():LoaderInfo
        {
            return (_loader.contentLoaderInfo);
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
                _content = null;
                rslLoadData = $rslLoadData;
            };
            initUrlLoadEvent();
            var ur:URLRequest = new URLRequest(rslLoadData.url);
            ur.method = rslLoadData.requestMethod;
            ur.data = rslLoadData.requestData;
            ur.requestHeaders = rslLoadData.requestHeaders;
            if (rslLoadData.allowLoadBytesCode)
            {
                try
                {
                    _context["allowLoadBytesCodeExecution"] = true;
                }
                catch(e:Error)
                {
                };
            };
            if (rslLoadData.allowCodeImport)
            {
                try
                {
                    _context["allowCodeImport"] = true;
                }
                catch(e:Error)
                {
                };
            };
            _context = ((rslLoadData.loaderContext) || (_context));
            _context.applicationDomain = (((rslLoadData.applicationDomain)!=null) ? rslLoadData.applicationDomain : ApplicationDomain.currentDomain);
            try
            {
                _context.imageDecodingPolicy = rslLoadData.imageDecodingPolicy;
            }
            catch(e:Error)
            {
                _context.imageDecodingPolicy = "onDemand";
            };
            _loader.load(ur, _context);
            if (isPrint)
            {
                (trace(("开始加载 : " + rslLoadData.url)));
            };
        }

        public function stop(value:uint=0):void
        {
            if (isPrint)
            {
                (trace("停止加载 : ", value, ((rslLoadData) ? rslLoadData.url : rslLoadData)));
            };
            removeUrlLoadEvent();
            try
            {
                if (rslLoadData.isUnloadAndStop)
                {
                    _loader.unloadAndStop(false);
                }
                else
                {
                    _loader.unload();
                };
                _loader.close();
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
            _content = null;
            _loaderInfo = null;
            isLoading = false;
            _tryIndex = 0;
            _timeOutInterval = 0;
            _timeOutTryCnt = 0;
        }

        private function initUrlLoadEvent():void
        {
            _loader.contentLoaderInfo.addEventListener("progress", onUrlProgress);
            _loader.contentLoaderInfo.addEventListener("complete", onComplete);
            _loader.contentLoaderInfo.addEventListener("ioError", onBytesError);
            _loader.contentLoaderInfo.addEventListener("securityError", onBytesError);
        }

        private function removeUrlLoadEvent():void
        {
            _loader.contentLoaderInfo.removeEventListener("progress", onUrlProgress);
            _loader.contentLoaderInfo.removeEventListener("complete", onComplete);
            _loader.contentLoaderInfo.removeEventListener("ioError", onBytesError);
            _loader.contentLoaderInfo.removeEventListener("securityError", onBytesError);
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
                removeUrlLoadEvent();
                try
                {
                    _loader.close();
                }
                catch(e:Error)
                {
                };
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
            if ((rslLoadData.tryCount > 1))
            {
                if ((_tryIndex < rslLoadData.tryCount))
                {
                    load(null);
                    return;
                };
            };
            _content = null;
            dispatchEvent(e);
        }

        private function onBytesError(e:Event):void
        {
            var url:String = ((rslLoadData) ? (rslLoadData.url) : "错误的资源路径");
            trace("加载显示对象二进制数据的时候出错,请检查显示对象素材 : ", url); //not popped
        }

        private function onComplete(e:Event):void
        {
            if (isPrint)
            {
                (trace(("加载完成 : " + rslLoadData.url)));
            };
            (clearTimeout(_timeOutInterval));
            _timeOutInterval = 0;
            _content = _loader.content;
            if (!((content == null)))
            {
                if ((((rslLoadData.dataFormat == "DISPLAYOBJECT")) && (!((rslLoadData.container == null)))))
                {
                    rslLoadData.container.addChild(content);
                };
            };
            dispatchEvent(e);
        }


    }
}//package org.client.load.loader.multi.loader
