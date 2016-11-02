﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.manager
{
    import flash.display.DisplayObjectContainer;
    import flash.display.Stage;

    public class ProjectManager 
    {

        private static var _root:DisplayObjectContainer;
        private static var _stage:Stage;
        private static var _stageWidth:int = 960;
        private static var _stageHeight:int = 560;


        public static function setup(root:DisplayObjectContainer, stage:Stage):void
        {
            _root = root;
            _stage = stage;
        }

        public static function stageSize(width:int, height:int):void
        {
            _stageWidth = width;
            _stageHeight = height;
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

        public static function get stageWidth():int
        {
            return (_stageWidth);
        }

        public static function get stageHeight():int
        {
            return (_stageHeight);
        }


    }
}//package org.client.mainCore.manager
