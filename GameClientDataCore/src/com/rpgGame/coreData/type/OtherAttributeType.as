package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 *非角色属性
	 *和角色属性类似但是值在1000000以上不能和角色属性重复
	 * @author dik
	 * 
	 */
	public class OtherAttributeType
	{
		/**
		 *帮贡 
		 */
		public static const BANG_GONG:int=rEnum.ENUM_START(1000000);
		/**
		 * 活跃度
		 */
		public static const HUO_YUEDU:int=rEnum.next;
		
		public function OtherAttributeType()
		{
		}
	}
}