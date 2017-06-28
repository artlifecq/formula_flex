package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.guild.GuildManager;
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
	import com.rpgGame.netData.guild.message.ReqGuildInviteMessage;
	import com.rpgGame.netData.guild.message.ReqGuildInviteOperationMessage;
	import com.rpgGame.netData.guild.message.ReqGuildJoinMessage;
	import com.rpgGame.netData.guild.message.ReqGuildKillMessage;
	import com.rpgGame.netData.guild.message.ReqGuildLevelupMessage;
	import com.rpgGame.netData.guild.message.ReqGuildListMessage;
	import com.rpgGame.netData.guild.message.ReqGuildModifyNoteMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSetAutoAcceptMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSkillInfoMessage;
	import com.rpgGame.netData.guild.message.ReqGuildSkillLevelupMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarApplyMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarCityApplyInfoMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarCityInfoMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarEnterApplyMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarEnterMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarGiveDailyGiftMessage;
	import com.rpgGame.netData.guildWar.message.ReqGuildWarLeaveApplyMessage;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	
	public class GuildSender extends BaseSender
	{
		public function GuildSender()
		{
		}
		/**  请求获得帮会信息 */
		public static function requestGuildInfo():void
		{
			if(!GuildManager.instance().haveGuild)
				return ;
			sendMsg(new ReqGuildInfoMessage());
		}
		
		/**  请求帮会技能 */
		public static function reqGuildSkillInfo():void
		{
			sendMsg(new ReqGuildSkillInfoMessage());
		}
		
		/**创建帮会**/
		public static function createGuild(type:int,name:String,banner:String):void
		{
			var msg:ReqGuildCreateMessage = new ReqGuildCreateMessage();
			msg.costType = type+1;
			msg.name = name;
			msg.note = banner;
			msg.opaque = 0;
			sendMsg(msg);
		}
		
		/** 请求召集帮派 **/
		public static function guildConvene():void
		{
			if(!GuildManager.instance().canConvene)
				return ;
			sendMsg(new ReqGuildConveneMessage());
		}
		
		/** 获取帮派列表 **/
		public static function reqGuildList(page:int,isfull:int,opaque:int):void
		{
			var request:ReqGuildListMessage = new ReqGuildListMessage();
			request.isFilterFull = isfull;
			request.page = page;
			request.opaque = opaque;
			sendMsg(request);
		}
		/** 请求加入帮派 **/
		public static function reqGuildJoin(guild:long,opaque:int):void
		{
			var msg:ReqGuildJoinMessage = new ReqGuildJoinMessage();
			msg.guildId = guild;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 邀请加入帮派 **/
		public static function reqGuildInvite(playerId:long,opaque:int):void
		{
			var msg:ReqGuildInviteMessage = new ReqGuildInviteMessage();
			msg.playerId = playerId;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 对邀请操作 **/
		public static function reqGuildInviteOperation(guild:int,flag:int,opaque:int):void
		{
			var msg:ReqGuildInviteOperationMessage = new ReqGuildInviteOperationMessage();
			msg.inviteId = guild;
			msg.flag = flag;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 请求召集帮派 **/
		public static function reqGuildConvene(opaque:int):void
		{
			var msg:ReqGuildConveneMessage = new ReqGuildConveneMessage();
			msg.opaque = opaque;
			sendMsg(msg);
		}
		/** 解散帮会 **/
		public static function guildDissolve():void
		{
			if(!GuildManager.instance().canDissolve)
				return ;
			sendMsg(new ReqGuildDissolveMessage());
		}
		/** 请求离开帮派 **/
		public static function guildExit():void
		{
			sendMsg(new ReqGuildExitMessage());
		}
		
		/** 请求设置自动通过玩家申请模式 **/
		public static function reqGuildSetAutoAccept(type:int):void
		{
			var msg:ReqGuildSetAutoAcceptMessage = new ReqGuildSetAutoAcceptMessage();
			msg.type = type;
			sendMsg(msg);
		}
		
		/** 对申请者操作 **/
		public static function applyOperation(flag:int,applyId:int,opaque:int):void
		{
			var msg:ReqGuildApplyOperationMessage = new ReqGuildApplyOperationMessage();
			msg.flag = flag;
			msg.applyId = applyId;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 请求提出成员 **/
		public static function guildKill(playerId:long,opaque:int):void
		{
			var msg:ReqGuildKillMessage = new ReqGuildKillMessage();
			msg.playerId = playerId;
			msg.opaque = opaque;
			SocketConnection.send(msg);
		}
		
		/** 请求提出成员 **/
		public static function guildAppoint(playerId:long,memberType:int,type:int,opaque:int):ReqGuildAppointMessage
		{
			var msg:ReqGuildAppointMessage = new ReqGuildAppointMessage();
			msg.playerId = playerId;
			msg.memberType = memberType;
			msg.leaderModel = type;
			msg.opaque = opaque;
			sendMsg(msg);
			return msg;
		}
		
		/** 请求帮派升级 **/
		public static function guildLevelup(opaque:int):void
		{
			if(!GuildManager.instance().canUpgrad)
				return ;
			var msg:ReqGuildLevelupMessage = new ReqGuildLevelupMessage();
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 请求领取帮派每日礼包 **/
		public static function guildGetDailyGift(opaque:int):void
		{
			var msg:ReqGuildGetDailyGiftMessage = new ReqGuildGetDailyGiftMessage();
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 请求帮派捐献 **/
		public static function guildDonate(type:int,num:int,opaque:int):void
		{
			if(num==0)
				return ;
			var msg:ReqGuildDonateMessage = new ReqGuildDonateMessage();
			msg.type = type;
			msg.num = num;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		
		/** 请求申请列表*/
		public static function reqGuildApplyListInfo():void
		{
			sendMsg(new ReqGuildApplyListMessage());
		}
		
		/** 获取帮派简介信息*/
		public static function reqGuildBriefnessInfo(guildId:long,opaque:int):void
		{
			var msg:ReqGuildBriefnessInfoMessage = new ReqGuildBriefnessInfoMessage();
			msg.guildId = guildId;
			msg.opaque = opaque;
			sendMsg(msg);
		}
		/** 获取邀请列表*/
		public static function reqGuildInviteList():void
		{
			sendMsg(new ReqGuildInviteListMessage());
		}
		
		/** 请求帮派技能升级*/
		public static function guildSkillLevelup(type:int,skillid:int,opaque:int):void
		{
			var msg:ReqGuildSkillLevelupMessage = new ReqGuildSkillLevelupMessage();
			msg.type = type;
			msg.opaque = opaque;
			msg.skillId = skillid;
			sendMsg(msg);
		}
		/** 请求帮派宣言修改*/
		public static function reqGuildModifyNote(note:String):void
		{
			var msg:ReqGuildModifyNoteMessage = new ReqGuildModifyNoteMessage();
			msg.note = note;
			sendMsg(msg);
		}
		
		/**
		 *请求帮会战城池信息 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarCityInfo(opaque:int=0):void
		{
			var msg:ReqGuildWarCityInfoMessage=new ReqGuildWarCityInfoMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *告知后台进入王城争霸界面 
		 * @param opaque
		 * 
		 */
		public static function reqEnterGuildWarPanel(opaque:int=0):void
		{
			var msg:ReqGuildWarEnterApplyMessage=new ReqGuildWarEnterApplyMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *请求帮会战报名 
		 * @param city
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarApply(city:int,opaque:int=0):void
		{
			var msg:ReqGuildWarApplyMessage=new ReqGuildWarApplyMessage();
			msg.cityId=city;
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 * 请求王城报名信息 
		 * @param type 王城类型,1:卫城,2:王城
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarCityApplyInfo(type:int,opaque:int=0):void
		{
			var msg:ReqGuildWarCityApplyInfoMessage=new ReqGuildWarCityApplyInfoMessage();
			msg.type=type;
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *告知后台离开报名界面 
		 * 
		 */
		public static function reqGuildWarLeaveApplyPanel(opaque:int=0):void
		{
			var msg:ReqGuildWarLeaveApplyMessage=new ReqGuildWarLeaveApplyMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *获取帮会战每日奖励 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarGiveDailyGift(opaque:int=0):void
		{
			var msg:ReqGuildWarGiveDailyGiftMessage=new ReqGuildWarGiveDailyGiftMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
		
		/**
		 *请求进入帮会战 
		 * @param opaque
		 * 
		 */
		public static function reqGuildWarEnter(opaque:int=0):void
		{
			var msg:ReqGuildWarEnterMessage=new ReqGuildWarEnterMessage();
			msg.opaque=opaque;
			sendMsg(msg);
		}
	}
}