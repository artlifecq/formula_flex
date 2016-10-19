package com.rpgGame.app.cmdlistener.enum
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 品质枚举 
	 * @author 陈鹉光
	 * 
	 */	
	public class EmQuality
	{
		/** 品质 0：白色 **/
		public static const QUALITY_WHITE:uint = rEnum.ENUM_START();
		/** 品质 1：绿色 **/
		public static const QUALITY_GREEN:uint = rEnum.next;
		/** 品质 2：蓝色 **/
		public static const QUALITY_BLUE:uint = rEnum.next;
		/** 品质 3：紫色 **/
		public static const QUALITY_PURPLE:uint = rEnum.next;
		/** 品质 4：橙色 **/
		public static const QUALITY_ORANGE:uint = rEnum.next;
		/** 品质 5：灰色【灰色是特殊经书品质】 **/
		public static const QUALITY_GRAY:uint = rEnum.next;
	}
}