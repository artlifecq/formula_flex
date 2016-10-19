package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * @author Guodong.Zhang
	 * 创建时间：2016-6-23 下午5:42:51
	 * 
	 */
	public class DaTiEvent
	{
		public static const PANEL_INFO_INIT:int = UNIQUEID.NEXT;
		public static const GET_QUESTION:int = UNIQUEID.NEXT;
		public static const ANSWER_SELECTED:int = UNIQUEID.NEXT;
		public static const SELF_RANKING_CHANGED:int = UNIQUEID.NEXT;
		public static const REMOVE_WRONG_SUCCESS:int = UNIQUEID.NEXT;
		public static const DOUBLE_SCORE_SUCCESS:int = UNIQUEID.NEXT;
		public static const FOLLOW_OTHER_SUCCESS:int = UNIQUEID.NEXT;
		public static const UI_UNABLE_ALL_PROP:int = UNIQUEID.NEXT;
		public static const UI_USED_FOLLOW_OTHER_PROP:int = UNIQUEID.NEXT;
		public static const UI_ABLE_ALL_PROP:int = UNIQUEID.NEXT;
		public static const UI_UPDATE_PROP_COUNT:int = UNIQUEID.NEXT;
		public static const UI_RESET_DA_TI_PANEL:int = UNIQUEID.NEXT;
		
	}
}