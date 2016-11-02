//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class FPSCounter extends Sprite 
    {

        private var ticks:int;
        private var FPS:TextField;
        private var format:TextFormat;
        private var t:Timer;

        public function FPSCounter(x:int=0, y:int=0)
        {
            format = new TextFormat();
            t = new Timer(1000);
            super();
            this.x = x;
            this.y = y;
            createText();
            t.addEventListener("timer", updateFPS);
            addEventListener("enterFrame", onEnterFrame);
            t.start();
        }

        private function createText():void
        {
            format.font = "Verdana";
            format.size = 9;
            FPS = new TextField();
            FPS.defaultTextFormat = format;
            FPS.autoSize = "left";
            FPS.textColor = 0xFFFFFF;
            FPS.background = true;
            FPS.backgroundColor = 0x666666;
            FPS.antiAliasType = "advanced";
            FPS.selectable = false;
            FPS.text = "FPS: ";
            addChild(FPS);
        }

        private function updateFPS(event:TimerEvent):void
        {
            FPS.text = ("FPS: " + ticks);
            ticks = 0;
        }

        private function onEnterFrame(event:Event):void
        {
            ticks++;
        }


    }
}//package org.client.mainCore.utils
