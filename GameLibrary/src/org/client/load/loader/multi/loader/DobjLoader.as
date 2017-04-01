//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.multi.loader
{
    import flash.events.EventDispatcher;
    import flash.net.URLLoader;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import org.client.load.loader.multi.vo.LoadData;
    import flash.display.LoaderInfo;
    import flash.display.DisplayObject;
    import flash.system.ApplicationDomain;
    import flash.utils.clearTimeout;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import flash.utils.setTimeout;
    import flash.events.ProgressEvent;

    public class DobjLoader extends EventDispatcher 
    {

        private static const TIME_OUT_GAP:Number = 5;

        public static var enableTimeoutReload:Boolean = true;
        public static var isPrint:Boolean = false;

        private var _urlLoader:URLLoader;
        private var _loader:Loader;
        private var _context:LoaderContext;
        public var isLocked:Boolean;
        public var isLoading:Boolean;
        private var _isBytesLoaded:Boolean = false;
        public var rslLoadData:LoadData;
        private var _loaderInfo:LoaderInfo;
        private var _content:DisplayObject;
        private var _timeOutInterval:uint = 0;
        private var _timeOutTryCnt:uint = 0;
        private var _tryIndex:int;

        public function DobjLoader()
        {
            _context = new LoaderContext();
            _urlLoader = new URLLoader();
            _urlLoader.dataFormat = "binary";
            _loader = new Loader();
        }

        public static function getClass($className:String, $applicationDomain:ApplicationDomain=null):Class
        {
            if (((($className == null)) || (($className == ""))))
            {
                return (null);
            };
            if (($applicationDomain == null))
            {
                $applicationDomain = ApplicationDomain.currentDomain;
            };
            if ($applicationDomain.hasDefinition($className))
            {
                return (($applicationDomain.getDefinition($className) as Class));
            };
            return (null);
        }

        public static function getInstance($className:String, $applicationDomain:ApplicationDomain=null, ... str)
        {
            var Instance:Class = getClass($className, $applicationDomain);
            var instance = getInstanceByClass(Instance, str);
            return (instance);
        }

        public static function getInstanceByClass($class:Class, $params:Array=null)
        {
            var instance:*;
            if ($class == null)
            {
                return (null);
            };
            var len:int = (($params) ? ($params.length) : 0);
            switch (len)
            {
                case 0:
                    instance = new ($class)();
                    break;
                case 1:
                    instance = new ($class)($params[0]);
                    break;
                case 2:
                    instance = new ($class)($params[0], $params[1]);
                    break;
                case 3:
                    instance = new ($class)($params[0], $params[1], $params[2]);
                    break;
                case 4:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3]);
                    break;
                case 5:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4]);
                    break;
                case 6:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5]);
                    break;
                case 7:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6]);
                    break;
                case 8:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7]);
                    break;
                case 9:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8]);
                    break;
                case 10:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9]);
                    break;
                case 11:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9], $params[10]);
                    break;
                case 12:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9], $params[10], $params[11]);
                    break;
                case 13:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9], $params[10], $params[11], $params[12]);
                    break;
                case 14:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9], $params[10], $params[11], $params[12], $params[13]);
                    break;
                case 15:
                    instance = new ($class)($params[0], $params[1], $params[2], $params[3], $params[4], $params[5], $params[6], $params[7], $params[8], $params[9], $params[10], $params[11], $params[12], $params[13], $params[14]);
                default:
            };
            return (instance);
        }


        public function get content():DisplayObject
        {
            return (_content);
        }

        public function get loaderInfo():LoaderInfo
        {
            return (_loader.contentLoaderInfo);
        }

        public function get isBytesLoaded():Boolean
        {
            return (_isBytesLoaded);
        }

        public function load($rslLoadData:LoadData):void
        {
            if (($rslLoadData == null))
            {
                _tryIndex++;
            }
            else
            {
                _timeOutTryCnt = 0;
                _isBytesLoaded = false;
                isLoading = true;
                _content = null;
                rslLoadData = $rslLoadData;
            };
            initUrlLoadEvent();
            if (_timeOutInterval)
            {
                (clearTimeout(_timeOutInterval));
                _timeOutInterval = 0;
            };
            var ur:URLRequest = new URLRequest(rslLoadData.url);
            ur.method = rslLoadData.requestMethod;
            ur.data = rslLoadData.requestData;
            ur.requestHeaders = rslLoadData.requestHeaders;
            _urlLoader.load(ur);
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
                _urlLoader.close();
            }
            catch(e:Error)
            {
            };
            try
            {
                _loader.contentLoaderInfo.removeEventListener("complete", onComplete);
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
            _isBytesLoaded = false;
            (clearTimeout(_timeOutInterval));
            _timeOutInterval = 0;
        }

        public function clear():void
        {
            rslLoadData = null;
            _content = null;
            _loaderInfo = null;
            isLoading = false;
            _isBytesLoaded = false;
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
            _loader.contentLoaderInfo.removeEventListener("complete", onComplete);
            _loader.contentLoaderInfo.removeEventListener("ioError", onBytesError);
            _loader.contentLoaderInfo.removeEventListener("securityError", onBytesError);
        }

        private function onUrlComplete(e:Event):void
        {
            _isBytesLoaded = true;
            var bytes:ByteArray = e.currentTarget.data;
            if (!((rslLoadData.decode == null)))
            {
                bytes = rslLoadData.decode(bytes);
            };
            bytes.position = 0;
            _loader.contentLoaderInfo.addEventListener("ioError", onBytesError);
            _loader.contentLoaderInfo.addEventListener("securityError", onBytesError);
            _loader.contentLoaderInfo.addEventListener("complete", onComplete);
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
            if ((rslLoadData.dataFormat == "DISPLAYOBJECT"))
            {
                _context.applicationDomain = null;
            }
            else
            {
                _context.applicationDomain = (((rslLoadData.applicationDomain)!=null) ? rslLoadData.applicationDomain : ApplicationDomain.currentDomain);
            };
            try
            {
                _context.imageDecodingPolicy = rslLoadData.imageDecodingPolicy;
            }
            catch(e:Error)
            {
                _context.imageDecodingPolicy = "onDemand";
            };
            _loader.loadBytes(bytes, _context);
            if (isPrint)
            {
                (trace(("文件加载成功,开始二进制加载 : " + rslLoadData.url)));
            };
            if (!((bytes == e.currentTarget.data)))
            {
                if ((e.currentTarget.data is ByteArray))
                {
                    e.currentTarget.data.clear();
                };
                e.currentTarget.data = null;
            };
            bytes.clear();
            bytes = null;
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
                    _urlLoader.close();
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
            if ((_tryIndex < rslLoadData.tryCount))
            {
                load(null);
                return;
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
