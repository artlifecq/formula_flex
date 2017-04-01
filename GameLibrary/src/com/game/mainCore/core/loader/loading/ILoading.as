package com.game.mainCore.core.loader.loading
{
    import flash.events.IEventDispatcher;
    import flash.display.DisplayObjectContainer;
    import flash.display.DisplayObject;

    public /*dynamic*/ interface ILoading extends IEventDispatcher 
    {

        function setPercent(_arg1:Number, _arg2:Number):void;
        function destroy():void;
        function show():void;
        function hide():void;
        function set title(_arg1:String):void;
        function set text(_arg1:String):void;
        function set closeEnabled(_arg1:Boolean):void;
        function get parent():DisplayObjectContainer;
        function get loadingBar():DisplayObject;
        function get key():String;

    }
}