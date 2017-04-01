//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import flash.display.Sprite;
    import flash.display.Stage;
    import com.game.mainCore.core.ui.MovieMonitor;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.events.Event;
    import flash.display.DisplayObjectContainer;
    import flash.events.MouseEvent;

    public class LayerManager 
    {

        private static var _root:Sprite;
        private static var _stage:Stage;
        private static var _gameLevel:Sprite;
        private static var _topLevel:Sprite;
        private static var _uiLevel:Sprite;
        private static var _toolsLevel:Sprite;
        private static var _mapUILevel:Sprite;
        private static var _mapLevel:Sprite;
        private static var _mapLowLevel:Sprite;
        private static var _mm:MovieMonitor;


        public static function setup(con:Sprite):void
        {
            _root = con;
            _stage = _root.stage;
            _mapLowLevel = new Sprite();
            _mapLowLevel.mouseEnabled = false;
            _mapLowLevel.tabChildren = false;
            _mapLowLevel.tabEnabled = false;
            _mapLowLevel.name = "mapLowLevel";
            _root.addChild(_mapLowLevel);
            _mapLevel = new Sprite();
            _mapLevel.mouseEnabled = false;
            _mapLevel.tabChildren = false;
            _mapLevel.tabEnabled = false;
            _mapLevel.name = "mapLevel";
            _root.addChild(_mapLevel);
            _mapUILevel = new Sprite();
            _mapUILevel.mouseEnabled = false;
            _mapUILevel.tabChildren = false;
            _mapUILevel.tabEnabled = false;
            _mapUILevel.name = "mapUILevel";
            _root.addChild(_mapUILevel);
            _toolsLevel = new Sprite();
            _toolsLevel.name = "toolsLevel";
            _toolsLevel.mouseEnabled = false;
            _toolsLevel.mouseChildren = false;
            _toolsLevel.tabChildren = false;
            _toolsLevel.tabEnabled = false;
            _root.addChild(_toolsLevel);
            _uiLevel = new Sprite();
            _uiLevel.name = "uiLevel";
            _uiLevel.mouseEnabled = false;
            _uiLevel.mouseChildren = false;
            _uiLevel.tabChildren = false;
            _uiLevel.tabEnabled = false;
            _root.addChild(_uiLevel);
            _gameLevel = new Sprite();
            _gameLevel.name = "gameLevel";
            _gameLevel.mouseEnabled = false;
            _gameLevel.tabChildren = false;
            _gameLevel.tabEnabled = false;
            _root.addChild(_gameLevel);
            _topLevel = new Sprite();
            _topLevel.name = "topLevel";
            _topLevel.mouseEnabled = false;
            _topLevel.tabChildren = false;
            _topLevel.tabEnabled = false;
            _root.addChild(_topLevel);
            _stage.addEventListener("resize", onStgResize);
        }

        public static function get stageWidth():Number
        {
            return (_stage.stageWidth);
        }

        public static function get stageHeight():Number
        {
            return (_stage.stageHeight);
        }

        public static function get root():Sprite
        {
            return (_root);
        }

        public static function get stage():Stage
        {
            return (_stage);
        }

        public static function get mapLowLevel():Sprite
        {
            return (_mapLowLevel);
        }

        public static function get mapLevel():Sprite
        {
            return (_mapLevel);
        }

        public static function get mapUILevel():Sprite
        {
            return (_mapUILevel);
        }

        public static function get uiLevel():Sprite
        {
            return (_uiLevel);
        }

        public static function get toolsLevel():Sprite
        {
            return (_toolsLevel);
        }

        public static function get gameLevel():Sprite
        {
            return (_gameLevel);
        }

        public static function get topLevel():Sprite
        {
            return (_topLevel);
        }

        public static function get stageCenterPoint():Point
        {
            return (new Point((_stage.stageWidth / 2), (_stage.stageHeight / 2)));
        }

        public static function get stageRect():Rectangle
        {
            return (new Rectangle(0, 0, _stage.stageWidth, _stage.stageHeight));
        }

        public static function openMouseEvent():void
        {
            _mapLevel.mouseChildren = true;
            _mapUILevel.mouseChildren = true;
            _uiLevel.mouseChildren = true;
            _toolsLevel.mouseChildren = true;
            _gameLevel.mouseChildren = true;
            _topLevel.mouseChildren = true;
        }

        public static function closeMouseEvent(isTop:Boolean=false, isTools:Boolean=true):void
        {
            _mapLevel.mouseChildren = false;
            _mapUILevel.mouseChildren = false;
            _uiLevel.mouseChildren = false;
            if (isTools)
            {
                _toolsLevel.mouseChildren = false;
            };
            if (isTop)
            {
                _gameLevel.mouseChildren = false;
                _topLevel.mouseChildren = false;
            };
        }

        public static function addMmItem(name:String, valueObj:Object, valueName:String, color:uint=0xFFFFFF, cName:String=null):void
        {
            if (!(_mm))
            {
                _mm = new MovieMonitor();
            };
            if (_mm)
            {
                _mm.addItem(name, valueObj, valueName, color, cName);
            };
        }

        public static function showOrHideMM():void
        {
            if (!(_mm))
            {
                _mm = new MovieMonitor();
            };
            if (_mm.parent)
            {
                _mm.parent.removeChild(_mm);
            }
            else
            {
                _mm.y = 100;
                LayerManager.stage.addChild(_mm);
            };
        }

        private static function onStgResize(e:Event):void
        {
        }

        private static function onMosOver(e:MouseEvent):void
        {
            var disCot:DisplayObjectContainer = (e.currentTarget as DisplayObjectContainer);
            disCot.mouseChildren = true;
            disCot.tabChildren = true;
            disCot.tabEnabled = true;
        }

        private static function onMosOut(e:MouseEvent):void
        {
            var disCot:DisplayObjectContainer = (e.currentTarget as DisplayObjectContainer);
            disCot.mouseChildren = false;
            disCot.tabChildren = false;
            disCot.tabEnabled = false;
        }


    }
}//package com.game.mainCore.core.manager
