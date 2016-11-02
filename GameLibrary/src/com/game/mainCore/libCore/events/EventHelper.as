package com.game.mainCore.libCore.events
{
    import flash.events.Event;
    import flash.display.DisplayObject;

    public class EventHelper 
    {

        public function EventHelper()
        {
            throw (new Event("静态类"));
        }

        public static function registerAddToStageEventListener($toStageDOBJ:DisplayObject, $callBack:Function, $callBackDobj:DisplayObject=null, $eventType:String="enterFrame"):Function
        {
            $toStageDOBJ = $toStageDOBJ;
            $callBack = $callBack;
            $callBackDobj = $callBackDobj;
            $eventType = $eventType;
            function onAddToStage(e:Event):void
            {
                $toStageDOBJ.addEventListener("removedFromStage", onRemoveFromStage);
                $callBackDobj.addEventListener($eventType, $callBack);
            };
            function onRemoveFromStage(e:Event):void
            {
                $toStageDOBJ.removeEventListener("removedFromStage", onRemoveFromStage);
                $callBackDobj.removeEventListener($eventType, $callBack);
            };
            var $callBackDobj:DisplayObject = (($callBackDobj) || ($toStageDOBJ));
            if (!(($toStageDOBJ.stage == null)))
            {
                (onAddToStage(null));
            };
            $toStageDOBJ.addEventListener("addedToStage", onAddToStage);
            var removeEventListenerfunction:Function = function ():void
            {
                (onRemoveFromStage(null));
                $toStageDOBJ.removeEventListener("addedToStage", onAddToStage);
            };
            return (removeEventListenerfunction);
        }
    }
}