package com.game.mainCore.core.loader.loading
{
    import flash.display.DisplayObjectContainer;

    public class MainLoading extends TitlePercentLoading implements ILoading 
    {

        private static const KEY:String = "mainLoad";

        public function MainLoading(parent:DisplayObjectContainer, title:String="Loading...", showCloseBtn:Boolean=false)
        {
            super(parent, title, showCloseBtn);
        }

    }
}