package org.client.mainCore.utils
{
    import flash.system.Capabilities;
    import flash.display.DisplayObject;

    public class CapabilitiesUtils 
    {
        public static function getPlayerInfo():String
        {
            var debugger:String = Capabilities.isDebugger ? " / Debugger" : "";
            var info:String = "Flash Platform: " + Capabilities.version + " / " + Capabilities.playerType + debugger + " / " + Capabilities.os + " / " + Capabilities.screenResolutionX + "x" + Capabilities.screenResolutionY;
            return info;
        }

        public static function isAirApplication():Boolean
        {
            return Capabilities.playerType == "Desktop";
        }

        public static function isIDE():Boolean
        {
            return Capabilities.playerType == "External";
        }

        public static function isMac():Boolean
        {
            return Capabilities.os.toLowerCase().indexOf("mac os") != -1;
        }

        public static function isPC():Boolean
        {
            return Capabilities.os.toLowerCase().indexOf("mac os") == -1;
        }

        public static function isPlugin():Boolean
        {
            return Capabilities.playerType == "PlugIn" || Capabilities.playerType == "ActiveX";
        }

        public static function isStandAlone():Boolean
        {
            return Capabilities.playerType == "StandAlone";
        }

        public static function isWeb(location:DisplayObject):Boolean
        {
            return location.loaderInfo.url.substr(0, 4) == "http";
        }
    }
}