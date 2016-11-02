//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.model
{
    import flash.events.EventDispatcher;
    import org.client.mainCore.module.IDisplayModule;
    import com.game.mainCore.core.loader.UILoader;
    import flash.events.IEventDispatcher;
    import com.game.mainCore.core.manager.LayerManager;
    import flash.events.Event;
    import com.game.mainCore.core.loader.events.UILoadEvent;
    import flash.events.IOErrorEvent;

    public class AppModel extends EventDispatcher 
    {

        private static const ADD:int = 0;
        private static const SHOW:int = 1;
        private static const HIDE:int = 2;

        public static var decode:Function;

        private var _state:int = 2;
        private var _hasSetup:Boolean = false;
        private var _isLoading:Boolean = false;
        private var _url:String;
        private var _title:String;
        private var _mode:IDisplayModule;
        private var _data:Object;
        private var _loader:UILoader;
        private var _events:IEventDispatcher;

        public function AppModel(url:String, title:String)
        {
            _events = new EventDispatcher();
            super();
            _url = url;
            _title = title;
        }

        public function get hasSetup():Boolean
        {
            return (_hasSetup);
        }

        public function get url():String
        {
            return (_url);
        }

        public function get events():IEventDispatcher
        {
            return (_events);
        }

        public function get module():IDisplayModule
        {
            return (_mode);
        }

        public function get hasParent():Boolean
        {
            if (_mode)
            {
                return ((((_mode.parentContainer)==null) ? false : true));
            };
            return (false);
        }

        public function add():void
        {
            _state = 0;
            setup();
        }

        public function setupModule():void
        {
            _hasSetup = true;
            _mode.setup();
        }

        public function setup():void
        {
            if (_mode)
            {
                return;
            };
            if (_isLoading)
            {
                return;
            };
            var loadingType:uint = (((_state)==0) ? -1 : 1);
            _isLoading = true;
            _loader = new UILoader(_url, LayerManager.topLevel, loadingType, _title, true, true, decode);
            _loader.addEventListener("complete", onLoadComplete);
            _loader.addEventListener("close", onLoadClose);
            _loader.addEventListener("ioError", onError);
            _loader.load();
        }

        public function init(data:Object=null):void
        {
            _data = data;
            if (_mode)
            {
                _mode.init(data);
            };
            setup();
        }

        public function show():void
        {
            _state = 1;
            if (!(hasParent))
            {
                if (_mode)
                {
                    _mode.show();
                };
            };
            setup();
        }

        public function hide():void
        {
            _state = 2;
            if (hasParent)
            {
                _mode.hide();
            };
        }

        public function destroy():void
        {
            _isLoading = false;
            clearLoaderEvent();
            if (_loader)
            {
                _loader.destroy();
                _loader = null;
            };
            clearModeEvent();
            if (_mode)
            {
                _mode.destroy();
                _mode = null;
            };
            _data = null;
            _events = null;
        }

        private function clearLoaderEvent():void
        {
            if (_loader)
            {
                _loader.removeEventListener("complete", onLoadComplete);
                _loader.removeEventListener("close", onLoadClose);
                _loader.removeEventListener("ioError", onError);
            };
        }

        private function clearModeEvent():void
        {
            if (_mode)
            {
            };
        }

        private function onLoadComplete(e:UILoadEvent):void
        {
            _loader.removeEventListener("complete", onLoadComplete);
            _loader.removeEventListener("close", onLoadClose);
            _loader.removeEventListener("ioError", onError);
            _isLoading = false;
            _mode = (e.uiloader.content as IDisplayModule);
            _events = (_mode as IEventDispatcher);
            if ((_state == 1))
            {
                _hasSetup = true;
                _mode.setup();
                if (!((_data == null)))
                {
                    _mode.init(_data);
                };
                _mode.show();
            };
            dispatchEvent(new Event("complete"));
        }

        private function onLoadClose(e:UILoadEvent):void
        {
            destroy();
            dispatchEvent(new Event("close"));
        }

        private function onError(e:IOErrorEvent):void
        {
            destroy();
            dispatchEvent(e);
            trace("应用模块加载出错", e.text); //not popped
        }

        private function onModeShow(e:Event):void
        {
            _state = 1;
            dispatchEvent(e);
        }

        private function onModeHide(e:Event):void
        {
            _state = 2;
            dispatchEvent(e);
        }

        private function onModeDestroy(e:Event):void
        {
            _isLoading = false;
            clearLoaderEvent();
            if (_loader)
            {
                _loader.destroy();
                _loader = null;
            };
            clearModeEvent();
            if (_mode)
            {
                _mode = null;
            };
            _data = null;
            _events = null;
        }


    }
}//package com.game.mainCore.core.model
