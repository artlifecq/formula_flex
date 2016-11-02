//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.core.utils
{
    import flash.utils.ByteArray;

    public class ByteArrayUtil 
    {


        public static function clone(rawData:ByteArray):ByteArray
        {
            var result:ByteArray = new ByteArray();
            result.writeBytes(rawData);
            rawData.position = 0;
            result.position = 0;
            return (result);
        }

        public static function getNickNameByteArray(nameStr:String, maxLen:uint=16):ByteArray
        {
            return (getStringByteArray(nameStr, maxLen));
        }

        public static function getStringByteArray(str:String, length:uint):ByteArray
        {
            var i:int;
            var temp = null;
            var result:ByteArray = new ByteArray();
            var maxLen:int = length;
            var len:int = str.length;
            i = 0;
            while (i < len)
            {
                temp = new ByteArray();
                temp.writeUTFBytes(str.charAt(i));
                if (((result.length + temp.length) <= maxLen))
                {
                    result.writeUTFBytes(str.charAt(i));
                }
                else
                {
                    break;
                };
                i++;
            };
            while (result.length < maxLen)
            {
                result.writeByte(0);
            };
            return (result);
        }


    }
}//package com.game.mainCore.core.utils
