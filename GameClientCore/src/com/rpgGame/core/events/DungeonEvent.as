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
		public function DungeonEvent()
		{
		}
	}
}