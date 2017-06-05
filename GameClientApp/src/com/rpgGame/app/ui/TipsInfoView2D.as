package com.rpgGame.app.ui
{
    public class TipsInfoView2D 
    {

        private static var _actualInstance:Object;

        public static function setActual(actual:Class):void
        {
            _actualInstance = actual;
        }

        public static function showAlert2D(info:String, okFunc:Function=null):void
        {
            _actualInstance.showAlert2D(info, okFunc);
        }

        public static function showKernelAlert2D():void
        {
            _actualInstance.showKernelAlert2D();
        }
    }
}