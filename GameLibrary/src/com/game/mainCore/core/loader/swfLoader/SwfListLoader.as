//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.swfLoader
{
    import flash.events.EventDispatcher;
    import flash.net.URLStream;
    import flash.display.Loader;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObjectContainer;
    import com.game.mainCore.core.loader.loading.ILoading;
    import com.game.mainCore.core.manager.LoadingManager;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.display.DisplayObject;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.display.LoaderInfo;
    import flash.events.ProgressEvent;
    import flash.errors.IOError;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    public class SwfListLoader extends EventDispatcher 
    {

        private var _streamLoader:URLStream;
        private var _loader:Loader;
        private var _isCompress:Boolean;
        private var _isLoading:Boolean = false;
        private var _list:Vector.<SwfLoadData>;
        private var _info:SwfLoadData;
        private var _curtCnt:uint = 0;
        private var _allCnt:uint = 1;
        private var _parent:DisplayObjectContainer;
        private var _url:String;
        private var _loadingView:ILoading;
        private var _autoCloseLoading:Boolean;

        public function SwfListLoader(parent:DisplayObjectContainer=null, loadingType:int=-1, loadingTitle:String="", autoCloseLoading:Boolean=true)
        {
            _list = new Vector.<SwfLoadData>();
            super();
            _parent = parent;
            _autoCloseLoading = autoCloseLoading;
            _streamLoader = new URLStream();
            _streamLoader.addEventListener("complete", onComplete);
            _streamLoader.addEventListener("open", onOpen);
            _streamLoader.addEventListener("progress", onProgress);
            _streamLoader.addEventListener("ioError", onIoError);
            _streamLoader.addEventListener("securityError", onSecurityError);
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener("complete", onLoadCmp);
            if (((_parent) || (!((loadingType == -1)))))
            {
                _loadingView = LoadingManager.getLoading(loadingType, parent, loadingTitle);
                _loadingView.addEventListener("close", onLoadingCloseHandler);
                DisplayUtil.align(_loadingView.loadingBar, null, 4);
            };
        }

        public function get loader():Loader
        {
            return (_loader);
        }

        public function get loading():ILoading
        {
            return (_loadingView);
        }

        public function set parent(i:DisplayObjectContainer):void
        {
            _parent = i;
        }

        public function get parent():DisplayObjectContainer
        {
            return (_parent);
        }

        public function set closeEnabled(b:Boolean):void
        {
            _loadingView.closeEnabled = b;
        }

        public function get sharedEvents():EventDispatcher
        {
            return (_loader.contentLoaderInfo.sharedEvents);
        }

        public function get content():DisplayObject
        {
            return (_loader.content);
        }

        public function loadList(list:Vector.<SwfLoadData>):void
        {
            _list = list;
            _curtCnt = 0;
            _allCnt = list.length;
            if (!(_isLoading))
            {
                _isLoading = true;
                _info = _list.shift();
                _streamLoader.load(new URLRequest(_info.path));
            };
        }

        public function close():void
        {
            _isLoading = false;
            if (_loadingView)
            {
                _loadingView.hide();
            };
            if (_streamLoader.connected)
            {
                _streamLoader.close();
            };
            try
            {
                _loader.close();
                _loader.unload();
            }
            catch(e:Error)
            {
            };
            dispatchEvent(new SwfLoadEvent("close"));
        }

        public function destroy():void
        {
            close();
            _streamLoader.removeEventListener("complete", onComplete);
            _streamLoader.removeEventListener("open", onOpen);
            _streamLoader.removeEventListener("progress", onProgress);
            _streamLoader.removeEventListener("ioError", onIoError);
            _streamLoader.removeEventListener("securityError", onSecurityError);
            _streamLoader = null;
            _loader.contentLoaderInfo.removeEventListener("complete", onLoadCmp);
            if (_loadingView)
            {
                _loadingView.removeEventListener("close", onLoadingCloseHandler);
                _loadingView.destroy();
                _loadingView = null;
            };
            _parent = null;
            _loader = null;
        }

        private function onOpen(e:Event):void
        {
            _isLoading = true;
            if (_loadingView)
            {
                _loadingView.show();
            };
            dispatchEvent(e);
        }

        private function onComplete(e:Event):void
        {
            var loadContext = null;
            _isLoading = false;
            var data:ByteArray = new ByteArray();
            _streamLoader.readBytes(data);
            if (_info.isCompress)
            {
                data.uncompress();
            };
            if (!((_info.decodeFun == null)))
            {
                data = _info.decodeFun(data);
            };
            if (_info.isByte)
            {
                _info.data = data;
                if (!((_info.completeFun == null)))
                {
                    _info.completeFun(_info);
                };
                dispatchCmpEvent();
            }
            else
            {
                if (_info.isCurrentDomain)
                {
                    loadContext = new LoaderContext(false, ApplicationDomain.currentDomain);
                    loadContext.allowCodeImport = true;
                    _loader.loadBytes(data, loadContext);
                }
                else
                {
                    _loader.loadBytes(data);
                };
            };
        }

        private function onLoadCmp(e:Event):void
        {
            var info:LoaderInfo = (e.currentTarget as LoaderInfo);
            _info.data = info;
            dispatchCmpEvent();
        }

        private function dispatchCmpEvent():void
        {
            _curtCnt++;
            if ((_curtCnt == _allCnt))
            {
                dispatchEvent(new SwfLoadEvent("item_complete", _info));
                dispatchEvent(new SwfLoadEvent("all_complete"));
            }
            else
            {
                _isLoading = false;
                if (((_autoCloseLoading) && (_loadingView)))
                {
                    _loadingView.hide();
                };
                dispatchEvent(new SwfLoadEvent("item_complete", _info));
            };
            if (((!(_isLoading)) && (_list.length)))
            {
                _isLoading = true;
                _info = _list.shift();
                _streamLoader.load(new URLRequest(_info.path));
            };
        }

        private function onProgress(e:ProgressEvent):void
        {
            var percent:uint = ((e.bytesLoaded / e.bytesTotal) * 100);
            percent = (((_curtCnt / _allCnt) * 100) + ((1 / _allCnt) * percent));
            if (_loadingView)
            {
                _loadingView.setPercent(percent, 100);
            };
            dispatchEvent(new SwfLoadEvent("progress", percent));
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

        private function onLoadingCloseHandler(e:Event):void
        {
            close();
        }


    }
}//package com.game.mainCore.core.loader.swfLoader
