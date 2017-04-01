//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.xmlLoader
{
    import flash.events.EventDispatcher;
    import flash.net.URLStream;
    import __AS3__.vec.Vector;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.events.ProgressEvent;
    import flash.errors.IOError;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    public class XMLListLoader extends EventDispatcher 
    {

        private var _xmlloader:URLStream;
        private var _isCompress:Boolean;
        private var _isLoading:Boolean = false;
        private var _list:Vector.<XMLLoadData>;
        private var _info:XMLLoadData;
        private var _curtCnt:uint = 0;
        private var _allCnt:uint = 1;

        public function XMLListLoader()
        {
            _list = new Vector.<XMLLoadData>();
            super();
            _xmlloader = new URLStream();
            _xmlloader.addEventListener("complete", onComplete);
            _xmlloader.addEventListener("open", onOpen);
            _xmlloader.addEventListener("progress", onProgress);
            _xmlloader.addEventListener("ioError", onIoError);
            _xmlloader.addEventListener("securityError", onSecurityError);
        }

        public function close():void
        {
            if (_xmlloader.connected)
            {
                _xmlloader.close();
            };
        }

        public function loadList(list:Vector.<XMLLoadData>):void
        {
            _list = list.concat();
            _curtCnt = 0;
            _allCnt = list.length;
            if (!(_isLoading))
            {
                _info = _list.shift();
                _xmlloader.load(new URLRequest(_info.path));
            };
        }

        public function destroy():void
        {
            close();
            _xmlloader.removeEventListener("complete", onComplete);
            _xmlloader.removeEventListener("open", onOpen);
            _xmlloader.removeEventListener("progress", onProgress);
            _xmlloader.removeEventListener("ioError", onIoError);
            _xmlloader.removeEventListener("securityError", onSecurityError);
            _xmlloader = null;
        }

        private function onOpen(e:Event):void
        {
            _isLoading = true;
            dispatchEvent(e);
        }

        private function onComplete(e:Event):void
        {
            (trace(("配置文件加载成功 : " + _info.path)));
            _isLoading = false;
            var data:ByteArray = new ByteArray();
            _xmlloader.readBytes(data);
            if (_info.isCompress)
            {
                data.uncompress();
            };
            if (!!((_info.decodeFun == null)))
            {
                _info.data = XML(data.readUTFBytes(data.bytesAvailable));
            };
            if (!((_info.completeFun == null)))
            {
                _info.completeFun(_info);
            };
            _curtCnt++;
            if (_list.length)
            {
                _info = _list.shift();
                _xmlloader.load(new URLRequest(_info.path));
            };
            if ((_curtCnt == _allCnt))
            {
                dispatchEvent(new XMLLoadEvent("item_complete", _info));
                dispatchEvent(new XMLLoadEvent("all_complete"));
            }
            else
            {
                dispatchEvent(new XMLLoadEvent("item_complete", _info));
            };
        }

        private function onProgress(e:ProgressEvent):void
        {
            var percent:uint = ((e.bytesLoaded / e.bytesTotal) * 100);
            percent = (((_curtCnt / _allCnt) * 100) + ((1 / _allCnt) * percent));
            dispatchEvent(new XMLLoadEvent("progress", percent));
        }

        private function onIoError(e:IOErrorEvent):void
        {
            dispatchEvent(e);
            throw (new IOError(e.text));
        }

        private function onSecurityError(e:SecurityErrorEvent):void
        {
            dispatchEvent(e);
            throw (new SecurityError(e.text));
        }


    }
}//package com.game.mainCore.core.loader.xmlLoader
