//Created by Action Script Viewer - http://www.buraks.com/asv
package com.game.mainCore.libCore._special.codemix
{
    import flash.utils.ByteArray;

    public class CodeMixer 
    {

        public static var key:uint = 123;
        public static var pieceLen:uint = 37;
        public static var skip:uint = 299;


        public static function encodeBytes(bytes:ByteArray):ByteArray
        {
            var j:int;
            bytes.position = 0;
            var bytesLen:uint = bytes.length;
            var i:uint;
            while (true)
            {
                j = 0;
                while (j < pieceLen)
                {
                    var _local6 = i;
                    var _local7 = (bytes[_local6] ^ key);
                    bytes[_local6] = _local7;
                    if (++i >= bytesLen) break;
                    j++;
                };
                i = (i + skip);
                if (i >= bytesLen) break;
            };
            var doneBytes:ByteArray = new ByteArray();
            doneBytes.writeBytes(bytes);
            return (doneBytes);
        }

        public static function decodeBytes(bytes:ByteArray):ByteArray
        {
            var j:int;
            bytes.position = 0;
            var newSWFBytes:ByteArray = new ByteArray();
            bytes.readBytes(newSWFBytes);
            var bytesLen:uint = newSWFBytes.length;
            var i:uint;
            while (true)
            {
                j = 0;
                while (j < pieceLen)
                {
                    var _local6 = i;
                    var _local7 = (newSWFBytes[_local6] ^ key);
                    newSWFBytes[_local6] = _local7;
                    if (++i >= bytesLen) break;
                    j++;
                };
                i = (i + skip);
                if (i >= bytesLen) break;
            };
            return (newSWFBytes);
        }


    }
}//package com.game.mainCore.libCore._special.codemix
