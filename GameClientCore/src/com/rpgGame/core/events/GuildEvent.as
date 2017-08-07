package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class GuildEvent
	{
		public function GuildEvent()
		{
		}
		/**跳转到申请面板**/		
		public static const GO_TO_APPLY : uint = UNIQUEID.NEXT;
		/**是否有帮派改变来了，需要过这个事件来更新显示**/
		public static const HAVE_GUILD_CHANGE : uint = UNIQUEID.NEXT;
		/**事件有改变了，需要重新拉取**/
		public static const GUILD_EVENT_CHANGE : uint = UNIQUEID.NEXT;
		/**帮派名字改变了**/
		public static const GUILD_NAME_CHANGE : uint = UNIQUEID.NEXT;
		/**获取申请加入帮派的list**/
		public static const GET_JOIN_GUILD_LIST : uint = UNIQUEID.NEXT;
		/**获取本人帮派邀请的list**/
		public static const GET_INVITE_GUILD_LIST : uint = UNIQUEID.NEXT;
		/**删除一条邀请**/
		public static const DELETE_GUILD_INVAITE : uint = UNIQUEID.NEXT;
		/**请求本国帮派列表**/
		public static const GET_GUILD_LIST : uint = UNIQUEID.NEXT;
		/**帮派公告改变了**/
		public static const GUILD_ANNOUNCEMENT_CHANGE : uint= UNIQUEID.NEXT;
		/**帮派等级改变了升、降级**/
		public static const GUILD_LEVEL_CHANGE:uint = UNIQUEID.NEXT;
		/**领取俸禄状态改变了**/
		public static const GUILD_SALARY_CHANGE : uint = UNIQUEID.NEXT;
		/**数据初始化了**/
		public static const GUILD_DATA_INIT : uint = UNIQUEID.NEXT;
		/**帮派仓库变化了**/
		public static const GUILD_STORAGE_CHANGE : uint = UNIQUEID.NEXT;
		/**帮派贡献改变了**/
		public static const GUILDCONTRIBUTIONPOINT_CHANGE : uint = UNIQUEID.NEXT;
		/**帮派家族成员变化了**/
		public static const GUILD_FAMILY_CHANGE : uint = UNIQUEID.NEXT;
		/**帮派操作标识**/
		public static const GUILD_OPERATERESULT : uint = UNIQUEID.NEXT;
		
		/**帮派活跃度改变**/
		public static const GUILD_ACTIVE_CHANGE: uint = UNIQUEID.NEXT;
		
		/**主玩家帮会贡献改变**/
		public static const GUILD_MAINPLAYER_VALUE_CHANGE: uint = UNIQUEID.NEXT;
		
		/**跟新帮派技能信息**/
		public static const GUILD_SKILLINFO_CHAGE:uint = UNIQUEID.NEXT;
		/**王城争霸战信息**/
		public static const GUILD_WCZB_INFO:uint = UNIQUEID.NEXT;
		/**王城争霸申请列表**/
		public static const GUILD_WCZB_APPLYINFO:uint = UNIQUEID.NEXT;
		/**王城争霸竞价信息改变**/
		public static const GUILD_WCZB_CHANGEMAXPRICE:uint = UNIQUEID.NEXT;
		/**帮会活跃值变化**/
		public static const GUILD_CHANGE_ACTIVE:uint = UNIQUEID.NEXT;
		/**争霸阵营矿信息**/
		public static const GUILD_WAR_CAMPORE:uint = UNIQUEID.NEXT;
		/**通知帮会战玩家排名**/
		public static const GUILD_WAR_PERSONRANK:uint = UNIQUEID.NEXT;
		/**通知个人信息**/
		public static const GUILD_WAR_PERSIONINFO:uint = UNIQUEID.NEXT;
		/**通知阵营积分**/
		public static const GUILD_WAR_CAMPSCORE:uint = UNIQUEID.NEXT;
		/**回复矿位置**/
		public static const GUILD_WAR_FINDORE:uint = UNIQUEID.NEXT;
		/**争霸城**/
		public static const GUILD_WCZB_FIGHTCITY:uint = UNIQUEID.NEXT;
		/**王城争霸结束**/
		public static const GUILD_WCZB_OVER:uint = UNIQUEID.NEXT;
		/**跨服帮会战占领信息**/
		public static const GUILD_HCZB_AVATAR_LIST:uint = UNIQUEID.NEXT;
		/**显示统帅技能**/
		public static const GUILD_LEADER_SKILL_SHOW:uint=UNIQUEID.NEXT;
	}
}