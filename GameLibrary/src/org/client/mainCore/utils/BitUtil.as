//Created by Action Script Viewer - http://www.buraks.com/asv
package org.client.mainCore.utils
{
    import flash.utils.ByteArray;

    public class BitUtil 
    {

        public static const BIT_POS:Array = [1, 2, 4, 8, 16, 32, 64, 128, 0x0100, 0x0200, 0x0400, 0x0800, 0x1000, 0x2000, 0x4000, 0x8000, 65536, 131072, 262144, 524288, 0x100000, 0x200000, 0x400000, 0x800000, 16777216, 33554432, 67108864, 134217728, 0x10000000, 0x20000000, 0x40000000, 0x80000000];


        public static function getBit(byte:uint, index:uint):uint
        {
            return (((byte & BIT_POS[index]) >> index));
        }

        public static function getInt($data:int, $pos:uint):Boolean
        {
            if (($pos >= 32))
            {
                return (false);
            };
            return (!((($data & (1 << $pos)) == 0)));
        }

        public static function setInt($data:int, $pos:uint, $value:Boolean):int
        {
            if (($pos >= 32))
            {
                return ($data);
            };
            if ($value)
            {
                $data = ($data | (1 << $pos));
            }
            else
            {
                $data = ($data & (-1 ^ (1 << $pos)));
            };
            return ($data);
        }

        public static function getByteArray($data:ByteArray, $pos:uint):Boolean
        {
            if (($pos >= ($data.length << 3)))
            {
                return (false);
            };
            var bytePos:int = $data.position;
            $data.position = ($pos >> 3);
            var value:int = $data.readByte();
            $data.position = bytePos;
            return (!(((value & (1 << ($pos % 8))) == 0)));
        }

        public static function setByteArray($data:ByteArray, $pos:uint, $value:Boolean):ByteArray
        {
            if (($pos >= ($data.length << 3)))
            {
                return ($data);
            };
            var bytePos:int = $data.position;
            var pos = ($pos >> 3);
            $data.position = pos;
            var value:int = $data.readByte();
            $data.position = pos;
            pos = ($pos % 8);
            if ($value)
            {
                value = (value | (1 << pos));
            }
            else
            {
                value = (value & (-1 ^ (1 << pos)));
            };
            $data.writeByte(value);
            $data.position = bytePos;
            return ($data);
        }


    }
}//package org.client.mainCore.utils
