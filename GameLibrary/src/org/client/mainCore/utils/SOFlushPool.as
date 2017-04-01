//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.Timer;
    import flash.net.SharedObject;
    import flash.events.TimerEvent;

    public class SOFlushPool 
    {

        private static const TIME:int = 100;

        private var _poolList:Array;
        private var _time:Timer;

        public function SOFlushPool()
        {
            _poolList = [];
            _time = new Timer(100, 0);
            _time.addEventListener("timer", onTime);
        }

        public function addFlush(so:SharedObject):void
        {
            if (!(isInPool(so)))
            {
                _poolList.push(so);
                if (!(_time.running))
                {
                    _time.reset();
                    _time.start();
                };
            };
        }

        private function isInPool(so:SharedObject):Boolean
        {
            return (!((_poolList.indexOf(so) == -1)));
        }

        private function onTime(e:TimerEvent):void
        {
            var shareObject:SharedObject = _poolList.shift();
            if (!((shareObject == null)))
            {
                try
                {
                    shareObject.flush();
                }
                catch(e:Error)
                {
                    (trace("SOFlushPool.flush", e.toString()));
                };
            }
            else
            {
                _time.stop();
            };
        }


    }
}//package org.client.mainCore.utils
