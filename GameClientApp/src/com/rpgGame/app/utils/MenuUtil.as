package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.ChatWindowManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.friend.FriendManager;
	import com.rpgGame.app.manager.goods.ItemUseManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.trade.TradeManager;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ChatEvent;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.society.SocietyStaticConfigData;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.society.SocietyMemberData;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.lang.LangMisc;
	import com.rpgGame.coreData.lang.LangTeam;
	import com.rpgGame.coreData.type.MailType;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	
	import app.message.AllFamilyOfficerDatasProto.FamilyOfficerDataProto;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	
	/**
	 * 弹出菜单
	 * @author luguozheng
	 *
	 */
	public class MenuUtil
	{
		
		public static function getPlayerTargetMenu(targetID:Number,fromChat:Boolean = false):Array
		{
			var selfMemberData : SocietyMemberData = SocietyManager.getSelfMemberData();
			var officerDataProto : FamilyOfficerDataProto = selfMemberData ? SocietyStaticConfigData.getFamilyOfficerDataByPos(selfMemberData.societyPos) : null;
			var menus : Array = [];
			if(fromChat)
			{
				menus.push(LangMenu.SI_LIAO);
			}
			menus.push(LangMenu.LOOK_HERO);
			//			if(!FriendManager.checkIsFriend(targetID))
			//			{
			//				menus.push(LangMenu.ADD_FRIEND);
			//			}
			//			if(!TeamManager.isInTeam(targetID))
			//			{
			//这个需要一直显示 
			menus.push(LangMenu.INVITE_TEAM);
			//			}
			//			menus.push(LangMenu.TRADE);
			if(!fromChat)
			{
				menus.push(LangMenu.SI_LIAO);
			}
			//			menus.push(LangMenu.DUI_HUA);
			//			if (officerDataProto && officerDataProto.canInviteOther) // 能否邀请他人，或者回复申请
			//			{
			//				menus.push(LangMenu.INVITE_JOIN_SOCIETY);
			//			}
			if(GuildManager.instance().haveGuild&&GuildManager.instance().canInvite
				&&GuildManager.instance().getGuildMemberInfoById(targetID.toString())==null)//能否邀请他人加入帮派
			{
				menus.push(LangMenu.INVITE_JOIN_GUILD);
			}
			//			menus.push(LangMenu.SEND_MAIL, LangMenu.COPY_THE_NAME, LangMenu.BLACK_FRIEND);
			return menus;
		}
		
		
		public static function getPlayerTargetGuildMenu(targetID:String,fromChat:Boolean = false):Array
		{
			var menus : Array = [];
			var selfMemberData : SocietyMemberData = SocietyManager.getSelfMemberData();
			menus.push(LangMenu.LOOK_HERO);
			menus.push(LangMenu.INVITE_TEAM);
			var info:GuildMemberInfo = GuildManager.instance().getGuildMemberInfoById(targetID);
			if(info!=null)
			{
				if(GuildManager.instance().haveGuild&&GuildManager.instance().canExpel
					&&info.memberType>GuildManager.instance().selfMemberInfo.memberType)//逐出成员
				{
					menus.push(LangMenu.KICK_GUILD);
				}
				
				if(GuildManager.instance().haveGuild&&GuildManager.instance().canElder)//任命职务
				{
					menus.push(LangMenu.SET_UP_VICE_LEADER);
				}
				
				if(GuildManager.instance().haveGuild&&GuildManager.instance().canLeader)//任命统帅
				{
					menus.push(LangMenu.SETUP_LEADER);
				}
			}
			
			return menus;
		}
		
		public static function getPlayerTargetGuildMenu2(targetID:String,fromChat:Boolean = false):Array
		{
			var menus : Array = [];
			
			if(GuildManager.instance().haveGuild&&GuildManager.instance().canLeader
				&&GuildManager.instance().getGuildMemberInfoById(targetID)!=null)//任命统帅
			{
				menus.push(LangMenu.SETUP_LEADER);
			}
			return menus;
		}
		
		/**
		 * 在这个表里，res\config\lang\cn\ui_text\Misc.txt   MENU_CONFIG
		 */
		private static var menuConfig : Array;
		
		/**
		 * 得到这个菜单的名字
		 * @param type   MenuType
		 * @return
		 *
		 */
		public static function getMenuTitle(type : String) : String
		{
			return LanguageConfig.getText(type);
		}
		
		/**
		 * 这个功能是否要显示
		 * @param type
		 * @return
		 *
		 */
		public static function isShowType(type : int) : Boolean
		{
			return true;
		}
		
		/**
		 * 根据类型来分别处理对应功能
		 * 基本上就两个东西上才会用到弹出菜单
		 * 1、玩家名字--会有加好友、加帮派、组队，那id就是英雄ID了
		 * 2、装备---背包、仓库两个地方用到。那id是格子ID（就是这个装备所在空间的位置，用这个索引到对应背包或者仓库对应的数据）
		 * 	  如果背包和仓库都有移动功能，无法区别时。那就再创建一个新移动类型出来，如果保存的数据只有ID不够用那么再修改或者扩展
		 *
		 *
		 */
		public static function doMenu(type : String) : void
		{
			var data : Object = MenuManager.curData;
			
			if (data == null)
				return;
			
			if (data is ClientItemInfo)
			{
				var item : ClientItemInfo = data as ClientItemInfo;
				switch (type)
				{
					case LangMenu.SELL:
						Mgr.shopMgr.readySellItem(item);
						break;
					case LangMenu.MOVE:
						EventManager.dispatchEvent(ItemEvent.ITEM_PRE_MOVE, data);
						break;
					case LangMenu.WEAR:
						ItemUseManager.useItem(item);
						break;
					case LangMenu.SPLIT:
						EventManager.dispatchEvent(ItemEvent.ITEM_PRE_SPLITE, data);
						break;
					case LangMenu.USE_ITEM:
						ItemUseManager.useItem(item);
						break;
					case LangMenu.BATCH_ITM:
						EventManager.dispatchEvent(ItemEvent.ITEM_BATCH, data);
						break;
					case LangMenu.DISCARDED://丢弃
						EventManager.dispatchEvent(ItemEvent.ITEM_DISCARDED, data);
						break;
					case LangMenu.SHOW:
						EventManager.dispatchEvent(ChatEvent.SHOW_GOODS, data);
						break;
				}
				return;
			}
			
			
			if(data is GridInfo){
				switch (type)
				{
					case LangMenu.GET_ITEM:
						EventManager.dispatchEvent(ItemEvent.ITEM_GET, data);
						break;
				}
				return ;
			}
			
			var datas : Array = data as Array;
			var heroId :long;
			if(datas[0] is long)
			{
				heroId = datas[0];
			}else{
				heroId = new long(datas[0]);
			}
			var heroName : String = datas[1];
			
			switch (type)
			{
				case LangMenu.LOOK_HERO://查看玩家信息
					LookSender.lookOtherPlayer(heroId);
					//					LookSender.reqLook(heroId,true);
					//					Mgr.teamMgr.loopPlayer(heroId);
					break;
				case LangMenu.INVITE_JOIN_SOCIETY://邀请加入帮派
					//					SocietyManager.reqInviteJoin(heroId);
					break;
				case LangMenu.SEND_MAIL://发送邮件
				case LangMenu.INVITE_JOIN_GUILD:
					GuildManager.instance().reqGuildJoin(heroId,0);
					break;
				case LangMenu.SEND_MAIL://邀请加入帮派
					AppManager.showAppNoHide(AppConstant.MAIL_PANEL, [MailType.SEND, heroId, heroName, LanguageConfig.getText(LangMisc.NOTHING_INFO)]);
					break;
				case LangMenu.ADD_FRIEND://加为好友
					FriendManager.requestAddFriend(heroId.fValue);
					break;
				case LangMenu.REMOVE_FRIEND://删除
					FriendManager.requestRemoveFriend(heroId.fValue);
					break;
				case LangMenu.BLACK_FRIEND://屏蔽
					FriendManager.requestAddBlack(heroId.fValue);
					break;
				case LangMenu.REMOVE_BLACK://解除屏蔽
					FriendManager.requestRemoveBlack(heroId.fValue);
					break;
				case LangMenu.SOCIETY_CHANGE_JOB://更改职务
					AppManager.showAppNoHide(AppConstant.SOCIETY_OFFICER_POS_ALERT_PANEL, [heroId]);
					break;
				case LangMenu.KICK_SOCIETY://逐出帮会
					SocietyManager.requestExpelled(heroId.fValue, heroName);
					break;
				case LangMenu.TRADE://交易
					TradeManager.invitePlayerTrade(heroId.fValue);
					break;
				case LangMenu.TRANSFER_THE_CAPTAIN://转移队长
					TeamSender.ReqAppointNewCaptain(Mgr.teamMgr.teamInfo.teamId,heroId);
					break;
				case LangMenu.PLEASE_FROM_THE_TEAM://请离队伍
					TeamSender.ReqKickTeam(heroId);
					break;
				case LangMenu.LEAVE_TEAM://离开队伍
					//					if( TeamManager.isTeamLeader( MainRoleManager.actorID ) )//自己是队长
					//						onAgreeLeaveTeam();
					//					else
					//						GameAlert.showAlertUtil(LangAlertInfo.TEAM_LEAVE_TEAM,leaveTeamClick);
					//					break;
				case LangMenu.INVITE_TEAM_VOICE://邀请队伍语音
					NoticeManager.showNotify( LangTeam.TEAM_FAIL_TIP );
					break;
				case LangMenu.SEND_FLOWERS://赠送鲜花
					NoticeManager.showNotify( LangTeam.TEAM_FAIL_TIP );
					break;
				case LangMenu.SI_LIAO://私聊
					EventManager.dispatchEvent(ChatEvent.SWITCH_PRIVATE_CHANNEL,heroId,heroName);
					break;
				case LangMenu.INVITE_TEAM://组队
					Mgr.teamMgr.InvitePlayerJoinTeam(new long(heroId));
					//					TeamManager.InvitePlayerJoinTeam( heroId );
					break;
				case LangMenu.PLAY://切磋
					NoticeManager.showNotify( LangTeam.TEAM_FAIL_TIP );
					break;
				case LangMenu.COPY_THE_NAME://复制名称
					Clipboard.generalClipboard.clear();
					Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,heroName,false);
					break;
				case LangMenu.TEAM_EXP_MEAN_MODE://经验平均分配
					//					TeamManager.expIndex = 0;
					//					TeamManager.sendSetTeamExpAllocate( false );
					//					EventManager.dispatchEvent( TeamEvent.TEAM_EXP_MODE );
					break;
				case LangMenu.TEAM_EXP_HURT_MODE://经验按伤害分配
					//					TeamManager.expIndex = 1;
					//					TeamManager.sendSetTeamExpAllocate( true );
					//					EventManager.dispatchEvent( TeamEvent.TEAM_EXP_MODE );
					break;
				case LangMenu.TEAM_PICK_UP_MODE://轮流拾取
					//					TeamManager.pickupIndex = 0;
					//					TeamManager.sendSetTeamDropAllocate( TeamDropAllocateType.TURN );
					//					EventManager.dispatchEvent( TeamEvent.TEAM_PICK_UP_MODE );
					break;
				case LangMenu.TEAM_KILLER_MODE://猎杀者拾取
					//					TeamManager.pickupIndex = 1;
					//					TeamManager.sendSetTeamDropAllocate( TeamDropAllocateType.KILLER );
					//					EventManager.dispatchEvent( TeamEvent.TEAM_PICK_UP_MODE );
					break;
				case LangMenu.TEAM_FEED_PICK_UP_MODE://自由拾取
					//					TeamManager.pickupIndex = 2;
					//					TeamManager.sendSetTeamDropAllocate( TeamDropAllocateType.FREE );
					//					EventManager.dispatchEvent( TeamEvent.TEAM_PICK_UP_MODE );
					break;
				case LangMenu.DUI_HUA://对话
					if(FriendManager.checkIsFriend(heroId.fValue))
					{
						ChatWindowManager.addWindowChatTargetId(heroId.fValue,heroName);
						//						ChatWindowPanel.instance.showChatWindow(heroId);
					}
					else
					{
						NoticeManager.mouseFollowNotify("好友之间才能对话");
					}
					break;
				case LangMenu.REMOVE_VICE_LEADER:
//					GuildManager.instance.removeViceLeader();
					break;
				case LangMenu.SET_UP_VICE_LEADER:
					if(GuildManager.instance().haveGuild&&GuildManager.instance().canNormal)
						AppManager.showApp(AppConstant.GUILD_APPOINTED_PANEL,[heroId,heroName]);
					break;
				case LangMenu.KICK_GUILD:
					GuildManager.instance().guildKill(heroId);
					break;
				case LangMenu.MOVE_TO_HERO:
					Mgr.teamMgr.move2TeamMember(heroId);
					break;
				case LangMenu.SETUP_LEADER:
					if(GuildManager.instance().haveGuild&&GuildManager.instance().canLeader)
						AppManager.showApp(AppConstant.GUILD_LEADER_PANEL,[heroId,heroName]);
					break;
				
			}
		}
		
		private static function leaveTeamClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onAgreeLeaveTeam();
					break;
			}
		}
		
		/**
		 * 同意离开队伍 
		 * 
		 */		
		private static function onAgreeLeaveTeam():void
		{
			TeamSender.ReqLeaveTeam(1);
		}
	}
}
