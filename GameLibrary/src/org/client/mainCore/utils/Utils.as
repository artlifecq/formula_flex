package org.client.mainCore.utils
{
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.display.Sprite;
    import flash.media.Sound;
    import flash.system.ApplicationDomain;
    import flash.utils.Dictionary;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    public class Utils 
    {

        public static var isPrint:Boolean = false;
        private static var _bmdPacket:Dictionary = new Dictionary(true);


        public static function getMovieClipFromLoader(name:String, loader:Loader):MovieClip
        {
            var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
            return r==null ? null : (r as MovieClip);
        }

        public static function getSpriteFromLoader(name:String, loader:Loader):Sprite
        {
            var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
            return r==null ? null : (r as Sprite);
        }

        public static function getSimpleButtonFromLoader(name:String, loader:Loader):SimpleButton
        {
            var r:DisplayObject = getDisplayObjectFromLoader(name, loader);
            return r==null ? null : (r as SimpleButton);
        }

        public static function getSoundFromLoader(name:String, loader:Loader):Sound
        {
            var classReference:Class = getClassFromLoader(name, loader);
            return new classReference() as Sound;
        }

        public static function getBitmapDataFromLoader(name:String, loader:Loader, isCache:Boolean=false):BitmapData
        {
            var bmd:BitmapData = null;
            if (_bmdPacket[name])
            {
                return _bmdPacket[name];
            }
            var classReference:Class = getClassFromLoader(name, loader);
            if (classReference)
            {
                try
                {
                    bmd = new classReference(1, 1) as BitmapData;
                }
                catch(e:Error)
                {
                    if (isPrint)
                    {
                        trace("Utils getBitmapDataFromLoader error:" + e.toString());
                    }
                }
            }
            else
            {
                return null;
            }
            if (isCache)
            {
                if (bmd)
                {
                    _bmdPacket[name] = bmd;
                }
            }
            return bmd;
        }

        public static function getClassFromLoader(name:String, loader:Loader):Class
        {
            var app:ApplicationDomain = loader.contentLoaderInfo.applicationDomain;
            if (app.hasDefinition(name))
            {
                return app.getDefinition(name) as Class;
            }
            if (isPrint)
            {
                trace("Utils getClassFromLoader not hasDefinition:" + name);
            }
            return null;
        }

        public static function getDisplayObjectFromLoader(name:String, loader:Loader):DisplayObject
        {
            var classReference:Class = getClassFromLoader(name, loader);
            if (classReference != null)
            {
                try
                {
                    var dis:DisplayObject = new classReference() as DisplayObject;
                    return dis;
                }
                catch(e:Error)
                {
                    if (isPrint)
                    {
                        trace("Utils getDisplayObjectFromLoader error:" + e.toString());
                    }
                    return null;
                }
            }
            return null;
        }

        public static function getClass(name:String):Class
        {
            var ClassReference:Class = null;
            try
            {
                ClassReference = getDefinitionByName(name) as Class;
            }
            catch(e:Error)
            {
                if (isPrint)
                {
                    trace("getClass " + name + "error" + e.message);
                }
                return null;
            }
            return ClassReference;
        }

        public static function getClassByObject(obj:DisplayObject):Class
        {
            var mcs:Class = null;
            try
            {
                mcs = getClassFromLoader(getQualifiedClassName(obj), obj.loaderInfo.loader) as Class;
            }
            catch(e:Error)
            {
                if (isPrint)
                {
                    trace("getClass " + obj.toString() + "error" + e.message);
                }
                return null;
            }
            return mcs;
        }

        public static function getLoaderClass(loader:Loader):Class
        {
            return loader.contentLoaderInfo.applicationDomain.getDefinition(getQualifiedClassName(loader.content)) as Class;
        }

        public static function copyObjectValue(fromObj:Object, toObj:Object):void
        {
            var key:String;
            for (key in fromObj)
            {
                toObj[key] = fromObj[key];
            }
        }

        public static function getMemoryName(obj:Object):String
        {
            var memoryHash:String = null;
            try
            {
                Utils(obj);
            }
            catch(e:Error)
            {
                memoryHash = e.replace(/.*([@|\$].*?) 转换为 .*$/gi, "$1");
            }
            return memoryHash;
        }

        public static function getFunctionName(fun:Function):String
        {
            var k:* = null;
            var fn:String = null;
            try
            {
                k = Sprite(fun);
            }
            catch(err:Error)
            {
                fn = err.message.replace(/.+::(\w+\/\w+)\(\)\}\@.+/, "$1");
                return fn==err.message ? err.message.replace(/.+ (function\-\d+) .+/i, "$1") : fn;
            }
            return null;
        }
    }
}