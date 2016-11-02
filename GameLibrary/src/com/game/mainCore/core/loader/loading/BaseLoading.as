//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.loading
{
    import flash.events.EventDispatcher;
    import flash.display.MovieClip;
    import flash.display.DisplayObjectContainer;
    import flash.display.InteractiveObject;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import com.game.mainCore.core.manager.LoadingManager;
    import flash.display.Sprite;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.events.Event;
    import flash.events.MouseEvent;

    [Event(name="close", type="flash.events.Event")]
    public class BaseLoading extends EventDispatcher implements ILoading 
    {

        private static const KEY:String = "baseLoading";

        protected var _loadingBar:MovieClip;
        protected var _parent:DisplayObjectContainer;
        protected var _percent:Number;
        protected var _closeEnabled:Boolean;
        protected var _closeBtn:InteractiveObject;
        protected var _percentBar:DisplayObject;
        protected var _percentText:TextField;
        protected var _alignType:uint;

        public function BaseLoading(parent:DisplayObjectContainer=null, closeEnabled:Boolean=false, align:uint=4)
        {
            _parent = parent;
            _loadingBar = LoadingManager.getMovieClip(key);
            _closeBtn = _loadingBar["closeBtn"];
            _percentBar = _loadingBar["loadingbar"];
            _percentText = _loadingBar["perNum"];
            _alignType = align;
            if (_percentText)
            {
                _percentText.text = "0%";
            };
            if (_closeBtn)
            {
                if ((_closeBtn is Sprite))
                {
                    Sprite(_closeBtn).buttonMode = true;
                };
            };
            this.closeEnabled = closeEnabled;
        }

        public function setPercent(loaded:Number, total:Number):void
        {
            _percent = Math.floor(((loaded / total) * 100));
        }

        public function show():void
        {
            if (_parent)
            {
                alignType = _alignType;
                _parent.addChild(_loadingBar);
            };
        }

        public function hide():void
        {
            DisplayUtil.removeForParent(_loadingBar);
            if (((parent) && (parent.stage)))
            {
                parent.stage.removeEventListener("resize", onStgResize);
            };
        }

        public function destroy():void
        {
            if (!((_closeBtn == null)))
            {
                _closeBtn.removeEventListener("click", onCloseHandler);
                _closeBtn = null;
            };
            DisplayUtil.removeForParent(_loadingBar);
            _loadingBar = null;
            _parent = null;
            _percentText = null;
        }

        public function get loadingBar():DisplayObject
        {
            return (_loadingBar);
        }

        public function get parent():DisplayObjectContainer
        {
            return (_parent);
        }

        public function set closeEnabled(b:Boolean):void
        {
            _closeEnabled = b;
            if (!((_closeBtn == null)))
            {
                if (_closeEnabled)
                {
                    _closeBtn.visible = _closeEnabled;
                    _closeBtn.addEventListener("click", onCloseHandler);
                }
                else
                {
                    _closeBtn.visible = _closeEnabled;
                    _closeBtn.removeEventListener("click", onCloseHandler);
                };
            };
        }

        public function get alignType():uint
        {
            return (_alignType);
        }

        public function set alignType(value:uint):void
        {
            _alignType = value;
            if (((parent) && (parent.stage)))
            {
                parent.stage.addEventListener("resize", onStgResize);
            };
            onStgResize();
        }

        public function set title(str:String):void
        {
        }

        public function get key():String
        {
            return ("baseLoading");
        }

        public function set text(str:String):void
        {
        }

        private function onCloseHandler(e:MouseEvent):void
        {
            dispatchEvent(new Event("close"));
        }

        private function onStgResize(e:Event=null):void
        {
            switch (_alignType)
            {
                case 4:
                    _loadingBar.x = ((parent.stage.stageWidth - _loadingBar.width) * 0.5);
                    _loadingBar.y = ((parent.stage.stageHeight - _loadingBar.height) * 0.5);
                    return;
                case 7:
                    _loadingBar.x = ((parent.stage.stageWidth - _loadingBar.width) * 0.5);
                    _loadingBar.y = (parent.stage.stageHeight - _loadingBar.height);
                default:
                    return;
            };
        }


    }
}//package com.game.mainCore.core.loader.loading
