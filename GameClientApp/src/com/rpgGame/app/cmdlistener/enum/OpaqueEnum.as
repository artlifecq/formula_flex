package com.rpgGame.app.cmdlistener.enum
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *操作码枚举值 
	 * @author dik
	 * 
	 */
	public class OpaqueEnum
	{
		public static const DEFAULT_OP:int=rEnum.ENUM_START(0);//默认
		
		public static const XI_WEI:int=rEnum.next;//西卫 竞拍
		public static const ZHONG_WEI:int=rEnum.next;//中卫 竞拍
		public static const DONG_WEI:int=rEnum.next;//东卫 竞拍
		
		
		public function OpaqueEnum()
		{
		}
	}
}