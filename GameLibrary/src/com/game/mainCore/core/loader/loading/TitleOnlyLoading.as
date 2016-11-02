//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.loader.loading
{
    import flash.text.TextField;
    import flash.display.DisplayObjectContainer;

    public class TitleOnlyLoading extends BaseLoading implements ILoading 
    {

        private static const KEY:String = "titleOnlyLoading";

        protected var _titleText:TextField;

        public function TitleOnlyLoading(parent:DisplayObjectContainer, title:String="Loading...", showCloseBtn:Boolean=false, align:uint=4)
        {
            super(parent, showCloseBtn, align);
            _titleText = _loadingBar["content_txt"];
            _titleText.text = title;
        }

        override public function set title(str:String):void
        {
            _titleText.text = str;
        }

        override public function destroy():void
        {
            _titleText = null;
            super.destroy();
        }

        override public function get key():String
        {
            return ("titleOnlyLoading");
        }


    }
}//package com.game.mainCore.core.loader.loading
