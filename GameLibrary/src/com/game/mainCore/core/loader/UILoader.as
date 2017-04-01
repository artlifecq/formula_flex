//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader
{
    import flash.events.EventDispatcher;
    import com.game.mainCore.core.loader.loading.ILoading;
    import flash.display.DisplayObjectContainer;
    import flash.display.Loader;
    import flash.net.URLStream;
    import com.game.mainCore.core.manager.LoadingManager;
    import flash.display.DisplayObject;
    import flash.net.URLRequest;
    import com.game.mainCore.core.loader.events.UILoadEvent;
    import flash.events.Event;
    import flash.utils.ByteArray;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;

    [Event(name="ioError", type="flash.events.IOErrorEvent")]
    [Event(name="close", type="com.rpgGame.core.events.UILoadEvent")]
    [Event(name="open", type="com.rpgGame.core.events.UILoadEvent")]
    [Event(name="complete", type="com.rpgGame.core.events.UILoadEvent")]
    public class UILoader extends EventDispatcher 
    {

        private var _loadingView:ILoading;
        private var _autoCloseLoading:Boolean;
        private var _parent:DisplayObjectContainer;
        private var _url:String;
        private var _loader:Loader;
        private var _isCurrentApp:Boolean;
        private var _isLoading:Boolean = false;
        private var _stream:URLStream;
        private var _decode:Function;

        public function UILoader(url:String="", parent:DisplayObjectContainer=null, loadingType:int=-1, loadingTitle:String="", autoCloseLoading:Boolean=true, isCurrentApp:Boolean=false, decode:Function=null)
        {
            _isCurrentApp = isCurrentApp;
            _url = url;
            _parent = parent;
            _autoCloseLoading = autoCloseLoading;
            _decode = decode;
            _stream = new URLStream();
            _stream.addEventListener("open", onOpenHandler);
            _stream.addEventListener("complete", onStreamComplete);
            _stream.addEventListener("ioError", onErrorHandler);
            _stream.addEventListener("progress", onProgressHandler);
            _loader = new Loader();
            _loader.contentLoaderInfo.addEventListener("complete", onCompleteHandler);
            _loadingView = LoadingManager.getLoading(loadingType, parent, loadingTitle);
            _loadingView.addEventListener("close", onLoadingCloseHandler);
        }

        public function get loading():ILoading
        {
            return (_loadingView);
        }

        public function get loader():Loader
        {
            return (_loader);
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

        public function load(url:String=""):void
        {
            if (!((url == "")))
            {
                _url = url;
            };
            if (!((_url == "")))
            {
                _stream.load(new URLRequest(_url));
                _isLoading = true;
            };
        }

        public function close():void
        {
            _isLoading = false;
            _loadingView.hide();
            try
            {
                _loader.close();
            }
            catch(e:Error)
            {
            };
            dispatchEvent(new UILoadEvent("close", this));
        }

        public function destroy():void
        {
            close();
            _loader.contentLoaderInfo.removeEventListener("open", onOpenHandler);
            _loader.contentLoaderInfo.removeEventListener("complete", onCompleteHandler);
            _loader.contentLoaderInfo.removeEventListener("ioError", onErrorHandler);
            _loader.contentLoaderInfo.removeEventListener("progress", onProgressHandler);
            _loadingView.removeEventListener("close", onLoadingCloseHandler);
            _loadingView.destroy();
            _loadingView = null;
            _parent = null;
            _loader = null;
        }

        private function onOpenHandler(e:Event):void
        {
            _loadingView.show();
            dispatchEvent(new UILoadEvent("open", this));
        }

        private function onStreamComplete(e:Event):void
        {
            var byteArray:ByteArray = new ByteArray();
            _stream.readBytes(byteArray);
            if (!((_decode == null)))
            {
                byteArray = _decode(byteArray);
            };
            _stream.close();
            var context:LoaderContext = new LoaderContext();
            if (_isCurrentApp)
            {
                context.applicationDomain = ApplicationDomain.currentDomain;
                context.allowCodeImport = true;
            };
            _loader.loadBytes(byteArray, context);
        }

        private function onCompleteHandler(e:Event):void
        {
            _isLoading = false;
            if (_autoCloseLoading)
            {
                _loadingView.hide();
            };
            dispatchEvent(new UILoadEvent("complete", this));
        }

        private function onErrorHandler(e:IOErrorEvent):void
        {
            _isLoading = false;
            dispatchEvent(e);
            trace("加载出错！", _url); //not popped
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
