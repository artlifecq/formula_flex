package com.game.mainCore.core.iView
{
    import org.client.mainCore.module.IDisplayModule;

    public /*dynamic*/ interface IViewModule extends IDisplayModule 
    {

        function addEvent():void;
        function removeEvent():void;
        function excuteEsc():void;

    }
}