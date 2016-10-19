package com.rpgGame.core.events.society
{
	import com.rpgGame.coreData.UNIQUEID;

	public class SocietyEvent
	{
		/** 本国帮派列表更新 **/
		public static const SOCIETY_LIST_UPDATE : int = UNIQUEID.NEXT;
		/** 他国帮派列表更新 **/
		public static const SOCIETY_OTHER_LIST_UPDATE : int = UNIQUEID.NEXT;
		/** 更新自己的帮派详细信息, 包括成员列表, 家族等级, 等级, 已捐献物品数量等等**/
		public static const SELF_SOCIETY_INFO_UPDATE : int = UNIQUEID.NEXT;
		/**离开帮派 或者 被踢了**/
		public static const LEAVE_SOCIETY : int = UNIQUEID.NEXT;
		/**加入帮派**/
		public static const JOIN_SOCIETY : int = UNIQUEID.NEXT;
		/**帮主召集**/
		public static const SOCIETY_LEADER_SUMMON : int = UNIQUEID.NEXT;
		/**帮派公告改变**/
		public static const SOCIETY_ANNOUNCEMENT_CHANGE : int = UNIQUEID.NEXT;
		/**帮派动态改变**/
		public static const SOCIETY_TRENDS_UPDATE : int = UNIQUEID.NEXT;
		/** 邀请我入家族的列表改变**/
		public static const INVITATE_SOCIETY_CHANGE : int = UNIQUEID.NEXT;
		/** 家族有人申请入族 **/
		public static const SOCIETY_APPROVE_CHANGE : int = UNIQUEID.NEXT;
		/** 帮派技能更新 **/
		public static const SOCIETY_SPELL_LIST_UPDATE : int = UNIQUEID.NEXT;
		/** 神兽副本状态改变 **/
		public static const SOCIETY_ANIMAL_DUNGEON_STATE_CHANGE : int = UNIQUEID.NEXT;
	}
}
