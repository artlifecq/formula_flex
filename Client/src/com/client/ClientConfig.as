package com.client
{
    import flash.utils.Dictionary;
    import org.game.netCore.net.ByteBuffer;
    import flash.display.Sprite;
    import flash.system.IME;
    import flash.text.TextField;
    import flash.events.MouseEvent;
    import com.gameClient.utils.VersionUtils;

    public class ClientConfig 
    {

        public static var urlParmar:Object;
        public static var loginIP:String;
        public static var loginPort:uint = 0;
        public static var policyPort:uint = 48889;
        public static var isRelease:Boolean = false;
        public static var isDebug:Boolean = true;
        public static var isSingle:Boolean = false;
        public static var useBpgFormat:Boolean = false;
        public static var useAtfFormat:Boolean = false;
        public static var uiUseAtf:Boolean = true;
        public static var loginName:String = null;
        public static var loginKey:String = null;
        public static var debugConfig:String = null;
        public static var useWorker:Boolean = true;
        public static var maskWorldDic:Dictionary;
        public static var loginData:ByteBuffer;
        public static var countryMemberCounts:Array;
        public static var baseDir:String = "../";
        public static var resURL:String = "res/";
        public static var auth:String;
        public static var sign:String;
        public static var version:String;
        public static var versionInfo:String;
        public static var loginType:int;
        public static var userID:Number;
        public static var hasHero:Boolean;
        public static var isWeiDuan:Boolean = false;
        public static var isBanShu:Boolean = false;
        public static var isStable:Boolean = false;
        public static var mainEntry:Object = null;
        public static var root:Sprite;
        public static var debugParams:String = null;
        public static var miniDownloadUrl:String = null;
        public static var reportUrl:String = null;
        public static var platform:String = null;
        public static var GlobalBridge:Class = null;


        public static function setup(root:Sprite):void
        {
            ClientConfig.root = root;
            IME.enabled = false;
            root.stage.addEventListener("rightClick", onRightMosClick);
            root.stage.addEventListener("mouseDown", onDisabledIME);
            root.stage.addEventListener("rightMouseDown", onDisabledIME);
        }

        private static function onDisabledIME(event:MouseEvent):void
        {
            if (IME.isSupported)
            {
                if ((event.target is TextField))
                {
                    IME.enabled = true;
                }
                else
                {
                    IME.enabled = false;
                };
            };
        }

        private static function onRightMosClick(e:MouseEvent):void
        {
        }

        public static function getLoadingResUrl():String
        {
            var _local1:String = "loading/loading.png";
            return (((baseDir + resURL) + ((ClientConfig.uiUseAtf) ? (_local1 + ".atf") : _local1)));
        }

        public static function getSignInResUrl():String
        {
            var _local1:String = "loading/signIn.png";
            return (((baseDir + resURL) + ((ClientConfig.uiUseAtf) ? (_local1 + ".atf") : _local1)));
        }

        public static function getLoginuiResUrl():String
        {
            var _local1:String = "login/loginui.png";
            return (((baseDir + resURL) + _local1));
        }

        public static function getLangUrl():String
        {
            var _local1:String = "config/lang/cn/lang.data";
            return (VersionUtils.getVersionPath(((baseDir + resURL) + _local1)));
        }

        public static function getSound($name:String):String
        {
            var _local2:String = (("sound/" + $name) + ".ap3");
            return (VersionUtils.getVersionPath(((baseDir + resURL) + _local2)));
        }

        public static function getUI(name:String, extFileName:String=".atf"):String
        {
            var _local3 = null;
            if (name.indexOf(".") != -1)
            {
                _local3 = ("app/" + name);
            }
            else
            {
                _local3 = ((("app/" + name) + ".png") + extFileName);
            };
            return (((baseDir + resURL) + _local3));
        }

        public static function getFont(name:String):String
        {
            var _local2:String = ("font/" + name);
            return (VersionUtils.getVersionPath(((baseDir + resURL) + _local2)));
        }
    }
}