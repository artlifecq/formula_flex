//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.effect
{
    import flash.utils.Timer;
    import com.game.mainCore.core.effect.lighting.Lightning;
    import flash.geom.Point;
    import flash.filters.GlowFilter;
    import com.game.mainCore.core.manager.LayerManager;
    import flash.display.Sprite;
    import org.client.mainCore.utils.DisplayUtil;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class LightEffect 
    {

        private var timer:Timer;
        private var ll:Lightning;

        public function LightEffect()
        {
            timer = new Timer(1500, 1);
            timer.addEventListener("timer", onTimer);
        }

        public function show(startPoint:Point, endPoint:Point, isFlash:Boolean=true, color:uint=0xFFFFFF, filterColor:uint=0xFFFFFF, strength:Number=1.8):Sprite
        {
            var dis:Number;
            ll = new Lightning(color, 2);
            ll.blendMode = "add";
            ll.childrenDetachedEnd = false;
            ll.childrenLifeSpanMin = 0.1;
            ll.childrenLifeSpanMax = 2;
            ll.childrenMaxCount = 3;
            ll.childrenMaxCountDecay = 0.5;
            ll.steps = 350;
            ll.wavelength = 0.36;
            ll.amplitude = 0.76;
            if (isFlash)
            {
                dis = Point.distance(startPoint, endPoint);
                ll.maxLength = (dis * 0.666666666666667);
                ll.maxLengthVary = (dis * 0.5);
            };
            ll.startX = startPoint.x;
            ll.startY = startPoint.y;
            ll.endX = endPoint.x;
            ll.endY = endPoint.y;
            ll.alphaFadeType = "generation";
            var glow:GlowFilter = new GlowFilter(filterColor);
            glow.strength = strength;
            glow.quality = 3;
            var _local9:int = 10;
            glow.blurY = _local9;
            glow.blurX = _local9;
            ll.filters = [glow];
            LayerManager.mapLevel.addChild(ll);
            ll.childrenProbability = 0.3;
            ll.addEventListener("enterFrame", onEnter);
            timer.start();
            return (ll);
        }

        private function onTimer(event:TimerEvent):void
        {
            timer.stop();
            timer.removeEventListener("timer", onTimer);
            timer = null;
            ll.kill();
            ll.removeEventListener("enterFrame", onEnter);
            DisplayUtil.removeForParent(ll);
            ll = null;
        }

        private function onEnter(event:Event):void
        {
            ll.update();
        }


    }
}//package com.game.mainCore.core.effect
