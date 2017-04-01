//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.load.loader.resManager
{
    import __AS3__.vec.Vector;

    public class ResInfo 
    {

        public var eventList:Vector.<Function>;
        public var progressEvtList:Vector.<Function>;
        public var isCache:Boolean;
        public var level:int;
        public var url:String;
        public var isLoading:Boolean = false;
        public var name:String = "";
        public var nameList:Vector.<String>;

        public function ResInfo()
        {
            eventList = new Vector.<Function>();
            progressEvtList = new Vector.<Function>();
            nameList = new Vector.<String>();
            super();
        }

    }
}//package org.client.load.loader.resManager
