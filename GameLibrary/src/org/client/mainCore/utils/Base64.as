﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.ByteArray;

    public class Base64 
    {

        private static const BASE64_CHARS:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        public static const version:String = "1.0.0";

        public function Base64()
        {
            throw (new Error("Base64 class is static container only"));
        }

        public static function encode(data:String):String
        {
            var bytes:ByteArray = new ByteArray();
            bytes.writeUTFBytes(data);
            return (encodeByteArray(bytes));
        }

        public static function encodeByteArray(data:ByteArray):String
        {
            var dataBuffer = null;
            var i:int;
            var j:int;
            var k:int;
            var output:String = "";
            var outputBuffer:Array = new Array(4);
            data.position = 0;
            while (data.bytesAvailable > 0)
            {
                dataBuffer = [];
                i = 0;
                while ((((i < 3)) && ((data.bytesAvailable > 0))))
                {
                    dataBuffer[i] = data.readUnsignedByte();
                    i++;
                };
                outputBuffer[0] = ((dataBuffer[0] & 252) >> 2);
                outputBuffer[1] = (((dataBuffer[0] & 3) << 4) | (dataBuffer[1] >> 4));
                outputBuffer[2] = (((dataBuffer[1] & 15) << 2) | (dataBuffer[2] >> 6));
                outputBuffer[3] = (dataBuffer[2] & 63);
                j = dataBuffer.length;
                while (j < 3)
                {
                    outputBuffer[(j + 1)] = 64;
                    j++;
                };
                k = 0;
                while (k < outputBuffer.length)
                {
                    output = (output + "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".charAt(outputBuffer[k]));
                    k++;
                };
            };
            return (output);
        }

        public static function decode(data:String):String
        {
            var bytes:ByteArray = decodeToByteArray(data);
            return (bytes.readUTFBytes(bytes.length));
        }

        public static function decodeToByteArray(data:String):ByteArray
        {
            var i:int;
            var j:int;
            var k:int;
            var output:ByteArray = new ByteArray();
            var dataBuffer:Array = new Array(4);
            var outputBuffer:Array = new Array(3);
            i = 0;
            while (i < data.length)
            {
                j = 0;
                while ((((j < 4)) && (((i + j) < data.length))))
                {
                    dataBuffer[j] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".indexOf(data.charAt((i + j)));
                    j++;
                };
                outputBuffer[0] = ((dataBuffer[0] << 2) + ((dataBuffer[1] & 48) >> 4));
                outputBuffer[1] = (((dataBuffer[1] & 15) << 4) + ((dataBuffer[2] & 60) >> 2));
                outputBuffer[2] = (((dataBuffer[2] & 3) << 6) + dataBuffer[3]);
                k = 0;
                while (k < outputBuffer.length)
                {
                    if ((dataBuffer[(k + 1)] == 64)) break;
                    output.writeByte(outputBuffer[k]);
                    k++;
                };
                i = (i + 4);
            };
            output.position = 0;
            return (output);
        }


    }
}//package org.client.mainCore.utils
