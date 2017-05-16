package com.rpgGame.app.ui.main.activityBar.item
{
    public class ActivityDiaoDuiButton extends ActivityButton 
    {
        override protected function onShow():void
        {
            this.playEffect();
        }

        override protected function onHide():void
        {
            this.stopEffect();
        }

        override protected function onTextRuning():String
        {
            var _local1:String = "";
            ui.txtTitle.htmlText = _local1;
            return (_local1);
        }
    }
}