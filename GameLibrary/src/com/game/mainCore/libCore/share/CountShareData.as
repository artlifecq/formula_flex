package com.game.mainCore.libCore.share
{
    public class CountShareData 
    {

        private var _count:int = 0;


        public function addCount(obj:*):void
        {
            _count++;
        }

        public function removeCount(obj:*):void
        {
            _count--;
        }

        public function get count():int
        {
            return _count;
        }

        public function destroy():void
        {
        }
    }
}