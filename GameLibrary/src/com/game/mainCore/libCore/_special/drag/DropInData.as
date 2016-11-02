//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.drag
{
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class DropInData extends Event 
    {

        public static const DROP_IN_DATA:String = "DROP_IN_DATA";

        public var from:DisplayObject;
        public var action:String;
        public var data;
        public var hasDone:Boolean;
        public var breakUp:Boolean;

        public function DropInData($from:DisplayObject, $action:String=null, $data:*=null)
        {
            super("DROP_IN_DATA");
            from = $from;
            action = $action;
            data = $data;
        }

        override public function toString():String
        {
            return ((((((("[DropInData: from:" + from) + " action:") + action) + " data:") + data) + "]"));
        }


    }
}//package com.game.mainCore.libCore._special.drag
