//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.helper.draw
{
    import flash.events.Event;
    import flash.display.Graphics;
    import flash.geom.Point;

    public class DrawHelper 
    {

        public function DrawHelper()
        {
            throw (new Event("静态类"));
        }

        public static function drawLine($drawLayer:*, $startPoint:Point, $endPoint:Point, $styleData:StyleData=null, $fristClear:Boolean=false):void
        {
            if (!$drawLayer)
            {
                return;
            };
            $styleData = (($styleData) || (StyleData.DEFAULT));
            var g:Graphics = $drawLayer.graphics;
            if ($fristClear)
            {
                g.clear();
            };
            g.lineStyle($styleData.lineThickness, $styleData.lineColor, $styleData.lineAlpha);
            g.moveTo($startPoint.x, $startPoint.y);
            g.lineTo($endPoint.x, $endPoint.y);
        }

        public static function drawRect($drawLayer:*, $startPoint:Point, $endPoint:Point, $styleData:StyleData=null, $fristClear:Boolean=false):void
        {
            if (!$drawLayer)
            {
                return;
            };
            $styleData = (($styleData) || (StyleData.DEFAULT));
            var g:Graphics = $drawLayer.graphics;
            if ($fristClear)
            {
                g.clear();
            };
            g.lineStyle($styleData.lineThickness, $styleData.lineColor, $styleData.lineAlpha);
            g.beginFill($styleData.fillColor, $styleData.fillAlpha);
            g.moveTo($startPoint.x, $startPoint.y);
            g.lineTo($endPoint.x, $startPoint.y);
            g.lineTo($endPoint.x, $endPoint.y);
            g.lineTo($startPoint.x, $endPoint.y);
            g.lineTo($startPoint.x, $startPoint.y);
            g.endFill();
        }

        public static function drawCircle($drawLayer:*, $startPoint:Point, $endPoint:Point, $styleData:StyleData=null, $fristClear:Boolean=false):void
        {
            if (!$drawLayer)
            {
                return;
            };
            $styleData = (($styleData) || (StyleData.DEFAULT));
            var g:Graphics = $drawLayer.graphics;
            if ($fristClear)
            {
                g.clear();
            };
            g.lineStyle($styleData.lineThickness, $styleData.lineColor, $styleData.lineAlpha);
            g.beginFill($styleData.fillColor, $styleData.fillAlpha);
            g.drawCircle($startPoint.x, $startPoint.y, Math.sqrt(((($endPoint.x - $startPoint.x) * ($endPoint.x - $startPoint.x)) + (($endPoint.y - $startPoint.y) * ($endPoint.y - $startPoint.y)))));
            g.endFill();
        }


    }
}//package com.game.mainCore.core.helper.draw
