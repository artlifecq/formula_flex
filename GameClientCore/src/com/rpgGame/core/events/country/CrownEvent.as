package com.rpgGame.core.events.country
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * 王权/国家系统消息 
	 * @author Mandragora
	 * 
	 */
	public class CrownEvent
	{
		public function CrownEvent()
		{
		}
		/**内政内有属性改变了**/
		public static const NEI_ZHEN_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 统治力改变 
		 */		
		public static const TONG_ZHI_LI_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 国家公告改变  
		 */		
		public static const ANNOUNCEMENT_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 预留 获取国家公告派发这条消息 
		 */		
		public static const GET_ANNOUNCEMENT : uint = UNIQUEID.NEXT;
		/**
		 * 禁卫公告改变  
		 */		
		public static const JIN_WEI_ANNOUNCEMENT_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 预留 获取国家公告派发这条消息 
		 */		
		public static const GET_JIN_WEI_ANNOUNCEMENT : uint = UNIQUEID.NEXT;
		/**
		 *  俸禄领取状态改变
		 */		
		public static const HAS_COLLECT_SALARY_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 募捐状态改变 boolean 
		 */		
		public static const COUNTRY_DONATE_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 国库银子改变 
		 */		
		public static const EXCHEQUER_DONATE_CHANGE : uint = UNIQUEID.NEXT;
		
		/**
		 * 禁言时间改变了。 
		 */		
		public static const DONT_TALK_END_TIME_CHANGE : uint = UNIQUEID.NEXT;
		/**
		 * 禁言次数改变了 
		 */		
		public static const SET_DONT_TALK_TIME_CHANGE : uint = UNIQUEID.NEXT;
		/**囚禁次数改变**/
		public static const SET_CAPTIVITY_TIME_CHANGE : uint = UNIQUEID.NEXT;
		/**囚禁结束时间**/
		public static const CAPTIVITY_END_TIME_CHANGE : uint = UNIQUEID.NEXT;
		/**战报改变了**/
		public static const CROWN_ZHAN_BAO_CHANGE : uint = UNIQUEID.NEXT;
	}
}