package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;
	
	/**
	 * 组队事件
	 * @author EC
	 */
	public class TeamEvent 
	{
		/**别人加入我的队伍**/
		public static const TEAM_OTHER_JOIN_MY_TEAM:int = UNIQUEID.NEXT;
		/**队长改变**/
		public static const TEAM_CAPTION_CHANGE:int = UNIQUEID.NEXT;
		/**队员离队**/
		public static const TEAM_MEMB_LEAVE:int = UNIQUEID.NEXT;
		/**队员死亡**/
		public static const TEAM_MEMB_DEATH:int = UNIQUEID.NEXT;
		/**我的队伍状态发生改变 入队或者离队发生**/
		public static const TEAM_PLAYER_TEAM_STATE_UPDATE:int = UNIQUEID.NEXT;
		/**队员信息变化**/
		public static const TEAM_MEMB_INFO_UPDATE:int = UNIQUEID.NEXT;
		/**队员地图位置发生变化**/
		public static const TEAM_MEMB_MAP_UPDATE:int = UNIQUEID.NEXT;
		/**队伍玩家位置变化**/
		public static const TEAM_MEMB_POS_UPDATE:int = UNIQUEID.NEXT;
		/**组队邀请列表变化**/
		public static const TEAM_INVENT_JOIN_INFO_CHANGE:int = UNIQUEID.NEXT;
		/**收到申请入队变化**/
		public static const TEAM_APPLY_JOIN_INFO_CHANGE:int = UNIQUEID.NEXT;
		/**更新附近队伍搜索结果**/
		public static const TEAM_NEAR_TEAM_SEARCH_RESULT_UPDATE:int = UNIQUEID.NEXT;
		/**更新附近玩家搜索结果**/
		public static const TEAM_NEAR_PLAYER_SEARCH_RESULT_UPDATE:int = UNIQUEID.NEXT;
		/**邀请组队  同意按钮  事件**/
		public static const TEAM_INVENT_BTN_OK:int = UNIQUEID.NEXT;
		/**邀请组队  拒绝按钮  事件**/
		public static const TEAM_INVENT_BTN_NO:int = UNIQUEID.NEXT;
		/**申请进队  同意按钮  事件**/
		public static const TEAM_APPLY_JOIN_BTN_OK:int = UNIQUEID.NEXT;
		/**申请进队  拒绝按钮  事件**/
		public static const TEAM_APPLY_JOIN_BTN_NO:int = UNIQUEID.NEXT;
		/**组队---经验模式  事件**/
		public static const TEAM_EXP_MODE:int = UNIQUEID.NEXT;
		/**组队---拾取模式  事件**/
		public static const TEAM_PICK_UP_MODE:int = UNIQUEID.NEXT;
		/**组队-小队跟随 队长收到队员跟随了、队长转移队长、队长取消跟随事件**/
		public static const TEAM_FOLLOW_LEADER:int = UNIQUEID.NEXT;
		/**组队-小队跟 队员不在线了**/
		public static const TEAM_MEMB_NOT_ONLINE:int = UNIQUEID.NEXT;
		/**组队-小队跟 队长取消小队跟随**/
		public static const TEAM_LEADER_CANCEL_FOLLOW:int = UNIQUEID.NEXT;
		/**组队-小队跟 队员同意/取消 小队跟随**/
		public static const TEAM_PLAYER_FOLLOW:int = UNIQUEID.NEXT;
		/**组队-小队跟 自己被踢出队伍**/
		public static const TEAM_KICK_PLAYER:int = UNIQUEID.NEXT;
		/**组队-小队跟 队员离开队伍**/
		public static const TEAM_LEAVER_TEAM:int = UNIQUEID.NEXT;
		/**组队-小队跟 自己离开队伍**/
		public static const TEAM_MY_LEAVE_TEAM:int = UNIQUEID.NEXT;
		
	}
}