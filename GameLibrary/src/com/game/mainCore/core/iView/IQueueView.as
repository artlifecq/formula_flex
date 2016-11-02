//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.iView
{
    import flash.display.DisplayObject;

    public /*dynamic*/ interface IQueueView 
    {

        function get view():DisplayObject;
        function excuteShow():void;
        function excuteHide():void;

    }
}//package com.game.mainCore.core.iView
