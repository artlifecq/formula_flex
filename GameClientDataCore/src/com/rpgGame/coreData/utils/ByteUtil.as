package com.rpgGame.coreData.utils
{
	/**
	 * 定义一些用来操作byte的方法
	 * @author wangyuan
	 */	
	public class ByteUtil
	{
		/**
		 * 设置byte中某一位的值
		 * @param byte 需要操作的byte
		 * @param site 需要设置值的位的索引，最低位为0，以此类推，这里最高32位，因为byte参数为uint
		 * @param value 设置的值，0或1，大于1则设为1
		 * @return 更新后的byte值
		 */
		public static function setByteValue(byte:uint, site:uint, value:uint):uint
		{
			//如果该值不需要设置，则返回
			if(getByteValue(byte, site) == value)return byte;
			var mask:uint = 1<<site;
			//将目标位设为1
			if(value>=1){
				return byte |= mask;
			}else{
				mask = ~mask;
				return byte &= mask;
			}
		}
		
		/**
		 * 获取byte中某一位的值
		 * @param byte 需要操作的byte
		 * @param site 需要获取值的位的索引，最低位为0，以此类推，这里最高32位，因为byte参数为uint
		 * @return 取得的值，1或0
		 */
		public static function getByteValue(byte:uint, site:uint):uint
		{
			return byte>>>site & 1;
		}
		/**
		 * 从一个32位中取两个16位整数出来
		 * @param value
		 * @return 
		 */		
		public static function getNumsFromInt32(value:uint):Array
		{
			var endX:int = value&0xffff;
			value = value >> 16;
			var endY:int = value&0xffff;
			return [endX, endY];
		}
	}
}