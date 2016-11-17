package org.game.netCore.net_protobuff
{
    import com.netease.protobuf.Int64;
    import com.netease.protobuf.ReadUtils;
    import com.netease.protobuf.WriteUtils;
    import com.netease.protobuf.WritingBuffer;
    
    import flash.utils.ByteArray;

    public class ByteBuffer extends ByteArray 
    {

        private static const _POW_2_32:Number = Math.pow(2, 32);

        public function ByteBuffer()
        {
            endian = "bigEndian";
        }

        public static function get POW_2_32():Number
        {
            return _POW_2_32;
        }


        override public function readBytes(bytes:ByteArray, offset:uint=0, length:uint=0xFFFFFFFF):void
        {
            if (length == 0)
            {
                trace("\t警告！ByteBuffer.readBytes ：：：：  legth为0时，将不做任何处理，而不是读取所有可用数据。如果要读取所有可用数据,length应该为uint.MAX_VALUE");
                return;
            }
            if (length == 0xFFFFFFFF)
            {
                super.readBytes(bytes, offset, 0);
            }
            else
            {
                super.readBytes(bytes, offset, length);
            }
        }

        public function readLong():Number
        {
            var num0:int;
            var num1:int;
            if (endian == "bigEndian")
            {
                num0 = readInt();
                num1 = readUnsignedInt();
            }
            else
            {
                num1 = readUnsignedInt();
                num0 = readInt();
            }
            var num:Number = (num0 * POW_2_32) + num1;
            return num;
        }

        public function writeLong(val:Number):void
        {
            var num0:int = val / POW_2_32;
            var num1:uint = val % POW_2_32;
            if (endian == "bigEndian")
            {
                writeInt(num0);
                writeUnsignedInt(num1);
            }
            else
            {
                writeUnsignedInt(num1);
                writeInt(num0);
            }
        }

        public function writeVarint32(value:int):void
        {
            while (true)
            {
                if ((value & -128) == 0)
                {
                    writeByte(value);
                    return;
                }
                writeByte((value & 127) | 128);
                value = value >>> 7;
            }
        }

        public function readVarint32():int
        {
            return readUint32();
        }

        public function writeVarint64(value:Number):void
        {
            var int64:Int64 = Int64.fromNumber(value);
            var buffer:WritingBuffer = new WritingBuffer();
            buffer.endian = "bigEndian";
            WriteUtils.write_TYPE_INT64(buffer, int64);
            this.writeBytes(buffer);
        }

        public function readVarint64():Number
        {
            return ReadUtils.read_TYPE_INT64(this).toNumber();
        }

        public function readUint32():uint
        {
            var i:int;
            var _local2:int;
            var result:uint;
            i = 0;
            while (true)
            {
                _local2 = this.readUnsignedByte();
                if (i < 32)
                {
                    if (_local2 >= 128)
                    {
                        result = (result | ((_local2 & 127) << i));
                    }
                    else
                    {
                        result = (result | (_local2 << i));
                        break;
                    }
                }
                else
                {
                    do 
                    {
                    } while (readUnsignedByte() >= 128);
                    break;
                }
                i = i + 7;
            }
            return result;
        }

        public function writeUint32(value:uint):void
        {
            while (true)
            {
                if (value < 128)
                {
                    writeByte(value);
                    return;
                }
                writeByte((value & 127) | 128);
                value = value >>> 7;
            }
        }

        public function readString():String
        {
            var len:uint = readVarint32();
            return readUTFBytes(len);
        }

        public function writeString(value:String):void
        {
            var bytes:ByteArray = null;
            if (value == null)
            {
                this.writeInt(0);
            }
            else
            {
                bytes = new ByteArray();
                bytes.writeUTFBytes(value);
                writeVarint32(bytes.length);
                writeBytes(bytes);
            }
        }

        public function printString(radix:int=10):String
        {
            var b:String = null;
            var s:String = "";
            var bytes:ByteArray = new ByteArray();
            bytes.writeBytes(this);
            bytes.position = 0;
            if (radix == 10)
            {
                while (bytes.bytesAvailable > 0)
                {
                    s = s + bytes.readUnsignedByte().toString() + " ";
                }
            }
            else if (radix == 16)
			{
				while (bytes.bytesAvailable > 0)
				{
					b = bytes.readUnsignedByte().toString(16);
					if (b.length == 1)
					{
						b = "0" + b;
					}
					s = s + b + " ";
				};
			}
			else
			{
				throw new Error("radix 只能为 10 或 16");
			}
            return s;
        }
    }
}