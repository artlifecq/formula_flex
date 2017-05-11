package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 消息通知栏，图片类型
	 * @author fly.liuyang
	 * 根据Type取对应的图片 修改请勿改动其他Type值
	 */
	public class EnumFunctionMessageBarIcoType
	{
		/** 好友 1 **/
		public static const FRIEND_TYPE : int = rEnum.ENUM_START(1);
		/** 敌人 2 **/
		public static const ENEMY_TYPE : int = rEnum.next;
		/** 帮会 3 **/
		public static const GUILD_TYPE : int = rEnum.next;
		/** 聊天 4 **/
		public static const CHAT_TYPE : int = rEnum.next;
		/** 组队 5 **/
		public static const TEAM_TYPE : int = rEnum.next;
		/** mail 6 **/
		public static const MAIL_TYPE : int = rEnum.next;
		/** 邀请入帮 7 **/
		public static const INVITE_ADD_GUILD : int = rEnum.next;
		/** 降妖除魔 8 **/
		public static const WORLD_BOSS : int = rEnum.next;
		/** 排位赛排位变化9 **/
		public static const QUA_RANK_CHANGE : int = rEnum.next;
		/**福袋图标10**/
		public static const FU_DAI_TYPE : int = rEnum.next;
		/**country award 11**/
		public static const COUNTRY_AWARD_TYPE : int = rEnum.next;
		/** 个人运镖求助 12 **/
		public static const GE_REN_YUN_BIAO_HELP : int = rEnum.next;
		/** 个人运镖护镖 13 **/
		public static const GE_REN_HU_BIAO : int = rEnum.next;
		/** 战斗记录 14 **/
		public static const BATTLE_RECORD : int = rEnum.next;
		/** 权利印记 15 **/
		public static const PRIVILEGE_MARK_TYPE : int = rEnum.next;
		/** 禁卫军申请 16 **/
		public static const JIN_WEI_APPLICANT_TYPE : int = rEnum.next;
		/** 入帮邀请 17 **/
		public static const SOCIETY_JOIN_INVITE_TYPE : int = rEnum.next;
		/** 组队邀请 18 **/
		public static const TEAM_INVITE_WAITE_TYPE : int = rEnum.next;
		/** 入队申请 19 **/
		public static const TEAM_APPLY_JOIN_TYPE : int = rEnum.next;
		/** 交易 20 **/
		public static const TRADE_TYPE : int = rEnum.next;
		/**复活 21 **/
		public static const RELIVE_TYPE : int = rEnum.next;
		/**申请加入帮派的家族列表 22 **/
		public static const REQ_JOIN_GUILD : int = rEnum.next;
		/**邀请我加入帮派的列表 23 **/
		public static const INVITE_JOIN_GUILD : int = rEnum.next;
		/**坐骑繁育邀请 24 **/
		public static const MOUNT_BREAD_INVITE_WAITE_TYPE : int = rEnum.next;
		/**帮派 被设置成副帮主了**/
		public static const GUILD_BEEN_SET_POS : int = rEnum.next;
		/**帮派 被卸任副帮主了**/
		public static const GUILD_BEEN_REMOVE_POS : int = rEnum.next;
		/**被开除出帮派了**/
		public static const GUILD_BEEN_KICK_GUILD : int = rEnum.next;
		/**加入帮派成功了**/
		public static const GUILD_JION_COMPLETE : int = rEnum.next;
		/**新邮件*/
		public static const MAIL_NEWMAIL : int = rEnum.next;
	}
}
