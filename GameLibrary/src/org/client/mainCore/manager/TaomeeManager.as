//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;

    public class TaomeeManager 
    {

        public static var stageHeight:int;
        public static var stageWidth:int;
        private static var _root:DisplayObjectContainer;
        private static var _stage:Stage;


        public static function setup(root:DisplayObjectContainer, stage:Stage):void
        {
            _root = root;
            _stage = stage;
        }

        public static function get root():DisplayObjectContainer
        {
            return (_root);
        }

        public static function set root(r:DisplayObjectContainer):void
        {
            _root = r;
        }

        public static function get stage():Stage
        {
            return (_stage);
        }

        public static function set stage(s:Stage):void
        {
            _stage = s;
        }


    }
}//package org.client.mainCore.manager
