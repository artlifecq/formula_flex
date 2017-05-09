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
		
		public function DungeonEvent()
		{
		}
	}
}