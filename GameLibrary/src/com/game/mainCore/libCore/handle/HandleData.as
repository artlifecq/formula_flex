//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore.handle
{
    public class HandleData 
    {

        private var _handler:Function;
        private var _parameters:Array;
        private var _delay:Number;
        private var _doNext:Boolean;

        public function HandleData($handler:Function, $parameters:Array=null, $delay:Number=0, $doNext:Boolean=true)
        {
            _handler = $handler;
            _parameters = $parameters;
            _delay = $delay;
            _doNext = $doNext;
        }

        public function get handler():Function
        {
            return (_handler);
        }

        public function get parameters():Array
        {
            return (_parameters);
        }

        public function get delay():Number
        {
            return (_delay);
        }

        public function get doNext():Boolean
        {
            return (_doNext);
        }


    }
}//package com.game.mainCore.libCore.handle
