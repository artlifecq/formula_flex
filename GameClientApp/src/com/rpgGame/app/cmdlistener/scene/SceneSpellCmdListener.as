package com.rpgGame.app.cmdlistener.scene
{
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import app.cmd.SceneModuleMessages;
	import app.message.SpellProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 场景技能消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 下午4:50:25
	 *
	 */
	public class SceneSpellCmdListener extends BaseBean
	{
		public function SceneSpellCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			//技能相关
			SocketConnection.addCmdListener(SceneModuleMessages.S2C_YOUR_SPELL_RELEASED, onYouSpellRelease);
			SocketConnection.addCmdListener(SceneModuleMessages.S2C_SPELL_RELEASE_FAIL, onSpellReleaseFail);
			SocketConnection.addCmdListener(SceneModuleMessages.S2C_SCENE_SPELL_RELEASED, onSpellReleased);
			SocketConnection.addCmdListener(SceneModuleMessages.S2C_SCENE_SPELL_EFFECTED, onSpellEffected);
			//
			finish();
		}

		/**
		 * 做技能冷却用
		 * @param buffer
		 *
		 */
		private function onYouSpellRelease(buffer : ByteBuffer) : void
		{
			var spellType : int = buffer.readVarint32();
			//添加单技能CD
			var spellData : SpellProto = CastSpellHelper.getSpellData(spellType);
			if (!spellData)
			{
				var defaultSpell : SpellProto = CastSpellHelper.getDefaultSpell();
				if (defaultSpell)
				{
					if (spellType == defaultSpell.spellType)
					{
						spellData = defaultSpell;
					}
					else
					{
						var relateSpells : Array = defaultSpell.activeSpell.relateSpells;
						for each (var tmpData : SpellProto in relateSpells)
						{
							if (spellType == tmpData.spellType)
							{
								spellData = tmpData;
								break;
							}
						}
					}
				}
			}
			SkillCDManager.getInstance().addSkillCDTime(spellData);
		}

		private function onSpellReleaseFail(buffer : ByteBuffer) : void
		{
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_10;
					break;
				case 2:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_11;
					break;
				case 3:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_12;
					break;
				case 4:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_13;
					break;
				case 5:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_14;
					break;
				case 6:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_15;
					break;
				case 7:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_16;
					break;
				case 8:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_17;
					break;
				case 9:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_18;
					break;
				case 10:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_19; //（英雄死亡后不会被删除，怪物会被立即删除,所以一般情况下怪物目标不会返还这个消息）
					break;
				case 11:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_20;
					break;
				case 12:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_21;
					break;
				case 13:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_22;
					break;
				case 14:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_23;
					break;
				case 15:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_24;
					break;
				case 16:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_81;
					break;
				case 17:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_82;
					break;
				case 18:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_83;
					break;
				case 19:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_84;
					break;
				case 20:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_85;
					break;
				case 21:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_86;
					break;
				case 22:
					failReason = "该技能必须在马上才能够释放";
					break;
				case 23:
					failReason = "飞行中，无法释放技能";
					break;
				case 24:
					failReason = "当前坐骑无法骑战";
					break;
				case 25:
					failReason = "在镖车上";
					break;
				default:
					failReason = LangNoticeInfo.ErrorMsgNoticeManager_25;
					break;
			}

			NoticeManager.showNotify(failReason, failID);
		}

		/**
		 * 位移技能、普通攻击的起手广播(包括自己)
		 * @param buffer
		 *
		 */
		private function onSpellReleased(buffer : ByteBuffer) : void
		{
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var flySceneObjID : int = buffer.readVarint32();
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(flySceneObjID, buffer, true);
			ReleaseSpellHelper.releaseSpell(info);
			effectCharsHp(info);

//			if (info.atkor && info.atkor.isMainChar)
//			{
//				GameLog.addShow("释放技能" + info.flySceneObjID + "效果：" + info.spellEffectID);
//			}
//
//			for each (var bInfo : BuffInfo in info.stateList)
//			{
//				BuffManager.addBuf(bInfo);
//			}
		}

		/**
		 * 技能的后续延时伤害广播(包括自己)(通用)
		 * @param buffer
		 *
		 */
		private function onSpellEffected(buffer : ByteBuffer) : void
		{
			var flySceneObjID : int = buffer.readVarint32();
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(flySceneObjID, buffer);
			SpellHitHelper.serverSpellHitEffect(info);
			effectCharsHp(info);

//			if (info.atkor && info.atkor.isMainChar)
//			{
//				GameLog.addShow("技能伤害" + info.flySceneObjID + "效果：" + (info.hurtList.length > 0 ? "伤害" + info.hurtList[0].hurtAmount : "无"));
//			}

//			SpellAnimationManager.addPosEffectAnimaton(info);
//			//
//			for each (var bInfo : BuffInfo in info.stateList)
//			{
//				BuffManager.addBuf(bInfo);
//			}
		}
		
		private function effectCharsHp(info : ReleaseSpellInfo):void
		{
			var hurtList:Vector.<FightHurtResult> = info.hurtList;
			for each (var hurtResult:FightHurtResult in hurtList) 
			{
				var role:SceneRole = SceneManager.getSceneObjByID(hurtResult.roleID) as SceneRole;
				if(role && role.usable)
				{
					CharAttributeManager.setCharHp(role.data as RoleData, hurtResult.curLife);
				}
			}
		}
	}
}
