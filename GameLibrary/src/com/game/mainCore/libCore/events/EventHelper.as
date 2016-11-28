package com.game.mainCore.libCore.events
{
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class EventHelper 
    {

        public function EventHelper()
        {
            throw new Event("静态类");
        }

        public static function registerAddToStageEventListener($toStageDOBJ:DisplayObject, $callBack:Function, $callBackDobj:DisplayObject=null, $eventType:String=Event.ENTER_FRAME):Function
        {
            function onAddToStage(e:Event):void
            {
                $toStageDOBJ.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
                $callBackDobj.addEventListener($eventType, $callBack);
            };
            function onRemoveFromStage(e:Event):void
            {
                $toStageDOBJ.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
                $callBackDobj.removeEventListener($eventType, $callBack);
            };
            $callBackDobj = $callBackDobj || $toStageDOBJ;
            if ($toStageDOBJ.stage != null)
            {
                onAddToStage(null);
            }
            $toStageDOBJ.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
            var removeEventListenerfunction:Function = function ():void
            {
                onRemoveFromStage(null);
                $toStageDOBJ.removeEventListener(Event.ADDED_TO_STAGE, onAddToStage);
            }
            return removeEventListenerfunction;
        }
    }
}