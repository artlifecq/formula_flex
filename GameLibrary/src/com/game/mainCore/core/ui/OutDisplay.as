//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.ui
{
    import flash.events.EventDispatcher;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.events.Event;

    public class OutDisplay extends EventDispatcher 
    {

        private var _type:String;
        private var _disList:Array;

        public function OutDisplay(type:String, dis:DisplayObject, ... objs)
        {
            _type = type;
            _disList = objs;
            dis.addEventListener(type, onEvent);
        }

        private function onEvent(e:Event):void
        {
            var i:int;
            i = 0;
            while (i < _disList.length)
            {
                if ((e.target == _disList[i]))
                {
                    return;
                };
                if ((((_disList[i] is DisplayObjectContainer)) && ((_disList[i] as DisplayObjectContainer).contains((e.target as DisplayObject)))))
                {
                    return;
                };
                e.currentTarget.removeEventListener(_type, onEvent);
                dispatchEvent(new Event("cancel"));
                i++;
            };
        }


    }
}//package com.game.mainCore.core.ui
