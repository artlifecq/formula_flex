//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.noGC
{
    import flash.utils.Dictionary;

    public class noGC 
    {

        private var _objDict:Dictionary;

        public function noGC()
        {
            _objDict = new Dictionary();
            super();
        }

        public function addObject($obj:Object):void
        {
            _objDict[$obj] = true;
        }

        public function removeObject($obj:Object):void
        {
            _objDict[$obj] = null;
            delete _objDict[$obj]; //not popped
        }

        public function clear():void
        {
            var key:*;
            for (key in _objDict)
            {
                _objDict[key] = null;
                delete _objDict[key];
            };
        }


    }
}//package com.game.mainCore.libCore.noGC
