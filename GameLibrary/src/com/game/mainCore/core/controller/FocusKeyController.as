package com.game.mainCore.core.controller
{
    import com.game.mainCore.core.manager.LayerManager;
    
    import flash.display.InteractiveObject;
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.KeyboardEvent;

    public class FocusKeyController extends EventDispatcher 
    {

        private static var _instance:FocusKeyController;

        private var _target:String = "";


        public static function get instance():FocusKeyController
        {
            if (_instance == null)
            {
                _instance = new FocusKeyController();
            }
            return _instance;
        }

        public static function destroy():void
        {
            if (_instance)
            {
                _instance.destroy();
                _instance = null;
            }
        }

        public static function addFocusKeyListener(keyCode:uint, listener:Function):void
        {
            instance.addEventListener(instance._target + keyCode.toString(), listener);
        }

        public static function removeFocusKeyListener(keyCode:uint, listener:Function):void
        {
            instance.removeEventListener(instance._target + keyCode.toString(), listener);
        }

        public static function addKeyListener(keyCode:uint, listener:Function):void
        {
            instance.addEventListener(keyCode.toString(), listener);
        }

        public static function removeKeyListener(keyCode:uint, listener:Function):void
        {
            instance.removeEventListener(keyCode.toString(), listener);
        }


        public function init():void
        {
            LayerManager.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }

        public function clear():void
        {
            LayerManager.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }

        public function destroy():void
        {
            clear();
        }

        public function setTarget(target:InteractiveObject):void
        {
            _target = target.name;
        }

        public function resetTarget():void
        {
            _target = "";
        }

        private function onKeyDown(e:KeyboardEvent):void
        {
            dispatchEvent(new Event(_target + e.keyCode.toString()));
        }
    }
}