
package com.rpgGame.core.app
{
	import com.rpgGame.core.app.enum.PanelPosType;
	
	import flash.utils.Dictionary;

	/**
	 * app模块常量定义，
	 * AppManager打开面板的AppInfo参数都需要在这里定义，外部不可定义
	 * @author fly.liuyang
	 * 
	 */	
	public class AppConstant
	{
		/**
		 * 模块代码包路径
		 */
		private static const APP_ROOT:String="com.rpgGame.appModule";
		
		private static var appNameDic:Dictionary = new Dictionary();
		
		/**
		 * @param moduleName 横块名:包名.+类名形式,如gm.GmPanel
		 * @param resName APP资源名:由UIBuilder生成,位于..\res\app目录
		 * @param posType 位置类型,默认为 PanelPosType.MIDDLE_CENTRAL
		 * @param pX
		 * @param pY
		 * @return 
		 */		
		private static function createAppInfo( moduleName:String, resName:String=null,posType:uint=4, pX:int = 0, pY:int = 0 ):String
		{
			var a:AppInfo = appNameDic[ moduleName ];
			if(a == null)
			{
				a = new AppInfo();
				a.appName = moduleName;
				a.loadingTitle = "正在加载，请您稍候...";
				a.resName = resName;
				a.btnName = "";
				a.className = APP_ROOT+"."+moduleName;
				a.isSpecialInCloseAll = false;
				a.posType = posType;
				a.pX = pX;
				a.pY = pY;
				appNameDic[moduleName] = a;
			}else{
				trace("警告:",moduleName+"重复定义,请检查是否有同名APP(可能包路径不同)");
			}
			return moduleName;
		}
		
		/**
		 * 通过appName获取appinfo的定义 
		 * @param appName
		 * @return 
		 * 
		 */		
		public static function getAppinfoByAppName( appName:String ):AppInfo
		{
			var info:AppInfo = appNameDic[ appName ];
			return info;
		}

		/**
		 * 横块名应该使用包名.+类名形式
		 */		
		/** GM命令面板 **/
		public static var GM_PANEL:String = createAppInfo( "gm.GmPanel" );
		/** 测试面板 **/
		public static var UIDEMO_PANEL:String = createAppInfo("demo.UIDemoPanel");
		/** 人物面板 **/
		public static var ROLE_PANEL:String = createAppInfo("role.RolePanel","beibao");
		/** 玩家信息面板 **/
		public static var PLAYERINFO_PANEL:String = createAppInfo("role.PlayerInfoPanel","beibao");
		/** 查看面板*/
		public static var LOOK_PANEL:String = createAppInfo("look.LookPanel","look");
		/** 背包面板 **/
		public static var BACK_PACK_PANEL:String = createAppInfo("bag.BagPanel","beibao");
		public static var STORAGE_PANEL:String = createAppInfo("storage.StoragePanel");
		public static var RELIVE_PANEL:String = createAppInfo( "relive.RelivePanel","relive");
		
		/** 大地图面板 **/
		public static var BIGMAP_PANEL:String = createAppInfo("maps.MapsPanel","maps");
		
		/**
		 *死亡复活 
		 */
		public static var DIE_PANEL:String = createAppInfo( "die.DiePanel","siwangfuhuo");
		/**
		 *武学面板 
		 */
		public static var SKILL_PANL:String = createAppInfo( "skill.SkillPanel","wuxue");
		/**
		 *装备面板
		 */
		public static var EQUIP_PANL:String = createAppInfo( "equip.EquipPanel","zhuangbei");
		/** 
		*战魂
		 */
		public static var Battle_PANL:String = createAppInfo( "fightsoul.FightSoulPanel","zhanhun");
		
		
		/**世界地图**/
		public static var WORLD_MAP_PANEL:String = createAppInfo( "worldMap.WorldMapPanel" ,"worldmap");
		/**寻路指引面板*/
		public static var MAP_WAYS_GUILD_PANEL:String = createAppInfo( "worldMap.MapWaysGuildSkinViewer" );
		
		/**NPC对话面板**/
		public static var TASK_DIAILOG_FUNC_PANEL:String = createAppInfo( "taskDiailog.func.TaskDiailogFuncPanel","npc"); 
		/**NPC对话面板--刺探品质选择**/
		public static var CITAN_QULITY_SELECT_PANEL:String = createAppInfo( "citan.CitanPanel","citan");
		/**抽奖轮盘**/
		public static var ROULETTE_PANEL:String = createAppInfo( "roulette.RoulettePanel","roulette");
		
		/**传送面板**/
		//public static var TASK_DIAILOG_TRANS_PANEL:String = createAppInfo( "taskDiailog.trans.TaskDiailogTransPanel",null, PanelPosType.MIDDLE_LEFT, 300 ); 
		
		/**任务面板**/
		public static var TASK_PANEL:String = createAppInfo( "task.TaskPanel" ); 
		
		/**主线任务面板**/
		public static var TASK_LEAD_PANEL:String = createAppInfo( "task.TaskLeadPanel" ); 
		/**环线任务面板**/
		public static var TASK_LOOP_PANEL:String = createAppInfo( "task.TaskLoopPanel" ); 
		/**国家讨逆任务条面板**/
		public static var COUNTRY_TAO_NI_TASK_BAR_PANEL:String = createAppInfo( "taoni.CountryTaoNiTaskBarPanel" , null,PanelPosType.MIDDLE_RIGHT); 
	
		/**采集条**/
		public static var COLLECT_PANEL:String = createAppInfo( "collect.CollectBar" ); 
		
		
		/** 偷经 倒计时等待面板 **/
		public static var TOU_JING_CDPANEL:String = createAppInfo("toujing.TouJingCDPanel");
		/** 密信 倒计时等待面板 **/
		public static var MI_XIN_CDPANEL:String = createAppInfo("toujing.CiTanCDPanel");
		/** 运镖 换取镖车倒计时等待面板 **/
		public static var YUN_BIAO_CDPANEL:String = createAppInfo("toujing.YunBiaoCDPanel");
		/** 偷经 任务面板 **/
		public static var TOU_JING_PANEL:String = createAppInfo("toujing.TouJingPanel");
		/** 偷经 任务追踪面板 **/
		public static var TOU_JING_TRACK_PANEL:String = createAppInfo("toujing.TaskTouJingTrackPanel");
		/** 偷经 查询各国经书数量面板 **/
		public static var TOU_JING_COUNTRY_BOOK_STATE_PANEL:String = createAppInfo("toujing.TouJingCountryBookStatePanel");
		/** 运镖 各种提示小窗口 **/
		public static var YUN_BIAO_TIPS:String = createAppInfo("yunbiao.YunBiaoTips",null,PanelPosType.BOTTOM_RIGHT, -20, -20 );
		/** 运镖 中间底部各种提示小窗口 **/
		public static var YUN_BIAO_BOTTOM_TIP:String = createAppInfo("yunbiao.YunBiaoBottomTips",null,PanelPosType.MIDDLE_CENTRAL, 0, 290 );
		
		
		/**日常**/
		public static var DAILY_TASK_PANEL:String = createAppInfo( "dailyTask.DailyTaskPanel" ); 
		
		/**家族协议**/
		public static var FAMILY_CREATE_AGREEMENT_PANEL:String = createAppInfo( "family.FamilyCreatAgreementPanel" ); 
		/**家族收人**/
		public static var FAMILY_INCOME_PANEL:String = createAppInfo( "family.FamilyIncomePanel" ); 
		/**家族招募**/
		public static var FAMILY_MSG_INFO_PANEL:String = createAppInfo( "family.FamilyMsgInfoPanel" ); 
		/**掉落物品列表**/
		public static var DROP_GOODS_LIST_PANEL:String = createAppInfo( "dropGoods.DropGoodsListPanel" , null, PanelPosType.MIDDLE_LEFT , 200); 

		/**随身商店/NPC商店面板**/
		public static var SHOP_PANEL:String = createAppInfo( "shop.ShopPanel", "shop" ); 
		/**商店购买确认框**/
		public static var SHOP_BUY_PANEL:String = createAppInfo( "shop.ShopBuyPanel" ); 
		/**物品出售确认框**/
		public static var SHOP_SELL_PANEL:String = createAppInfo( "shop.ShopSellPanel" ); 
		/**商城面板**/
		public static var SHOP_SYSTEM_PANEL:String = createAppInfo( "shop.ShopSystemPanel" ); 
		
		/**技能**/
		public static var SPELL_PANEL:String = createAppInfo( "spell.SpellPanel", "spell" ); 
		
		/**邮件面板     可带一个数组为参数，可以直接打开发件邮  [ MailType.SEND, senderId, senderName, 主题 ]**/
		public static var MAIL_PANEL:String = createAppInfo( "mail.MailPanel", "mail" ); 
		/**答题面板**/
		public static var DA_TI_PANEL:String = createAppInfo( "daTi.DaTiPanel", "daTi" ); 
		/**答题结果面板**/
		public static var DA_TI_RESULT_PANEL:String = createAppInfo( "daTi.DaTiResultPanel", "daTi" ); 
		
		/**游戏更新公告**/
		public static var GAME_NOTICE:String = createAppInfo( "gameNotice.GameNoticePanel", "game_notice" ); 
		
		/**好友面板**/
		public static var FRIEND_PANEL:String = createAppInfo( "friend.FriendPanel", "friend" ); 
		/**国家面板**/
		public static var COUNTRY_PANEL:String = createAppInfo( "country.CountryPanel", "country" ); 
		/**权力印记面板**/
		public static var PRIVILEGE_MARK_PANEL:String = createAppInfo( "country.PrivilegeMarkPanel"); 
		/**王权面板**/
		public static var CROWN_PANEL:String = createAppInfo( "crown.CrownPanel","crown"); 
		/**入帮审批面板**/
		public static var SOCIETY_JOIN_APPROVE_PANEL:String = createAppInfo( "country.society.SocietyJoinApprovePanel"); 
		/**入帮邀请面板**/
		public static var SOCIETY_JOIN_INVITE_PANEL:String = createAppInfo( "country.society.SocietyJoinInvitePanel"); 
		/**帮派职务设置面板**/
		public static var SOCIETY_OFFICER_POS_ALERT_PANEL:String = createAppInfo( "country.society.SocietyOfficerPosAlertPanel"); 
		/**转让帮主提示面板1级**/
		public static var SOCIETY_OASSIGNMENT_LEADER_ALERT_PANEL:String = createAppInfo( "country.society.SocietyAssignmentLeaderAlertPanel"); 
		/**帮派建筑升级面板**/
		public static var SOCIETY_BUILD_UPGRADE_PANEL:String = createAppInfo( "country.society.SocietyBuildUpgradePanel","society_build_upgrade"); 
		/**挑战帮派神兽信息面板**/
		public static var SOCIETY_BEAST_FIGHT_INFO_PANEL:String = createAppInfo( "country.society.SocietyBeastFightInfoPanel",null,PanelPosType.BOTTOM_RIGHT); 
		/**Boss伤害排行榜面板**/
		public static var BOSS_HURT_RANK_PANEL:String = createAppInfo( "rank.BossHurtRankPanel",null,PanelPosType.MIDDLE_LEFT); 
		/**国家讨逆信息面板**/
		public static var COUNTRY_TAO_NI_INFO_PANEL:String = createAppInfo( "taoni.CountryTaoNiInfoPanel",null,PanelPosType.BOTTOM_RIGHT,-10,-130); 
		/**国家讨逆结算信息面板**/
		public static var COUNTRY_TAO_NI_ACCOUNT_PANEL:String = createAppInfo( "taoni.CountryTaoNiAccountPanel","account"); 
		/**NPC剧情对话面板**/
		public static var NPC_PLOT_DIALOG_PANEL:String = createAppInfo( "dialog.NpcPlotDialogPanel","dialog",PanelPosType.BOTTOM_CENTRAL,0,-150); 
		/**国战顶部面板*/
		public static var COUNTRY_WAR_TOP_BAR_PANEL:String = createAppInfo( "countryWar.CountryWarTopBarPanel","countryWar",PanelPosType.TOP_RIGHT);
		/**国战右部面板*/
		public static var COUNTRY_WAR_RIGHT_BAR_PANEL:String = createAppInfo( "countryWar.CountryWarRightBarPanel","countryWar",PanelPosType.TOP_RIGHT);
		/**国战底部面板*/
		public static var COUNTRY_WAR_BOTTOM_BAR_PANEL:String = createAppInfo( "countryWar.CountryWarBottomBarPanel","countryWar",PanelPosType.BOTTOM_CENTRAL);
		/**国战结算面板*/
		public static var COUNTRY_WAR_RESULT_PANEL:String = createAppInfo( "countryWar.CountryWarResultPanel","countryWar");
		/**国战进度文本面板*/
		public static var COUNTRY_WAR_PROGRESS_TEXT_PANEL:String = createAppInfo( "countryWar.CountryWarProgressTextPanel","countryWar",PanelPosType.BOTTOM_CENTRAL,0,-390);
		
		/**组队面板**/
		public static var TEAM_PANEL:String = createAppInfo( "team.TeamPanel","team" );
		/**组队邀请组队消息面板**/
		public static var TEAM_INVITE_WAITE_PANEL:String = createAppInfo( "team.TeamInviteWaitPanel" );
		/**组队申请进队消息面板**/
		public static var TEAM_APPLY_JOIN_WAITE_PANEL:String = createAppInfo( "team.TeamApplyJoinWaitPanel" );
		/**组队---小队跟随界面，是队长**/
		public static var TEAM_FOLLOW_LEADER_PANEL:String = createAppInfo( "team.TeamFollowLeaderPanel" );
		/**组队---小队跟随界面，是队员**/
		public static var TEAM_FOLLOW_TEAM_PLAYER_PANEL:String = createAppInfo( "team.TeamFollowTeamPlayerPanel" );
		
		/**
		 * 装备打造 
		 */		
		public static var EQUIP_CHANGE : String = createAppInfo("equip.EquipChangePanel","equip");
		/**
		 * 国家公告改变 
		 */	
		public static var ANNOUCEMENT_CHANGE_PANEL : String = createAppInfo("crown.AnnouncementChangePanel");
		/**
		 *税收改变 
		 */		
		public static var CROWN_SHUI_SHOU_CHANGE : String = createAppInfo("crown.CrownShuiShouPanel");
		/**
		 *捐款 
		 */		
		public static var CROWN_JUAN_KUAN_PANEL : String = createAppInfo("crown.CrownMuJuanPanel");
		/**禁卫申请列表**/
		public static var CROWN_JIN_WEI_LIST_PANEL : String = createAppInfo("crown.CrownJinWeiListPanel");
		
		/**收到结盟**/
		public static var CROWN_BEEN_INVITE_UNION_PANEL : String = createAppInfo("crown.CrownBeenInviteUnionPanel");
		
		/** 坐骑主面板 **/
		public static var MOUNT_PANEL:String = createAppInfo( "mount.MountPanel","mount" );
		/** 坐骑转化面板 **/
		public static var MOUNT_CHANGE_PANEL:String = createAppInfo( "mount.panel.MountChangePanel","mount" );
		/** 坐骑繁育面板 **/
		public static var MOUNT_BREED_PANEL:String = createAppInfo( "mount.panel.MountBreedPanel","mount" );
		/** 坐骑鉴定面板 **/
		public static var MOUNT_AUTHENTICATE_PANEL:String = createAppInfo( "mount.panel.MountAuthenticatePanel","mount" );
		/** 坐骑繁育邀请消息面板 **/
		public static var MOUNT_BREAD_INVITE_WAITE_PANEL:String = createAppInfo( "mount.panel.MountBreadInviteWaitPanel","mount" );
		/** 坐骑传承面板 **/
		public static var MOUNT_INHERIT_PANEL:String = createAppInfo( "mount.panel.MountInheritPanel","mount" );
		
		/**禁言**/
		public static var CROWN_SET_DONT_TALK_PANEL : String = createAppInfo("crown.CrownSetDontTalkPanel");
		/**囚禁**/
		public static var CROWN_QIU_JIN_PANEL : String = createAppInfo("crown.CrownQiuJinPanel");
		/**战报**/
		public static var CROWN_ZHAN_BAO_PANEL : String = createAppInfo("crown.ZhanBaoPanel");
		/**国王评价投票面板**/
		public static var CROWN_VOTE_PANEL:String = createAppInfo( "crown.CrownVotePanel","npc"); 
		/**王城战竞标面板**/
		public static var FAMILY_WAR_BID_PANEL : String = createAppInfo("familyWar.FamilyWarBidPanel","familyWar");
		/**提高自己的竞价面板**/
		public static var FAMILY_WAR_MY_BID_PANEL : String = createAppInfo("familyWar.FamilyWarMyBidPanel");
		/**等待进入面板**/
		public static var FAMILY_WAR_WAIT_JION_DUNGEON_PANEL : String = createAppInfo("familyWar.FamilyWarHintPanel");
		/**王城战副本信息**/
		public static var FAMILY_WAR_DUNGEON_INFO_PANEL : String = createAppInfo("familyWar.FamilyWarDungeonInfoPanel","familyWar");
		/**王城战副本杀人排行榜**/
		public static var FAMILY_WAR_DUNGEON_KILL_RANK_PANEL : String = createAppInfo("familyWar.FamilyWarDungeonKillRankPanel","familyWar");
		/**王城争霸胜利**/
		public static var FAMILY_WAR_DUNGEON_END_PANEL : String = createAppInfo("familyWar.FamilyWarDungeonEndPanel","familyWar");
		/**王城争霸战报**/
		public static var FAMILY_WAR_DUNGEON_ZHAN_BAO_PANEL : String = createAppInfo("familyWar.FamilyWarZhanBaoPanel","familyWar");
		/**王城战怪物数据**/
		public static var FAMILY_WAR_DUNGEON_MONSTER_PANEL : String = createAppInfo("familyWar.FamilyWarMonsterPanel","familyWar");
		/**交易**/
		public static var TRADE_PANEL : String = createAppInfo("trade.TradePanel","trade");
		/** 交易输入金钱 **/
		public static var TRADE_SILVER_PANEL : String = createAppInfo("trade.TradeSilverPanel");
		/** 收到的交易列表 **/
		public static var TRADE_BEEN_INVITE_PANEL : String = createAppInfo("trade.TradeBeenInvitePanel","trade");
		/**八阵图详情面板**/
		public static var BA_ZHEN_TU_DETAIL_PANEL : String = createAppInfo("baZhenTu.BaZhenTuDetailPanel","baZhenTu",PanelPosType.MIDDLE_RIGHT);
		/**聊天设置**/
		public static var CHAT_SET_PANEL : String = createAppInfo("chatSet.ChatSetPanel",null,PanelPosType.MIDDLE_CENTRAL);
		/**喇叭*/
		public static var LABA_PANEL : String = createAppInfo("laba.LabaPanel",null,PanelPosType.MIDDLE_CENTRAL);
		/**囚禁倒计时**/
		public static var CROWN_QIU_JIN_END_TIME : String = createAppInfo("crown.CrownQiuJinEndPanel",null,PanelPosType.MIDDLE_LEFT);
		//------------------镖局
		/** 镖局**/
		public static var BIAO_JU_PANEL : String = createAppInfo("biaoju.BiaoJuPanel","biaoju");
		/**镖局分配面板**/
		public static var BIAO_JU_FEN_PEI_PANEL : String = createAppInfo("biaoju.BiaoJuFenPeiPanel","biaoju");
		/**确认投保**/
		public static var BIAO_JU_TOU_BAO_PANEL : String  = createAppInfo("biaoju.BiaoJuTouBaoPanel","biaoju");
		/**镖局充钱**/
		public static var BIAO_JU_ADD_MONEY_PANEL : String =  createAppInfo("biaoju.BiaoJuAddMoneyPanel","biaoju");
		//-------------------帮派
		/**帮派协议**/
		public static var GUILD_AGREEMENT_PANEL : String = createAppInfo("country.guild.GuildAgreementPanel","country");
		/**帮派创建**/
		public static var GUILD_CREATE_PANEL : String = createAppInfo("country.guild.GuildCreatePanel","country");
		/**申请加入帮派的家族列表**/
		public static var GUILD_REQ_JOIN_YOUR_GUILD_PANEL : String = createAppInfo("country.guild.GuildInviteListPanel","country");
		/**帮派升级**/
		public static var GUILD_UPGRADE_LEVEL : String = createAppInfo("country.guild.GuildUpgradePanel","country");
		/**帮派俸禄**/
		public static var GUILD_SALARY_PANEL : String = createAppInfo("country.guild.GuildSalaryPanel","country");
		/**帮派募捐**/
		public static var GUILD_MU_JUAN_PANEL : String = createAppInfo("country.guild.GuildMuJuanPanel","country");
		/**帮派家族成员列表**/
		public static var GUILD_FAMILY_PANEL : String = createAppInfo("country.guild.GuildFamilyPanel","country");
		/**迷宫排行**/
		public static var MAZE_RANK_PANEL : String = createAppInfo("maze.MazeInfoPanel","maze",PanelPosType.MIDDLE_RIGHT);
		/**上次迷宫排行**/
		public static var MAZE_LAST_RANL_PANEL : String = createAppInfo("maze.MazeLastInfoPanel","maze");
		/**迷宫提示**/
		public static var MAZE_ALERT_PANEL : String = createAppInfo("maze.MazeAlert","maze",PanelPosType.TOP_CENTRAL);
		/**查找玩家**/
		public static var FIND_FRIEND_PANEL : String = createAppInfo("friend.view.FindFriendPanel","friend");
		/**其他人加我为好友的列表**/
		public static var TARGET_ADD_ME_TO_FRIEND : String = createAppInfo("friend.view.FriendAddMeListPanel","friend");
		/**摆摊面板**/
		public static var STALL_PANEL : String  = createAppInfo("stall.StallPanel","stall");
		/**摆摊出售**/
		public static var STALL_SELL_PANEL : String = createAppInfo("stall.StallSellGoodsPanel","stall");
		/**摆摊购买**/
		public static var STALL_BUY_PANEL : String = createAppInfo("stall.StallBuyGoodsPanel","stall");
		/**摆摊切换类型**/
		public static var STALL_CHANGE_TYPE_PANEL : String = createAppInfo("stall.StallChangeTypePanel","stall");
		/**摆摊购买时间**/
		public static var STALL_BUY_TIME_PANEL : String = createAppInfo("stall.BuyStallTypeTimePanel","stall");
		/**从摊位购买物品**/
		public static var STALL_BUY_GOODS_FROM_STALL : String = createAppInfo("stall.BuyGoodsFromStall","stall");
		/**出售物品给摊位**/
		public static var STALL_SELL_GOODS_TO_STALL : String = createAppInfo("stall.SellGoodsToStallPanel","stall");
		/**查看摊位区域**/
		public static var STALL_AREA_PANEL : String = createAppInfo("stall.StallAreaPanel");
		/**系统设置**/
		public static var SYSTEMSET_PANEL:String = createAppInfo("systemset.SystemsetingPanel","systemSet");
		/**经脉**/
		public static var JINGMAI_PANEL:String = createAppInfo("jingmai.JingMaiPanelExt","jingmai");
	}
}
