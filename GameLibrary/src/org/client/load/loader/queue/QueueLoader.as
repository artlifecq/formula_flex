//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.queue
{
    import flash.events.EventDispatcher;
    import flash.utils.clearTimeout;
    import flash.net.URLRequest;
    import flash.utils.setTimeout;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.events.ProgressEvent;

    public class QueueLoader extends EventDispatcher 
    {

        public static const QUEUE_LOADER_ERROR:String = "queueLoaderError";
        public static const QUEUE_LOADER_TIMEOUT:String = "queueLoaderTimeout";
        public static const HIGHEST:int = 0;
        public static const HIGH:int = 1;
        public static const STANDARD:int = 2;
        public static const LOW:int = 3;
        public static const LOWEST:int = 4;

        public static var isPrint:Boolean = false;
        private static var _instance:QueueLoader;

        private var _waitList:Array;
        private var _isStop:Boolean = false;
        private var _loader:QueueStream;
        private var _isCpuing:Boolean = false;
        private var _timeoutID:uint;

        public function QueueLoader()
        {
            _waitList = [];
            _loader = new QueueStream();
            super();
        }

        public static function get instance():QueueLoader
        {
            if ((_instance == null))
            {
                _instance = new (QueueLoader)();
            };
            return (_instance);
        }


        public function load(url:String, event:Function, error:Function=null, progress:Function=null, level:int=2):void
        {
            var item = null;
            for each (item in _waitList)
            {
                if ((item.url == url))
                {
                    if ((item.event == event))
                    {
                        return;
                    };
                };
            };
            var info:QueueInfo = new QueueInfo();
            info.url = url;
            info.event = event;
            info.error = error;
            info.progress = progress;
            info.level = level;
            _waitList.push(info);
            _waitList.sortOn("level", 16);
            if (_loader.info)
            {
                if ((level == 0))
                {
                    if (!((_loader.info.level == 0)))
                    {
                        nextLoad();
                    };
                };
            }
            else
            {
                nextLoad();
            };
        }

        public function addBef(url:String):void
        {
            var info = null;
            for each (info in _waitList)
            {
                if ((info.url == url))
                {
                    return;
                };
            };
            info = new QueueInfo();
            info.level = 4;
            info.url = url;
            _waitList.push(info);
            if ((_loader.info == null))
            {
                nextLoad();
            };
        }

        public function stop():void
        {
            _isStop = true;
            close();
            _loader.info = null;
        }

        public function start():void
        {
            if (_isStop)
            {
                _isStop = false;
                nextLoad();
            };
        }

        public function cancelAll():void
        {
            stop();
            _waitList = [];
        }

        public function cancel(url:String, event:Function):void
        {
            var item = null;
            var i:int;
            if ((event == null))
            {
                return;
            };
            var len:int = _waitList.length;
            while (i < len)
            {
                item = _waitList[i];
                if ((item.url == url))
                {
                    if ((item.event == event))
                    {
                        _waitList.splice(i, 1);
                        break;
                    };
                };
                i++;
            };
            var info:QueueInfo = _loader.info;
            if (info)
            {
                if ((info.url == url))
                {
                    if ((info.event == event))
                    {
                        nextLoad();
                    };
                };
            };
        }

        public function cancelURL(url:String):void
        {
            remove(url);
            var info:QueueInfo = _loader.info;
            if (info)
            {
                if ((info.url == url))
                {
                    nextLoad();
                };
            };
        }

        private function close():void
        {
            _loader.removeEventListener("open", onOpen);
            _loader.removeEventListener("complete", onComplete);
            _loader.removeEventListener("progress", onProgress);
            _loader.removeEventListener("ioError", onIOError);
            _loader.removeEventListener("securityError", onIOError);
            if (_loader.connected)
            {
                _loader.close();
            };
        }

        private function remove(url:String):void
        {
            var item = null;
            var i:int;
            var len:int = _waitList.length;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == url))
                    {
                        _waitList.splice(i, 1);
                        i--;
                    };
                };
                i++;
            };
        }

        private function nextLoad():void
        {
            var info = null;
            (clearTimeout(_timeoutID));
            if (_isCpuing)
            {
                return;
            };
            if (_isStop)
            {
                return;
            };
            close();
            if ((_waitList.length > 0))
            {
                _loader.addEventListener("open", onOpen);
                _loader.addEventListener("complete", onComplete);
                _loader.addEventListener("progress", onProgress);
                _loader.addEventListener("ioError", onIOError);
                _loader.addEventListener("securityError", onIOError);
                info = _waitList[0];
                _loader.info = info;
                _loader.load(new URLRequest(info.url));
                _timeoutID = setTimeout(onTimeout, 5000);
                if (isPrint)
                {
                    (trace("QueueLoader.nextLoad:", info.url));
                };
            }
            else
            {
                _loader.info = null;
            };
        }

        private function onTimeout():void
        {
            if (_loader.info)
            {
                if ((_loader.info.timeCount >= 3))
                {
                    remove(_loader.info.url);
                    dispatchEvent(new Event("queueLoaderTimeout"));
                }
                else
                {
                    _loader.info.timeCount++;
                };
                nextLoad();
            };
        }

        private function onOpen(e:Event):void
        {
            clearTimeout(_timeoutID); //not popped
        }

        private function onComplete(e:Event):void
        {
            var item = null;
            var i:int;
            _isCpuing = true;
            var info:QueueInfo = _loader.info;
            var data:ByteArray = new ByteArray();
            _loader.readBytes(data);
            close();
            _loader.info = null;
            if (isPrint)
            {
                (trace("QueueLoader.onComplete:", info.url));
            };
            var len:int = _waitList.length;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == info.url))
                    {
                        _waitList.splice(i, 1);
                        i--;
                        if (!((item.event == null)))
                        {
                            item.event(item.url, data);
                        };
                        item.event = null;
                        item.error = null;
                    };
                };
                i++;
            };
            _isCpuing = false;
            nextLoad();
        }

        private function onProgress(e:ProgressEvent):void
        {
            var percent:Number = ((e.bytesLoaded / e.bytesTotal) * 100);
            var info:QueueInfo = _loader.info;
            if (((info) && (!((info.progress == null)))))
            {
                info.progress(info.url, percent);
            };
        }

        private function onIOError(e:Event):void
        {
            var item = null;
            var i:int;
            (clearTimeout(_timeoutID));
            _isCpuing = true;
            var info:QueueInfo = _loader.info;
            close();
            var len:int = _waitList.length;
            while (i < len)
            {
                item = _waitList[i];
                if (item)
                {
                    if ((item.url == info.url))
                    {
                        _waitList.splice(i, 1);
                        i--;
                        if (!((item.error == null)))
                        {
                            item.error(info.url);
                        };
                        item.event = null;
                        item.error = null;
                    };
                };
                i++;
            };
            _isCpuing = false;
            nextLoad();
            dispatchEvent(new Event("queueLoaderError"));
            trace(("QueueLoader资源加载路径不正确:" + info.url)); //not popped
        }


    }
}//package org.client.load.loader.queue
