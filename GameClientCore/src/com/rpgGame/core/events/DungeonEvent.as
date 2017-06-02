package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *副本相关事件
	 *@author dik
	 *2017-5-8下午1:54:13
	 */
	public class DungeonEvent
	{
		/**
		 *更新论剑面板 
		 */
		public static const UPDATE_LUNJIAN_PANEL:int = UNIQUEID.NEXT;
		/**
		 *更新论剑时间
		 */
		public static const UPDATE_LUNJIAN_TIME:int = UNIQUEID.NEXT;
		
		/**
		 *更新日常副本时间
		 */
		public static const UPDATE_DAILYZONE_TIME:int = UNIQUEID.NEXT;
		
		/**
		 *更新日常副本信息 
		 */
		public static const UPDATE_DAILYZONE_INFO:int = UNIQUEID.NEXT;
		
		/**
		 *更新副本波次信息
		 */
		public static const UPDATA_WAVE_INFO:int = UNIQUEID.NEXT;
		
		/**
		 *更新副本结束信息 
		 */
		public static const UPDATA_DAILYZONE_ENDINFO:int = UNIQUEID.NEXT;
		
		/**
		 *进入副本
		 */
		public static const ENTER_ZONE:int = UNIQUEID.NEXT;
		/**
		 *退出副本
		 */
		public static const OUT_ZONE:int = UNIQUEID.NEXT;
		/**
		 *副本状态信息
		 */
		public static const ZONE_STAGE_CHANGE:int = UNIQUEID.NEXT;
		/**
		 *副本时间
		 */
		public static const ZONE_REMAIN_TIME:int = UNIQUEID.NEXT;
		/**
		 *击杀列表
		 */
		public static const ZONE_SKILL_INFOS:int = UNIQUEID.NEXT;
		/**
		 *击杀单个
		 */
		public static const ZONE_SKILL_INFO:int = UNIQUEID.NEXT;
		/**
		 *触发列表
		 */
		public static const ZONE_CUR_TRIGGER:int = UNIQUEID.NEXT;
		/**
		 *准备退出副本
		 */
		public static const ZONE_OUT_RESULT:int = UNIQUEID.NEXT;
		/**
		 *通关奖励
		 */
		public static const ZONE_REWARD:int = UNIQUEID.NEXT;
		
		
		
		public function DungeonEvent()
		{
		}
	}
}