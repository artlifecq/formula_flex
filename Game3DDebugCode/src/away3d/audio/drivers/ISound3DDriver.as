//Created by Action Script Viewer - http://www.buraks.com/asv
package away3d.audio.drivers
{
    import away3d.events.IEventDispatcher;
    import flash.media.Sound;
    import flash.geom.Vector3D;

    public /*dynamic*/ interface ISound3DDriver extends IEventDispatcher 
    {

        function get sourceSound():Sound;
        function set sourceSound(_arg1:Sound):void;
        function get scale():Number;
        function set scale(_arg1:Number):void;
        function get meshVolume():Number;
        function set meshVolume(_arg1:Number):void;
        function set reducationAlgorithm(_arg1:int):void;
        function get volume():Number;
        function set volume(_arg1:Number):void;
        function get mute():Boolean;
        function set mute(_arg1:Boolean):void;
        function play(_arg1:Number=NaN):void;
        function pause():void;
        function stop():void;
        function updateReferenceVector(_arg1:Vector3D, _arg2:Vector3D):void;
        function get position():Number;
        function dispose():void;

    }
}//package away3d.audio.drivers
