//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.events
{
    import flash.events.Event;
    import com.game.mainCore.core.loader.UILoader;

    public class UILoadEvent extends Event 
    {

        public static const COMPLETE:String = "complete";
        public static const OPEN:String = "open";
        public static const CLOSE:String = "close";

        private var _loader:UILoader;

        public function UILoadEvent(type:String, loader:UILoader)
        {
            super(type);
            _loader = loader;
        }

        public function get uiloader():UILoader
        {
            return (_loader);
        }


    }
}//package com.game.mainCore.core.loader.events
