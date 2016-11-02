//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.ByteArray;
    import flash.display.DisplayObject;
    import flash.events.KeyboardEvent;
    import flash.events.Event;

    public class KeyPoll 
    {

        private var states:ByteArray;
        private var dispObj:DisplayObject;

        public function KeyPoll(displayObj:DisplayObject)
        {
            states = new ByteArray();
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            states.writeUnsignedInt(0);
            dispObj = displayObj;
            dispObj.addEventListener("keyDown", keyDownListener, false, 0, true);
            dispObj.addEventListener("keyUp", keyUpListener, false, 0, true);
            dispObj.addEventListener("activate", activateListener, false, 0, true);
            dispObj.addEventListener("deactivate", deactivateListener, false, 0, true);
        }

        private function keyDownListener(ev:KeyboardEvent):void
        {
            var _local2 = (ev.keyCode >>> 3);
            var _local3 = (states[_local2] | (1 << (ev.keyCode & 7)));
            states[_local2] = _local3;
        }

        private function keyUpListener(ev:KeyboardEvent):void
        {
            var _local2 = (ev.keyCode >>> 3);
            var _local3 = (states[_local2] & ~((1 << (ev.keyCode & 7))));
            states[_local2] = _local3;
        }

        private function activateListener(ev:Event):void
        {
            var i:int;
            i = 0;
            while (i < 32)
            {
                states[i] = 0;
                i++;
            };
        }

        private function deactivateListener(ev:Event):void
        {
            var i:int;
            i = 0;
            while (i < 32)
            {
                states[i] = 0;
                i++;
            };
        }

        public function isDown(keyCode:uint):Boolean
        {
            return (!(((states[(keyCode >>> 3)] & (1 << (keyCode & 7))) == 0)));
        }

        public function isUp(keyCode:uint):Boolean
        {
            return (((states[(keyCode >>> 3)] & (1 << (keyCode & 7))) == 0));
        }


    }
}//package org.client.mainCore.utils
