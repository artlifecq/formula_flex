//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.module
{
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;

    public /*dynamic*/ interface IDisplayModule extends IModule 
    {

        function get sprite():Sprite;
        function get parentContainer():DisplayObjectContainer;

    }
}//package org.client.mainCore.module
