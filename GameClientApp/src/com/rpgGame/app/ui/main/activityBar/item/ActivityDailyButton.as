package com.rpgGame.app.ui.main.activityBar.item
{
    public class ActivityDailyButton extends ActivityButton 
    {
        override protected function onTextRuning():String
        {
            var txt:String = "";
            ui.txtTitle.htmlText = txt;
            return txt;
        }
    }
}