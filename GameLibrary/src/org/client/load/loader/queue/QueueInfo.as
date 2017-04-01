//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.queue
{
    public class QueueInfo 
    {

        public var timeCount:uint;
        public var level:int;
        public var url:String;
        public var event:Function;
        public var error:Function;
        public var progress:Function;

        public function QueueInfo()
        {
            this.level = 2;
            super();
        }

    }
}//package org.client.load.loader.queue
