//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.loading
{
    import flash.display.Sprite;
    import flash.display.MovieClip;
    import flash.display.DisplayObjectContainer;

    public class SwitchSceneLoading extends TitlePercentLoading implements ILoading 
    {

        private static const KEY:String = "SwitchSceneLoading";

        private var _lightSp:Sprite;
        private var _bg:MovieClip;
        private var _bgTitle:Sprite;

        public function SwitchSceneLoading(parent:DisplayObjectContainer, title:String="Loading...", showCloseBtn:Boolean=false, align:uint=7)
        {
            super(parent, title, showCloseBtn, align);
        }

        override public function get key():String
        {
            return ("SwitchSceneLoading");
        }

        override public function setPercent(loaded:Number, total:Number):void
        {
            super.setPercent(loaded, total);
        }


    }
}//package com.game.mainCore.core.loader.loading
