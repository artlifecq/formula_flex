package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 八阵图事件
	 * 
	 */
	public class BaZhenTuEvent
	{
		/** 进入八阵图次数变更 **/
		public static const ENTER_BAZHENTU_TIME_CHANGE:int = UNIQUEID.NEXT;
		/** 副本结束 **/
		public static const DUNGEON_FINISH:int = UNIQUEID.NEXT;
		/** 详情面板刷新 **/
		public static const BA_ZHEN_TU_DETAIL_UPDATE:int = UNIQUEID.NEXT;
		/** 怪物进入场景 **/
		public static const MONSTER_ENTER_SCENE:int = UNIQUEID.NEXT;
		/** 石碑进入场景 **/
		public static const SHIBEI_ENTER_SCENE:int = UNIQUEID.NEXT;
		
	}
}