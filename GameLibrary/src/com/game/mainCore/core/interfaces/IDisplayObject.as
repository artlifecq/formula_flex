//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.interfaces
{
    import flash.geom.Point;
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Rectangle;

    public /*dynamic*/ interface IDisplayObject 
    {

        function get x():Number;
        function set x(_arg1:Number):void;
        function get y():Number;
        function set y(_arg1:Number):void;
        function get offsetX():Number;
        function set offsetX(_arg1:Number):void;
        function get offsetY():Number;
        function set offsetY(_arg1:Number):void;
        function get visible():Boolean;
        function set visible(_arg1:Boolean):void;
        function get alpha():Number;
        function set alpha(_arg1:Number):void;
        function get scaleX():Number;
        function set scaleX(_arg1:Number):void;
        function get scaleY():Number;
        function set scaleY(_arg1:Number):void;
        function get rotation():Number;
        function set rotation(_arg1:Number):void;
        function get logicAngle():uint;
        function set logicAngle(_arg1:uint):void;
        function set depth(_arg1:int):void;
        function get depth():int;
        function set depthIndex(_arg1:uint):void;
        function get depthIndex():uint;
        function get mouseEnabled():Boolean;
        function set mouseEnabled(_arg1:Boolean):void;
        function get showPos():Point;
        function get graphicDis():DisplayObject;
        function set graphicDis(_arg1:DisplayObject):void;
        function get parent():DisplayObjectContainer;
        function set parent(_arg1:DisplayObjectContainer):void;
        function hitRect(_arg1:Rectangle):Boolean;
        function hitPoint(_arg1:Point):Boolean;
        function destroy():void;

    }
}//package com.game.mainCore.core.interfaces
