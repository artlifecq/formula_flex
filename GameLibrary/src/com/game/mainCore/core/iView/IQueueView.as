package com.game.mainCore.core.iView
{
    import flash.display.DisplayObject;

    public /*dynamic*/ interface IQueueView 
    {
        function get view():DisplayObject;
        function excuteShow():void;
        function excuteHide():void;
    }
}