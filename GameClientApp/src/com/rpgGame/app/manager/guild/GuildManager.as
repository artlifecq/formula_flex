package com.rpgGame.app.manager.guild
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.alert.AlertText;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.events.country.CountryEvent;
	import com.rpgGame.core.events.country.CrownEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.guild.GuildEventType;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.guild.GuildData;
	import com.rpgGame.coreData.info.guild.GuildFamilyData;
	import com.rpgGame.coreData.info.guild.GuildListItemData;
	import com.rpgGame.coreData.info.guild.GuildModuleObjData;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.society.SocietyDetailData;
	import com.rpgGame.coreData.info.society.SocietyMemberData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangGuild;
	import com.rpgGame.coreData.lang.LangMenu;
	import com.rpgGame.coreData.role.MonsterBornData;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.geom.Point;
	
	import app.cmd.GuildModuleMessages;
	import app.message.AmountType;
	import app.message.GuildModuleObjProto;
	import app.message.GuildNewsProto;
	import app.message.GuildOfficerPos;
	import app.message.GuildPosOfficersProto;
	import app.message.GuildProto;
	import app.message.MonsterDataProto;
	import app.message.GuildLevelDatasProto.GuildLevelDataProto;
	import app.message.GuildOfficerDatasProto.GuildOfficerDataProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	/**
	 * 帮派管理类 
	 * @author Mandragora
	 * 
	 */	
	public class GuildManager
	{
		public function GuildManager()
		{
		}
		//------------------------------data-----------------
		private static const MAX_INPUT_TEXT : int = 30;
		private static const MIN_CREATE_LEVEL : int = 45;
		private static var allEvents : Array;
		private static var _guildData : GuildData;
		public static var guildModuleObj : GuildModuleObjData;
		/**申请加入我帮派的列表**/
		public static var joinGuildList : Array;
		public static var guildList : Array;
		/**我请求加入的帮派列表**/
		public static var reqJoinGuildList:Array;
		
		public static function setupModuleObj(guild:GuildModuleObjProto):void
		{
			if(!guild)
				return;
			guildModuleObj = new GuildModuleObjData();
			guildModuleObj.guildContributionPoint = guild.guildContributionPoint? guild.guildContributionPoint.toNumber():0;
			guildModuleObj.isCollectGuildPrize = guild.isCollectGuildPrize;
			guildModuleObj.isCollectKingGuildPrize = guild.isCollectKingGuildPrize;
		}
		
		
		/**个人贡献改变了**/
		public static function guildContributionPointChange(value:Number):void
		{
			if(!guildModuleObj)
				guildModuleObj = new GuildModuleObjData();
			guildModuleObj.guildContributionPoint = value;
			getSelfGuildBaseData();
			EventManager.dispatchEvent(GuildEvent.GUILDCONTRIBUTIONPOINT_CHANGE);
		}
			
		public static function setGuildData(data:GuildProto):void
		{
			guildData.setup(data);
			EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
		}
		//------------------------------帮派成员查看
		private static var familyHashMap : HashMap;
		/**当前正在查看的帮派名字**/
		private static var seeGuildFamily : String;
		public static function setGuildFamilyData(data:GuildFamilyData):void
		{
			if(!familyHashMap)
				familyHashMap = new HashMap();
			familyHashMap.add(seeGuildFamily,data);
			EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
		}
		/**获取当前正在查看的帮派的内容**/
		public static function getSeeGuildFamilyData():GuildFamilyData
		{
			return familyHashMap?familyHashMap.getValue(seeGuildFamily):null;
		}
		
		public static function getGuildFamilyData(family:String):void
		{
			seeGuildFamily = family;
			AppManager.showAppNoHide(AppConstant.GUILD_FAMILY_PANEL);
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_GUILD_FAMILY_MEMBERS+family))
			{
				EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
				return;
			}
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_GUILD_FAMILY_MEMBERS+family,15000);
			GuildSender.getFamilyData(family);
		}
		//------------------------------列表项点击
		private static var selectFamily:String;
		public static function showMenu(familyName:String):void
		{
			if(!selfIsLeader)
				return;
			selectFamily = familyName;
			var pos : int = getFamilyLeaderPos(selectFamily);
			var showMenu:Array = [];
			if(pos == GuildOfficerPos.GUILD_VICE_LEADER)
			{
				//是副帮主，显示卸任
				showMenu.push(LangMenu.REMOVE_VICE_LEADER);
				showMenu.push(LangMenu.KICK_GUILD);
			}else
			{
				showMenu.push(LangMenu.SET_UP_VICE_LEADER);
				showMenu.push(LangMenu.KICK_GUILD);
			}
			var y : Number = Stage3DLayerManager.stage.mouseY;
			var x : Number = Stage3DLayerManager.stage.mouseX;
			MenuManager.showMenu( showMenu,  [0,familyName], x, y, 80);
		}
		
		public static function kickFamily():void
		{
			kickGuildMember(selectFamily);
			selectFamily = "";
		}
		
		public static function setupViceLeader():void
		{
			setPos(selectFamily,true);
			selectFamily = "";
		}
		
		public static function removeViceLeader():void
		{
			setPos(selectFamily,false);
			selectFamily = "";
		}
		
		//----------------------帮派募捐
		public static function donate(silver:Number):void
		{
			guildData.storage.money = silver;
			EventManager.dispatchEvent(GuildEvent.GUILD_STORAGE_CHANGE);
		}
		//---------------------帮派日志
		/**
		 * 获取指定类型的所有的消息 
		 * @param type
		 * @return 
		 * 
		 */		
		public static function getSelectEvents(type:int):Array
		{
			if(!allEvents)
				return [];
			if(type == GuildEventType.TYPE_ALL)
			{
				allEvents.sort(allGuildEventSort);
				return allEvents;
			}
			var result : Array = [];
			for each(var event : GuildNewsProto in allEvents)
			{
				switch(type)
				{
					case GuildEventType.TYPE_1:
						if(event.hasJoinGuild || event.hasLeaveGuild)
							result.push(event);
						break;
					case GuildEventType.TYPE_2:
						if(event.hasSetPos)
							result.push(event);
						break;
					case GuildEventType.TYPE_3:
						if(event.hasDonate)
							result.push(event);
						break;
					case GuildEventType.TYPE_4:
						if(event.hasCreateGuild || event.hasDemoteLevel || event.hasUpgradeLevel || event.hasMaintain)
							result.push(event);
						break;
					case GuildEventType.TYPE_5:
						
						break;
				}
			}
			result.sort(allGuildEventSort);
			return result;
		}
		private static function allGuildEventSort(event1:GuildNewsProto,event2:GuildNewsProto):int
		{
			if(event1.time.toNumber() > event2.time.toNumber())
				return -1;
			return 1;
		}
		public static function setAllGuildEvents(all:Array):void
		{
			allEvents = all;
			EventManager.dispatchEvent(GuildEvent.GUILD_EVENT_CHANGE);
		}
		/**
		 * 请求帮派日志,请求间隔30S
		 */
		public static function getGuildLog():void
		{
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_GUILD_LOG))
			{
				EventManager.dispatchEvent(GuildEvent.GUILD_EVENT_CHANGE);
				return;
			}
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_GUILD_LOG,30000);
			GuildSender.getGuildLog();	
		}
		
		//---------------------------------自己的帮派信息
		/**获取自己帮派的基本数据**/
		public static function getSelfGuildBaseData():void
		{
			GuildSender.getGuildBaseData();
		}
		
		//---------------------------俸禄
		/**领取王帮奖励**/
		public static function getKingSalary():void
		{
			if(guildModuleObj.isCollectKingGuildPrize)
				return;
			GuildSender.getKingSalary();
		}
		/**每日奖励领取成功**/
		public static function getKingSalaryComplete():void
		{
			guildModuleObj.isCollectKingGuildPrize = true;
			EventManager.dispatchEvent(GuildEvent.GUILD_SALARY_CHANGE);
		}
		/**获取每日奖励**/
		public static function getSalary():void
		{
			if(guildModuleObj.isCollectGuildPrize)
				return;
			GuildSender.getSalary();
		}
		/**每日奖励领取成功**/
		public static function getSalaryComplete():void
		{
			guildModuleObj.isCollectGuildPrize = true;
			EventManager.dispatchEvent(GuildEvent.GUILD_SALARY_CHANGE);
		}
		//----------------------帮派升级
		/**请求升级帮派，判断繁荣度银两是否满足，**/
		public static function upgradeLevel():void
		{
			var pos : GuildOfficerDataProto = getSelfOfficePosData();
			if(!haveGuild || !pos || !pos.canUpgradeGuildLevel || !guildData)
			{
				NoticeManager.showNotify("您没有权限升级帮派");
				return;
			}
			var level : GuildLevelDataProto = GuildCfgData.getGuildLevelData(guildData.level);
			if(!level)
				return ;
			if(guildData.storage.fanRongDu < level.demoteReturnFanRongDu)
			{
				NoticeManager.showNotify("繁荣度不足，升级失败");
				return;
			}
			if(guildData.storage.money < level.demoteReturnMoney)
			{
				NoticeManager.showNotify("银两不足，升级失败");
				return;
			}
			GuildSender.upgradeLevel();
		}
		/**升级成功**/
		public static function upgradeLevelComplete(level:int,fanrong:Number,silver:Number):void
		{
			NoticeManager.showNotify("成功提升帮派等级至"+level+"级");
			guildData.level = level;
			guildData.storage.fanRongDu = fanrong;
			guildData.storage.money = silver;
			EventManager.dispatchEvent(GuildEvent.GUILD_LEVEL_CHANGE);
		}
		//--------------------------------------设置官职
		private static var setPosName:String;
		private static var setPosPos : int;
		/**设置职位**/
		public static function setPos(name:String,isSet:Boolean,pos:int = GuildOfficerPos.GUILD_VICE_LEADER):void
		{
			if(getFamilyLeaderPos(name)==GuildOfficerPos.GUILD_LEADER)
			{
				NoticeManager.showNotify("不能设置帮主所在的帮派");
				return;
			}
			var office:GuildOfficerDataProto = getSelfOfficePosData();
			if(!office || !office.canSetOfficerPos || office.canSetOfficerPos.indexOf(pos) == -1)
			{
				NoticeManager.showNotify("没有权限设置职位");
				return ;
			}
			setPosName = name;
			setPosPos = pos;
			var alertSet : AlertSetInfo;
			alertSet = new AlertSetInfo();
			if(isSet)
			{
				alertSet.setAlertInfo(LangGuild.setupPosAlert,guildData.getFamilyLeaderName(name),getGuildOfficerPos(pos));
			}else
			{
				alertSet.setAlertInfo(LangGuild.setDownPosAlert,getGuildOfficerPos(pos),guildData.getFamilyLeaderName(name));
			}
			GameAlert.showAlert(alertSet,setPosClick,isSet);
		}
		
		private static function setPosClick(gameAlert:GameAlert,isSet:Boolean):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
				{
					GuildSender.setPos(setPosName,isSet,setPosPos);
					break;
				}
			}
		}
		
		public static function societyPosChange(society:String,isSet:Boolean,pos:int):void
		{
			if(society == MainRoleManager.actorInfo.societyName && SocietyManager.getSelfMemberData() && SocietyManager.getSelfMemberData().isLeader)
			{
				if(isSet)
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,EnumFunctionMessageBarIcoType.GUILD_BEEN_SET_POS);
				}else
				{
					EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,EnumFunctionMessageBarIcoType.GUILD_BEEN_REMOVE_POS);
				}
			}
			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				getSelfGuildBaseData();
		}
		//--------------------------------------公告
		private static var _amountIsChange : Boolean = false;
		public static function setAnnouncementFunction() : void
		{
			AlertText.showAlert("帮派公告", guildData.announcement, GuildSender.setAnnouncement);
		}
		
		/**
		 * 设置公告
		 * @param emperor
		 *
		 */
		public static function setAnnouncement(emperor : String) : void
		{
			guildData.announcement = emperor;
			EventManager.dispatchEvent(GuildEvent.GUILD_ANNOUNCEMENT_CHANGE);
		}
		
		/**
		 * 公告改变了
		 *
		 */
		public static function announcementChange() : void
		{
			_amountIsChange = true;
			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				getAnnouncement();
		}
		
		/**
		 * 获取公告
		 *
		 */
		public static function getAnnouncement() : void
		{
			if (_amountIsChange)
			{
				GuildSender.getAnnouncement();
				_amountIsChange = false;
			}
			else
				EventManager.dispatchEvent(CrownEvent.JIN_WEI_ANNOUNCEMENT_CHANGE);
		}
		
		//----------------------------------开除帮派
		private static var kickGuildName : String;
		public static function kickGuildMember(name:String):void
		{
			kickGuildName = name;
			if(getFamilyLeaderPos(name)==GuildOfficerPos.GUILD_LEADER)
			{
				NoticeManager.showNotify("不能开除帮主所在的帮派");
				return;
			}
			var selfOffice : GuildOfficerDataProto = getSelfOfficePosData();
			if(selfOffice && selfOffice.canNotKickOtherOfficerPos)
			{
				GameAlert.showAlertUtil(LangAlertInfo.KICK_GUILD_SURE,kickGuildMemberClick,name);
			}else
			{
				NoticeManager.showNotify("没有权限");
			}
		}
		
		private static function kickGuildMemberClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					sureKickGuild();
					break;
			}	
		}
		
		public static function kickComplete():void
		{
			NoticeManager.showNotify("开除家族成功");
			getSelfGuildBaseData();
		}
		
		private static function sureKickGuild():void
		{
			GuildSender.kickGuildMember(kickGuildName);
		}
		/**被提出帮派了**/
		public static function beenKickGuild():void
		{
			guildData.clear();
			EventManager.dispatchEvent(GuildEvent.HAVE_GUILD_CHANGE);
		}
		/**有家族离开帮派了，如果能看到帮派就重新拉一下数据**/
		public static function familyBeenKickGuild(guild:String):void
		{
			NoticeManager.systemSwitchNotify("$家族被开除出本帮派",[guild]);
			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				getSelfGuildBaseData();
		}
		
		//---------------------------------退出帮派
		/**退出帮派**/
		public static function leaveGuild():void
		{
			if(selfIsLeader)
			{
				GameAlert.showAlertUtil(LangGuild.leaderLeaveGuildAlert,leaveGuildClick);
				return;
			}
			GameAlert.showAlertUtil(LangGuild.leaveGuildAlert,leaveGuildClick);
		}
		
		private static function leaveGuildClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:	
					sureLeaveGuild();
					break;
			}
		}
		private static function sureLeaveGuild():void
		{
			var self : SocietyMemberData=  SocietyManager.getSelfMemberData()
			if(self && self.isLeader)
			{
				GuildSender.leaveGuild();
			}else
			{
				GameAlert.showAlertUtil(LangAlertInfo.LEAVE_GUILD_ERROR);
			}
		}
		
		//---------------------------------邀请别人加入我的帮派
		
		/**收到他人的邀请了，做回复**/
		private static var inviteGuildName : String;
		public static function receiveJoinInvite(heroId : int,name:String,guildName:String):void
		{
			inviteGuildName = guildName;
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.RECEIVE_JOIN_INVITE,name,guildName);
			GameAlert.showAlert(alertSet,receiveJoinInviteClick);
			TimerServer.add(closeJoinGuildInvite,12000);
		}
		
		private static function receiveJoinInviteClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					agreeJionGuildInvite();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					cancelJoinGuildInvite();
					break;
			}
		}
		/**时间到两分钟自动关闭了**/
		private static function closeJoinGuildInvite():void
		{
			GameAlert.closeAlert(LangAlertInfo.RECEIVE_JOIN_INVITE);
		}
		
		private static function cancelJoinGuildInvite():void
		{
			GuildSender.replyJoinInvite(false,inviteGuildName);
		}
		private static function agreeJionGuildInvite():void
		{
			GuildSender.replyJoinInvite(true,inviteGuildName);
		}
		/**已经发出去了**/
		public static function inviteSocietyComplete():void
		{
			NoticeManager.showNotify("帮派邀请发出");
		}
		/**发出邀请**/
		public static function inviteSocietyJoinMyGuild(heroId:Number):void
		{
			if(!haveGuild)
			{
				NoticeManager.showNotify("您没有帮派，无法邀请别人加入");
				return ;
			}
			var office : GuildOfficerDataProto = getSelfOfficePosData();
			if(!office)
			{
				NoticeManager.showNotify("您没有权限邀请别人加入帮派");
				return;
			}
			var level : GuildLevelDataProto = GuildCfgData.getGuildLevelData(_guildData.level);
			if(!level)
				return;
			if(_guildData.families.length>=level.capacity)
			{
				NoticeManager.showNotify("当前帮派已入驻的家族数已满");
				return;
			}
			GuildSender.inviteJoin(heroId);
		}
		
		//---------------------------------下面是加入帮派的 申请被同意了
		/**自己加入帮派了**/
		public static function mineJoinGuild(guild:String):void
		{
			//需要在自己在场景中的角色头上加上家族名
			
			//删掉所有邀请加我入他们帮派的icon
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
				EnumFunctionMessageBarIcoType.INVITE_JOIN_GUILD);
//			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				getSelfGuildBaseData();
		}
		/**广播，有家族加入了**/
		public static function otherJoinGuildBroadcast(society:String):void
		{
			NoticeManager.systemSwitchNotify(LanguageConfig.getText(LangGuild.OTHER_JOIN_GUILD_BROADCAST,society));
			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				getSelfGuildBaseData();
		}
		//---------------------------------这里是申请加入本帮的
		/**你的申请被拒绝了**/
		public static function yourJoinReqCancel(guild:String):void
		{
			GameAlert.showAlertUtil(LangAlertInfo.YOUR_JOIN_REQ_CANCEL,null,guild);
			cancelReqJoin(guild,false);
		}
		//--------------------------------------别人收到我的请求，要做的事情
		/**同意或者拒绝别人的请求**/
		public static function replyJoinReq(isAgree:Boolean,guild:String):void
		{
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_REPLY_JOIN_REQUEST,true))
				return;
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_REPLY_JOIN_REQUEST,500);
			GuildSender.replyJoinReq(isAgree,guild);
			joinGuildList.splice(joinGuildList.indexOf(guild));
			EventManager.dispatchEvent(GuildEvent.GET_JOIN_GUILD_LIST);
		}
		/**收到入帮申请列表了**/
		public static function getReqJoinGuildListComplete(array:Array):void
		{
			joinGuildList = array;
			EventManager.dispatchEvent(GuildEvent.GET_JOIN_GUILD_LIST);
			if(joinGuildList.length>0)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
					EnumFunctionMessageBarIcoType.REQ_JOIN_GUILD,
					joinGuildList.length);
			}else
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
					EnumFunctionMessageBarIcoType.REQ_JOIN_GUILD)
			}
		}
		/**是否还有申请，如果还有申请，那就去拉取一下申请列表，没有就删除图标**/
		public static function hasReqJoinChange(has:Boolean):void
		{
			if(has)
			{
				getReqJoinGuildList();
			}else
			{
				getReqJoinGuildListComplete([]);
			}
		}
		/**
		 * 查看所有向我们帮派发送过申请的人
		 *
		 * 申请间隔，30S
		 */
		public static function getReqJoinGuildList():void
		{
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_GET_REQUEST_JOIN_DETAIL) && joinGuildList.length >0)
			{
				EventManager.dispatchEvent(GuildEvent.GET_JOIN_GUILD_LIST);
				return;
			}
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_GET_REQUEST_JOIN_DETAIL,30000);
			GuildSender.getReqJoinGuildList();
		}
		
		//---------------------------------------请求加入别人的帮派，走到这里就完了。
		/**请求加入别的帮派，如果已经申请了，再调用就取消**/
		public static function reqJoinGuild(data:GuildListItemData):void
		{
			var name : String = data.guildName;
			if(!SocietyManager.getSelfMemberData() || !SocietyManager.getSelfMemberData().isLeader)
			{
				GameAlert.showAlertUtil(LangAlertInfo.JOIN_GUILD_DONT_HAVE_SOCIETY);
				return;
			}
			var society : SocietyDetailData = SocietyManager.getSelfSocietyData();
			if(!society)
				return ;
			if(society.level > data.guildLevel)
			{
				NoticeManager.showNotify(LangGuild.joinGuildLevelFail);
				return;
			}
			if(haveGuild)
			{
				GameAlert.showAlertUtil(LangAlertInfo.JOIN_GUILD_HAVE_GUILD);
				return;
			}
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_REQUEST_JOIN+name,true))
				return;
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_REQUEST_JOIN+name,10000);//这里上锁10s
			if(!reqJoinGuildList)
				reqJoinGuildList = [];
			//没有长度，找不到申请过这个帮派，走申请流程
			if(!isInReqJoinGuildList(name))
				GuildSender.reqJoinGuild(name,true);
			else
				GuildSender.reqJoinGuild(name,false);
		}
		/**判断是否存在申请列表中**/
		public static function isInReqJoinGuildList(name:String):Boolean
		{
			if(!reqJoinGuildList)
				return false;
			if(reqJoinGuildList.indexOf(name) == -1)
				return false;
			return true;
		}
		/**取消申请，删除这个申请**/
		public static function cancelReqJoin(name:String,alert:Boolean = true):void
		{
			if(reqJoinGuildList.indexOf(name) == -1)
			{
				trace("都没有申请加入这个帮派，怎么可以取消？");
				return;
			}
			reqJoinGuildList.splice(reqJoinGuildList.indexOf(name),1);
			if(alert)
				GameAlert.showAlertUtil(LangAlertInfo.CANCEL_JOIN_GUILD,null,name);
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
		}
		public static function reqJoinGuildComplete(name:String,timeOut:Number):void
		{
			var time : Number = timeOut - SystemTimeManager.curtTm;
			TimerServer.add(cancelReqJoin,time,[name,false]);
			reqJoinGuildList.push(name);
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
		}
		/**通过名字搜索帮派**/
		public static function getGuildsInGuildListBySelectName(name:String):Array
		{
			if(name == "" || name == null)
				return guildList;
			var result : Array = [];
			for each(var guild:GuildListItemData in guildList)
			{
				if(guild && guild.guildName.indexOf(name)!=-1)
				{
					result.push(guild);
				}
			}
			return result;
		}
		/**通过名字和在线状态查询**/
		public static function getGuildsInGuildList(isOnline:Boolean,name:String):Array
		{
			var result : Array = [];
			var nameData : Array = getGuildsInGuildListBySelectName(name);
			if(!guildList)
				return result;
			if(!isOnline)
				return nameData;
			for each(var data : GuildListItemData in nameData)
			{
				if(data && data.isOnLine)
				{
					result.push(data);
				}
			}
			return result;
		}
		public static function getGuildListComplete(data:Array):void
		{
			guildList = data;
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
		}
		/**请求帮派列表**/
		public static function getGuildList():void
		{
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_GET_GUILD_LIST))
			{
				EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
				return;
			}
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_GET_GUILD_LIST,15000);
			GuildSender.getGuildList();
		}
		/**请求列表返回回来**/
		public static function returnJoinGuildList(array:Array):void
		{
			reqJoinGuildList = array;
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
		}
		/**获取之前申请过的帮派的名字**/
		public static function getJoinGuildList():void
		{
			if(!SocietyManager.getSelfMemberData() || !SocietyManager.getSelfMemberData().isLeader)
			{
				trace("你自己不是帮主，不能请求这个");
				return;
			}
			if(ReqLockUtil.isReqLocked(GuildModuleMessages.C2S_GET_FAMILY_REQUEST_JOIN_GUILD_LIST))
			{
				EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
				return;
			}
			ReqLockUtil.lockReq(GuildModuleMessages.C2S_GET_FAMILY_REQUEST_JOIN_GUILD_LIST,15000);
			GuildSender.getJoinGuildList();
		}
		//-----------------------------------下面是创建帮派的
		/**帮派名字改变了**/
		public static function guildNameChange(guild:String):void
		{
			if(!guildData)
				guildData.name = guild;
			EventManager.dispatchEvent(GuildEvent.GUILD_NAME_CHANGE);
			EventManager.dispatchEvent(GuildEvent.HAVE_GUILD_CHANGE);
		}
		/**创建帮派广播**/
		public static function createGuildBroadcast(guild:String):void
		{
			NoticeManager.systemSwitchNotify(LanguageConfig.getText(LangGuild.CREATE_BRADCAST,guild));
		}
		/**收到这个说明创建成功了，把创建面板关闭了**/
		public static function createGuildComplete():void
		{
			getSelfGuildBaseData();
			AppManager.hideApp(AppConstant.GUILD_CREATE_PANEL);
			AppManager.showApp(AppConstant.COUNTRY_PANEL);
			EventManager.dispatchEvent(CountryEvent.COUNTRY_PANEL_TABBAR_SELECT,2);
		}
		/**
		 * 创建帮派 
		 * @param diwenIndex
		 * @param dikuangIndex
		 * @param banner
		 * @param name
		 * 
		 */		
		public static function createGuild(diwenIndex:int,dikuangIndex:int,banner:String,name:String):void
		{
			if(StringFilter.checkBadWords(banner))
			{
				NoticeManager.showNotify("帮派旗号非法。");
				return;
			}
			if(StringFilter.checkBadWords(name))
			{
				NoticeManager.showNotify("帮派名非法。");
				return;
			}
			if(haveGuild)
			{
				NoticeManager.showNotify(LangGuild.createGuildHaveGuildFail);
				return;
			}
			var money : Number = MainRoleManager.actorInfo.amountInfo.getAmountByType(AmountType.MONEY);
			if(money < GuildCfgData.guildMiscData.createCostMoney)
			{
				GameAlert.showAlertUtil(LangAlertInfo.createGuildEroor3,null,MoneyUtil.getHtmlMoneyString(GuildCfgData.guildMiscData.createCostMoney));
				return;
			}
			var costItem : int = BackPackManager.instance.getItemCount(GuildCfgData.guildMiscData.createCostGoods);
			if(costItem<=0)
			{
				GameAlert.showAlertUtil(LangAlertInfo.createGuildEroor4,null,ItemCfgData.getItemName(GuildCfgData.guildMiscData.createCostGoods));
				return;
			}
			var cost : ItemInfo = BackPackManager.instance.getBagItemsByID(GuildCfgData.guildMiscData.createCostGoods)[0];
			
			GuildSender.createGuild(createNpcId,createDialog,cost.index,diwenIndex,dikuangIndex,banner,name);
		}
		/**
		 * 同意帮派协议打开创建帮派面板 
		 */		
		public static function agreementSure():void
		{
			AppManager.showApp(AppConstant.GUILD_CREATE_PANEL);
			AppManager.hideApp(AppConstant.GUILD_AGREEMENT_PANEL);
		}
		/**开始创建帮派，判定完成打开帮派协议**/
		public static function createGuildStart():void
		{
			if(haveGuild)
			{
				GameAlert.showAlertUtil(LangAlertInfo.createGuildError_1);
				return;
			}
			if(!SocietyManager.getSelfMemberData() || !SocietyManager.getSelfMemberData().isLeader)
			{
				GameAlert.showAlertUtil(LangAlertInfo.createGuildError_2);
				return;
			}
			if(MainRoleManager.actorInfo.level < MIN_CREATE_LEVEL)
			{
				GameAlert.showAlertUtil(LangAlertInfo.createGuildError_5,null,MIN_CREATE_LEVEL);
				return;
			}
			AppManager.showApp(AppConstant.GUILD_AGREEMENT_PANEL);
		}
		
		/**
		 * 打开帮派协议面板，如果有帮派了，去屎吧。 
		 * 
		 */		
		public static function showCreateAgreementPanel(npcId:Number,dialog:int):void
		{
			createNpcId = npcId;
			createDialog=dialog;
			createGuildStart();
		}
		private static var createNpcId : Number;
		private static var createDialog:Number;
		/**前去创建**/
		public static function gotoCreate():void
		{
			var monsterdata:MonsterDataProto=MonsterDataManager.getData(GuildCfgData.createGuildNpc);
			var pos : Point = MonsterDataManager.getMonsterPosition(monsterdata);
			var monsterData : MonsterBornData = new MonsterBornData();
			monsterData.setProtocData(monsterdata);
			MainRoleSearchPathManager.gotoTargetData.setData(monsterdata.sceneId,pos.x,pos.y,monsterData);
			MainRoleSearchPathManager.walkToScene(monsterdata.sceneId,pos.x,pos.y);
		}
		//------------------------------杂项
		/**获取自己是不是帮主**/
		public static function get selfIsLeader():Boolean
		{
			return getSelfGuildOfficePos() == GuildOfficerPos.GUILD_LEADER;
		}
		/**获取自己是不是副帮主**/
		public static function get selfIsViceLeader():Boolean
		{
			return getSelfGuildOfficePos() == GuildOfficerPos.GUILD_VICE_LEADER;
		}
		
		/**拿自己的职位**/
		public static function getSelfGuildOfficePos():int
		{
			if(!guildData||!guildData.office)
				return -1;
			if(!SocietyManager.getSelfMemberData())
				return -1;
			if(!SocietyManager.getSelfMemberData().isLeader)
				return -1;
			for each(var guildOffice : GuildPosOfficersProto in guildData.office.officers)
			{
				if(guildOffice.leader)
				{
					for each(var leader : String in guildOffice.leader)
					{
						if(leader == MainRoleManager.actorInfo.societyName)
							return guildOffice.pos;
					}
				}
			}
			return -1;
		}
		
		public static function getFamilyLeaderPos(family:String):int
		{
			if(!guildData||!guildData.office)
				return -1;
			for each(var guildOffice : GuildPosOfficersProto in guildData.office.officers)
			{
				if(guildOffice.leader)
				{
					for each(var leader : String in guildOffice.leader)
					{
						if(leader == family)
							return guildOffice.pos;
					}
				}
			}
			return -1;
		}
		/**拿到自己的官职权限，如果是空代表没有官职或者自己的官职找不到配置**/
		public static function getSelfOfficePosData():GuildOfficerDataProto
		{
			var pos : int = getSelfGuildOfficePos();
			return GuildCfgData.getGuildOfficeData(pos);
		}
		/**获取是否有帮派了**/
		public static function get haveGuild():Boolean
		{
			return guildData.name != "" &&  guildData.name != null;
		}
		/**
		 * 获取pso对应的职位名字 
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function getGuildOfficerPos(pos : int):String
		{
			switch(pos)
			{
				case GuildOfficerPos.GUILD_LEADER:
					return "帮主";
				case GuildOfficerPos.GUILD_VICE_LEADER:
					return "副帮主";
			}
			return "传了个什么鬼进来？"+pos;
		}

		public static function get guildData():GuildData
		{
			if(!_guildData)
				_guildData= new GuildData();
			return _guildData;
		}

		public static function set guildData(value:GuildData):void
		{
			_guildData = value;
		}
		
		public static function getGuildFamilyLeaderByName(name:String):String
		{
			return guildData.getFamilyLeaderName(name);
		}

	}
}