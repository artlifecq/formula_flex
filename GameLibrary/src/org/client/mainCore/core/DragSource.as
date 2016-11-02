//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.core
{
    public class DragSource 
    {

        private var _dataHolder:Object;
        private var _formatHandlers:Object;
        private var _formats:Array;

        public function DragSource()
        {
            this._dataHolder = {};
            this._formatHandlers = {};
            this._formats = [];
            super();
        }

        public function get formats():Array
        {
            return (this._formats);
        }

        public function addData(data:*, format:String):void
        {
            this._formats.push(format);
            this._dataHolder[format] = data;
        }

        public function addHandler(handler:Function, format:String):void
        {
            this._formats.push(format);
            this._formatHandlers[format] = handler;
        }

        public function dataForFormat(format:String)
        {
            var data:Object = this._dataHolder[format];
            if (data)
            {
                return (data);
            };
            if (this._formatHandlers[format])
            {
                return (this._formatHandlers[format]());
            };
            return (null);
        }

        public function hasFormat($format:String):Boolean
        {
            $format = $format;
            var format:* = $format;
            var b:* = this._formats.some(function (item:String, index:int, array:Array):Boolean
            {
                if ((_arg1 == format))
                {
                    return (true);
                };
                return (false);
            });
            return (b);
        }


    }
}//package org.client.mainCore.core
