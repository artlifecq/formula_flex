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
	}
}