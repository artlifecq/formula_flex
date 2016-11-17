package org.game.netCore.data
{
    import flash.utils.ByteArray;
	
	/**
	 * 消息数据结构
	 * @author tyevlag
	 * 
	 */	
    public dynamic class ByteData implements IRawData
	{
        protected var _buf:ByteArray;

        public function write(_buf:ByteArray):Boolean
		{
            this._buf = _buf;
            return writing();
        }

        public function read(_buf:ByteArray):Boolean 
		{
            this._buf = _buf;
            return reading();
        }

        protected function writing():Boolean
		{
            return true;
        }

        protected function reading():Boolean 
		{
            return false;
        }

        protected function writeInt(value:int):void
		{
            _buf.writeInt(value);
        }

        protected function writeString(value:String):void 
		{
            if (value == null)
			{
                _buf.writeInt(0);
            } 
			else
			{
                var bytes:ByteArray = new ByteArray();
                bytes.writeUTFBytes(value);
                _buf.writeInt(bytes.length);
                _buf.writeBytes(bytes);
            }
        }

        protected function writeFloat(value:Number):void 
		{
            _buf.writeFloat(value);
        }

        protected function writeInt64(value:Int64):void
		{
			if ( value == null )
			{
				value = new Int64();
			}
            value.bytes.position = 0;
            _buf.writeBytes(value.bytes);
        }

        protected function writeByteData(value:ByteData):void 
		{
            value.write(_buf);
        }

        protected function writeShort(value:int):void 
		{
            _buf.writeShort(value);
        }

        protected function writeByte(value:int):void
		{
            _buf.writeByte(value);
        }
		
		protected function writeBoolean(value:Boolean):void 
		{
			_buf.writeByte(value?1:0);
		}
		
        protected function readInt():int 
		{
            return _buf.readInt();
        }

        protected function readString():String 
		{
            var length:int = _buf.readInt();
            if (length == 0) 
				return null;
            else 
			return _buf.readUTFBytes(length);
        }

        protected function readInt64():Int64
		{
            var bytes:ByteArray = new ByteArray();
            _buf.readBytes(bytes, 0, 8);
            var long1:Int64 = new Int64();
            long1.bytes = bytes;
            return long1;
        }

        protected function readFloat():Number 
		{
            return _buf.readFloat();
        }

        protected function readByteData(clazz:Class):ByteData
		{
            var bean:ByteData = new clazz() as ByteData;
            bean.read(_buf);
            return bean;
        }

        protected function readShort():int
		{
            return _buf.readShort();
        }

        protected function readByte():int 
		{
            return _buf.readByte();
        }
		
		protected function readBoolean():Boolean 
		{
			return _buf.readByte() != 0;
		}
		
        protected function readBytes():ByteArray 
		{
            var length:int = _buf.readInt();
            var bytes:ByteArray = new ByteArray();
            _buf.readBytes(bytes, 0, length);
            return bytes;
        }
		
		protected function writeIntCheck(value:int):void
		{
			if (value != 0)
				_buf.writeInt(value);
		}
		
		protected function writeStringCheck(value:String):void 
		{
			if (value != null)
			{
				var bytes:ByteArray = new ByteArray();
				bytes.writeUTFBytes(value);
				_buf.writeInt(bytes.length);
				_buf.writeBytes(bytes);
			}
		}
		
		protected function writeFloatCheck(value:Number):void 
		{
			if (value != 0)
				_buf.writeFloat(value);
		}
		
		protected function writeShortCheck(value:int):void 
		{
			if (value != 0)
				_buf.writeShort(value);
		}
		
		protected function writeByteCheck(value:int):void
		{
			if (value != 0)
				_buf.writeByte(value);
		}
    }
}