//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import flash.text.TextFormat;
    import flash.text.TextField;
    import flash.text.StyleSheet;

    public class TextFormatUtil 
    {

        private static var _tfm:TextFormat = new TextFormat("Microsoft YaHei", 12, 0xFFFFFF, null, null, null, null, null, null, null, null, null, 3);


        public static function appDefaultFormatText(tf:TextField, str:String, color:uint):void
        {
            _tfm.color = color;
            _tfm.bold = false;
            _tfm.size = 14;
            _tfm.italic = false;
            _tfm.underline = false;
            appendOne(tf, str);
        }

        public static function appContentFormatText(tf:TextField, str:String, mfm:Object):void
        {
            _tfm.color = mfm.color;
            _tfm.bold = mfm.bold;
            _tfm.size = mfm.size;
            _tfm.italic = mfm.italic;
            _tfm.underline = mfm.underline;
            appendOne(tf, str);
        }

        public static function appSenderFormatText(tf:TextField, str:String, isSelf:Boolean):void
        {
            if (isSelf)
            {
                _tfm.color = 0xFF;
            }
            else
            {
                _tfm.color = 0x8000;
            };
            _tfm.bold = false;
            _tfm.size = 14;
            _tfm.italic = false;
            _tfm.underline = false;
            appendOne(tf, str);
        }

        public static function appSeparatorFormatText(tf:TextField, str:String, color:uint):void
        {
            _tfm.color = color;
            _tfm.bold = true;
            _tfm.size = 14;
            _tfm.italic = false;
            _tfm.underline = false;
            appendOne(tf, str);
        }

        public static function getEventText(str:String, href:String, color:String="#FF0000"):String
        {
            return ((((((("<a href='event:" + href) + "'><font color='") + color) + "'>") + str) + "</font></a>"));
        }

        public static function getRedText(str:String):String
        {
            return ((("<font color='#FF0000'>" + str) + "</font>"));
        }

        public static function getBlueText(str:String):String
        {
            return ((("<font color='#0000FF'>" + str) + "</font>"));
        }

        public static function getColorText(str:String, color:uint):String
        {
            return ((((("<font color='#" + color.toString(16)) + "'>") + str) + "</font>"));
        }

        public static function getColorSizeText(str:String, color:uint, size:int):String
        {
            return ((((((("<font size='" + size) + "' color='#") + color.toString(16)) + "'>") + str) + "</font>"));
        }

        public static function getLinkStyle(liskColor:String, hoverColor:String):StyleSheet
        {
            var style:StyleSheet = new StyleSheet();
            var link:Object = {};
            link.color = liskColor;
            var hover:Object = {};
            hover.color = hoverColor;
            style.setStyle("a:link", link);
            style.setStyle("a:hover", hover);
            return (style);
        }

        public static function getFontSizeText(str:String, size:uint, isBold:Boolean=false):String
        {
            size = (((size)<12) ? 12 : size);
            if (isBold)
            {
                return ((('<font size="20"><b>' + str) + "</b></font>"));
            };
            return ((('<font size="20">' + str) + "</font>"));
        }

        public static function formatNumber(inputStr:String):String
        {
            var char = null;
            var i:int;
            var j:int;
            var z:int;
            if ((((inputStr == "")) || ((inputStr == "0"))))
            {
                return ("0");
            };
            var numbers:String = "1234567890";
            var len:uint = inputStr.length;
            var result:String = "";
            i = 0;
            while (i < len)
            {
                char = inputStr.charAt(i);
                j = 0;
                while (j < 10)
                {
                    if ((char == numbers.charAt(j)))
                    {
                        result = (result + char);
                    };
                    j++;
                };
                i++;
            };
            var resultLen:uint = result.length;
            z = 0;
            while (z < resultLen)
            {
                if (!((result.charAt(z) == "0")))
                {
                    result = result.substring(z, resultLen);
                    break;
                };
                z++;
            };
            if ((result.charAt(0) == "0"))
            {
                result = "0";
            };
            return (result);
        }

        public static function formatLine(txt:String, num:uint=10):String
        {
            var i:int;
            var len:uint = txt.length;
            var result:String = "";
            i = 1;
            while (i < (len + 1))
            {
                result = (result + txt.charAt((i - 1)));
                if (((((i % num) == 0)) && ((len > num))))
                {
                    result = (result + "<br>");
                };
                i++;
            };
            return (result);
        }

        public static function appendConfig(typeStr:String, value:Object, isLast:Boolean=false):String
        {
            var str:String = (((typeStr + "_") + value) + ((isLast) ? "" : ";"));
            return (str);
        }

        public static function appendConfigList(typeList:Array, valueList:Array, isLast:Boolean=false):String
        {
            var i:int;
            if (!((typeList.length == valueList.length)))
            {
                throw (new Error("长度错误"));
            };
            var str:String = "";
            var len:uint = typeList.length;
            i = 0;
            while (i < len)
            {
                str = (str + (((typeList[i] + "_") + valueList[i]) + (((((i == (len - 1))) && (isLast))) ? "" : ";")));
                i++;
            };
            return (str);
        }

        private static function appendOne(tf:TextField, str:String):void
        {
            tf.replaceText(tf.length, (tf.length + 1), str);
            tf.setTextFormat(_tfm, (tf.length - str.length), tf.length);
        }


    }
}//package com.game.mainCore.core.utils
