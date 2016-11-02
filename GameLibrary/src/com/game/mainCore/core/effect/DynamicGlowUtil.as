//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.effect
{
    import org.client.mainCore.ds.HashMap;
    import flash.display.DisplayObject;
    import flash.filters.ColorMatrixFilter;

    public class DynamicGlowUtil 
    {

        private static var _glowMap:HashMap = new HashMap();


        public static function addGlow(dis:DisplayObject, color:uint=0xFFFFFF, delay:uint=40, blur:uint=10, glowType:uint=1, inner:Boolean=false, colorFilter:ColorMatrixFilter=null):void
        {
            var glow:DynamicGlow = _glowMap.getValue(dis);
            if (glow)
            {
                glow.stop();
                glow = null;
            };
            glow = new DynamicGlow(dis, color, delay, blur, glowType, inner, colorFilter);
            glow.start();
            _glowMap.add(dis, glow);
        }

        public static function removeGlow(dis:DisplayObject):void
        {
            var glow:DynamicGlow = _glowMap.getValue(dis);
            if (glow)
            {
                glow.stop();
                glow = null;
            };
            _glowMap.remove(dis);
        }


    }
}//package com.game.mainCore.core.effect
