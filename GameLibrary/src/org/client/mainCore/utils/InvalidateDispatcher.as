//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.events.IEventDispatcher;
    import flash.events.Event;

    public class InvalidateDispatcher 
    {

        private var _ed:IEventDispatcher;
        private var _list:Array;

        public function InvalidateDispatcher(ed:IEventDispatcher)
        {
            _list = [];
            super();
            _ed = ed;
        }

        public function destroy():void
        {
            Tick.removeCallback(onInvalidate);
            _ed = null;
            _list = null;
        }

        public function addDispatcher(e:Event):void
        {
            _list.push(e);
            Tick.addCallback(onInvalidate);
        }

        private function onInvalidate():void
        {
            var e = null;
            Tick.removeCallback(onInvalidate);
            if (_ed)
            {
                for each (e in _list)
                {
                    _ed.dispatchEvent(e);
                };
            };
            _list.length = 0;
        }


    }
}//package org.client.mainCore.utils
