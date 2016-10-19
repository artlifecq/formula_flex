package com.client.utils
{
	import flash.utils.ByteArray;

	/**
	 * 结构体对齐使用的工具 
	 * @author kuhx
	 * 2011.11.07
	 */
	public class StructUtils
	{
		/** 预先生成的全为0的缓冲区 **/
		private static var m_zeroBuf:ByteArray = null;
		public static function FillBufZero(buf:ByteArray, len:uint) : ByteArray
		{
			var i:uint = 0;
			if (m_zeroBuf == null)
			{
				m_zeroBuf = new ByteArray();
				for (i=0; i<64; i++)
				{
					m_zeroBuf.writeUnsignedInt(0);
				}
			}
			for (i=0; i<len; i+=256)
			{
				var l:uint = uint(Math.min(256, len-i));
				buf.writeBytes(m_zeroBuf, 0, l);
			}
			return buf;
		}
	}
}