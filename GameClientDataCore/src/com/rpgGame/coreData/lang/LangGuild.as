package com.rpgGame.coreData.lang
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	* 
	*/
	public class LangGuild
	{
		 /**  帮主权利<font color='#ffffff'><br/>1、招收帮派成员（家族）<br/>2、开除帮派成员<br/>3、授予成员家族家族长帮派职位。<br/>4、建设升级帮派。</font> */
		public static const LEADER_RIGHT:String = "LEADER_RIGHT";
		 /**  帮主义务<font color='#ffffff'><br/>1、促使帮众和睦相处<br/>2、维持帮派日常开支<br/>3、积极组织参与帮派活动</font> */
		public static const LEADER_OBLIGATION:String = "LEADER_OBLIGATION";
		 /**  帮派创建条件<font color='#ffffff'><br/>1、在王城找帮派管理员（XXX,XXX)对话进行创建。<br/>2、需要支付5锭银子费用。<br/>3、需要道具英雄令</font> */
		public static const CREATE_CONDITION:String = "CREATE_CONDITION";
		 /**  帮派信息,加入帮派 */
		public static const TABBAR_DONT_HAVE_GUILD:String = "TABBAR_DONT_HAVE_GUILD";
		 /**  帮派信息,帮派事件 */
		public static const TABBAR_HAVE_GUILD:String = "TABBAR_HAVE_GUILD";
		 /**  $族长被任命为帮派$ */
		public static const SET_POS_ON:String = "SET_POS_ON";
		 /**  $族长卸任帮派$ */
		public static const SET_POS_OFF:String = "SET_POS_OFF";
		 /**  欢迎$加入帮派。 */
		public static const JOIN_GUILD:String = "JOIN_GUILD";
		 /**  $退出帮派。 */
		public static const LEAVE_GUILD:String = "LEAVE_GUILD";
		 /**  $慷慨解囊个，向帮派捐款$。 */
		public static const DONATE:String = "DONATE";
		 /**  $创建了帮派，旗号$ */
		public static const CREATE:String = "CREATE";
		 /**  帮派成功提升等级至LV$ */
		public static const UPGRADE_LEVEL:String = "UPGRADE_LEVEL";
		 /**  很遗憾，帮派维护费用不足，等级降低至LV$，返还帮派资金$，返还帮派繁荣度$。 */
		public static const DEMOTE_LEVEL:String = "DEMOTE_LEVEL";
		 /**  每日维护：昨日收益帮派资金$，帮派繁荣度$。维护消耗繁荣度$，消耗资金$。 */
		public static const MAINTAIN:String = "MAINTAIN";
		 /**  $新帮成立，风起云涌的天下又多了一股新势力。 */
		public static const CREATE_BRADCAST:String = "CREATE_BRADCAST";
		 /**  欢迎【$】家族加入本帮派，本帮派变的更加强大了。 */
		public static const OTHER_JOIN_GUILD_BROADCAST:String = "OTHER_JOIN_GUILD_BROADCAST";
		 /**  没有家族 */
		public static const guildBasicFail1:String = "guildBasicFail1";
		 /**  没有帮派 */
		public static const guildBasicFail2:String = "guildBasicFail2";
		 /**  没有家族 */
		public static const guildLOgFail1:String = "guildLOgFail1";
		 /**  没有帮派 */
		public static const guildLOgFail2:String = "guildLOgFail2";
		 /**  没有家族 */
		public static const getKingSalaryFail1:String = "getKingSalaryFail1";
		 /**  没有帮派 */
		public static const getKingSalaryFail2:String = "getKingSalaryFail2";
		 /**  奖励已经领取 */
		public static const getKingSalaryFail3:String = "getKingSalaryFail3";
		 /**  不是王帮 */
		public static const getKingSalaryFail4:String = "getKingSalaryFail4";
		 /**  背包满了 */
		public static const getKingSalaryFail5:String = "getKingSalaryFail5";
		 /**  没有家族 */
		public static const getSalaryFail1:String = "getSalaryFail1";
		 /**  没有帮派 */
		public static const getSalaryFail2:String = "getSalaryFail2";
		 /**  奖励已经领取 */
		public static const getSalaryFail3:String = "getSalaryFail3";
		 /**  背包满了 */
		public static const getSalaryFail4:String = "getSalaryFail4";
		 /**  没有家族 */
		public static const upgradeLevelFail1:String = "upgradeLevelFail1";
		 /**  没有帮派 */
		public static const upgradeLevelFail2:String = "upgradeLevelFail2";
		 /**  没有权限 */
		public static const upgradeLevelFail3:String = "upgradeLevelFail3";
		 /**  帮派等级已满 */
		public static const upgradeLevelFail4:String = "upgradeLevelFail4";
		 /**  升级繁荣度不够 */
		public static const upgradeLevelFail5:String = "upgradeLevelFail5";
		 /**  升级银两不够 */
		public static const upgradeLevelFail6:String = "upgradeLevelFail6";
		 /**  你没有家族如何上任卸任家族 */
		public static const setPosFail1:String = "setPosFail1";
		 /**  你没有帮派如何上任卸任家族 */
		public static const setPosFail2:String = "setPosFail2";
		 /**  没有权限 */
		public static const setPosFail3:String = "setPosFail3";
		 /**  目标家族没找到 */
		public static const setPosFail4:String = "setPosFail4";
		 /**  不可以操作自己家族的官职 */
		public static const setPosFail5:String = "setPosFail5";
		 /**  目标家族不是我们帮派的,无权设置 */
		public static const setPosFail6:String = "setPosFail6";
		 /**  发送过来的官职非法 */
		public static const setPosFail7:String = "setPosFail7";
		 /**  无法上任或者卸任帮主 */
		public static const setPosFail8:String = "setPosFail8";
		 /**  目标当前就是这个官职啊 */
		public static const setPosFail9:String = "setPosFail9";
		 /**  官员空位不够 */
		public static const setPosFail10:String = "setPosFail10";
		 /**  要卸任选定的目标,但是目标不是该职位 */
		public static const setPosFail11:String = "setPosFail11";
		 /**  自己不是族长 */
		public static const setPosFail12:String = "setPosFail12";
		 /**  你没有家族获取帮派公告 */
		public static const getAnnouncementFail1:String = "getAnnouncementFail1";
		 /**  你没有帮派怎么获取帮派公告 */
		public static const getAnnouncementFail2:String = "getAnnouncementFail2";
		 /**  你没有家族怎么设置帮派公告 */
		public static const setAnnoucementFail1:String = "setAnnoucementFail1";
		 /**  你没有帮派怎么设置帮派公告 */
		public static const setAnnoucementFail2:String = "setAnnoucementFail2";
		 /**  没有权限设置公告 */
		public static const setAnnoucementFail3:String = "setAnnoucementFail3";
		 /**  权限不够,无法申请离开 */
		public static const leaveGuildFail1:String = "leaveGuildFail1";
		 /**  没有帮派,怎么离开 */
		public static const leaveGuildFail2:String = "leaveGuildFail2";
		 /**  要离开帮派,但是你当前没有家族,如何离开 */
		public static const leaveGuildFail3:String = "leaveGuildFail3";
		 /**  当前帮派变更了 */
		public static const leaveGuildFail4:String = "leaveGuildFail4";
		 /**  不是帮主 */
		public static const leaveGuildFail5:String = "leaveGuildFail5";
		 /**  是帮派创建者,无法离开 */
		public static const leaveGuildFail6:String = "leaveGuildFail6";
		 /**  服务器bug */
		public static const leaveGuildFail100:String = "leaveGuildFail100";
		 /**  没有家族 */
		public static const inviteJoinFail1:String = "inviteJoinFail1";
		 /**  没有权限 */
		public static const inviteJoinFail2:String = "inviteJoinFail2";
		 /**  当前帮派已入驻的家族数已满 */
		public static const inviteJoinFail3:String = "inviteJoinFail3";
		 /**  对方不在线 */
		public static const inviteJoinFail4:String = "inviteJoinFail4";
		 /**  对方家族已经在你帮派里了 */
		public static const inviteJoinFail5:String = "inviteJoinFail5";
		 /**  对方家族在别的帮派里 */
		public static const inviteJoinFail6:String = "inviteJoinFail6";
		 /**  已经邀请过对方了 */
		public static const inviteJoinFail7:String = "inviteJoinFail7";
		 /**  对方等级不够 */
		public static const inviteJoinFail8:String = "inviteJoinFail8";
		 /**  板块战期间 */
		public static const inviteJoinFail10:String = "inviteJoinFail10";
		 /**  对方是别的国家的 */
		public static const inviteJoinFail11:String = "inviteJoinFail11";
		 /**  对方在入帮cd中 */
		public static const inviteJoinFail12:String = "inviteJoinFail12";
		 /**  你没有帮派 */
		public static const inviteJoinFail13:String = "inviteJoinFail13";
		 /**  目标没有家族 */
		public static const inviteJoinFail14:String = "inviteJoinFail14";
		 /**  没有家族 */
		public static const getReqJoinDetailFail1:String = "getReqJoinDetailFail1";
		 /**  不是官员 */
		public static const getReqJoinDetailFail2:String = "getReqJoinDetailFail2";
		 /**  不能够邀请他人 */
		public static const getReqJoinDetailFail3:String = "getReqJoinDetailFail3";
		 /**  服务器内部错误 */
		public static const getReqJoinDetailFail4:String = "getReqJoinDetailFail4";
		 /**  没有帮派 */
		public static const getReqJoinDetailFail5:String = "getReqJoinDetailFail5";
		 /**  没有家族 */
		public static const replyJoinReqFail1:String = "replyJoinReqFail1";
		 /**  没有权限 */
		public static const replyJoinReqFail2:String = "replyJoinReqFail2";
		 /**  申请已过期 */
		public static const replyJoinReqFail3:String = "replyJoinReqFail3";
		 /**  对方已经在你帮派中了 (可能通过其他途径加入) */
		public static const replyJoinReqFail4:String = "replyJoinReqFail4";
		 /**  对方已经在其他帮派中了 */
		public static const replyJoinReqFail5:String = "replyJoinReqFail5";
		 /**  目标家族没有找到 */
		public static const replyJoinReqFail6:String = "replyJoinReqFail6";
		 /**  自己家族人满了 */
		public static const replyJoinReqFail7:String = "replyJoinReqFail7";
		 /**  板块战期间 */
		public static const replyJoinReqFail8:String = "replyJoinReqFail8";
		 /**  对方不在自己国家了 */
		public static const replyJoinReqFail9:String = "replyJoinReqFail9";
		 /**  退出家族24小时内不能加入其它帮派 */
		public static const replyJoinReqFail10:String = "replyJoinReqFail10";
		 /**  你当前没有帮派 */
		public static const replyJoinReqFail11:String = "replyJoinReqFail11";
		 /**  没有家族 */
		public static const reqJoinFail1:String = "reqJoinFail1";
		 /**  你请求加入的帮派不存在 */
		public static const reqJoinFail2:String = "reqJoinFail2";
		 /**  你请求加入的帮派满人了 */
		public static const reqJoinFail3:String = "reqJoinFail3";
		 /**  你已经申请过这个帮派了 */
		public static const reqJoinFail5:String = "reqJoinFail5";
		 /**  你的等级不够 */
		public static const reqJoinFail6:String = "reqJoinFail6";
		 /**  板块战期间, 不能进入 */
		public static const reqJoinFail7:String = "reqJoinFail7";
		 /**  不能加入别的联服的帮派 */
		public static const reqJoinFail8:String = "reqJoinFail8";
		 /**  当前处于加入帮派的cd中 */
		public static const reqJoinFail9:String = "reqJoinFail9";
		 /**  没有发送过申请 */
		public static const reqJoinFail10:String = "reqJoinFail10";
		 /**  有帮派了,无法申请 */
		public static const reqJoinFail11:String = "reqJoinFail11";
		 /**  申请加入帮派过于频繁 */
		public static const reqJoinFail12:String = "reqJoinFail12";
		 /**  没有家族 */
		public static const GetJoinGuildListFail1:String = "GetJoinGuildListFail1";
		 /**  家族有帮派了 */
		public static const GetJoinGuildListFail2:String = "GetJoinGuildListFail2";
		 /**  没有权限,无法申请 */
		public static const GetJoinGuildListFail3:String = "GetJoinGuildListFail3";
		 /**  没有家族怎么创建帮派 */
		public static const createGuildFail1:String = "createGuildFail1";
		 /**  没有开放帮派功能 */
		public static const createGuildFail2:String = "createGuildFail2";
		 /**  当前在帮派创建或者加入帮派cd中 */
		public static const createGuildFail3:String = "createGuildFail3";
		 /**  没有创建帮派的权限 */
		public static const createGuildFail4:String = "createGuildFail4";
		 /**  银两不够,无法创建帮派 */
		public static const createGuildFail5:String = "createGuildFail5";
		 /**  创建帮派的物品位置非法 */
		public static const createGuildFail6:String = "createGuildFail6";
		 /**  创建帮派的物品已过期 */
		public static const createGuildFail7:String = "createGuildFail7";
		 /**  物品不是创建帮派需要的物品 */
		public static const createGuildFail8:String = "createGuildFail8";
		 /**  旗号非法 */
		public static const createGuildFail9:String = "createGuildFail9";
		 /**  底纹非法 */
		public static const createGuildFail10:String = "createGuildFail10";
		 /**  底框非法 */
		public static const createGuildFail11:String = "createGuildFail11";
		 /**  帮派名字非法 */
		public static const createGuildFail12:String = "createGuildFail12";
		 /**  该帮派名字已被其他帮派或家族占用了 */
		public static const createGuildFail13:String = "createGuildFail13";
		 /**  该帮派旗号已经存在了 */
		public static const createGuildFail14:String = "createGuildFail14";
		 /**  你们家族已经解散 */
		public static const createGuildFail15:String = "createGuildFail15";
		 /**  家族已经有帮派了,无法创建 */
		public static const createGuildFail16:String = "createGuildFail16";
		 /**  你家族当前等级高于要加入的帮派的等级 */
		public static const joinGuildLevelFail:String = "joinGuildLevelFail";
		 /**  对不起，您当前已有帮派，无法创建新的帮派。 */
		public static const createGuildHaveGuildFail:String = "createGuildHaveGuildFail";
		 /**  没有家族 */
		public static const donateFail1:String = "donateFail1";
		 /**  没有帮派 */
		public static const donateFail2:String = "donateFail2";
		 /**  捐献数量非法 */
		public static const donateFail3:String = "donateFail3";
		 /**  捐献太多的银两了 */
		public static const donateFail4:String = "donateFail4";
		 /**  银两不足 */
		public static const donateFail5:String = "donateFail5";
		 /**  帮派仓库容量不足 */
		public static const donateFail6:String = "donateFail6";
		 /**  确定任命$为$? */
		public static const setupPosAlert:String = "setupPosAlert";
		 /**  确认撤职$ $? */
		public static const setDownPosAlert:String = "setDownPosAlert";
		 /**  您是帮主，离开后自动解散本帮派，是否离开？ */
		public static const leaderLeaveGuildAlert:String = "leaderLeaveGuildAlert";
		 /**  您想离开现在的帮派吗？ */
		public static const leaveGuildAlert:String = "leaveGuildAlert";
		 /**  帮派邀请发出 */
		public static const inviteSocietyComplete:String = "inviteSocietyComplete";
		 /**  您没有帮派，无法邀请别人加入 */
		public static const dontHaveGuildCantInvite:String = "dontHaveGuildCantInvite";
		 /**  您没有权限邀请别人加入帮派 */
		public static const posCantInvite:String = "posCantInvite";
		 /**  当前帮派已入驻的家族数已满 */
		public static const guildSocietyFull:String = "guildSocietyFull";
		 /**  不能开除帮主所在的家族 */
		public static const cantKickLeaderSociety:String = "cantKickLeaderSociety";
		 /**  $家族被开除出本帮派 */
		public static const kickGuildComplete:String = "kickGuildComplete";
		 /**  领取每日俸禄成功 */
		public static const getSalaryComplete:String = "getSalaryComplete";
		 /**  领取王帮奖励成功 */
		public static const getKingSalaryComplete:String = "getKingSalaryComplete";
		 /**  $家族离开了本帮派 */
		public static const societyleaveGuild:String = "societyleaveGuild";

	}
}
		