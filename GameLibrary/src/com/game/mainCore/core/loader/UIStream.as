//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader
{
    import flash.events.EventDispatcher;
    import com.game.mainCore.core.loader.loading.ILoading;
    import flash.display.DisplayObjectContainer;
    import flash.net.URLStream;
    import com.game.mainCore.core.manager.LoadingManager;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;

    [Event(name="ioError", type="flash.events.Event")]
    [Event(name="close", type="flash.events.Event")]
    [Event(name="open", type="flash.events.Event")]
    [Event(name="complete", type="flash.events.Event")]
    public class UIStream extends EventDispatcher 
    {

        private var _loadingView:ILoading;
        private var _autoCloseLoading:Boolean;
        private var _parent:DisplayObjectContainer;
        private var _url:String;
        private var _stream:URLStream;

        public function UIStream(parent:DisplayObjectContainer=null, loadingType:int=-1, loadingTitle:String="", autoCloseLoading:Boolean=true)
        {
            _parent = parent;
            _autoCloseLoading = autoCloseLoading;
            _stream = new URLStream();
            _stream.addEventListener("open", onOpenHandler);
            _stream.addEventListener("complete", onCompleteHandler);
            _stream.addEventListener("ioError", onErrorHandler);
            _stream.addEventListener("progress", onProgressHandler);
            _loadingView = LoadingManager.getLoading(loadingType, parent, loadingTitle);
            _loadingView.addEventListener("close", onLoadingCloseHandler);
        }

        public function get loading():ILoading
        {
            return (_loadingView);
        }

        public function get stream():URLStream
        {
            return (_stream);
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

        public function load(url:String):void
        {
            _url = url;
            _stream.load(new URLRequest(_url));
            _loadingView.show();
        }

        public function close():void
        {
            _loadingView.hide();
            if (_stream.connected)
            {
                _stream.close();
            };
            dispatchEvent(new Event("close"));
        }

        public function destroy():void
        {
            close();
            _stream.removeEventListener("open", onOpenHandler);
            _stream.removeEventListener("complete", onCompleteHandler);
            _stream.removeEventListener("ioError", onErrorHandler);
            _stream.removeEventListener("progress", onProgressHandler);
            _loadingView.removeEventListener("close", onLoadingCloseHandler);
            _loadingView.destroy();
            _loadingView = null;
            _parent = null;
            _stream = null;
        }

        private function onOpenHandler(e:Event):void
        {
            dispatchEvent(e);
        }

        private function onCompleteHandler(e:Event):void
        {
            if (_autoCloseLoading)
            {
                _loadingView.hide();
            };
            dispatchEvent(e);
        }

        private function onErrorHandler(e:IOErrorEvent):void
        {
            (trace("加载出错！", _url));
            dispatchEvent(e);
        }

        private function onProgressHandler(e:ProgressEvent):void
        {
            _loadingView.setPercent(e.bytesLoaded, e.bytesTotal);
        }

        private function onLoadingCloseHandler(e:Event):void
        {
            close();
        }


    }
}//package com.game.mainCore.core.loader
