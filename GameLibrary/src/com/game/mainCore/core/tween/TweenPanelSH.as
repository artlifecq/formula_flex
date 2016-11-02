package com.game.mainCore.core.tween
{
    import com.greensock.TweenLite;
    
    import flash.display.DisplayObject;
    import flash.display.Sprite;

    public class TweenPanelSH 
    {

        public static var isVisible:Boolean = false;


        public static function show(o:DisplayObject):void
        {
            isVisible = true;
            var s:Sprite = new Sprite();
            s.x = o.x;
            s.y = o.y;
            if ((o.parent == null))
            {
                return;
            };
            o.parent.addChild(s);
            s.addChild(o);
            o.x = (-(o.width) / 2);
            o.y = (-(o.height) / 2);
            s.scaleX = 0.01;
            s.scaleY = 0.01;
            s.alpha = 0;
            TweenLite.to(s, 0.5, {
                "scaleX":1,
                "scaleY":1,
                "alpha":1,
                "onComplete":onShowComplete
            });
        }

        private static function onShowComplete():void
        {
        }

        public static function hide(o:DisplayObject, hideFun:Function=null):void
        {
            o = o;
            hideFun = hideFun;
			function onHideComplete(o:DisplayObject):void
            {
                if (!((hideFun == null)))
                {
                    (hideFun());
                }
                if (o.parent)
                {
                    o.parent.removeChild(o);
                }
            }
            isVisible = false;
            var s:Sprite = new Sprite();
            if ((o.parent == null))
            {
                return;
            };
            o.parent.addChild(s);
            s.addChild(o);
            o.x = (-(o.width) / 2);
            o.y = (-(o.height) / 2);
            TweenLite.to(s, 0.5, {
                "scaleX":0,
                "scaleY":0,
                "alpha":0,
                "onComplete":onHideComplete,
                "onCompleteParams":[s]
            });
        }
    }
}