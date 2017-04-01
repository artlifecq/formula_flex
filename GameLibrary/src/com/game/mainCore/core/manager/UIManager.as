//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.manager
{
    import flash.display.Loader;
    import org.client.mainCore.utils.Utils;
    import flash.display.DisplayObject;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.display.SimpleButton;
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.media.Sound;

    public class UIManager 
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

        public static function getClass(str:String):Class
        {
            return (Utils.getClassFromLoader(str, _loader));
        }

        public static function getDisplayObject(str:String):DisplayObject
        {
            return (Utils.getDisplayObjectFromLoader(str, _loader));
        }

        public static function getMovieClip(str:String):MovieClip
        {
            return (Utils.getMovieClipFromLoader(str, _loader));
        }

        public static function getSprite(str:String):Sprite
        {
            return (Utils.getSpriteFromLoader(str, _loader));
        }

        public static function getButton(str:String):SimpleButton
        {
            return (Utils.getSimpleButtonFromLoader(str, _loader));
        }

        public static function getBitmap(str:String):Bitmap
        {
            return (new Bitmap(Utils.getBitmapDataFromLoader(str, _loader, true)));
        }

        public static function getBitmapData(str:String):BitmapData
        {
            return (Utils.getBitmapDataFromLoader(str, _loader, true));
        }

        public static function getSound(str:String):Sound
        {
            return (Utils.getSoundFromLoader(str, _loader));
        }

        public static function hasDefinition(name:String):Boolean
        {
            return (_loader.contentLoaderInfo.applicationDomain.hasDefinition(name));
        }


    }
}//package com.game.mainCore.core.manager
