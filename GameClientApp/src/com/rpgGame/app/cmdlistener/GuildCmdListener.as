package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.info.guild.GuildFamilyData;
	import com.rpgGame.coreData.info.guild.GuildListItemData;
	import com.rpgGame.coreData.info.guild.GuildReqJoinData;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangGuild;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import flash.utils.ByteArray;
	
	import app.cmd.GuildModuleMessages;
	import app.message.AllGuildNewsProto;
	import app.message.GuildProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;
	
	public class GuildCmdListener extends BaseBean
	{
		public function GuildCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_CREATE_GUILD,createGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_CREATE_GUILD_FAIL,createGuildFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_CREATE_GUILD_BROADCAST,createGuildBroadcast);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_CHANGED,guildChange);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_FAMILY_REQUEST_JOIN_GUILD_LIST,GetJoinGuildList);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_FAMILY_REQUEST_JOIN_GUILD_LIST_FAIL,GetJoinGuildListFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_REQUEST_JOIN_FAIL,reqJoinFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_CANCEL_REQUEST_JOIN,cancelReqJoin);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_REQUEST_JOIN_SUCCESS_WAIT_OTHER_REPLY,reqJoinGuildComplete);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_OTHER_JOIN_GUILD,otherJoinGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_REPLY_JOIN_REQUEST_FAIL,replyJoinReqFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_YOU_JOIN_GUILD,youJoinGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_YOUR_JOIN_REQUEST_CANCEL,yourJoinReqCancel);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_GUILD_LIST,getGuildList);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_REPLY_JOIN_REQUEST_SUCCESS,replyJOinReqSuccess);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_OTHER_REJECTED_YOUR_JOIN_REQUEST,otherRejectedYourJoinReq);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_OTHER_ACCEPTED_YOUR_JOIN_REQUEST,otherAcceptedYourJoinReq);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_HAS_REQUEST_JOIN,hasReqJoin);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_REQUEST_JOIN_DETAIL,getReqJoinDetail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_REQUEST_JOIN_DETAIL_FAIL,getReqJoinDetailFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_INVITE_JOIN_FAIL,inviteJoinFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_INVITE_JOIN_SUCCESS_AND_WAIT_OTHER_REPLY,inviteJoinSuccess);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_RECEIVE_JOIN_INVITE,receiveJoinInvite);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_LEAVE_GUILD_FAIL,leaveGuildFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_LEAVE_GUILD,leaveGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_LEAVE_GUILD_BROADCAST,leaveGuildBroadcast);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SELF_FAMILY_LEAVE_GUILD,selfFamilyLeaveGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_KICK_GUILD_MEMBER_BROADCAST,kickGuildMemberBroadcast);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_BEEN_KICK_OUT_GUILD,beenKickGuild);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_DISMISS,guildDismiss);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_ANNOUCEMENT,getAnnoucement);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SET_ANNOUNCEMENT,setAnnoucementComplete);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SET_ANNOUNCEMENT_FAIL,setAnnoucementFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SET_ANNOUNCEMENT_BROADCAST,setAnnouncementBroadcast);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GET_ANNOUCEMENT_FAIL,getAnnouncementFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SET_POS,setPos);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_SET_POS_FAIL,setPosFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_POS_CHANGED,posChange);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_UPGRADE_LEVEL,upgradeLevel);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_UPGRADE_LEVEL_FAIL,upgradeLevelFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_LEVEL_CHANGED_BROADCAST,guildLevelCHangeBradecast);
			
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_COLLECT_PRIZE,getSalaryComplete);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_COLLECT_PRIZE_FAIL,getSalaryFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_COLLECT_KING_PRIZE,getKingSalaryComplete);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_COLLECT_KING_PRIZE_FAIL,getKingSalaryFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_LOG,guildLog);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_LOG_FAIL,guildLOgFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_BASIC,guildBasic);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_BASIC_FAIL,guildBasicFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_DONATE,donate);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_DONATE_FAIL,donateFail);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_DONATE_BROADCAST,donateBroadcast);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_FAMILY_MEMBERS,guildFamilyMembers);
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_GUILD_FAMILY_MEMBERS_FAIL,guildFamilyMembersFail);
			
			SocketConnection.addCmdListener(GuildModuleMessages.S2C_KICK_GUILD_MEMBER,kickGuildMember);
			finish();
		}
		
		private function kickGuildMember(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify("开除帮派成员成功");
			GuildManager.getSelfGuildBaseData();
		}
		
		private function guildFamilyMembersFail(buffer:ByteBuffer):void
		{
			// TODO Auto Generated method stub
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("donateFail"+error);
		}
		/**
		 * 返回帮派成员数据
		 * <p>
		 * 已经压缩,先解压
		 * <p>
		 * varint32 后面官员数据的长度
		 * <p>
		 * bytes FamilyOfficeProto
		 * <p>
		 * while(buffer.readable()){
		 *      varint64 玩家id
		 *      utf 玩家名字
		 *      varint64 帮派贡献
		 *      varint32 等级
		 *      varint64 战斗力
		 * }
		 */
		private function guildFamilyMembers(buffer:ByteBuffer):void
		{
			var family : GuildFamilyData = new GuildFamilyData();
			family.setup(buffer);
			GuildManager.setGuildFamilyData(family);
		}
		/**
		 * 捐献成功
		 * <p>
		 * varint64 捐献基数的倍数,客户端转换成锭/两/文
		 * <p>
		 * bytes 捐献的人的名字
		 */
		private function donateBroadcast(buffer:ByteBuffer):void
		{
			var base : Number = buffer.readVarint64();
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangGuild.DONATE,name,MoneyUtil.getHtmlMoneyString(base*GuildCfgData.guildMiscData.donateMoneyBase));
			}
		/**
		 * 捐献失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.捐献数量非法
		 * 4.捐献太多的银两了
		 * 5.银两不足
		 * 6.帮派仓库容量不足
		 */
		private function donateFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("donateFail"+error);
		}
		/**
		 * 捐献成功,自己的帮派贡献变化通过另外的消息推送
		 * <p>
		 * varint64 当前帮派的银两
		 */
		private function donate(buffer:ByteBuffer):void
		{
			var nowSilver : Number = buffer.readVarint64();
			GuildManager.donate(nowSilver);
		}
		/**
		 * 请求帮派基本信息失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 */
		private function guildBasicFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("guildBasicFail"+error);
		}
		
		private function guildBasic(buffer:ByteBuffer):void
		{
			var allData : GuildProto = new GuildProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			allData.mergeFrom(bytes);
			GuildManager.setGuildData(allData);
		}
		/**
		 * 请求帮派日志失败,返回varint32错误码
		 *
		 * 1.没有家族
		 * 2.没有帮派
		 */
		private function guildLOgFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("guildLOgFail"+error);
		}
		
		private function guildLog(buffer:ByteBuffer):void
		{
			var allData : AllGuildNewsProto = new AllGuildNewsProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			allData.mergeFrom(bytes);
			GuildManager.setAllGuildEvents(allData.news);
		}
		/**
		 * 领取王帮奖励失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.奖励已经领取
		 * 4.不是王帮
		 * 5.背包满了
		 */
		private function getKingSalaryFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("getKingSalaryFail"+error);
		}
		/**
		 * 领取王帮奖励成功,将GuildModuleObj中的is_collect_king_guild_prize设置为true
		 */
		private function getKingSalaryComplete(buffer:ByteBuffer):void
		{
			GuildManager.getKingSalaryComplete();
		}
		/**
		 * 领取失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.奖励已经领取
		 * 4.背包满了
		 */
		private function getSalaryFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("getSalaryFail"+error);
		}
		/**
		 * 领取帮派奖励成功,将GuildModuleObj中的is_collect_guild_prize设置为true
		 */
		private function getSalaryComplete(buffer:ByteBuffer):void
		{
			GuildManager.getSalaryComplete();
		}
		
		private function guildLevelCHangeBradecast(buffer:ByteBuffer):void
		{
			var newLv : int = buffer.readVarint32();
			var isup : Boolean = buffer.readBoolean();
			var msg : String = isup?"帮派升级到"+newLv+"级":"帮派降级到"+newLv+"级";
			NoticeManager.systemSwitchNotify(msg);
		}
		/**
		 * 升级帮派失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.没有权限
		 * 4.帮派等级已满
		 * 5.升级繁荣度不够
		 * 6.升级银两不够
		 */
		private function upgradeLevelFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("upgradeLevelFail"+error);
		}
		/**
		 * 升级帮派成功
		 * <p>
		 * varint32 新的等级
		 * varint64 剩余的繁荣度
		 * varint64 剩余的银两
		 */
		private function upgradeLevel(buffer:ByteBuffer):void
		{
			var level : int = buffer.readVarint32();
			var fanrongdu:Number = buffer.readVarint64();
			var silver : Number = buffer.readVarint64();
			GuildManager.upgradeLevelComplete(level,fanrongdu,silver);
		}
		/**
		 * 帮派职位变更了,根据策划需求进行显示
		 *
		 * utf 家族名字
		 * bool 上任(true)/卸任(false)
		 * varint32 官职(上任的话该官职是上任后的官职/卸任的是该官员卸任前的官职)
		 */
		private function posChange(buffer:ByteBuffer):void
		{
			var family:String = buffer.readUTF();
			var bool : Boolean = buffer.readBoolean();
			var pos : int = buffer.readVarint32();
			GuildManager.societyPosChange(family,bool,pos);
		}
		/**
		 * 设置帮派职位失败,返回varint32错误码
		 * <p>
		 * 1.你没有家族如何上任卸任家族
		 * 2.你没有帮派如何上任卸任家族
		 * 3.没有权限
		 * 4.目标家族没找到
		 * 5.不可以操作自己家族的官职
		 * 6.目标家族不是我们帮派的,无权设置
		 * 7.发送过来的官职非法
		 * 8.无法上任或者卸任帮主
		 * 9.目标当前就是这个官职啊
		 * 10.官员空位不够
		 * 11.要卸任选定的目标,但是目标不是该职位
		 * 12.自己不是族长
		 */
		private function setPosFail(buffer:ByteBuffer):void
		{
			// TODO Auto Generated method stub
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("setPosFail"+error);
		}
		/**
		 * 设置职位成功,广播什么的根据策划的来
		 * <p>
		 * utf 家族名字
		 * bool 上任(true)/卸任(false)
		 * varint32 官职(上任的话该官职是上任后的官职/卸任的是该官员卸任前的官职)
		 */
		private function setPos(buffer:ByteBuffer):void
		{
			var family:String = buffer.readUTF();
			var bool : Boolean = buffer.readBoolean();
			var pos : int = buffer.readVarint32();
			var msg : String;
			if(bool)
			{
				msg = "恭喜"+GuildManager.getGuildFamilyLeaderByName(family)+"族长上任帮派"+GuildManager.getGuildOfficerPos(pos);
			}else
			{
				msg = ""+GuildManager.getGuildFamilyLeaderByName(family)+"族长卸任帮派"+GuildManager.getGuildOfficerPos(pos);
			}
			NoticeManager.systemSwitchNotify(msg);
			if(AppManager.isAppInScene(AppConstant.COUNTRY_PANEL))
				GuildManager.getSelfGuildBaseData();
		}
		/**
		 * 请求公告失败,返回varint32错误码
		 * <p>
		 * 1.你没有家族获取帮派公告
		 * 2.你没有帮派怎么获取帮派公告
		 */
		private function getAnnouncementFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("getAnnouncementFail"+error);
		}
		
		private function setAnnouncementBroadcast(buffer:ByteBuffer):void
		{
			GuildManager.announcementChange();
		}
		/**
		 * 修改公告失败,返回varint32错误码
		 *
		 * 1.你没有家族怎么设置帮派公告
		 * 2.你没有帮派怎么设置帮派公告
		 * 3.没有权限设置公告
		 */
		private function setAnnoucementFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("setAnnoucementFail"+error);
		}
		/**
		 * 修改公告成功,玩家可以在需要的时候再次请求
		 */
		private function setAnnoucementComplete(buffer:ByteBuffer):void
		{
			NoticeManager.showNotify("修改公告成功");
			GuildManager.announcementChange();
		}
		/**
		 * 返回公告内容
		 * <p>
		 * bytes 长度可能为0,表示没有公告内容
		 */
		private function getAnnoucement(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.setAnnouncement(guild);
		}
		/**
		 * 帮派解散了,这是一条全场景的广播,任何收到该消息的人,检查视野里面是不是有人是这个帮派名字,将他们的帮派名字取下来
		 * 自己是这个帮派的根据策划需求处理一下
		 * <p>
		 * bytes 帮派名字
		 */
		private function guildDismiss(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.systemSwitchNotify("帮派"+guild+"解散了");
			if(GuildManager.haveGuild && guild == GuildManager.guildData.name)
				GuildManager.beenKickGuild();
		}
		/**
		 * 被从帮派踢出了
		 */
		private function beenKickGuild(buffer:ByteBuffer):void
		{
			if(SocietyManager.getSelfMemberData().isLeader)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
					EnumFunctionMessageBarIcoType.GUILD_BEEN_KICK_GUILD);
			}
			GuildManager.beenKickGuild();
		}
		/**
		 * 踢出帮派成员广播
		 * <p>
		 * bytes 目标家族的名字
		 */
		private function kickGuildMemberBroadcast(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.familyBeenKickGuild(guild);
		}
		/**
		 * 自己家族离开帮派了
		 */
		private function selfFamilyLeaveGuild(buffer:ByteBuffer):void
		{
			trace("自己家族离开帮派了");
			GuildManager.beenKickGuild();
		}
		
		private function leaveGuildBroadcast(buffer:ByteBuffer):void
		{
			var guild:String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.systemSwitchNotify("$家族离开了本帮派",[guild]);
		}
		
		private function leaveGuild(buffer:ByteBuffer):void
		{
			GuildManager.beenKickGuild();
		}
		/**
		 * 离开失败,返回varint32错误码
		 * <p>
		 * 1.权限不够,无法申请离开
		 * 2.没有帮派,怎么离开
		 * 3.要离开帮派,但是你当前没有家族,如何离开
		 * 4.当前帮派变更了
		 * 5.不是帮主
		 * 6.是帮派创建者,无法离开
		 *
		 * 100.服务器bug
		 */
		private function leaveGuildFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("leaveGuildFail"+error);
		}
		/**
		 * 收到别的帮派的入帮邀请
		 *
		 * 缓存2分钟, 2分钟后删掉
		 *
		 * 附带
		 *
		 * varint64 对方id
		 * UTF 对方玩家名字
		 * bytes 帮派名字
		 */
		private function receiveJoinInvite(buffer:ByteBuffer):void
		{
			var heroId : Number = buffer.readVarint64();
			var name : String = buffer.readUTF();
			var guildName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.receiveJoinInvite(heroId,name,guildName);
		}
		
		private function inviteJoinSuccess(buffer:ByteBuffer):void
		{
			GuildManager.inviteSocietyComplete();
		}
		/**
		 * 邀请失败, 附带varint32 错误码
		 *
		 * 1. 没有家族
		 * 2. 没有权限
		 * 3. 帮派人已经满了
		 * 4. 对方不在线
		 * 5. 对方家族已经在你帮派里了
		 * 6. 对方家族在别的帮派里
		 * 7. 已经邀请过对方了
		 * 8. 对方等级不够
		 * 10. 板块战期间
		 * 11. 对方是别的国家的
		 * 12. 对方在入帮cd中
		 * 13. 你没有帮派
		 * 14. 目标没有家族
		 */
		private function inviteJoinFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("inviteJoinFail"+error);
		}
		/**
		 * 请求帮派申请失败
		 *
		 * 1. 没有家族
		 * 2. 不是官员
		 * 3. 不能够邀请他人
		 * 4. 服务器内部错误
		 * 5. 没有帮派
		 */
		private function getReqJoinDetailFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("getReqJoinDetailFail"+error);
		}
		/**
		 * 返回入帮申请
		 *
		 * while(buffer.readable()){
		 *      UTF 家族名字
		 *      UTF 家族族长的名字
		 *      varint32 家族等级
		 *      varint64 总的战斗力
		 *      varint32 家族成员数量
		 * }
		 */
		private function getReqJoinDetail(buffer:ByteBuffer):void
		{
			var societys : Array = [];
			while(buffer.bytesAvailable)
			{
				var guildreqJoin : GuildReqJoinData = new GuildReqJoinData();
				guildreqJoin.readBytes(buffer);
				societys.push(guildreqJoin);
			}
			GuildManager.getReqJoinGuildListComplete(societys);
		}
		
		private function hasReqJoin(buffer:ByteBuffer):void
		{
			var bool:Boolean = buffer.readBoolean();
			GuildManager.hasReqJoinChange(bool);
		}
		
		/**恭喜，XXX帮派已同意您的入帮请求**/
		private function otherAcceptedYourJoinReq(buffer:ByteBuffer):void
		{
			var guild:String = buffer.readUTFBytes(buffer.bytesAvailable);
			if(SocietyManager.getSelfMemberData().isLeader)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,EnumFunctionMessageBarIcoType.GUILD_JION_COMPLETE);
			}
		}
		/**
		 *很抱歉，XXX帮派拒绝了您的入帮申请 
		 * 
		 */		
		private function otherRejectedYourJoinReq(buffer:ByteBuffer):void
		{
			var guild:String = buffer.readUTFBytes(buffer.bytesAvailable);
			GameAlert.showAlertUtil(LangAlertInfo.YOUR_JOIN_REQ_CANCEL,null,guild);
			GuildManager.cancelReqJoin(guild,false);
		}
		
		private function replyJOinReqSuccess(buffer:ByteBuffer):void
		{
			ReqLockUtil.unlockReq(GuildModuleMessages.C2S_REPLY_JOIN_REQUEST);
		}
		/**
		 * 返回本国帮派列表
		 *
		 * while(buffer.readable()){
		 *      utf 帮派名字
		 *      utf 帮主名字
		 *      varint32 帮派等级
		 *      varint32 家族数量
		 *      varint32 家族繁荣度
		 *      bool 是否有官员在线
		 * }
		 */
		private function getGuildList(buffer:ByteBuffer):void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			
			var array : Array = [];
			while(bytes.bytesAvailable)
			{
				var guild : GuildListItemData = new GuildListItemData();
				guild.readByte(bytes);
				array.push(guild);
			}
			GuildManager.getGuildListComplete(array);
		}
		/**
		 * 某个帮派取消了你的申请
		 *
		 * bytes 帮派名字
		 */
		private function yourJoinReqCancel(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.yourJoinReqCancel(guild);
		}
		
		private function youJoinGuild(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.mineJoinGuild(guild);
		}
		/**
		 * 回复别人的入帮申请失败. 一定是同意才会收到. 失败不会有返回
		 *
		 * 附带varint32 错误码
		 *
		 * 1. 没有家族
		 * 2. 没有权限
		 * 3. 申请已过期
		 * 4. 对方已经在你帮派中了 (可能通过其他途径加入)
		 * 5. 对方已经在其他帮派中了
		 * 6. 目标家族没有找到
		 * 7. 自己家族人满了
		 * 8. 板块战期间
		 * 9. 对方不在自己国家了
		 * 10. 退出家族24小时内不能加入其它帮派
		 * 11. 你当前没有帮派
		 */
		private function replyJoinReqFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("replyJoinReqFail"+error);
			ReqLockUtil.unlockReq(GuildModuleMessages.C2S_REPLY_JOIN_REQUEST);
		}
		
		private function otherJoinGuild(buffer:ByteBuffer):void
		{
			var society:String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.otherJoinGuildBroadcast(society);
		}
		
		private function reqJoinGuildComplete(buffer:ByteBuffer):void
		{
			var time : Number = buffer.readVarint64();
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.reqJoinGuildComplete(guild,time);
		}
		
		private function cancelReqJoin(buffer:ByteBuffer):void
		{
			var guild : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.cancelReqJoin(guild);
		}
		/**
		 * 要求加入帮派失败, 附带varint32 错误码
		 *
		 * 1. 没有家族
		 * 2. 你请求加入的帮派不存在
		 * 3. 你请求加入的帮派满人了
		 * 5. 你已经申请过这个帮派了
		 * 6. 你的等级不够
		 * 7. 板块战期间, 不能进入
		 * 8. 不能加入别的联服的帮派
		 * 9. 当前处于加入帮派的cd中
		 * 10. 没有发送过申请
		 * 11. 有帮派了,无法申请
		 * 12. 申请加入帮派过于频繁
		 */
		private function reqJoinFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("reqJoinFail"+error);
			ReqLockUtil.unlockReq(GuildModuleMessages.C2S_REQUEST_JOIN);
		}
		/**
		 * 请求失败,返回varint32错误码
		 *
		 * 1. 没有家族
		 * 2. 家族有帮派了
		 * 3. 没有权限,无法申请
		 */
		private function GetJoinGuildListFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("GetJoinGuildListFail"+error);
		}
		
		private function GetJoinGuildList(buffer:ByteBuffer):void
		{
			var array : Array = [];
			var guild:String;
			while(buffer.bytesAvailable)
			{
				guild = buffer.readUTF();
				array.push(guild);
			}
			GuildManager.returnJoinGuildList(array);
		}		
		/**
		 * 帮派变化了
		 * <p>
		 * bytes 帮派名字,长度为0表示变成没有帮派了
		 */
		private function guildChange(buffer:ByteBuffer):void
		{
			var newName : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.guildNameChange(newName);
		}
		
		private function createGuildBroadcast(buffer:ByteBuffer):void
		{
			var msg : String = buffer.readUTFBytes(buffer.bytesAvailable);
			GuildManager.createGuildBroadcast(msg);
		}
		/**
		 * 创建帮派失败,返回varint32错误码
		 * <p>
		 * 1. 没有家族怎么创建帮派
		 * 2. 没有开放帮派功能
		 * 3. 当前在帮派创建或者加入帮派cd中
		 * 4. 没有创建帮派的权限
		 * 5. 银两不够,无法创建帮派
		 * 6. 创建帮派的物品位置非法
		 * 7. 创建帮派的物品已过期
		 * 8. 物品不是创建帮派需要的物品
		 * 9. 旗号非法
		 * 10. 底纹非法
		 * 11. 底框非法
		 * 12. 帮派名字非法
		 * 13. 该帮派名字已经存在了
		 * 14. 该帮派旗号已经存在了
		 * 15. 你们家族已经解散
		 * 16. 家族已经有帮派了,无法创建
		 */
		private function createGuildFail(buffer:ByteBuffer):void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("createGuildFail"+error);
		}
		
		private function createGuild(buffer:ByteBuffer):void
		{
			//请求基本数据
			GuildManager.createGuildComplete();
		}		
		
	}
}