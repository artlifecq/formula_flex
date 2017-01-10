package com.rpgGame.app.cmdlistener.scene
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.display.shapeArea.ShapeArea3D;
	import com.game.engine3D.utils.MathUtil;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.fight.message.ResAttackRangeMessage;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.ResAttackVentToClientMessage;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	import com.rpgGame.netData.fight.message.ResFightFailedBroadcastMessage;
	import com.rpgGame.netData.fight.message.SCAttackerResultMessage;
	
	import flash.geom.Point;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net_protobuff.ByteBuffer;

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
			SocketConnection.addCmdListener(102105,onResFightFailedBroadcastMessage);
			SocketConnection.addCmdListener(102101,onResFightBroadcastMessage);
			SocketConnection.addCmdListener(102102,onResAttackResultMessage);
			SocketConnection.addCmdListener(102107,onResAttackVentToClientMessage);
			SocketConnection.addCmdListener(102114,onSCAttackerResultMessage);
			SocketConnection.addCmdListener(102103,onResAttackRangeMessage);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_YOUR_SPELL_RELEASED, onYouSpellRelease);
			//
			finish();
		}
		/**
		 * 施法失败, 附带varint32 失败原因
		 *
		 * 1. 已死亡
		 * 2. 晕眩
		 * 3. 沉默
		 * 4. gcd 没到
		 * 5. 跳跃中
		 * 6. 这技能你不会 (不管是不是存在于这世上)
		 * 7. cd 没到
		 * 8. 魔法不够
		 * 9. 技能目标没找到
		 * 10. 技能目标已死亡
		 * 11. 距离过远
		 * 12. 伤害技能不能打自己人 或 不是伤害技能不能打坏人 攻击技能不能打英雄的原因有
		 * 13. 法术值不足
		 * 14. 施法中
		 * 15. 前置技能没有释放
		 * 16. 定身中，无法释放位移技能
		 * 17. 当前场景，无法使用技能
		 * 18. 发送过来的角度非法，必须在(0-360]之间
		 * 19. 当前没有武器
		 * 20. 当前副武器无法释放该技能
		 * 21. 服务器bug
		 * 22. 该技能必须在马上才能够释放
		 * 23. 飞行中，无法释放技能
		 * 24. 当前坐骑无法骑战
		 * 25. 在镖车上
		 * 26. 摆摊中,无法放技能
		 * 27. 目标没有死亡，无法释放复活技能
		 * 28. 目标正在被他人复活中
		 * 29. 目标无法被复活
		 * 30. 禁技
		 */
		private function onResFightFailedBroadcastMessage(msg:ResFightFailedBroadcastMessage):void
		{
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var failID : int = 0;
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
		private function onResFightBroadcastMessage(msg:ResFightBroadcastMessage):void
		{
			GameLog.addShow("技能流水号为： 对目标\t" + msg.uid);
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg.uid, msg, true);
			ReleaseSpellHelper.releaseSpell(info);
//			effectCharAttribute(info);
			
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
		
		private function onResAttackVentToClientMessage(msg:ResAttackVentToClientMessage):void
		{
			GameLog.addShow("技能流水号为： 对地\t" + msg.uid);
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg.uid, msg, true);
			ReleaseSpellHelper.releaseSpell(info);
//			effectCharAttribute(info);
		}
		
		/**
		 * 技能伤害列表 
		 * @param msg
		 * 
		 */		
		private function onSCAttackerResultMessage(msg:SCAttackerResultMessage):void
		{
			GameLog.addShow("技能伤害流水号为： \t" + msg.uid);
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg.uid, msg);
			SpellHitHelper.fightSpellHitEffect(info);
			effectCharAttribute(info);
		}

		/**
		 * 技能的后续延时伤害广播(包括自己)(通用)
		 * @param buffer
		 *
		 */
		private function onResAttackResultMessage(msg:ResAttackResultMessage):void
		{
//			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg.state.uid, msg);
//			SpellHitHelper.fightSpellHitEffect(info);
//			effectCharAttribute(info);
			
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
		
		private function effectCharAttribute(info : ReleaseSpellInfo) : void
		{
			var hurtList : Vector.<FightHurtResult> = info.hurtList;
			for each (var hurtResult : FightHurtResult in hurtList)
			{
				var role : SceneRole = SceneManager.getSceneObjByID(hurtResult.roleID) as SceneRole;
				if (role && role.usable)
				{
					CharAttributeManager.setCharHp(role.data as RoleData, hurtResult.curLife);
					CharAttributeManager.setCharMp(role.data as RoleData, hurtResult.curMana);
				}
			}
		}
		
		private var attackAreas:Vector.<ShapeArea3D> = new Vector.<ShapeArea3D>();
		private function onResAttackRangeMessage(msg:ResAttackRangeMessage):void
		{
			
			var gw:int = SceneConfig.TILE_WIDTH;
			var gh:int = SceneConfig.TILE_HEIGHT;
			var i:int = 0;
			for ( i = 0; i < attackAreas.length; i++ )
			{
				if (attackAreas[i])
				{
					attackAreas[i].dispose();
					attackAreas[i] = null;
				}
			}
			
			attackAreas = new Vector.<ShapeArea3D>();
			for (i = 0; i < msg.grids.length; i++)
			{
				var pt:Point = new Point(int(msg.grids[i] / 10000), int(msg.grids[i] % 10000));
				var _measureShapeArea3D:ShapeArea3D = new ShapeArea3D(SceneManager.getScene().sceneRenderLayer);
				_measureShapeArea3D.updateFill(pt.x, 0, -pt.y, 0xff0000, 4,25,0);
				attackAreas.push( _measureShapeArea3D );
			}
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////
		///////////////////////////  参考协议------
		///////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 * 做技能冷却用
		 * @param buffer
		 *
		 */
		private function onYouSpellRelease(buffer : ByteBuffer) : void
		{
			var spellID : int = buffer.readVarint32();
			//添加单技能CD
			var spellData : Q_skill_model = CastSpellHelper.getSpellData(spellID);
			if (!spellData)
			{
				var defaultSpell : Q_skill_model = CastSpellHelper.getDefaultSpell();
				if (defaultSpell)
				{
					if (spellID == defaultSpell.q_skillID)
					{
						spellData = defaultSpell;
					}
					else
					{
						//连招
						var relateSpells : Vector.<Q_skill_model> = SpellDataManager.getRelateSpells(defaultSpell.q_relate_spells);
						for each (var tmpData : Q_skill_model in relateSpells)
						{
							if (spellID == tmpData.q_skillID)
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
		
		
		
		/**
		 * 触发被动技能，附带varint32类型的技能类型
		 *
		 */
		private function onTriggerHanGuangDunSpell(buffer : ByteBuffer) : void
		{
			var roleId : Number = buffer.readVarint64();
			var animationId : int = buffer.readVarint32();
			var role : SceneRole = SceneManager.getSceneObjByID(roleId) as SceneRole;
			if (role)
			{
				var animationData : Q_SpellAnimation = AnimationDataManager.getData(animationId);
				if (animationData)
				{
					SpellAnimationHelper.addSelfDestEffect(role, animationData);
				}
			}
		}
	}
}
