package org.game.netCore.net_protobuff
{
    import flash.utils.ByteArray;
    import com.netease.protobuf.ReadUtils;

    public class BytesUtil 
    {

        private static const _POW_2_32:Number = Math.pow(2, 32);


        public static function readLong(bytes:ByteArray):Number
        {
            var num0:int;
            var num1:int;
            if (bytes.endian == "bigEndian")
            {
                num0 = bytes.readInt();
                num1 = bytes.readUnsignedInt();
            }
            else
            {
                num1 = bytes.readUnsignedInt();
                num0 = bytes.readInt();
            }
            var num:Number = (num0 * _POW_2_32) + num1;
            return num;
        }

        public static function readVarint32(bytes:ByteArray):int
        {
            return readUint32(bytes);
        }

        public static function readUint32(bytes:ByteArray):uint
        {
            var i:int;
            var _local3:int;
            var result:uint;
            i = 0;
            while (true)
            {
                _local3 = bytes.readUnsignedByte();
                if (i < 32)
                {
                    if (_local3 >= 128)
                    {
                        result = result | ((_local3 & 127) << i);
                    }
                    else
                    {
                        result = result | (_local3 << i);
                        break;
                    }
                }
                else
                {
                    do 
                    {
                    } while (bytes.readUnsignedByte() >= 128);
                    break;
                }
                i = i + 7;
            }
            return result;
        }

        public static function readVarint64(bytes:ByteArray):Number
        {
            return ReadUtils.read_TYPE_INT64(bytes).toNumber();
        }

        public static function readRemainUTF(bytes:ByteArray):String
        {
            var result:String = bytes.readUTFBytes(bytes.bytesAvailable);
            return result;
        }

        public static function bytes2UTF(bytes:ByteArray):String
        {
            var position:int = bytes.position;
            bytes.position = 0;
            var result:String = bytes.readUTFBytes(bytes.bytesAvailable);
            bytes.position = position;
            return result;
        }
    }
}