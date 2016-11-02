//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.effect
{
    import flash.filters.ColorMatrixFilter;

    public class ColorFilter 
    {

        private static const RED:Number = 0.3086;
        private static const GREEN:Number = 0.6094;
        private static const BLUE:Number = 0.082;
        private static const DELTA_INDEX:Array = [0, 0.01, 0.02, 0.04, 0.05, 0.06, 0.07, 0.08, 0.1, 0.11, 0.12, 0.14, 0.15, 0.16, 0.17, 0.18, 0.2, 0.21, 0.22, 0.24, 0.25, 0.27, 0.28, 0.3, 0.32, 0.34, 0.36, 0.38, 0.4, 0.42, 0.44, 0.46, 0.48, 0.5, 0.53, 0.56, 0.59, 0.62, 0.65, 0.68, 0.71, 0.74, 0.77, 0.8, 0.83, 0.86, 0.89, 0.92, 0.95, 0.98, 1, 1.06, 1.12, 1.18, 1.24, 1.3, 1.36, 1.42, 1.48, 1.54, 1.6, 1.66, 1.72, 1.78, 1.84, 1.9, 1.96, 2, 2.12, 2.25, 2.37, 2.5, 2.62, 2.75, 2.87, 3, 3.2, 3.4, 3.6, 3.8, 4, 4.3, 4.7, 4.9, 5, 5.5, 6, 6.5, 6.8, 7, 7.3, 7.5, 7.8, 8, 8.4, 8.7, 9, 9.4, 9.6, 9.8, 10];


        public static function setHue(offset:Number):ColorMatrixFilter
        {
            offset = ((ColorFilter.cleanValue(offset, 180) / 180) * 3.14159265358979);
            if ((((offset == 0)) || (isNaN(offset))))
            {
                return (null);
            };
            var cosVal:Number = Math.cos(offset);
            var sinVal:Number = Math.sin(offset);
            var lumR = 0.213;
            var lumG = 0.715;
            var lumB = 0.072;
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([((lumR + (cosVal * (1 - lumR))) + (sinVal * -(lumR))), ((lumG + (cosVal * -(lumG))) + (sinVal * -(lumG))), ((lumB + (cosVal * -(lumB))) + (sinVal * (1 - lumB))), 0, 0, ((lumR + (cosVal * -(lumR))) + (sinVal * 0.143)), ((lumG + (cosVal * (1 - lumG))) + (sinVal * 0.14)), ((lumB + (cosVal * -(lumB))) + (sinVal * -0.283)), 0, 0, ((lumR + (cosVal * -(lumR))) + (sinVal * -((1 - lumR)))), ((lumG + (cosVal * -(lumG))) + (sinVal * lumG)), ((lumB + (cosVal * (1 - lumB))) + (sinVal * lumB)), 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
            return (color_Matrix);
        }

        public static function setBrightness(offset:Number):ColorMatrixFilter
        {
            offset = ColorFilter.cleanValue(offset, 100);
            if ((((offset == 0)) || (isNaN(offset))))
            {
                return (null);
            };
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([1, 0, 0, 0, offset, 0, 1, 0, 0, offset, 0, 0, 1, 0, offset, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
            return (color_Matrix);
        }

        public static function setSaturation(offset:Number):ColorMatrixFilter
        {
            offset = ColorFilter.cleanValue(offset, 100);
            if ((((offset == 0)) || (isNaN(offset))))
            {
                return (null);
            };
            var x:Number = (1 + (((offset)>0) ? ((3 * offset) / 100) : (offset / 100)));
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([((0.3086 * (1 - x)) + x), (0.6094 * (1 - x)), (0.082 * (1 - x)), 0, 0, (0.3086 * (1 - x)), ((0.6094 * (1 - x)) + x), (0.082 * (1 - x)), 0, 0, (0.3086 * (1 - x)), (0.6094 * (1 - x)), ((0.082 * (1 - x)) + x), 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
            return (color_Matrix);
        }

        public static function setContrast(offset:Number):ColorMatrixFilter
        {
            var x:Number;
            offset = ColorFilter.cleanValue(offset, 100);
            if ((((offset == 0)) || (isNaN(offset))))
            {
                return (null);
            };
            if ((offset < 0))
            {
                x = (127 + ((offset / 100) * 127));
            }
            else
            {
                x = (offset % 1);
                if ((x == 0))
                {
                    x = DELTA_INDEX[offset];
                }
                else
                {
                    x = ((DELTA_INDEX[(offset << 0)] * (1 - x)) + (DELTA_INDEX[((offset << 0) + 1)] * x));
                };
                x = ((x * 127) + 127);
            };
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([(x / 127), 0, 0, 0, (0.5 * (127 - x)), 0, (x / 127), 0, 0, (0.5 * (127 - x)), 0, 0, (x / 127), 0, (0.5 * (127 - x)), 0, 0, 0, 1, 0, 0, 0, 0, 0, 1]);
            return (color_Matrix);
        }

        public static function setGrayscale():ColorMatrixFilter
        {
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0.3086, 0.6094, 0.082, 0, 0, 0, 0, 0, 1, 0]);
            return (color_Matrix);
        }

        public static function setInvert():ColorMatrixFilter
        {
            var color_Matrix:ColorMatrixFilter = new ColorMatrixFilter([-1, 0, 0, 0, 0xFF, 0, -1, 0, 0, 0xFF, 0, 0, -1, 0, 0xFF, 0, 0, 0, 1, 0]);
            return (color_Matrix);
        }

        protected static function cleanValue(p_val:Number, p_limit:Number):Number
        {
            return (Math.min(p_limit, Math.max(-(p_limit), p_val)));
        }


    }
}//package org.client.mainCore.effect
