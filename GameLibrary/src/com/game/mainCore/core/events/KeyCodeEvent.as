//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.events
{
    import flash.events.Event;
    import com.game.mainCore.core.info.key.KeysCodeInfo;

    public class KeyCodeEvent extends Event 
    {

        public static const KEYS_DOWN:String = "KeyCodeEvent.keys_down";
        public static const KEYS_UP:String = "KeyCodeEvent.keys_up";
        public static const KEYS_CLEAR:String = "KeyCodeEvent.keys_clear";

        private var _data:KeysCodeInfo;

        public function KeyCodeEvent(type:String, data:KeysCodeInfo=null)
        {
            super(type, bubbles, cancelable);
            _data = data;
        }

        public function get data():KeysCodeInfo
        {
            return (_data);
        }


    }
}//package com.game.mainCore.core.events
