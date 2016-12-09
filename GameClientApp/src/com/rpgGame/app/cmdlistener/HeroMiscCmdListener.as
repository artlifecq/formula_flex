package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.FangChenMiManager;
	import com.rpgGame.app.manager.PlayerAttributeManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.SystemTimeEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.EnumHurtType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.netData.player.bean.PlayerAttributeItem;
	import com.rpgGame.netData.player.message.ResPlayerAttributesChangeMessage;
	
	import flash.utils.ByteArray;
	
	import app.cmd.HeroMiscModuleMessages;
	import app.message.AmountType;
	import app.message.ChangeLevelProto;
	import app.message.SpriteStatProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
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
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//////
			////// 以下为参考代码，是深圳那边的后台协议，不适用
			//////
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_AMOUNT, onRecChangeAmount);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_LEVEL, onRecChangeLevel);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_INIT_LEVEL_INFO, onRecInitChangeLevel);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_LEVEL_TO_OTHERS, onChangeLevelToOthers);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_HERO_DAILY_CLEARED, onHeroDailyCleared);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_PK_MODE, onChangePkMode);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_PK_MODE_FAIL, onChangePkModeFail);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_SELF_PK_AMOUNT_CHANGED, onPkAmountChanged);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_CHANGE_HERO_FIGHTING_AMOUNT, onFightingAmountChanged);
			//装备相关
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_EQUIPMENT_RESOURCES_CHANGED, onEquipmentResChanged);
			//防沉迷
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_1_HOUR, onRecFangChenMi1Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_2_HOUR, onRecFangChenMi2Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_3_HOUR, onRecFangChenMi3Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_3_5_HOUR, onRecFangChenMi3_5Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_4_HOUR, onRecFangChenMi4Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_4_5_HOUR, onRecFangChenMi4_5Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_5_HOUR, onRecFangChenMi5Hour);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_OK, onRecFangChenMiOnlineOk);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_WEAK, onRecFangChenMiOnelineWeak);
			SocketConnection_protoBuffer.addCmdListener(HeroMiscModuleMessages.S2C_FANG_CHEN_MI_ONLINE_STRONG, onRecFangChenMiOnelineStrong);

			finish();
		}
		
		private function RecvPlayerAttributesChangeMessage(msg:ResPlayerAttributesChangeMessage):void
		{
			var reason:int = msg.attributeChangeReason & 0x0ffffff;
			var calcFightPower:Boolean = (((msg.attributeChangeReason & 0xff000000) >> 24) == 1);// 这个是早于战斗力更新，也确实得这样
			// 装备觉醒期间，由于装备改动属性延迟执行
//			if ( reason == 52 && Mgr.equipForgeMgr.delayDoTool.lock )
//			{
//				Mgr.equipForgeMgr.delayDoTool.Push( RecvPlayerAttributesChangeMessage, msg );
//				return;
//			}
			
			// 穿戴装备属性改变显示
			if (reason == 52 )
			{
				
			}
						
			//
			PlayerAttributeManager.showSpriteStatChg(MainRoleManager.actorInfo.totalStat.statArr, msg.attributeChangeList);
			//
			MainRoleManager.actorInfo.totalStat.setData(msg.attributeChangeList);
			//MainManager.actorInfo.atkSpeed = 1;//100 / (100 + spriteStatProto.attackSpeed);
			//EventManager.dispatchEvent(UserEvent.USER_MAIN_FIGHT_ATTRIBUTE_CHANGE);
			EventManager.dispatchEvent(MainPlayerEvent.STAT_CHANGE);
			
			//如果这个协议，改变的属性，包括hp，mp，maxhp，maxmp的话，就要在下面还要写一段逻辑，来更新角色的血条。因为现在还不确定，是不是这样的，所以，暂时先不写。等以后，真正
			//用上的时候，检查下这里，再补上代码吧！
			// code!!!
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
				AvatarManager.callEquipmentChange(role);
				if (SceneRoleSelectManager.selectedRole == role)
					SceneRoleSelectManager.updateSelectRole();
			}
		}

		/**
		 * 数额改变时收到此消息，附带以下信息
		 * varint32 类型
		 * varint64 当前值
		 *
		 * bool 增加(true)还是减少(false)
		 * if(增加){
		 *      varint64 增加的量
		 * } else {
		 *      varint64 减少的量
		 * }
		 */
		private function onRecChangeAmount(buffer : ByteBuffer) : void
		{
			var type : int = buffer.readVarint32();
			var value : int = buffer.readVarint64();
			var isAdd : Boolean = buffer.readBoolean();
			var addValue : Number = buffer.readVarint64();

			MainRoleManager.actorInfo.amountInfo.setSomeType(type, value);

			EventManager.dispatchEvent(MainPlayerEvent.AMOUNT_CHANGE);

			switch (type)
			{
				case AmountType.MONEY:
					EventManager.dispatchEvent(MainPlayerEvent.MONEY_CHANGE);
					break;
				case AmountType.JINZI:
					EventManager.dispatchEvent(MainPlayerEvent.JINZI_CHANGE);
					break;
				case AmountType.FAMILY_LILIAN:
					EventManager.dispatchEvent(MainPlayerEvent.CONTRIBUTION_CHANGE);
					break;
				case AmountType.GUILD_CONTRIBUTION_POINT:
					GuildManager.guildContributionPointChange(value);
					break;
				case AmountType.EXP:
					MainRoleManager.actorInfo.curExp = value;
					if(isAdd)
						FightFaceHelper.showAttChange(EnumHurtType.EXP, addValue);
					EventManager.dispatchEvent(MainPlayerEvent.NOWEXP_CHANGE);
					break;
			}
		}

		/**
		 * 等级变化
		 * @param buffer
		 *
		 */
		private function onRecChangeLevel(buffer : ByteBuffer) : void
		{
			var roleData : HeroData = MainRoleManager.actorInfo;
			if (roleData == null)
				return;

			var client : ChangeLevelProto = new ChangeLevelProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			client.mergeFrom(bytes);

			roleData.level = client.newLevel;
			roleData.upgradeExp = client.exp.toNumber();
			roleData.canStorageExp = client.canStorageExp ? client.canStorageExp.toNumber() : 0;
			roleData.spellList.totalAddSpellPoint = client.totalAddSpellPoint;
//			roleData.totalAddSpriteStatPoint = client.totalAddSpriteStatPoint;
			roleData.relive_coeff = client.reliveCoeff;
			roleData.mountSlotCount = client.mountSlotCount;
//			MainRoleManager.actor.headFace.addAndUpdateLevel();

			SpellAnimationHelper.addTargetEffect(MainRoleManager.actor, RenderUnitID.LEVEL, RenderUnitType.LEVEL, EffectUrl.SHENG_JI);

			EventManager.dispatchEvent(MainPlayerEvent.LEVEL_CHANGE);
			EventManager.dispatchEvent(MainPlayerEvent.MAXEXP_CHANGE);


			//Demo版本的自动学习技能逻辑
//			var info : GmLevelAddSpellPoint = GmLevelAddSpellPointData.getInfo(roleData.level);
//			if (info)
//				SpellSender.learnOrUpgradeActiveSpell(info.spellID, new UpgradeItemListVo());
		}

		/**
		 * 等级初始化
		 * @param buffer
		 *
		 */
		private function onRecInitChangeLevel(buffer : ByteBuffer) : void
		{
			var roleData : HeroData = MainRoleManager.actorInfo;
			if (roleData == null)
				return;

			var client : ChangeLevelProto = new ChangeLevelProto();
			var bytes : ByteArray = new ByteArray();
			buffer.readBytes(bytes);
			bytes.uncompress();
			client.mergeFrom(bytes);

			roleData.level = client.newLevel;
			roleData.upgradeExp = client.exp.toNumber();
			roleData.spellList.totalAddSpellPoint = client.totalAddSpellPoint;
//			roleData.totalAddSpriteStatPoint = client.totalAddSpriteStatPoint;
			roleData.relive_coeff = client.reliveCoeff;
			roleData.mountSlotCount = client.mountSlotCount;
			//			MainRoleManager.actor.headFace.addAndUpdateLevel();
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

			heroData.level = buffer.readVarint32();

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
		
		private function onFightingAmountChanged(buffer : ByteBuffer):void
		{
			MainRoleManager.actorInfo.fightingAmount = buffer.readVarint64();
			EventManager.dispatchEvent(MainPlayerEvent.FIGHTING_AMOUNT_CHANGE);
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
			GameAlert.showAlertUtil(msg,showChenMiClick);
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
