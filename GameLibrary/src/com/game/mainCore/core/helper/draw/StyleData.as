//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.helper.draw
{
    public class StyleData 
    {

        public static const DEFAULT:StyleData = new (StyleData)(0, 0, 1, 0, 1);

        public var lineThickness:Number;
        public var lineColor:uint;
        public var lineAlpha:Number;
        public var fillColor:uint;
        public var fillAlpha:Number;

        public function StyleData($lineThickness:Number=0, $lineColor:uint=0, $lineAlpha:Number=1, $fillColor:uint=0, $fillAlpha:Number=1)
        {
            lineThickness = $lineThickness;
            lineColor = $lineColor;
            lineAlpha = $lineAlpha;
            fillColor = $fillColor;
            fillAlpha = $fillAlpha;
        }

    }
}//package com.game.mainCore.core.helper.draw
