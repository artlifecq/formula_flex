package com.rpgGame.app.manager.guild
{
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.gameClient.utils.StringFilter;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.ui.alert.GameAlertExt;
	import com.rpgGame.app.ui.main.taskbar.TaskControl;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.ui.tip.RewardTipTree;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.cfg.GuildSkillCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.clientConfig.Q_guildskill;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.item.GetShowItemVo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangGuild;
	import com.rpgGame.coreData.type.TaskType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberPostInfo;
	import com.rpgGame.netData.guild.bean.GuildSkillInfo;
	import com.rpgGame.netData.guild.message.G2CNotifyGuildActiveMessage;
	import com.rpgGame.netData.guild.message.G2CNotifyGuildMemberActiveMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildApplyOperationMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildAppointMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildInviteOperationMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildKillMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildLevelUpMessage;
	import com.rpgGame.netData.guild.message.ReplyGuildSkillLevelUpMessage;
	import com.rpgGame.netData.guild.message.ReqGuildAppointMessage;
	import com.rpgGame.netData.guild.message.ResGuildChangeGuildIdMessage;
	import com.rpgGame.netData.guild.message.ResGuildInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	import com.rpgGame.netData.prompt.message.G2CNotifyRedDotPromptMessage;
	
	import org.client.mainCore.manager.EventManager;
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
			_personSkillList=new HashMap();
			for (var i:int = 0; i < SELF_SKILL_COUNT; i++) 
			{
				_personSkillList.put(i+1,new GuildSkillVo(i+1));
			}
			_leaderSkillList=new HashMap();
			_leaderSkillList.put(LEADER_SKILL_ID,new GuildSkillVo(LEADER_SKILL_ID));
		}
		//------------------------------data-----------------
		/**
		 *统帅技能id; 
		 */		
		public static const LEADER_SKILL_ID:int=11;
		public static const SELF_SKILL_COUNT:int=6;
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
		private var _personSkillList:HashMap;
		//统帅帮派技能Id
		private var _leaderSkillList: HashMap;
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
		
		
		
		
		public function get memberList():Vector.<GuildMemberInfo>
		{
			return _memberList;
		}
		
		
		public function getSortMemberListByProp(prop:String):Vector.<GuildMemberInfo>
		{
			var sortfun1:Function = function(g1:GuildMemberInfo,g2:GuildMemberInfo):int{
				if(g1[prop]<g2[prop])
					return 1;
				else if(g1[prop]>g2[prop])
					return -1;
				else
					return 0;
			};
			var sortfun2:Function = function(g1:GuildMemberInfo,g2:GuildMemberInfo):int{
				if(g1[prop]<g2[prop])
					return -1;
				else if(g1[prop]>g2[prop])
					return 1;
				else
					return 0;
			};
			var sortfun:Function = sortfun1;
			if(prop == "memberType")
				sortfun = sortfun2;
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
			if (!haveGuild) 
			{
				return false;
			}
			return _haveDailyGift == 1;
		}
		public function hasDailyGift():Boolean
		{
			return haveDailyGift;
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
			EventManager.dispatchEvent(GuildEvent.GET_GUILD_LIST);
		}
		
		
		public function getGuildListInfoByIndex(index:int):GuildListInfo
		{
			if(_guildList==null)
				return null;
			if(_guildList.length<= index)
				return null;
			return _guildList[index];
		}
		
		public function getGuildListInfoById(guildid:long):GuildListInfo
		{
			var length:int = _guildList.length;
			for(var i:int = 0;i<length;i++)
			{
				if(_guildList[i].guildId.CompareTo(guildid)==1)
					return _guildList[i];
			}
			return null;
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
			return !ClientConfig.loginData.guildId.IsZero();
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
				banner = "新创建的帮派，欢迎大家的加入";
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
				NoticeManager.showNotifyById(60029,"",ItemConfig.getItemName(item["type"]));
				return;
			}
			
			GuildSender.createGuild(type,name,banner);
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
			var alertOk:AlertSetInfo=new AlertSetInfo(LangAlertInfo.dissolve_guild,guildData.name);
			GameAlert.showAlert(alertOk,sureguildDissolve);
		}
		
		private function sureguildDissolve(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					GuildSender.guildDissolve();
					break;
			}
		}
		
		
		/** 请求离开帮派 **/
		public function guildExit():void
		{
			var alertOk:AlertSetInfo=new AlertSetInfo(LangAlertInfo.quit_guild,guildData.name);
			GameAlert.showAlert(alertOk,sureguildExit);
		}
		
		private function sureguildExit(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					GuildSender.guildExit();
					break;
			}
		}
		
		

		
		public function reqGuildInviteOperation(guild:int,flag:int):void
		{
			GuildSender.reqGuildInviteOperation(guild,flag);
		}
		
		
		public static function get opaque():int
		{
			return ++_opaque;
		}

		/**
		 * 操作结果反馈
		 * @param msg
		 * 
		 */
		public function getGuildOperateResult(msg:ResGuildOperateResultMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.GUILD_OPERATERESULT,msg);
		}
		
		/** 请求设置自动通过玩家申请模式 **/
		public function reqGuildSetAutoAccept(value:Boolean):void
		{
			var type:int = value?1:0;
			if(type == _guildData.isAutoApply)
				return ;
			_guildData.isAutoApply = type;
			GuildSender.reqGuildSetAutoAccept(type);
		}
		
		/** 对申请者操作 **/
		public function applyOperation(flag:int,applyId:int):Boolean
		{
			GuildSender.applyOperation(flag,applyId);
			return true;
		}
		
		
		
		public function guildKill(playerId:long):void
		{
			var _killplayerInfo:GuildMemberInfo = this.getGuildMemberInfoById(playerId.hexValue);
			GameAlertExt.show(LanguageConfig.replaceStr("玩家$即将被您踢出帮派，确认将其踢出？",[_killplayerInfo.name]),GuildSender.guildKill,[_killplayerInfo.id]);
		
		}
		
	
		
	
		/** 请求任命成员 **/
		public function guildAppoint(playerId:long,memberType:int,type:int):void
		{
			GuildSender.guildAppoint(playerId,memberType,type);
		}
	
		
		
		/** 请求帮派升级 **/
		public function guildLevelup():void
		{
			if(!canUpgrad)
				return ;
		
			GuildSender.guildLevelup();
		}
		public function hasApplyList():Boolean
		{
			if (!haveGuild) 
			{
				return false;
			}
			return _hasApply;
			return false;
		}
		public function hasSkill2LevelUp():Boolean
		{
			if (hasLeaderSkill2LevelUp()) 
			{
				return true;
			}
			if (hasSelfSkill2LevelUp()) 
			{
				return true;
			}
			return false;
		}
		public function hasSelfSkill2LevelUp():Boolean
		{
			for (var i:int = 1; i <= SELF_SKILL_COUNT; i++) 
			{
				if (hasPersonalSkill2LevelUpBySkillId(i)) 
				{
					return true;
				}
			}
			return false;
		}
		public function hasLeaderSkill2LevelUp():Boolean
		{
			if (!haveGuild) 
			{
				return false;
			}
			if (!_selfMemberInfo) 
			{
				return false;
			}
			if (!isLeader) 
			{
				return false;
			}
			var skillInfo:GuildSkillVo=getLeaderSkillInfoById(LEADER_SKILL_ID);
			if (!skillInfo) 
			{
				return false;
			}
			
			var next:Q_guildskill= GuildSkillCfgData.getSkill(LEADER_SKILL_ID,skillInfo.level+1);
			//max
			if (!next) 
			{
				return false;
			}
			//看帮贡
			return next.q_costvalue<=MainRoleManager.actorInfo.totalStat.gold;
		}
		public  function hasPersonalSkill2LevelUpBySkillId(skillId:int):Boolean
		{
			if (!haveGuild) 
			{
				return false;
			}
			if (!_selfMemberInfo) 
			{
				return  false;
			}
			var skillInfo:GuildSkillVo=getSkillInfoById(skillId);
			if (!skillInfo) 
			{
				return false;
			}
			
			var next:Q_guildskill= GuildSkillCfgData.getSkill(skillId,skillInfo.level+1);
			//max
			if (!next) 
			{
				return false;
			}
			//看帮贡
			return next.q_costvalue<=_selfMemberInfo.contribution;
		}
		public function hasGuildLevelUp():Boolean
		{
			if (!haveGuild) 
			{
				return false;
			}
			if (!canUpgrad) 
			{
				return false;
			}
			if (!_guildData) 
			{
				return false;
			}
			if (_guildData.active<guildLevelInfo.q_active) 
			{
				return false;
			}
			var nextGuildInfo:Q_guild= GuildCfgData.getLevelInfo(_guildData.level+1);
			if (!nextGuildInfo) 
			{
				return false;
			}
			return true;
		}
			
		
		public function changeGuildDailyGift():void
		{
			_haveDailyGift = 0;
		}
		
		
		/**
		 * 根据id获取帮派信息 
		 * @param id
		 * @return 
		 * 
		 */
		public function getGuildMemberInfoById(id:String):GuildMemberInfo
		{
			if(_memberList == null)
				return null;
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
		
		public function setGuildApplyListInfo(list:Vector.<GuildApplyInfo>):void
		{
			_hasApply=false;
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
		
		
		
		
		
		public function get havePersonSkill():Boolean
		{
			var arr:Array=_personSkillList.values();
			for each (var skillVo:GuildSkillVo in arr) 
			{
				if (skillVo.level>0) 
				{
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 根据技能id获得技能信息 
		 * @param id
		 * @return 
		 * 
		 */
		public function getSkillInfoById(id:int):GuildSkillVo
		{
			return _personSkillList.getValue(id);
		}
		
		public function getLeaderSkillInfoById(id:int):GuildSkillVo
		{
			return _leaderSkillList.getValue(id);
		}
		
		public function setGuildSkill(personSkillList: Vector.<GuildSkillInfo>,leaderSkillList: Vector.<GuildSkillInfo>):void
		{
			var tmp:GuildSkillVo;
			var skill:GuildSkillInfo
			for each (skill in personSkillList) 
			{
				tmp=getSkillInfoById(skill.id);
				tmp.level=skill.level;
			}
			for each (skill in _leaderSkillList) 
			{
				tmp=getLeaderSkillInfoById(skill.id);
				tmp.level=skill.level;
			}
			EventManager.dispatchEvent(GuildEvent.GUILD_SKILLINFO_CHAGE);
		}
		
		
		public function get guildSkillMaxLevel():int
		{
			if(_guildLevelInfo == null)
				return 0;
			else
				return _guildLevelInfo.q_skill_num;
		}
		
		

		
		public function guildSkillLevelup(type:int,data:Q_guildskill):void
		{
//			if(_skillOpaque>0)
//				return ;
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
					NoticeManager.showNotifyById(60041);
					return;
				}
			}
			GuildSender.guildSkillLevelup(type,data.q_skillid);
		}

		
		/**
		 *是否为统帅 
		 * @return 
		 * 
		 */
		public function get isLeader():Boolean
		{
			return MainRoleManager.actorInfo.guildIsLeader==1;
		}
		
		/** 通知玩家帮派Id改变 */
		public function changeGuildId(msg:ResGuildChangeGuildIdMessage):void
		{
			if(MainRoleManager.isSelf(msg.playerId.ToGID()))
			{
				ClientConfig.loginData.guildId = msg.guildId;
				ClientConfig.loginData.guildMemberType = msg.guildMemberType;
				if(!haveGuild)
					EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
				else
					GuildSender.requestGuildInfo();
				_needSwitchChange = true;
			}else if(this.haveGuild&&_memberList!=null){
				var playerInfo:GuildMemberInfo = this.getGuildMemberInfoById(msg.playerId.hexValue);
				var index:int = -1;
				if(playerInfo!=null)
					index = _memberList.indexOf(playerInfo);
				if(msg.guildId.IsZero())
				{
					if(index>=0)
					{
						_memberList.splice(index,0);
					}
					_guildData.memberNum-- ;
					EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
				}else{
					if(index<0)
						GuildSender.requestGuildInfo();
					else{
						playerInfo.memberType = msg.guildMemberType;
						playerInfo.isLeader = msg.leader;
						EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
					}
				}
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
			var list:Vector.<GuildMemberInfo>
			if(key!="")
				list = getSortMemberListByProp(key);
			else{
				var sortfun1:Function = function(g1:GuildMemberInfo,g2:GuildMemberInfo):int{
					if(g1.online<g2.online)
						return 1;
					else if(g1.online > g2.online)
						return -1;
					else if(g1.memberType < g2.memberType)
						return -1;
					else if(g1.memberType > g2.memberType)
						return 1;
					else if(g1.curActive < g2.curActive)
						return 1;
					else if(g1.curActive > g2.curActive)
						return -1;
					else 
						return 0;
				};
				list =  _memberList.sort(sortfun1)
			}
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
		
		
		public function reqGuildModifyNote(note:String):void
		{
			if(_guildData.note == note)
				return ;
			_guildData.note = note;
			GuildSender.reqGuildModifyNote(note);
		}
		
		public  function onReplyGuildAppointHandler(msg:ReplyGuildAppointMessage):void
		{
			if (msg.changeMemberPostInfoList.length==0) 
			{
				return;
			}
			var result:GuildMemberPostInfo=msg.changeMemberPostInfoList[0];
			// TODO Auto Generated method stub
			var info:GuildMemberInfo = this.getGuildMemberInfoById(result.playerId.hexValue);
			if (info) 
			{
				info.memberType=result.memberType;
				info.isLeader=result.isLeader;
				info.isProxyChief=result.isProxyChief;
			}
			EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
		}
		
		public  function onReplyGuildInviteOperationHandler(msg:ReplyGuildInviteOperationMessage):void
		{
			// TODO Auto Generated method stub
			//同意
			if (msg.isReject==0) 
			{
				AppManager.hideApp(AppConstant.GUILD_INVITATION_PANEL);
				_inviteListInfo=null;
			}
			else
			{
				var len:int=_inviteListInfo.length;
				for (var i:int = 0; i < len; i++) 
				{
					if (_inviteListInfo[i].id==msg.operationInviteId) 
					{
						_inviteListInfo.splice(i,1);
						break;
					}
				}
				EventManager.dispatchEvent(GuildEvent.GET_INVITE_GUILD_LIST,_inviteListInfo);
			}
		}
		
		public function onReplyGuildLevelUpHandler(msg:ReplyGuildLevelUpMessage):void
		{
			// TODO Auto Generated method stub
			_guildData.level=msg.guildLevel;
			updataGuildData(_guildData);
			EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
		}
		
		public  function onReplyGuildSkillLevelUpHandler(msg:ReplyGuildSkillLevelUpMessage):void
		{
			// TODO Auto Generated method stub
			var skill:GuildSkillVo;
			
			if(msg.skillType==1)
			{
				skill = getSkillInfoById(msg.skillId);
				skill.level=msg.skillLevel;
				//_selfMemberInfo.contribution -= _skillData.q_costvalue;
			}
			else
			{
				skill = getLeaderSkillInfoById(msg.skillId);
				skill.level=msg.skillLevel;
			}
			EventManager.dispatchEvent(GuildEvent.GUILD_SKILLINFO_CHAGE);

		}
		
		public  function onReplyGuildKillHandler(msg:ReplyGuildKillMessage):void
		{
			// TODO Auto Generated method stub
			var mem:GuildMemberInfo= this.getGuildMemberInfoById(msg.targerPlayerId.hexValue);
			if (mem) 
			{
				var index:int = _memberList.indexOf(mem);
				if (index!=-1) 
				{
					_memberList.splice(index,1);
					EventManager.dispatchEvent(GuildEvent.GUILD_FAMILY_CHANGE);
				}
			}
		}
		
		public function onReplyGuildApplyOperationHandler(msg:ReplyGuildApplyOperationMessage):void
		{
			EventManager.dispatchEvent(GuildEvent.DELETE_GUILD_INVAITE,msg.applyId);
			// TODO Auto Generated method stub
			//AppManager.showApp(AppConstant.GUILD_APPLAYLIST_PANEL,msg.applyId);
		}
		
		public function onG2CNotifyGuildMemberActiveHandler(msg:G2CNotifyGuildMemberActiveMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.playerId.EqualTo(MainRoleManager.actorInfo.serverID)) 
			{
				selfMemberInfo.allActive=msg.allActive;
				selfMemberInfo.contribution=msg.contribution;
				selfMemberInfo.curActive=msg.curWeekendActive;
				EventManager.dispatchEvent(GuildEvent.GUILD_MAINPLAYER_VALUE_CHANGE);
			}
		}
		
		public function onG2CNotifyGuildActiveHandler(msg:G2CNotifyGuildActiveMessage):void
		{
			// TODO Auto Generated method stub
			if (_guildData&&_guildData.id.EqualTo(msg.guildId)) 
			{
				_guildData.active=msg.active;
				EventManager.dispatchEvent(GuildEvent.GUILD_DATA_INIT);
			}
		}
		
		public function gotoTask():void
		{
			if (!haveGuild) 
			{
				return ;
			}
			if (!TaskMissionManager.haveGuildTask) 
			{
				NoticeManager.showNotifyById(60039);
				return;
			}
			TaskControl.killWalkBut(TaskType.MAINTYPE_GUILDDAILYTASK,0,1);
		}
		public function hasSomeOneApply():Boolean
		{
			return _hasApply;
		}
		private var _hasApply:Boolean;
		public  function G2CNotifyRedDotPromptHandler(msg:G2CNotifyRedDotPromptMessage):void
		{
			// TODO Auto Generated method stub
			for each (var i:int in msg.typeList) 
			{
				if (i==1002) 
				{
					_hasApply=true;
					RewardTipTree.ins.setState(RTNodeID.MAIN_SOCAIL,true);
				}
			}
		}
	}
}