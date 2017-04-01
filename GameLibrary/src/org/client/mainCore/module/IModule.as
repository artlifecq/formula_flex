package org.client.mainCore.module
{
    public /*dynamic*/ interface IModule 
    {

        function setup():void;
        function init(_arg1:Object=null):void;
        function show():void;
        function hide():void;
        function destroy():void;

    }
}