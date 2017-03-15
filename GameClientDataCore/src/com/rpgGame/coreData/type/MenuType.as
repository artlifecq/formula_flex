package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.lang.LangChat;
	import com.rpgGame.coreData.lang.LangMenu;


	public class MenuType
	{
		//---------------------下拉菜单的集合
		public static const EQUIP_MENUS : Array = [LangMenu.WEAR, LangMenu.MOVE, LangMenu.SELL, LangMenu.DISCARDED, LangMenu.SHOW];
		public static const GEM_MENUS : Array = [LangMenu.MOSAIC, LangMenu.MOVE, LangMenu.SPLIT, LangMenu.SELL, LangMenu.DISCARDED, LangMenu.SHOW];
		public static const MATERIAL_MENUS : Array = [LangMenu.SYNTHETIC, LangMenu.MOVE, LangMenu.SPLIT, LangMenu.SELL, LangMenu.DISCARDED, LangMenu.SHOW];
		public static const ITEM_MENUS : Array = [LangMenu.USE_ITEM, /*LangMenu.BATCH_ITM, */LangMenu.MOVE, LangMenu.SPLIT, LangMenu.SELL, LangMenu.DISCARDED, LangMenu.SHOW];
		public static const ITEM_MENUS_DEPOT : Array = [LangMenu.MOVE];
		public static const ITEM_MENUS_NOMOVE : Array = [LangMenu.USE_ITEM,LangMenu.SPLIT, LangMenu.SELL, LangMenu.DISCARDED, LangMenu.SHOW];
		/**好友列表选择**/
		public static const FRIEND_MENUS : Array = [LangMenu.DUI_HUA,LangMenu.SI_LIAO,LangMenu.INVITE_TEAM,LangMenu.REMOVE_FRIEND, LangMenu.BLACK_FRIEND,LangMenu.COPY_THE_NAME];
		/**移除最近联系人**/
		public static const FRIEND_TALK_MENUS : Array = [LangMenu.REMOVE_TALK];
		/**黑名单列表选择**/
		public static const FRIEND_BLACK_MENUS : Array = [LangMenu.REMOVE_BLACK];
		/**聊天频道选择(这一部分是提取LangChat里面的内容，需要更改就去改chat.txt)**/
		public static const CHAT_CHANNELS : Array = [LangChat.CHAT_CHANNEL_WORLD, LangChat.CHAT_CHANNEL_ALLY, LangChat.CHAT_CHANNEL_NORMAL, LangChat.CHAT_CHANNEL_PARTY, LangChat.CHAT_CHANNEL_TEAM, LangChat.CHAT_CHANNEL_LABA];
		
		/**聊天里人物名字弹出的列表**/
		public static const CHAT_HERO : Array = [LangMenu.LOOK_HERO,LangMenu.ADD_FRIEND,LangMenu.INVITE_TEAM,LangMenu.SI_LIAO,LangMenu.DUI_HUA,LangMenu.COPY_THE_NAME,LangMenu.BLACK_FRIEND];
		
		/** 组队面板人物名字 弹出菜单[ 转移队长,请离队伍,加为好友,邀请队伍语音,赠送鲜花,查看资料 ] **/
		public static const TEAM_MENUS:Array = [ LangMenu.TRANSFER_THE_CAPTAIN, LangMenu.PLEASE_FROM_THE_TEAM, LangMenu.ADD_FRIEND, LangMenu.INVITE_TEAM_VOICE, LangMenu.LOOK_HERO ];
		/****/
		public static const GUILD_INFO_LIST_SET_UP : Array = [LangMenu.SET_UP_VICE_LEADER,LangMenu.KICK_GUILD];
		/**移除副帮主**/
		public static const GUILD_INFO_LIST_REMOVE : Array = [LangMenu.REMOVE_VICE_LEADER,LangMenu.KICK_GUILD]
		//---------------------以下都是背包物品的操作
		public function MenuType()
		{
		}
	}
}
