package org.game.netCore.net
{
    import flash.utils.ByteArray;
    
    import org.game.netCore.data.ByteData;
    import org.game.netCore.data.long;

    public dynamic class Bean extends ByteData
	{
		protected function writeLongCheck(value:long):void 
		{
			if ( value != null )
			{
				value.bytes.position = 0;
				_buf.writeBytes(value.bytes);
			}
		}
		
		protected function writeBeanCheck(value:Bean):void 
		{
			if (value != null)
				value.write(_buf);
		}
		
        protected function writeLong(value:long):void 
		{
			if ( value == null )
			{
				value = new long();
			}
            value.bytes.position = 0;
            _buf.writeBytes(value.bytes);
        }

        protected function writeBean(value:Bean):void 
		{
            value.write(_buf);
        }

        protected function readLong():long 
		{
            var bytes:ByteArray = new ByteArray();
            _buf.readBytes(bytes, 0, 8);
            var long1:long = new long();
            long1.bytes = bytes;
            return long1;
        }

       
        protected function readBean(clazz:Class):Bean 
		{
            var bean:Bean = new clazz() as Bean;
            bean.read(_buf);
            return bean;
        }

        protected function readUnsignedShort():int 
		{
            return _buf.readUnsignedShort()
        }

    }
}