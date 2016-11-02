//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.loading
{
    import flash.events.EventDispatcher;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;

    public class EmptyLoading extends EventDispatcher implements ILoading 
    {


        public function setPercent(loaded:Number, total:Number):void
        {
        }

        public function destroy():void
        {
        }

        public function show():void
        {
        }

        public function hide():void
        {
        }

        public function set title(str:String):void
        {
        }

        public function set text(str:String):void
        {
        }

        public function set closeEnabled(b:Boolean):void
        {
        }

        public function get parent():DisplayObjectContainer
        {
            return (null);
        }

        public function get loadingBar():DisplayObject
        {
            return (null);
        }

        public function get key():String
        {
            return ("");
        }


    }
}//package com.game.mainCore.core.loader.loading
