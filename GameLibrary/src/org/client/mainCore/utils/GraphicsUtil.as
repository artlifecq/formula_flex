//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.display.Graphics;

    public class GraphicsUtil 
    {


        public static function drawWedge(target:Graphics, x:Number, y:Number, startAngle:Number, arc:Number, radius:Number, yRadius:Number=NaN):void
        {
            var ax:Number;
            var ay:Number;
            var i:int;
            var angleMid:Number;
            var bx:Number;
            var by:Number;
            var cx:Number;
            var cy:Number;
            target.moveTo(x, y);
            if (isNaN(yRadius))
            {
                yRadius = radius;
            };
            if (Math.abs(arc) > 360)
            {
                arc = 360;
            };
            var segs:int = Math.ceil((Math.abs(arc) / 45));
            var segAngle:Number = (arc / segs);
            var theta:Number = (-((segAngle / 180)) * 3.14159265358979);
            var angle:Number = (-((startAngle / 180)) * 3.14159265358979);
            if (segs > 0)
            {
                ax = (x + (Math.cos(((startAngle / 180) * 3.14159265358979)) * radius));
                ay = (y + (Math.sin(((-(startAngle) / 180) * 3.14159265358979)) * yRadius));
                target.lineTo(ax, ay);
                i = 0;
                while (i < segs)
                {
                    angle = (angle + theta);
                    angleMid = (angle - (theta / 2));
                    bx = (x + (Math.cos(angle) * radius));
                    by = (y + (Math.sin(angle) * yRadius));
                    cx = (x + (Math.cos(angleMid) * (radius / Math.cos((theta / 2)))));
                    cy = (y + (Math.sin(angleMid) * (yRadius / Math.cos((theta / 2)))));
                    target.curveTo(cx, cy, bx, by);
                    i++;
                };
                target.lineTo(x, y);
            };
        }

        public static function drawDashedLine(target:Graphics, xStart:Number, yStart:Number, xEnd:Number, yEnd:Number, dashSize:Number=10, gapSize:Number=10):void
        {
            var i:int;
            var segmentLength:Number = (dashSize + gapSize);
            var xDelta:Number = (xEnd - xStart);
            var yDelta:Number = (yEnd - yStart);
            var delta:Number = Math.sqrt((Math.pow(xDelta, 2) + Math.pow(yDelta, 2)));
            var segmentCount:int = Math.floor(Math.abs((delta / segmentLength)));
            var radians:Number = Math.atan2(yDelta, xDelta);
            var xCurrent = xStart;
            var yCurrent = yStart;
            xDelta = (Math.cos(radians) * segmentLength);
            yDelta = (Math.sin(radians) * segmentLength);
            while (i < segmentCount)
            {
                target.moveTo(xCurrent, yCurrent);
                target.lineTo((xCurrent + (Math.cos(radians) * dashSize)), (yCurrent + (Math.sin(radians) * dashSize)));
                xCurrent = (xCurrent + xDelta);
                yCurrent = (yCurrent + yDelta);
                i++;
            };
            target.moveTo(xCurrent, yCurrent);
            delta = Math.sqrt((((xEnd - xCurrent) * (xEnd - xCurrent)) + ((yEnd - yCurrent) * (yEnd - yCurrent))));
            if ((delta > dashSize))
            {
                target.lineTo((xCurrent + (Math.cos(radians) * dashSize)), (yCurrent + (Math.sin(radians) * dashSize)));
            }
            else
            {
                if (delta > 0)
                {
                    target.lineTo((xCurrent + (Math.cos(radians) * delta)), (yCurrent + (Math.sin(radians) * delta)));
                };
            };
            target.moveTo(xEnd, yEnd);
        }


    }
}//package org.client.mainCore.utils
