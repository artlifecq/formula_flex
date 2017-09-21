package com.rpgGame.app.cmdlistener
{
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.display2D.ResChangeEffect;
	import com.rpgGame.app.fight.spell.FightPowerChangePopPanelExt;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.ClientSettingManager;
	import com.rpgGame.app.manager.FangChenMiManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.app.ui.alert.FangChenMiPanelExt;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.events.SystemTimeEvent;
	import com.rpgGame.core.events.role.RoleEvent;
	import com.rpgGame.core.ui.tip.RewardTipTree;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.enum.AttChangeEnum;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.EnumHurtType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.netData.client.bean.SystemHint;
	import com.rpgGame.netData.client.message.ResClientCustomTagMessage;
	import com.rpgGame.netData.client.message.SCSystemHintMessage;
	import com.rpgGame.netData.player.bean.AttributeItem;
	import com.rpgGame.netData.player.message.ResPersonalNoticeMessage;
	import com.rpgGame.netData.player.message.ResPlayerAddExpMessage;
	import com.rpgGame.netData.player.message.ResPlayerAttributesChangeMessage;
	import com.rpgGame.netData.player.message.SCCurrencyChangeMessage;
	import com.rpgGame.netData.player.message.SCMaxValueChangeMessage;
	import com.rpgGame.netData.player.message.SCModuleAttributesChangeMessage;
	import com.rpgGame.netData.player.message.SCNonagePromptMessage;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import com.rpgGame.netData.skill.message.ResSkillAddMessage;
	import com.rpgGame.netData.skill.message.ResSkillChangeMessage;
	import com.rpgGame.netData.skill.message.ResSkillInfosMessage;
	import com.rpgGame.netData.skill.message.SCSkillLevelUpResultMessage;
	
	import flash.utils.setTimeout;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 *
	 * 英雄杂项命令侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-1 下午3:05:12
	 *
	 */
	public class HeroMiscCmdListener extends BaseBean
	{
		protected static var _bytes : ByteBuffer = new ByteBuffer();
		
		public function HeroMiscCmdListener()
		{
			super();
		}
		
		override public function start() : void
		{
			SocketConnection.addCmdListener(103106,RecvPlayerAttributesChangeMessage);
			SocketConnection.addCmdListener(103130,RecvSCModuleAttributesChangeMessage);
			SocketConnection.addCmdListener(123101,RecvResSkillInfosMessage);
			SocketConnection.addCmdListener(123102,RecvResSkillAddMessage);
//			SocketConnection.addCmdListener(123104,RecvResSkillRemoveMessage);
			SocketConnection.addCmdListener(123107,RecvResSkillChangeMessage);
			SocketConnection.addCmdListener(301102,RecvResClientCustomTagMessage);
			SocketConnection.addCmdListener(103103,RecvResPersonalNoticeMessage);
			SocketConnection.addCmdListener(103102,RecvResPlayerAddExpMessage);
			SocketConnection.addCmdListener(103127,RecvSCCurrencyChangeMessage);
			SocketConnection.addCmdListener(103128,RecvSCMaxValueChangeMessage);
			SocketConnection.addCmdListener(103117,OnSCNonagePromptMessage);
			SocketConnection.addCmdListener(123108,OnSCSkillLevelUpResultMessage);
			SocketConnection.addCmdListener(301134,SCSystemHintHandler);
			
			
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//////
			////// 以下为参考代码，是深圳那边的后台协议，不适用
			//////
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_LEVEL_TO_OTHERS, onChangeLevelToOthers);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_HERO_DAILY_CLEARED, onHeroDailyCleared);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_PK_MODE, onChangePkMode);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_PK_MODE_FAIL, onChangePkModeFail);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_SELF_PK_AMOUNT_CHANGED, onPkAmountChanged);
			//			//装备相关
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_EQUIPMENT_RESOURCES_CHANGED, onEquipmentResChanged);
			//			//防沉迷
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_1_HOUR, onRecFangChenMi1Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_2_HOUR, onRecFangChenMi2Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_3_HOUR, onRecFangChenMi3Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_3_5_HOUR, onRecFangChenMi3_5Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_4_HOUR, onRecFangChenMi4Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_4_5_HOUR, onRecFangChenMi4_5Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_5_HOUR, onRecFangChenMi5Hour);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_OK, onRecFangChenMiOnlineOk);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_WEAK, onRecFangChenMiOnelineWeak);
			//			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_STRONG, onRecFangChenMiOnelineStrong);
			
			finish();
		}
		
		/*private function RecvResSkillRemoveMessage(msg:ResSkillRemoveMessage):void
		{
			var roleData : HeroData = MainRoleManager.actorInfo;
			roleData.spellList.removeSkill(msg.skillModelId);
		}*/
		
		RewardTipTree.ins.recordNodeState2Server=HeroMiscSender.reqSetSystemHint;
		private function SCSystemHintHandler(msg:SCSystemHintMessage):void
		{
			// TODO Auto Generated method stub
			var hash:com.gameClient.utils.HashMap=new com.gameClient.utils.HashMap();
			for each (var item:SystemHint in msg.systemHints) 
			{
				hash.put(item.key,item.value==1);
			}
			RewardTipTree.ins.setServerData(hash);
		}
		
		private function RecvResSkillAddMessage(msg:ResSkillAddMessage):void
		{
			var roleData : HeroData = MainRoleManager.actorInfo;
			roleData.spellList.addSkillData(msg.skillInfo);
			var _cfg:Q_skill_model=SpellDataManager.getSpellData(msg.skillInfo.skillModelId);
			if(_cfg.q_trigger_type==1) //判断是否要显示新增技能的提示框（主要是针对三连招的技能判断的）
			{
				var cfg:Q_skill_model=SpellDataManager.getSpellData(msg.skillInfo.skillModelId,msg.skillInfo.skillLevel);
				if(cfg.q_seat!=0)
				{
					//UIPopManager.showAlonePopUI(SkillAddPop,msg.skillInfo);
					AppManager.showApp(AppConstant.NEW_SKILL_ADD_PANLE,msg.skillInfo);
					setTimeout(ShortcutsManger.getInstance().updateNewSpell,2500+6000,cfg);
				}
			}
			EventManager.dispatchEvent(SpellEvent.SPELL_ADD);
		}
		
		private function RecvResSkillChangeMessage(msg:ResSkillChangeMessage):void
		{
			var roleData : HeroData = MainRoleManager.actorInfo;
			var oldInfo:SkillInfo=roleData.spellList.getSkillInfo(msg.skillInfo.skillModelId);
			var lv:int;
			roleData.spellList.addSkillData(msg.skillInfo);
			if(oldInfo.skillLevel==msg.skillInfo.skillLevel){//改的是等级
				lv=msg.skillInfo.skillChildLv-oldInfo.skillChildLv;
				EventManager.dispatchEvent(SpellEvent.SPELL_UPGRADE,lv);
			}else{//改的是阶数
				lv=msg.skillInfo.skillLevel-oldInfo.skillLevel;
				EventManager.dispatchEvent(SpellEvent.SPELL_RISE,lv);
			}
		}
		
		private function RecvSCMaxValueChangeMessage(msg:SCMaxValueChangeMessage):void
		{
			if(msg.type==CharAttributeType.RES_EXP){
				MainRoleManager.actorInfo.maxExp=msg.value.fValue;
			}else if(msg.type==CharAttributeType.RES_ZHENQI){
				MainRoleManager.actorInfo.maxZhenqi=msg.value.fValue;
			}else{
				MainRoleManager.actorInfo.totalStat.setMaxData(msg.type,msg.value);
			}
			EventManager.dispatchEvent(MainPlayerEvent.STAT_MAX_CHANGE,msg.type);
		}
		
		private function OnSCNonagePromptMessage(msg:SCNonagePromptMessage):void
		{
			//			if(ClientConfig.isBanShu)
			FangChenMiManager.OnSCNonagePromptMessage(msg);
		}
		
		private function OnSCSkillLevelUpResultMessage(msg:SCSkillLevelUpResultMessage):void
		{
//			if(msg.skilltype==1&&msg.result==1){
//				EventManager.dispatchEvent(SkillEvent.SKILL_ORDER_UP); 
//			}
		}
		
		private function RecvSCCurrencyChangeMessage(msg:SCCurrencyChangeMessage):void
		{
			if (CharAttributeType.RES_JING_ZHENG == msg.curType) {
				EventManager.dispatchEvent(RoleEvent.UPDATE_NEEDLE, 
					MainRoleManager.actor, 
					msg.value, 
					(MainRoleManager.actor.data as HeroData).totalStat.getResData(msg.curType));
			}
			
			checkMoney(msg);
			
			MainRoleManager.actorInfo.totalStat.setResData(msg.curType,msg.value);
			EventManager.dispatchEvent(MainPlayerEvent.STAT_RES_CHANGE,msg.curType);
		}
		
		/**
		 *检测金钱变化 
		 * @param msg
		 * 
		 */
		private function checkMoney(msg:SCCurrencyChangeMessage):void
		{
			var noticeId:int;
			var oldValue:int;
			var change:int; 
			switch(msg.curType){
				case CharAttributeType.RES_GOLD:
					change=msg.value-MainRoleManager.actorInfo.totalStat.getResData(msg.curType);
					if (change>0) 
					{
						ResChangeEffect.fly(msg.curType,change);
					}
					noticeId=change>0?11:15;
					break;
				case CharAttributeType.RES_BIND_GOLD:
					change=msg.value-MainRoleManager.actorInfo.totalStat.getResData(msg.curType);
					noticeId=change>0?14:18;
					if(change>0)
					{
						FightFaceHelper.showAttChange(EnumHurtType.BIND_GOLD,change);
					}
					if (change>0) 
					{
						ResChangeEffect.fly(msg.curType,change);
					}
					break;
				case CharAttributeType.RES_MONEY:
					change=msg.value-MainRoleManager.actorInfo.totalStat.getResData(msg.curType);
					noticeId=change>0?13:17;
					break;
				case CharAttributeType.RES_BIND_MONEY:
					change=msg.value-MainRoleManager.actorInfo.totalStat.getResData(msg.curType);
					noticeId=change>0?12:16;
					break;
				default:
					return;
			}
//			NoticeManager.showNotifyById(noticeId,null,Math.abs(change));
		}
		
		private function RecvResPlayerAddMPMessage(msg:*):void
		{
			EventManager.dispatchEvent(MainPlayerEvent.NOWMP_CHANGE);
		}
		
		private function RecvResPlayerAddExpMessage(msg:ResPlayerAddExpMessage):void
		{
			FightFaceHelper.showAttChange(EnumHurtType.EXP,msg.addExp.fValue);
			MainRoleManager.actorInfo.curExp=msg.exp.fValue;
			EventManager.dispatchEvent(MainPlayerEvent.NOWEXP_CHANGE);
		}
		
		private function RecvPlayerAttributesChangeMessage(msg:ResPlayerAttributesChangeMessage):void
		{
			var reason:int = msg.attributeChangeReason & 0x0ffffff;
			var calcFightPower:Boolean = (((msg.attributeChangeReason & 0xff000000) >> 24) == 1);// 这个是早于战斗力更新，也确实得这样
			
			// 穿戴装备属性改变显示
			if (reason == 52 )
			{
				
			}
			
			var beforeFight:int=MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.FIGHTING);
			
			
			//
			//			PlayerAttributeManager.showSpriteStatChg(MainRoleManager.actorInfo.totalStat, msg.attributeChangeList);
			//
			MainRoleManager.actorInfo.totalStat.setData(msg.attributeChangeList);
			
			//MainManager.actorInfo.atkSpeed = 1;//100 / (100 + spriteStatProto.attackSpeed);
			//EventManager.dispatchEvent(UserEvent.USER_MAIN_FIGHT_ATTRIBUTE_CHANGE);
			EventManager.dispatchEvent(MainPlayerEvent.STAT_CHANGE);
			
			var afterFight:int=MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.FIGHTING);
			var fightChange:int=afterFight-beforeFight;
			if(fightChange!=0){
				//UIPopManager.showAlonePopUI(FightChangePop,[afterFight,beforeFight]);
				FightPowerChangePopPanelExt.showFightPowerChange(afterFight,beforeFight);
			}
			//如果这个协议，改变的属性，包括hp，mp，maxhp，maxmp的话，就要在下面还要写一段逻辑，来更新角色的血条。因为现在还不确定，是不是这样的，所以，暂时先不写。等以后，真正
			//用上的时候，检查下这里，再补上代码吧！
			// code!!!
			//			for each (var attr:AttributeItem in msg.attributeChangeList) 
			//			{
			//				FightFaceHelper.showAttChange(attr.type,attr.value);
			//			}
			
		}
		
		private function RecvSCModuleAttributesChangeMessage(msg:SCModuleAttributesChangeMessage):void
		{
			var changeDs:org.client.mainCore.ds.HashMap=new org.client.mainCore.ds.HashMap();
			var changeUtil:com.gameClient.utils.HashMap=new com.gameClient.utils.HashMap();
			var length:int=msg.attributeChangeList.length;
			for(var i:int = 0;i<length;i++)
			{
				var item:AttributeItem = msg.attributeChangeList[i];
				changeDs.add(item.type,AttValueConfig.getDisAttValue(item.type,item.value));
				changeUtil.put(item.type,AttValueConfig.getDisAttValue(item.type,item.value));
			}
			//没打开自己的面板的时候
			if (AttChangeEnum.EQUIP==msg.modelId) 
			{
				if (BackPackManager.instance.isShowRole==false) 
				{
					FightFaceHelper.showPlayerBaseAttrChange(changeDs);
					return;
				}
			}
			if(msg.modelId == AttChangeEnum.UPLEVEL_MODLE)
			{
				FightFaceHelper.showPlayerBaseAttrChange(changeDs);
			}else{
				EventManager.dispatchEvent(MainPlayerEvent.MODULE_STAT_CHANGE,msg.modelId,changeUtil);
			}
			
		}
		
		private function RecvResSkillInfosMessage(msg:ResSkillInfosMessage):void
		{
			GameLog.add("收到技能列表，数量：" + msg.skills.length);
			var roleData : HeroData = MainRoleManager.actorInfo;
			if (roleData == null)
				return;
			roleData.spellList.setHeroData(msg);
			//技能CD
			//			SkillCDManager.getInstance().setHeroCd(heroProto.spellModuleObj);
			ShortcutsManger.getInstance().setup();
		}
		
		private function RecvResClientCustomTagMessage(msg:ResClientCustomTagMessage):void
		{
			ClientSettingManager.setup(msg.CustomTaginfos);
			
			//			ShortcutsManger.getInstance().setup();
		}
		
		private function RecvResPersonalNoticeMessage(msg:ResPersonalNoticeMessage):void
		{
			
			GameLog.addShow( "ResPersonalNoticeMessage"  ,msg.type , msg.content );
			
			var tmp :Vector.<String> = new Vector.<String>();
			for ( var i :int = 0; i < msg.values.length; i++ )
			{
				if ( msg.values[i] == null )
					continue;
				tmp.push( msg.values[i] );//TextUtil.getTextStr( msg.values[i] ) );
			}
			//			if ( msg.content == null || msg.content == '' )
			//				msg.content = Mgr.gameDataMgr.getServerLanguageStr( msg.contentId );
			//			var info :String = PromptUtil.connectStr( msg.content, tmp );
			//			info = info.replace( /\\f/g, String.fromCharCode( 0xc ) );
			
			var htmlStr :String;
			
			
			if ( msg.type == 1 || msg.type == 2 || msg.type == 3 )// 个人通知
			{
				//				AddPersonInfo( msg.type, info, true );
			}
				//			else if ( msg.type == EnumPersonalNoticeType.SROLL )// 滚动公告	
				//			{
				//				if ( TextUtil.isjson( msg.content ) )
				//				{
				//					var text :String = TextUtil.parseJsonLinkStrHtml( msg.content, ColorUtil.N_WRITE_STR, {linkcolor :"#cc9957", mapname :1} );
				//					text = TextUtil.removeHTMLTag( text );
				//					htmlStr = TextUtil.getHtmlStr( text, null, -1 );
				//					addGmInfo( htmlStr );
				//				}
				//				else
				//				{
				//					htmlStr = TextUtil.getHtmlStr( info, null, -1 );
				//					addGmInfo( htmlStr );
				//				}
				//			}
			else if ( msg.type == 5 )// 头顶聊天公告提示
			{
				//				htmlStr = TextUtil.GetHtmlStr( info, null, -1 );
				//				AddGlobalInfo( htmlStr );
			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_SYSTEM )// 右下角侧栏提示
				//			{
				//				
				//			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_COMMON )// 聊天普通频道
				//			{
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.NORMAL, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
				//			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_TEAM )// 聊天队伍频道
				//			{
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.TEAM, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
				//			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_GROUP )// 聊天普通频道
				//			{
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.FACTION, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
				//			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_WORLD )
				//			{
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.WORLD, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
				//			}
			else if ( msg.type == 6 )// 公告聊天提示
			{
				//				Mgr.chatMgr.AddChatStr( info );
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.CIRCLE, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
			}
				//			else if ( msg.type == EnumPersonalNoticeType.CHAT_COUNTRY )
				//			{
				//				Mgr.chatMgr.addChatMsg( EnumChatChannelType.COUNTRY, long.MAX_VALUE, Mgr.mainPlayer.sid, '', info, new ExtraResInfo() );
				//			}
			else if ( msg.type == 7 )// 锻造延迟聊天提示
			{
				//				if ( Mgr.equipForgeMgr.delayDoTool.lock )
				//				{
				//					Mgr.equipForgeMgr.delayDoTool.Push( Mgr.chatMgr.AddChatStr, info );
				//				}
				//				else
				//				{
				//					Mgr.chatMgr.AddChatStr( info );
				//				}
			}
			else if ( msg.type == 8 )// 鼠标提示
			{
				//				FloatingText.showUp( info );
			}
			else if ( msg.type == 9 )// 鼠标提示( 绿色 )
			{
				//				FloatingText.showUp( info );
			} 
		}
		
		/**
		 * 装备资源改变
		 * @param buffer
		 *
		 */
		private function onEquipmentResChanged(buffer : ByteBuffer) : void
		{
			var heroId : Number = buffer.readVarint64();
			var role : SceneRole = SceneManager.getSceneObjByID(heroId) as SceneRole;
			if (role && role.usable)
			{
				//				HeroData.setResources(role.data as HeroData, buffer);
				//				AvatarManager.callEquipmentChange(role);
				//				AvatarManager.updateAvatar(role);
				if (SceneRoleSelectManager.selectedRole == role)
					SceneRoleSelectManager.updateSelectRole();
			}
		}
		
		
		/**
		 * 视野里玩家升级了
		 * @param buffer
		 *
		 */
		private function onChangeLevelToOthers(buffer : ByteBuffer) : void
		{
			var heroID : Number = buffer.readVarint64();
			var atkor : SceneRole = SceneManager.getSceneObjByID(heroID) as SceneRole;
			if (atkor == null)
				return;
			
			SpellAnimationHelper.addTargetEffect(atkor, RenderUnitID.LEVEL, RenderUnitType.LEVEL, EffectUrl.SHENG_JI);
			
			var heroData : HeroData = atkor.data as HeroData;
			if (heroData == null)
				return;
			
			heroData.totalStat.level = buffer.readVarint32();
			
			//			atkor.headFace.addAndUpdateLevel();
		}
		
		/**
		 * pk模式变化
		 * @param buffer
		 *
		 */
		private function onChangePkMode(buffer : ByteBuffer) : void
		{
			MainRoleManager.actorInfo.pkMode = buffer.readVarint32();
			EventManager.dispatchEvent(MainPlayerEvent.PK_MODE_CHANGE);
		}
		
		/**
		 * 玩家主动设置pk模式失败
		 * @param buffer
		 *
		 */
		private function onChangePkModeFail(buffer : ByteBuffer) : void
		{
			var err : int = buffer.readByte();
			if (err == 1)
			{
				NoticeManager.systemSwitchNotify("当前场景不允许切换PK模式");
			}
			else if (err == 2)
			{
				NoticeManager.systemSwitchNotify("无效的PK模式");
			}
		}
		
		/**
		 * PK值更新
		 * @param buffer
		 *
		 */
		private function onPkAmountChanged(buffer : ByteBuffer) : void
		{
			MainRoleManager.actorInfo.pkAmount = buffer.readVarint32();
			MainRoleManager.actorInfo.pkAmountLeftTime = buffer.readVarint64();
			EventManager.dispatchEvent(MainPlayerEvent.PK_AMOUNT_CHANGE);
		}
		
		
		private function onHeroDailyCleared(buffer : ByteBuffer) : void
		{
			EventManager.dispatchEvent(SystemTimeEvent.DAILY_CLEARED);
		}
		
		private function onRecFangChenMi1Hour(buffer : ByteBuffer) : void
		{
			showChenMi(LanguageConfig.getText(LangText.FANG_CHEN_MI_1_HOUR));
		}
		
		private function onRecFangChenMi2Hour(buffer : ByteBuffer) : void
		{
			showChenMi(LanguageConfig.getText(LangText.FANG_CHEN_MI_2_HOUR));
		}
		
		private function onRecFangChenMi3Hour(buffer : ByteBuffer) : void
		{
			showChenMi(LanguageConfig.getText(LangText.FANG_CHEN_MI_3_HOUR));
			FangChenMiManager.setInChenMi(true);
		}
		
		private function onRecFangChenMi3_5Hour(buffer : ByteBuffer) : void
		{
			showChenMi(LanguageConfig.getText(LangText.FANG_CHEN_MI_3_5_HOUR));
			FangChenMiManager.setInChenMi(true);
		}
		
		private function onRecFangChenMi4Hour(buffer : ByteBuffer) : void
		{
			fnFangChenMi4Hour();
			FangChenMiManager.startFangChenMiInfoTick(30 * TimeUtil.MINUTE_MICRO_SECONDS, fnFangChenMi4Hour);
			FangChenMiManager.setInChenMi(true);
		}
		
		private function onRecFangChenMi4_5Hour(buffer : ByteBuffer) : void
		{
			fnFangChenMi4_5Hour();
			FangChenMiManager.startFangChenMiInfoTick(30 * TimeUtil.MINUTE_MICRO_SECONDS, fnFangChenMi4_5Hour);
			FangChenMiManager.setInChenMi(true);
		}
		
		private function onRecFangChenMi5Hour(buffer : ByteBuffer) : void
		{
			fnFangChenMi5Hour();
			FangChenMiManager.startFangChenMiInfoTick(15 * TimeUtil.MINUTE_MICRO_SECONDS, fnFangChenMi5Hour);
			FangChenMiManager.setInChenMi(true);
		}
		
		private function fnFangChenMi4Hour() : void
		{
			showChenMi(LangText.FANG_CHEN_MI_4_HOUR);
		}
		
		private function fnFangChenMi4_5Hour() : void
		{
			showChenMi(LangText.FANG_CHEN_MI_4_5_HOUR);
		}
		
		private function fnFangChenMi5Hour() : void
		{
			showChenMi(LangText.FANG_CHEN_MI_5_HOUR);
		}
		
		private function onRecFangChenMiOnlineOk(buffer : ByteBuffer) : void
		{
			showChenMi(LangText.FANG_CHEN_MI_ONLINE_OK);
		}
		
		private function onRecFangChenMiOnelineWeak(buffer : ByteBuffer) : void
		{
			showChenMi(LangText.FANG_CHEN_MI_ONLINE_WEAK);
			FangChenMiManager.setInChenMi(true);
		}
		
		private function onRecFangChenMiOnelineStrong(buffer : ByteBuffer) : void
		{
			showChenMi(LangText.FANG_CHEN_MI_ONLINE_STRONG);
			FangChenMiManager.setInChenMi(true);
		}
		
		private function showChenMi(msg : String) : void
		{
			FangChenMiPanelExt.showFangChenMiUtil(msg);
			//			GameAlert.showAlertUtil(msg,showChenMiClick);
			NoticeManager.chatSystemNotify(msg);
		}
		
		private function showChenMiClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{	
				case AlertClickTypeEnum.TYPE_SURE:
					onOk();
					break;
			}
		}
		
		private function onOk() : void
		{
			//这一步可以打开实名认证，接平台后实现。@L.L.M.Sunny 
			//WebManager.navigateToRealName();
		}
	}
}
