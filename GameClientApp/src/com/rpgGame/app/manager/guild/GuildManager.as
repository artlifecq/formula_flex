package com.rpgGame.app.manager.guild
{
	import com.gameClient.utils.JSONUtil;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.clientConfig.Q_guildskill;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangGuild;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	import com.rpgGame.netData.guild.bean.GuildBriefnessInfo;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.bean.GuildSkillInfo;
	import com.rpgGame.netData.guild.message.ReqGuildApplyListMessage;
	import com.rpgGame.netData.guild.message.ReqGuildApplyOperationMessage;
	import com.rpgGame.netData.guild.message.ReqGuildAppointMessage;
	import com.rpgGame.netData.guild.message.ReqGuildBriefnessInfoMessage;
	import com.rpgGame.netData.guild.message.ReqGuildConveneMessage;
	import com.rpgGame.netData.guild.message.ReqGuildCreateMessage;
	import com.rpgGame.netData.guild.message.ReqGuildDissolveMessage;
	import com.rpgGame.netData.guild.message.ReqGuildDonateMessage;
	import com.rpgGame.netData.guild.message.ReqGuildExitMessage;
	import com.rpgGame.netData.guild.message.ReqGuildGetDailyGiftMessage;
	import com.rpgGame.netData.guild.message.ReqGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ReqGuildInviteListMessage;
	import com.rpgGame.netData.guild.message.ReqGuildJoinMessage;
	import com.rpgGame.netData.guild.message.ReqGuildKillMessage;
	import com.rpgGame.netData.guild.message.ReqGuildLevelupMessage;
	import com.rpgGame.netData.guild.message.ReqGuildListMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSetAutoAcceptMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSkillInfoMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSkillLevelupMessage;
	import com.rpgGame.netData.guild.message.ResGuildChangeGuildIdMessage;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

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
		public static const MaxPlayerListPageCount:int = 12;
		private static var allEvents : Array;
		private var _guildData : GuildInfo;
		/**申请加入我帮派的列表**/
		public var joinGuildList : Array;
		public var guildList : Array;
		
		public var reqJoinGuildList:Array;
		
		public var defaultName:String;
		public var defaultMsg:String;
		
		private var _selfMemberInfo:GuildMemberInfo;
		private var _selfPermissionInfo:Q_guild_permission;
		
		private var _guildLevelInfo:Q_guild;
		private var _memberList: Vector.<GuildMemberInfo>;
		private var _haveDailyGift: int;
		private var _chiefGuildMemberInfo:GuildMemberInfo;
		
		private static var _instance:GuildManager;
		private static var _opaque:int = 0;
		//个人帮派技能Id
		private var _personSkillList: Vector.<GuildSkillInfo>;
		//统帅帮派技能Id
		private var _leaderSkillList: Vector.<GuildSkillInfo>;
		private var _needSwitchChange:Boolean = false;
		public static function instance():GuildManager
		{
			if(_instance==null)
			{
				_instance = new GuildManager();
			}
			return _instance;
		}
		private function init():void
		{
			var gd:GuildInfo = new GuildInfo();
			gd.level = 1;
			this.updataGuildData(gd);
		}
		
		public static function get opaque():int
		{
			return ++_opaque;
		}
		
		private function updataSelfInfo():void
		{
			if(_memberList!=null&&_memberList.length>0)
			{ 
				var length:int = _memberList.length;
				for(var i:int = 0;i<length;i++)
				{
					var menberinfo:GuildMemberInfo = _memberList[i];
					if(MainRoleManager.isSelf(menberinfo.id.ToGID()))
					{
						_selfMemberInfo = menberinfo;
					}
					if(menberinfo.memberType == EnumGuildPost.GUILDPOST_CHIEF)
						_chiefGuildMemberInfo = menberinfo;
				}
			}else{
				_selfMemberInfo = new GuildMemberInfo();
			}
			
			if(_selfMemberInfo!=null)
			{
				_selfPermissionInfo = GuildCfgData.getPermissionInfo(_selfMemberInfo.memberType);
			}
		}
		
		
		/**
		 * 请求获得帮会信息 
		 * 
		 */
		public function requestGuildInfo():void
		{
			SocketConnection.send(new ReqGuildInfoMessage());
		}
		
		public function get memberList():Vector.<GuildMemberInfo>
		{
			return _memberList;
		}
		
		
		public function getSortMemberListByProp(prop:String):Vector.<GuildMemberInfo>
		{
			var sortfun:Function = function(g1:GuildMemberInfo,g2:GuildMemberInfo):int{
				if(g1[prop]<g2[prop])
					return 1;
				else if(g1[prop]>g2[prop])
					return -1;
				else
					return 0;
			}
			return _memberList.sort(sortfun);
		}
		
		public function get guildData():GuildInfo
		{
			return _guildData;
		}
		
		private function updataGuildData(value:GuildInfo):void
		{
			_guildData = value;
			if(_guildData!=null)
				_guildLevelInfo = GuildCfgData.getLevelInfo(_guildData.level);
			else
				_guildLevelInfo = null;
		}
		
		private function updateMemberList(list: Vector.<GuildMemberInfo>):void
		{
			_memberList = list;
			updataSelfInfo();
		}
		
		
		public function setResGuildInfoMessage(msg:ResGuildInfoMessage):void
		{
			this.updataGuildData(msg.guildInfo);
			this.updateMemberList(msg.memberList);
			this._haveDailyGift = msg.haveDailyGift;
			EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
			if(_needSwitchChange&&this.haveGuild)
			{
				FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_CHENGYUAN,null,false);
			}
			_needSwitchChange = false;
		}
		
		public function get DailyGiftRewards():String
		{
			var str:String;
			var itemInfos:Object = JSONUtil.decode(guildLevelInfo.q_gift_data);
			var iteminfo:Object;
			if(selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_CHIEF||
				selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_AGEN_CHIEF||
				selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_VICE_CHIEF||
				selfMemberInfo.memberType == EnumGuildPost.GUILDPOST_ELDERS)
			{
				iteminfo = itemInfos[0];
			}else{
				iteminfo = itemInfos[1];
			}
			var qitem:Q_item = ItemConfig.getQItemByID(iteminfo["mod"]);
			str = HtmlTextUtil.getTextColor(ItemConfig.getItemQualityColor(qitem.q_id),qitem.q_name)+"×"+iteminfo["num"];
			return str;
		}
		public function get haveDailyGift():Boolean{
			return _haveDailyGift == 1;
		}
		
		private var _currentPageInfo:ResGuildListInfoMessage

		public function get currentPageInfo():ResGuildListInfoMessage
		{
			return _currentPageInfo;
		}
		
		private var _guildList: Vector.<GuildListInfo>
		public function setGuildListInfoMessage(msg:ResGuildListInfoMessage):void
		{
			_currentPageInfo= msg;
			_guildList = msg.guildList;
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST,msg);
		}
		
		
		public function getGuildListInfoByIndex(index:int):GuildListInfo
		{
			if(_guildList==null)
				return null;
			if(_guildList.length<= index)
				return null;
			return _guildList[index];
		}
		
		private var _allcreateGuildInfo:Array;
		//获取全局配置数据
		
		public function getcreateInfoByIndex(index:int):Object
		{
			if(_allcreateGuildInfo==null)
			{
				_allcreateGuildInfo = new Array();
				_allcreateGuildInfo.push(JSONUtil.decode( GlobalSheetData.getSettingInfo(820).q_string_value));
				_allcreateGuildInfo.push(JSONUtil.decode( GlobalSheetData.getSettingInfo(821).q_string_value));
			}
			return _allcreateGuildInfo[index];
		}
		
		/**获取是否有帮派了**/
		public function get haveGuild():Boolean
		{
			return !ClientConfig.loginData.guildId.IsMax();
		}
		/**创建帮会**/
		public function createGuild(type:int,name:String,banner:String):void
		{
			if(StringFilter.checkBadWords(banner))
			{
				NoticeManager.showNotify("帮派旗号非法。");
				return;
			}
			if(banner == defaultMsg)
				banner = " ";
			if(name==""||name== defaultName)
			{
				NoticeManager.showNotify("帮会名字不能为空");
				return ;
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
			
			var item:Object = this.getcreateInfoByIndex(type);
			var money : Number = MainRoleManager.actorInfo.totalStat.getResData(item["type"]);
			if(money < item["num"])
			{
				NoticeManager.showNotifyById(60029,ItemConfig.getItemName(item["type"]));
				return;
			}
			
			var msg:ReqGuildCreateMessage = new ReqGuildCreateMessage();
			msg.costType = type+1;
			msg.name = name;
			msg.note = banner;
			msg.opaque = 1;
			SocketConnection.send(msg);
		}
		//获取自己帮会信息
		public function get selfMemberInfo():GuildMemberInfo
		{
			return _selfMemberInfo;
		}
		
		/**  发布公告 */
		public function get canNotice():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_notice == 1;
		}
		/**  邀请权限 */
		public function get canInvite():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_invite == 1;
		}
		
		/**  召集成员 */
		public function get canConvene():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_convene == 1;
		}
		
		/**  招募成员 */
		public function get canRecrui():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_recrui == 1;
		}
		
		/**  同意加入 */
		public function get canJoin():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_join == 1;
		}
		
		/**  拒绝加入 */
		public function get canReject():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_reject == 1;
		}
		
		/**  逐出成员 */
		public function get canExpel():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_expel == 1;
		}
		
		/**  升级帮派 */
		public function get canUpgrad():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_upgrad == 1;
		}
		
		/**  解散帮派 */
		public function get canDissolve():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_dissolve == 1;
		}
		
		/**  任命帮主 */
		public function get canMinister():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_Minister == 1;
		}
		
		/**  任命副帮主 */
		public function get canViceMinister():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_viceMinister == 1;
		}
		
		/**  任命长老 */
		public function get canElder():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_elder == 1;
		}
		
		/**  任命普通帮众 */
		public function get canNormal():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_normal == 1;
		}
		
		/**  任命统帅 */
		public function get canLeader():Boolean
		{
			if(_selfPermissionInfo==null)
				return false;
			return _selfPermissionInfo.q_leader == 1;
		}
		
		/**  帮会等级信息 */
		public function get guildLevelInfo():Q_guild
		{
			return _guildLevelInfo;
		}
		
		
		public function getGuildHaveCityByIndex(index:int):Boolean
		{
			if(index>=3)
				return false;
			return (_guildData.city&(1<<index))>0;
		}
		
		/** 获得帮主帮派成员信息 **/
		public function get chiefGuildMemberInfo():GuildMemberInfo
		{
			return _chiefGuildMemberInfo;
		}
		
		/** 解散帮会 **/
		public function guildDissolve():void
		{
			if(!canDissolve)
				return ;
			var alertOk:AlertSetInfo=new AlertSetInfo(LangAlertInfo.LUNJIAN_FIGHT_MIN);
			GameAlert.showAlert(alertOk,sureguildDissolve);
		}
		
		private function sureguildDissolve(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					SocketConnection.send(new ReqGuildDissolveMessage());
					break;
			}
		}
		
		/** 请求召集帮派 **/
		public function guildConvene():void
		{
			if(!canConvene)
				return ;
			SocketConnection.send(new ReqGuildConveneMessage());
		}
		
		/** 请求离开帮派 **/
		public function guildExit():void
		{
			SocketConnection.send(new ReqGuildExitMessage());
		}
		/** 获取帮派列表 **/
		public function reqGuildList(page:int,isfull:int,opaque:int):void
		{
			var request:ReqGuildListMessage = new ReqGuildListMessage();
			request.isFilterFull = isfull;
			request.page = page;
			request.opaque = opaque;
			SocketConnection.send(request);
		}
		/** 请求加入帮派 **/
		public function reqGuildJoin(guild:long,opaque:int):void
		{
			var msg:ReqGuildJoinMessage = new ReqGuildJoinMessage();
			msg.guildId = guild;
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		private var _questreqGuildJoinOpaque:int;
		public function questreqGuildJoin(guild:long):void
		{
			if(_questreqGuildJoinOpaque>0)
				return ;
			_questreqGuildJoinOpaque = opaque;
			reqGuildJoin(guild,_questreqGuildJoinOpaque);
		}
		
		private function refeashQuestreqGuildJoin(opaque:int,result:int):Boolean
		{
			if(_questreqGuildJoinOpaque<=0)
				return false;
			if(_questreqGuildJoinOpaque != opaque)
				return false;
			if(result==0)
			{
				_questreqGuildJoinOpaque = 0;
				return true;
			}
			requestGuildInfo();
			_needSwitchChange = true;
			AppManager.showApp(AppConstant.GUILD_INVITATION_PANEL);
			return false;
		}
		
		/** 请求召集帮派 **/
		public function reqGuildConvene(opaque:int):void
		{
			var msg:ReqGuildConveneMessage = new ReqGuildConveneMessage();
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		/**
		 * 操作结果反馈
		 * @param msg
		 * 
		 */
		public function getGuildOperateResult(msg:ResGuildOperateResultMessage):void
		{
			if(refeashQuestreqGuildJoin(msg.opaque,msg.result))
				return ;
			if(updataGuildLevelupMsg(msg.opaque,msg.result))
				return ;
			if(refeashSkillOpaque(msg.opaque,msg.result))
				return ;
			if(_killOpaque>0&&_killOpaque == msg.opaque)
			{
				var index:int = _memberList.indexOf(_killplayerInfo);
				_memberList.splice(index,1);
				EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
				_killOpaque = 0;
			}else if(_reqapplayOpaque>0&&_reqapplayOpaque == msg.opaque){
				this.requestGuildInfo();
				_reqapplayOpaque = 0;
				if(_reqapplayId==-1)
				{
					AppManager.showApp(AppConstant.GUILD_APPLAYLIST_PANEL);
				}
			}else{
				EventManager.dispatchEvent(GuildEvent.GUILD_OPERATERESULT,msg);
			}	
		}
		
		/** 请求设置自动通过玩家申请模式 **/
		public function reqGuildSetAutoAccept(value:Boolean):void
		{
			var type:int = value?1:0;
			if(type == _guildData.isAutoApply)
				return ;
			_guildData.isAutoApply = type;
			var msg:ReqGuildSetAutoAcceptMessage = new ReqGuildSetAutoAcceptMessage();
			msg.type = value?1:0;
			SocketConnection.send(msg);
		}
		
		private var _reqapplayOpaque:int;
		private var _reqapplayId:int;
		/** 对申请者操作 **/
		public function applyOperation(flag:int,applyId:int):Boolean
		{
			if(_reqapplayOpaque>0)
				return false;
			_reqapplayOpaque = opaque;
			_reqapplayId = applyId;
			var msg:ReqGuildApplyOperationMessage = new ReqGuildApplyOperationMessage();
			msg.flag = flag;
			msg.applyId = applyId;
			msg.opaque = _reqapplayOpaque;
			SocketConnection.send(msg);
			return true;
		}
		
		private var _killOpaque:int;
		private var _killplayerInfo:GuildMemberInfo
		/** 请求提出成员 **/
		public function guildKill(playerId:String):void
		{
			if(_killOpaque!=0)
				return ;
			_killOpaque = GuildManager.opaque;
			var msg:ReqGuildKillMessage = new ReqGuildKillMessage();
			_killplayerInfo = this.getGuildMemberInfoById(playerId);
			msg.playerId = _killplayerInfo.id;
			msg.opaque = _killOpaque;
			SocketConnection.send(msg);
		}
		/** 请求任命成员 **/
		public function guildAppoint(playerId:long,memberType:int,type:int,opaque:int):void
		{
			var msg:ReqGuildAppointMessage = new ReqGuildAppointMessage();
			msg.playerId = playerId;
			msg.memberType = memberType;
			msg.leaderModel = type;
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		private var _guildLevelUpOpaque:int
		/** 请求帮派升级 **/
		public function guildLevelup():void
		{
			if(!canUpgrad)
				return ;
			if(_guildLevelUpOpaque>0)
				return ;
			_guildLevelUpOpaque = opaque;
			var msg:ReqGuildLevelupMessage = new ReqGuildLevelupMessage();
			msg.opaque = _guildLevelUpOpaque;
			SocketConnection.send(msg);
		}
		
		private function updataGuildLevelupMsg(opaque:int,result:int):Boolean
		{
			if(_guildLevelUpOpaque<=0)
				return false;
			if(_guildLevelUpOpaque != opaque)
				return false;
			_guildLevelUpOpaque = 0;
			if(result==0)
			{
				return true;
			}
			_guildData.level++;
			EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
			return false;
		}
		/** 请求领取帮派每日礼包 **/
		public function guildGetDailyGift(opaque:int):void
		{
			var msg:ReqGuildGetDailyGiftMessage = new ReqGuildGetDailyGiftMessage();
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		public function changeGuildDailyGift():void
		{
			_haveDailyGift = 0;
		}
		/** 请求帮派捐献 **/
		public function guildDonate(type:int,num:int,opaque:int):void
		{
			if(num==0)
				return ;
			var msg:ReqGuildDonateMessage = new ReqGuildDonateMessage();
			msg.type = type;
			msg.num = num;
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		/**
		 * 根据id获取帮派信息 
		 * @param id
		 * @return 
		 * 
		 */
		public function getGuildMemberInfoById(id:String):GuildMemberInfo
		{
			var length:int = _memberList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_memberList[i].id.hexValue == id)
				{
					return _memberList[i];
				}
			}
			return null;
		}
		
		
		/** 请求申请列表*/
		public function reqGuildApplyListInfo():void
		{
			SocketConnection.send(new ReqGuildApplyListMessage());
		}
		
		
		public function setGuildApplyListInfo(list:Vector.<GuildApplyInfo>):void
		{
			EventManager.dispatchEvent(GuildEvent.GET_JOIN_GUILD_LIST,list);
		}
		
		private var _inviteListInfo:Vector.<GuildInviteInfo>
		public function setGuildInviteListInfo(list:Vector.<GuildInviteInfo>):void
		{
			_inviteListInfo = list;
			EventManager.dispatchEvent(GuildEvent.GET_INVITE_GUILD_LIST,list);
		}
		
		public function getinviteListInfoByIndex(index:int):GuildInviteInfo
		{
			if(_inviteListInfo==null)
				return null;
			if(_inviteListInfo.length<= index)
				return null;
			return _inviteListInfo[index];
		}
		
		
		/** 获取帮派简介信息*/
		public function reqGuildBriefnessInfo(guildId:long,opaque:int):void
		{
			var msg:ReqGuildBriefnessInfoMessage = new ReqGuildBriefnessInfoMessage();
			msg.guildId = guildId;
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		
		public function reqGuildInviteList():void
		{
			SocketConnection.send(new ReqGuildInviteListMessage());
		}
		
		public function setResGuildBriefnessInfo(info:GuildBriefnessInfo):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_INFO_CHANGE,info);
		}
		
		
		/**
		 *根据职务类型获取帮会中已有该职务成员数量 
		 * @param type
		 * @return 
		 * 
		 */
		public function getMemberCountByType(type:int):int
		{
			var count:int = 0;
			var length:int = _memberList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_memberList[i].memberType == type)
					count++;
			}
			return count;
		}
		
		
		public function getLeaderCount():int
		{
			var count:int = 0;
			var length:int = _memberList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_memberList[i].isLeader == 1)
					count++;
			}
			return count;
		}
		
		
		/**
		 * 请求帮会技能 
		 * 
		 */
		public function reqGuildSkillInfo():void
		{
			SocketConnection.send(new ReqGuildSkillInfoMessage());
		}
		public function get personSkillList(): Vector.<GuildSkillInfo>
		{
			return _personSkillList;
		}
		
		public function get havePersonSkill():Boolean
		{
			if(_personSkillList==null)
				return false;
			return _personSkillList.length>0;
		}
		
		/**
		 * 根据技能id获得技能信息 
		 * @param id
		 * @return 
		 * 
		 */
		public function getSkillInfoById(id:int):GuildSkillInfo
		{
			if(_personSkillList==null)
				return null;
			var length:int = _personSkillList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_personSkillList[i].id == id)
					return _personSkillList[i];
			}
			return null;
		}
		
		public function getLeaderSkillInfoById(id:int):GuildSkillInfo
		{
			if(_leaderSkillList==null)
				return null;
			var length:int = _leaderSkillList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_leaderSkillList[i].id == id)
					return _leaderSkillList[i];
			}
			return null;
		}
		public function get leaderSkillList(): Vector.<GuildSkillInfo>
		{
			return _leaderSkillList;
		}
		public function setGuildSkill(personSkillList: Vector.<GuildSkillInfo>,leaderSkillList: Vector.<GuildSkillInfo>):void
		{
			_personSkillList = personSkillList;
			_leaderSkillList = leaderSkillList;
			EventManager.dispatchEvent(GuildEvent.GUILD_SKILLINFO_CHAGE);
		}
		
		
		public function get guildSkillMaxLevel():int
		{
			if(_guildLevelInfo == null)
				return 0;
			else
				return _guildLevelInfo.q_skill_num;
		}
		
		private var _skillOpaque:int;
		private var _skillData:Q_guildskill;
		private var _skillType:int;
		public function guildSkillLevelup(type:int,data:Q_guildskill):void
		{
			if(_skillOpaque>0)
				return ;
			if(data==null)
				return ;
			
			if(type==1)
			{
				if(data.q_costvalue>_selfMemberInfo.contribution)
				{
					NoticeManager.showNotifyById(60040);
					return ;
				}
			}else if(type == 2){
				if(!isLeader)
				{
					NoticeManager.showNotifyById(60043);
					return ;
				}
				var money : Number = MainRoleManager.actorInfo.totalStat.getResData(3);
				if(money < data.q_costvalue)
				{
					NoticeManager.showNotifyById(60027);
					return;
				}
			}
			
			_skillOpaque = opaque;
			_skillType = type;
			_skillData = data;
			var msg:ReqGuildSkillLevelupMessage = new ReqGuildSkillLevelupMessage();
			msg.type = type;
			msg.opaque = _skillOpaque;
			msg.skillId = _skillData.q_skillid;
			SocketConnection.send(msg);
		}
		
		/** 更新升级技能 */
		private function refeashSkillOpaque(opaque:int,result:int):Boolean
		{
			if(_skillOpaque<=0)
				return false;
			if(_skillOpaque != opaque)
				return false;
			_skillOpaque = 0;
			if(result==0)
			{
				return true;
			}
			var skill:GuildSkillInfo;
			if(_skillType==1)
			{
				skill = getSkillInfoById(_skillData.q_skillid);
				if(skill == null)
				{
					skill = new GuildSkillInfo();
					skill.id =  _skillData.q_skillid;
					skill.level = 1;
					if(_personSkillList == null)
						_personSkillList = new Vector.<GuildSkillInfo>();
					_personSkillList.push(skill);
				}else{
					skill.level++;
				}
			}else{
				skill = getLeaderSkillInfoById(_skillData.q_skillid);
				if(skill == null)
				{
					skill = new GuildSkillInfo();
					skill.id =  _skillData.q_id;
					skill.level = _skillData.q_level;
					if(_leaderSkillList == null)
						_leaderSkillList = new Vector.<GuildSkillInfo>();
					_leaderSkillList.push(skill);
				}else{
					skill.level = _skillData.q_level;
				}
			}
			_selfMemberInfo.contribution -= _skillData.q_costvalue;
			EventManager.dispatchEvent(GuildEvent.GUILD_SKILLINFO_CHAGE);
			return true;
		}
		
		
		public function get isLeader():Boolean
		{
			if(_selfMemberInfo == null)
				return false;
			return _selfMemberInfo.isLeader ==1;
		}
		
		/** 通知玩家帮派Id改变 */
		public function changeGuildId(msg:ResGuildChangeGuildIdMessage):void
		{
			if(MainRoleManager.isSelf(msg.playerId.ToGID()))
			{
				ClientConfig.loginData.guildId = msg.guildId;
				if(!haveGuild)
					EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
				else
					this.requestGuildInfo();
				_needSwitchChange = true;
			}else{
				var playerInfo:GuildMemberInfo = this.getGuildMemberInfoById(msg.playerId.hexValue);
				var index:int = _memberList.indexOf(playerInfo);
				if(index>=0)
				{
					_memberList.splice(index,0);
				}
				_guildData.memberNum-- ;
				EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
			}
			
		}
		
		
		
		private var _oriderList:Vector.<GuildMemberInfo> = new Vector.<GuildMemberInfo>();
		
		/**
		 * 
		 * @param key
		 * @param isShow
		 * @return 
		 * 
		 */
		public function sortGuildMemberInfo(key:String,isShow:Boolean):int
		{
			_oriderList.length = 0;
			var list:Vector.<GuildMemberInfo> = getSortMemberListByProp(key);
			var length:int = list.length;
			for(var i:int = 0;i<length;i++)
			{
				if(isShow&&(list[i].online==0))
					continue;
				_oriderList.push(list[i]);
			}
			return Math.ceil(_oriderList.length/MaxPlayerListPageCount);
		}
		
		public function getSortGuildMenberInfoByIndex(index:int):GuildMemberInfo
		{
			if(_oriderList.length<= index)
				return null;
			return _oriderList[index];
		}
	}
}