//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import flash.display.Loader;
    import org.client.mainCore.utils.Utils;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import com.game.mainCore.core.loader.loading.EmptyLoading;
    import com.game.mainCore.core.loader.loading.MainLoading;
    import com.game.mainCore.core.loader.loading.TitlePercentLoading;
    import com.game.mainCore.core.loader.loading.TitleOnlyLoading;
    import com.game.mainCore.core.loader.loading.BaseLoading;
    import com.game.mainCore.core.loader.loading.SwitchSceneLoading;
    import flash.display.DisplayObjectContainer;
    import com.game.mainCore.core.loader.loading.ILoading;

    public class LoadingManager 
    {

        private static var _loader:Loader;


        public static function setup(loader:Loader):void
        {
            _loader = loader;
        }

        public static function get loader():Loader
        {
            return (_loader);
        }

        public static function getMovieClip(str:String):MovieClip
        {
            return (Utils.getMovieClipFromLoader(str, _loader));
        }

        public static function getSprite(str:String):Sprite
        {
            return (Utils.getSpriteFromLoader(str, _loader));
        }

        public static function getBitmap(str:String):Bitmap
        {
            return (new Bitmap(Utils.getBitmapDataFromLoader(str, _loader, true)));
        }

        public static function getLoading(type:int, parent:DisplayObjectContainer, title:String="Loading...", closeEnabled:Boolean=false):ILoading
        {
            var _loading = null;
            switch (type)
            {
                case -1:
                    _loading = new EmptyLoading();
                    break;
                case 3:
                    _loading = new MainLoading(parent, title, closeEnabled);
                    break;
                case 1:
                    _loading = new TitlePercentLoading(parent, title, closeEnabled);
                    break;
                case 0:
                    _loading = new TitleOnlyLoading(parent, title, closeEnabled);
                    break;
                case 2:
                    _loading = new BaseLoading(parent, closeEnabled);
                    break;
                case 4:
                    _loading = new SwitchSceneLoading(parent, title, closeEnabled);
                default:
            };
            return (_loading);
        }


    }
}//package com.game.mainCore.core.manager
