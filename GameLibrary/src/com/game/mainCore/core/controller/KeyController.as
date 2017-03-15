package com.game.mainCore.core.controller
{
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;
    import com.game.mainCore.core.manager.LayerManager;
    import flash.system.IME;
    import org.client.mainCore.manager.EventManager;
    import com.game.mainCore.core.info.key.KeysCodeInfo;
    import flash.utils.getTimer;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.display.InteractiveObject;
    import flash.events.FocusEvent;
    import flash.text.TextField;

    public class KeyController 
    {

        public static var printFun:Function;
        public static var shift_down:Boolean = false;
        public static var ctrl_down:Boolean = false;
        public static var enable:Boolean = false;
        public static var isPrint:Boolean = false;
        private static var _instance:KeyController;

        private var _downKeyCode:uint;
        private var _upKeyCode:uint;
        private var _isTextFieldFocus:Boolean = false;

        {
            setup();
        }


        public static function get instance():KeyController
        {
            if (_instance == null)
            {
                _instance = new KeyController();
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

        private static function setup():void
        {
        }

        public static function isParentChild($parent:DisplayObjectContainer, $child:DisplayObject):Boolean
        {
            if ($child == null || $parent == null || $child.parent == null)
            {
                return false;
            }
            if ($child.parent == $parent)
            {
                return true;
            }
            return isParentChild($parent, $child.parent);
        }


        public function get isTextFieldFocus():Boolean
        {
            return _isTextFieldFocus;
        }

        public function set isTextFieldFocus(value:Boolean):void
        {
            _isTextFieldFocus = value;
        }

        public function isKeyDown(key:uint):Boolean
        {
            return _downKeyCode == key;
        }

        public function init():void
        {
            LayerManager.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown, false, 2147483647);
            LayerManager.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp, false, 2147483647);
            LayerManager.stage.addEventListener(Event.DEACTIVATE, onDeactivate, false, 2147483647);
            LayerManager.stage.addEventListener(Event.REMOVED, onRemove, false, 2147483647);
            IME.enabled = false;
        }

        public function clear():void
        {
            EventManager.dispatchEvent("KeyCodeEvent.keys_clear");
            shift_down = false;
            ctrl_down = false;
            LayerManager.stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            LayerManager.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
            LayerManager.stage.removeEventListener(Event.DEACTIVATE, onDeactivate);
            LayerManager.stage.removeEventListener(Event.REMOVED, onRemove);
        }

        public function destroy():void
        {
            clear();
        }

        public function excuteDownKey():void
        {
            var info:KeysCodeInfo = new KeysCodeInfo();
            info.code = _downKeyCode;
            info.time = getTimer();
            if (isPrint)
            {
//                trace("keyDown : " + _downKeyCode);
                if (printFun != null)
                {
                    printFun("keyDown : " + _downKeyCode);
                }
            }
            EventManager.dispatchEvent("KeyCodeEvent.keys_down", info);
        }

        public function excuteUpKey():void
        {
            var info:KeysCodeInfo = new KeysCodeInfo();
            info.code = _upKeyCode;
            info.time = getTimer();
            if (isPrint)
            {
//                trace("keyUp : " + _upKeyCode);
                if (printFun != null)
                {
                    printFun("keyUp : " + _upKeyCode);
                }
            }
            EventManager.dispatchEvent("KeyCodeEvent.keys_up", info);
        }

        private function onDeactivate(e:Event):void
        {
            shift_down = false;
            ctrl_down = false;
            _downKeyCode = 0;
            _upKeyCode = 0;
        }

        private function onRemove(e:Event):void
        {
            var dis:DisplayObjectContainer = (e.target as DisplayObjectContainer);
            var child:DisplayObject = LayerManager.stage.focus;
            if (e.target == LayerManager.stage.focus || isParentChild(dis, LayerManager.stage.focus))
            {
                LayerManager.stage.focus = null;
            }
        }

        private function onKeyDown(e:KeyboardEvent):void
        {
            shift_down = e.shiftKey;
            ctrl_down = e.ctrlKey;
            _downKeyCode = e.keyCode;
            if (_downKeyCode == _upKeyCode)
            {
                _upKeyCode = 0;
            }
            if (checkIsInputTxt())
            {
                return;
            }
            excuteDownKey();
        }

        private function onKeyUp(e:KeyboardEvent):void
        {
            shift_down = e.shiftKey;
            ctrl_down = e.ctrlKey;
            _upKeyCode = e.keyCode;
            if (_downKeyCode == _upKeyCode)
            {
                _downKeyCode = 0;
            }
            if (checkIsInputTxt())
            {
                return;
            }
            excuteUpKey();
        }

        private function onFocusIn(e:FocusEvent):void
        {
            checkInputTxtFocus(e.target as InteractiveObject);
        }

        private function onFocusOut(e:FocusEvent):void
        {
            checkInputTxtFocus(e.target as InteractiveObject);
        }

        private function onFocusChange(e:FocusEvent):void
        {
            var inObj:InteractiveObject = e.relatedObject;
            checkInputTxtFocus(inObj);
        }

        private function checkIsInputTxt():Boolean
        {
            var inObj:InteractiveObject = LayerManager.stage.focus;
            if (inObj is TextField && (inObj as TextField).type == "input")
            {
                return true;
            }
            return false;
        }

        private function checkInputTxtFocus(inObj:InteractiveObject):void
        {
            if (inObj is TextField && (inObj as TextField).type == "input")
            {
                _isTextFieldFocus = true;
            }
            else
            {
                _isTextFieldFocus = false;
            }
        }
    }
}