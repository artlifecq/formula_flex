package com.rpgGame.app.cmdlistener.scene
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.display.shapeArea.ShapeArea3D;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.fight.spell.SpellResultInfo;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.fight.message.ResAttackRangeMessage;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.ResAttackVentToClientMessage;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	import com.rpgGame.netData.fight.message.ResFightFailedBroadcastMessage;
	import com.rpgGame.netData.fight.message.SCAttackerResultMessage;
	import com.rpgGame.netData.fight.message.SCBuffSkillMessage;
	import com.rpgGame.netData.fight.message.SCCancelSkillMessage;
	import com.rpgGame.netData.structs.Position;
	
	import flash.geom.Point;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
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
//			SocketConnection.addCmdListener(102114,onSCAttackerResultMessage);
			SocketConnection.addCmdListener(102103,onResAttackRangeMessage);
			SocketConnection.addCmdListener(102115,onCanelSkillMessage);
            SocketConnection.addCmdListener(102116,onBuffSkillMessage);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_YOUR_SPELL_RELEASED, onYouSpellRelease);
			//
			finish();
		}
		/**
		 * 施法失败, 失败原因
		 *
			NONE(0),	//表示没有失败
			NO_SKILL_ID(1),	//没有技能
			NO_SCENE(2),	//没有场景
			NO_SKILL_CFG(3),	//没有技能数据
			PASSIVE_SKILL(4),	//无法释放被动技能
			PERFORMING(5),	//释放技能中
			SINGING(6),		//技能吟唱中
			PUBLIC_CD(7),	//公共冷却中
			NO_SKILL_TYPE(8),	/不到技能类型
			CANT_PERFORM(9),	//无法释放技能
			NO_MP(10),	//魔法不足
			NO_COST_CFG(11),	/不到技能消耗配置
			FAR_AWAY(12),	//释放距离过远
			SELECT_TARGET(13),	//目标技能没有选定目标
			NO_TARGET(14),	//没有找到目标
			TARGET_DIE(15),	//目标死亡
			SHUI_MIAN(16),	/眠状态
			BAN_ATTACK(17),	//沉默状态
			CHANGEMAP(18),	//切换地图中
		 */
		private function onResFightFailedBroadcastMessage(msg:ResFightFailedBroadcastMessage):void
		{
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var failID : int = msg.failType;
			var failReason : String;
			failReason=NotifyCfgData.getNotifyTextByID(failID);//yt修改，读取新的消息表格式
			//failReason = LangQ_NoticeInfo["SkillError_"+failID];
			if(!failReason)
			{
				failReason="未配置的技能错误码!----failID";
				GameLog.addShow(failReason);
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
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg, true);
			ReleaseSpellHelper.releaseSpell(info);	
			var skillId:int=msg.skillModelId&0xffffff;
			EventManager.dispatchEvent(SkillEvent.SKILL_ATTACK,skillId);
		}
		
		private function onResAttackVentToClientMessage(msg:ResAttackVentToClientMessage):void
		{
			
			var skillId:int=msg.fightType&0xffffff;
			var skillData:Q_skill_model=SpellDataManager.getSpellData(skillId);
			if(skillData!=null&&skillData.q_performType==1&&msg.playerid.ToGID() != MainRoleManager.actorID)//判断是否是战魂但是不是自己的技能  ---yt
			{
				return;
			}
			
			
			GameLog.addShow("技能流水号为： 对地\t" + msg.uid  + "\n" + "服务器给的点为：\t" + msg.pos.x +"_" + msg.pos.y);
			MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg, true);
			if(skillData.q_performType==1)
				ReleaseSpellHelper.fightSoulSpell(info);
			else
				ReleaseSpellHelper.releaseSpell(info);
			
			
			EventManager.dispatchEvent(SkillEvent.SKILL_ATTACK,skillId);
		}
		
		private function onResCancelSkillMessage(msg:SCCancelSkillMessage):void
		{
			GameLog.addShow("技能打断：" + msg.skillId);
			EventManager.dispatchEvent(SkillEvent.SKILL_CANCEL);
		}
		
		
		/**
		 * 技能伤害列表 
		 * @param msg
		 * 
		 */		
		private function onResAttackResultMessage(msg:ResAttackResultMessage):void
		{
			var info : SpellResultInfo = SpellResultInfo.setSpellResultInfo(msg);
			SpellHitHelper.fightSpellHitEffect(info);
			effectCharAttribute(info);
            lockAttack(info);
			EventManager.dispatchEvent(SkillEvent.SKILL_RESULT);
			
		}
		
		private function effectCharAttribute(info : SpellResultInfo) : void
		{
			var hurtList : Vector.<FightHurtResult> = info.hurtList;
			for each (var hurtResult : FightHurtResult in hurtList)
			{
				var role : SceneRole = SceneManager.getSceneObjByID(hurtResult.targetID) as SceneRole;
				if (role && role.usable)
				{
//					CharAttributeManager.setCharHp(role.data as RoleData, hurtResult.curLife);
//					CharAttributeManager.setCharMp(role.data as RoleData, hurtResult.curMana);
				}
			}
		}

        // 锁定攻击源
        private function lockAttack(info : SpellResultInfo):void
		{
            if (info.isMainCharHited && null == SceneRoleSelectManager.selectedRole)
			{
                var hurtList : Vector.<FightHurtResult> = info.hurtList;
                if (hurtList.length > 0)
				{
                    var attacker : SceneRole = SceneManager.getSceneObjByID(hurtList[0].atkorID) as SceneRole;
                    if (null != attacker)
					{
                        SceneRoleSelectManager.selectedRole = attacker;
                    }
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
        
        private function onCanelSkillMessage(msg : SCCancelSkillMessage) : void {
            var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
            if (null == role) {
                return;
            }
        }
        
        private function onBuffSkillMessage(msg : SCBuffSkillMessage) : void {
            var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
            if (null == role || !role.usable) {
                return;
            }
            if (msg.targets.length < 1) {
                return;
            }
            var skillInfo : Q_skill_model = SpellDataManager.getSpellDataWithID(msg.skillId);
            if (null == skillInfo) {
                return;
            }
            var info : ReleaseSpellInfo = new ReleaseSpellInfo();
            info.spellData = skillInfo;
            info.atkor = role;
            info.flyTargetPosList = new Vector.<Position>();
            info.flyTargets = new Vector.<SceneRole>();
            for (var i : int = 0, len : int = msg.targets.length; i < len; ++i) {
                var targetRole : SceneRole = SceneManager.getSceneObjByID(msg.targets[i].ToGID()) as SceneRole;
                if (null == targetRole || !targetRole.usable) {
                    continue;
                }
                info.flyTargets.push(targetRole);
            }
            info.readSpellEffectData(info.spellData.q_spell_effect);
            SpellAnimationHelper.addFlyEffect(info);
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
