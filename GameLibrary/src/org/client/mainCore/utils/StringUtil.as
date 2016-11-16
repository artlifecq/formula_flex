package org.client.mainCore.utils
{
    import flash.utils.ByteArray;

    public class StringUtil 
    {

        private static const HEX_Head:String = "0x";


        public static function renewZero(str:String, len:int):String
        {
            var i:int;
            var bul:String = "";
            var strLen:int = str.length;
            if (strLen < len)
            {
                i = 0;
                while (i < (len - strLen))
                {
                    bul = bul + "0";
                    i++;
                }
                return bul + str;
            }
            return str;
        }

        public static function stopwatchFormat(value:int):String
        {
            var minute:int = value / 60;
            var second:int = value % 60;
            var strM:String = minute<10 ? "0" + minute.toString() : minute.toString();
            var strS:String = second<10 ? "0" + second.toString() : second.toString();
            return strM + ":" + strS;
        }

        public static function timeFormat(value:int, sm:String="-"):String
        {
            var t:Date = new Date(value * 1000);
            return t.getFullYear().toString() + sm + (t.getMonth() + 1).toString() + sm + t.getDate().toString();
        }

        public static function uintToIp(v:uint):String
        {
            var str:String = v.toString(16);
            var ip1:String = "0x" + str.slice(0, 2).toString();
            var ip2:String = "0x" + str.slice(2, 4).toString();
            var ip3:String = "0x" + str.slice(4, 6).toString();
            var ip4:String = "0x" + str.slice(6).toString();
            return ip1 + "." + ip2 + "." + ip3 + "." + ip4;
        }

        public static function hexToIp(a:uint):String
        {
            var i:int;
            var by:ByteArray = new ByteArray();
            by.writeUnsignedInt(a);
            by.position = 0;
            var str:String = "";
            i = 0;
            while (i < 4)
            {
                str = str + by.readUnsignedByte().toString() + ".";
                i++;
            }
            return str.substr(0, (str.length - 1));
        }

        public static function ipToUint(i:String):uint
        {
            var arr:Array = i.split(".");
            var str:String = "0x";
            arr.forEach(function (item:String, index:int, array:Array):void
            {
                str = str + item.toString();
            });
            return uint(str);
        }

        public static function stringsAreEqual(s1:String, s2:String, caseSensitive:Boolean):Boolean
        {
            if (caseSensitive)
            {
                return s1 == s2;
            }
            return s1.toUpperCase() == s2.toUpperCase();
        }

        public static function trim(input:String):String
        {
            return StringUtil.leftTrim(StringUtil.rightTrim(input));
        }

        public static function leftTrim(input:String):String
        {
            var i:Number;
            var size:Number = input.length;
            i = 0;
            while (i < size)
            {
                if (input.charCodeAt(i) > 32)
                {
                    return input.substring(i);
                }
                i++;
            }
            return "";
        }

        public static function rightTrim(input:String):String
        {
            var i:Number;
            var size:Number = input.length;
            i = size;
            while (i > 0)
            {
                if (input.charCodeAt(i - 1) > 32)
                {
                    return input.substring(0, i);
                }
                i--;
            }
            return "";
        }

        public static function beginsWith(input:String, prefix:String):Boolean
        {
            return prefix == input.substring(0, prefix.length);
        }

        public static function endsWith(input:String, suffix:String):Boolean
        {
            return suffix == input.substring(input.length - suffix.length);
        }

        public static function remove(input:String, remove:String):String
        {
            return StringUtil.replace(input, remove, "");
        }

        public static function replace(input:String, replace:String, replaceWith:String):String
        {
            var i:Number;
            var j:Number;
            var sb:String = new String();
            var found:Boolean;
            var sLen:Number = input.length;
            var rLen:Number = replace.length;
            i = 0;
            for (;i < sLen;i++)
            {
                if (input.charAt(i) == replace.charAt(0))
                {
                    found = true;
                    j = 0;
                    while (j < rLen)
                    {
                        if (input.charAt(i + j) != replace.charAt(j))
                        {
                            found = false;
                            break;
                        }
                        j++;
                    }
                    if (found)
                    {
                        sb = sb + replaceWith;
                        i = i + (rLen - 1);
                        continue;
                    }
                }
                sb = sb + input.charAt(i);
            }
            return sb;
        }

        public static function stringHasValue(s:String):Boolean
        {
            return s != null && s.length > 0;
        }

        public static function toByteArray(s:String, length:uint):ByteArray
        {
            var _byte:ByteArray = new ByteArray();
            _byte.writeUTFBytes(s);
            _byte.length = length;
            _byte.position = 0;
            return _byte;
        }
    }
}