package com.rpgGame.app.cmdlistener.scene
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.display.shapeArea.ShapeArea3D;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.fight.spell.CastSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellHelper;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellEffectRecordCtrl;
	import com.rpgGame.app.fight.spell.SpellHitHelper;
	import com.rpgGame.app.fight.spell.SpellResultInfo;
	import com.rpgGame.app.manager.FightHeadEffectManager;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipFightSoulManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskMissionManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.clientConfig.Q_skill_warning;
	import com.rpgGame.coreData.info.fight.FightHurtResult;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.fight.bean.AttackResultInfo;
	import com.rpgGame.netData.fight.message.ResAttackRangeMessage;
	import com.rpgGame.netData.fight.message.ResAttackResultMessage;
	import com.rpgGame.netData.fight.message.ResAttackVentToClientMessage;
	import com.rpgGame.netData.fight.message.ResFightBroadcastMessage;
	import com.rpgGame.netData.fight.message.ResFightFailedBroadcastMessage;
	import com.rpgGame.netData.fight.message.SCBuffSkillMessage;
	import com.rpgGame.netData.fight.message.SCCancelSkillMessage;
	import com.rpgGame.netData.fight.message.SCSkillWarningInfoMessage;
	import com.rpgGame.netData.structs.Position;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
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
			SocketConnection.addCmdListener(102117,onSCSkillWarningInfoMessage);//  新加的预警消息 ----yt
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
			TrusteeshipManager.getInstance().isNormalSpell = false;
			var failID : int = msg.failType;
			var failReason : String;
			failReason=NotifyCfgData.getNotifyTextByID(failID);//yt修改，读取新的消息表格式
			//failReason = LangQ_NoticeInfo["SkillError_"+failID];
			if(!failReason)
			{
				failReason="未配置的技能错误码!----failID";
				GameLog.addShow(failReason);
			}
			
			//if(failID==1014&&TrusteeshipManager.getInstance().isAutoing)return;//---------------yt 客户端已经规避目标死亡还是出现，所有在挂机的时候不要这个提示
				
			NoticeManager.showNotify(failReason, failID);
			if (MainRoleManager.actor.stateMachine.isPrewarWaiting)
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR,null,true);
			else
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE,null,true);
		}
		
		/**
		 * 位移技能、普通攻击的起手广播(包括自己)
		 * @param buffer
		 *
		 */
		private function onResFightBroadcastMessage(msg:ResFightBroadcastMessage):void
		{
			//GameLog.addShow("技能流水号为： 对目标\t" + msg.uid);
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg, true);
			if (info.atkor == null || !info.atkor.usable || (!info.atkor.isInViewDistance&&info.blinkType==0))
				return;
			if (info.atkor.isPlayer) 
			{
				SpellEffectRecordCtrl.clear(msg.personId.ToGID());
			}
			
			if (msg.personId.ToGID()==MainRoleManager.actorID) 
			{
				MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
				GameLog.addShow("主玩家释放技能：\t" + info.spellData.q_skillID);
			}
			ReleaseSpellHelper.releaseSpell(info);
			var skillId:int=msg.skillModelId&0xffffff;
			var skillData:Q_skill_model=SpellDataManager.getSpellData(skillId);
			if(skillData!=null&&skillData.q_performType==0&&msg.personId.ToGID() == MainRoleManager.actorID)//判断是否是自己的技能但不是战魂的技能  ---yt
			{
				EventManager.dispatchEvent(SkillEvent.SKILL_ATTACK,skillId);
			}
			//大招
			if (skillId==1008||skillId==2008||skillId==3008) 
			{
				LostSkillManager.instance().checkBigSkill(msg.personId);
			}
		
			//TrusteeshipManager.getInstance().myFighterCtrl.update(msg.personId,msg.fightTarget,msg.targets);
		}
		
		private function onResAttackVentToClientMessage(msg:ResAttackVentToClientMessage):void
		{
			var info : ReleaseSpellInfo = ReleaseSpellInfo.setReleaseInfo(msg, true);
			if (info.atkor == null || !info.atkor.usable || (!info.atkor.isInViewDistance&&info.blinkType==0))
			{
				return;
			}
			if (info.atkor.isPlayer)
			{
				SpellEffectRecordCtrl.clear(msg.playerid.ToGID());
			}
			
			var skillId:int=msg.fightType&0xffffff;
			var skillData:Q_skill_model=SpellDataManager.getSpellData(skillId);
			
			if (msg.playerid.ToGID()==MainRoleManager.actorID) 
			{
				MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_CAST_SPELL_LOCK);
				GameLog.addShow("主玩家释放技能：\t" + info.spellData.q_skillID);
				if(skillData!=null&&skillData.q_performType==0)//不是战魂的技能  ---yt
				{
					EventManager.dispatchEvent(SkillEvent.SKILL_ATTACK,skillId);
				}
			}
			else
			{
				if(skillData!=null&&skillData.q_performType==1)//判断是否是战魂但是不是自己的技能  ---yt
				{
					return;
				}
			}

			GameLog.addShow("技能流水号为： 对地\t" + msg.uid  + "\n" + "服务器给的点为：\t" + msg.pos.x +"_" + msg.pos.y+"skillid:"+info.spellData.q_skillID);
			if(skillData.q_performType==1)
				ReleaseSpellHelper.fightSoulSpell(info);
			else
				ReleaseSpellHelper.releaseSpell(info);
			//TrusteeshipManager.getInstance().myFighterCtrl.update(msg.playerid,null,msg.targets);
		}
		
		private function onResCancelSkillMessage(msg:SCCancelSkillMessage):void
		{
			GameLog.addShow("技能打断：" + msg.skillId);
			var skillId:int=msg.skillId&0xffffff;
			var skillData:Q_skill_model=SpellDataManager.getSpellData(skillId);
			if(skillData!=null&&skillData.q_performType==0&&msg.playerId.ToGID() == MainRoleManager.actorID)//判断是否是自己的技能但不是战魂的技能  ---yt
			{
				EventManager.dispatchEvent(SkillEvent.SKILL_CANCEL,skillData.q_skillID);
			}
			
		}
		
		
		/**
		 * 技能伤害列表 
		 * @param msg
		 * 
		 */		
		private function onResAttackResultMessage(msg:ResAttackResultMessage):void
		{
			var info : SpellResultInfo = SpellResultInfo.setSpellResultInfo(msg);
			
			if (info.hurtDelay > 0)
				TweenLite.delayedCall(info.hurtDelay * 0.001, SpellHitHelper.fightSpellHitEffect, [info]);
			else
				SpellHitHelper.fightSpellHitEffect(info);
			
//			SpellHitHelper.fightSpellHitEffect(info);
			effectCharAttribute(info);
            lockAttack(info,msg.state);
			TrusteeshipManager.getInstance().myFighterCtrl.addFightInfo(msg.state);
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
        private function lockAttack(info : SpellResultInfo,state: AttackResultInfo):void
		{
           /* if (info.isMainCharHited)// && null == SceneRoleSelectManager.selectedRole   锁定攻击不需要选择为空
			{
                var hurtList : Vector.<FightHurtResult> = info.hurtList;
                if (hurtList.length > 0)
				{
                    var attacker : SceneRole = SceneManager.getSceneObjByID(hurtList[0].atkorID) as SceneRole;
                    if (null != attacker)
					{
                        //SceneRoleSelectManager.selectedRole = attacker;
						var mdata:MonsterData=attacker.data as MonsterData;
						if(mdata!=null&&mdata.monsterData.q_monster_type>=1&&mdata.monsterData.q_monster_type<=3)
						{
							TrusteeshipManager.getInstance().killActor(attacker);
						}
                    }
                }
            }*/
			var hurt:FightHurtResult;
			/**--------------------被动挂机-----------------*/
			if (info.isMainCharHited)//主角被打
			{
				if (info.hurtList.length > 0)
				{
					var attacker : SceneRole;
					for each(hurt in info.hurtList )
					{
						attacker=SceneManager.getSceneObjByID(hurt.atkorID) as SceneRole;
						if (attacker!=null)
						{
							TrusteeshipManager.getInstance().killActor(attacker);
							
						}
					}
				}
			}
			
			/**--------------------战魂-----------------*/
			var skillId:int=state.skillId&0xffffff;
			var skillData:Q_skill_model=SpellDataManager.getSpellData(skillId);
			if(skillData!=null&&skillData.q_performType==0)//判断不是战魂的技能  ---yt
			{
				if(state.attackerId.ToGID() == MainRoleManager.actorID)//自己攻击别人
				{
					EventManager.dispatchEvent(SkillEvent.SKILL_RESULT,skillData.q_skillID);
					TrusteeshipFightSoulManager.getInstance().startFightSoulAuto(state.targetId,1);//战魂帮忙打
				}
				else if(state.targetId.ToGID() == MainRoleManager.actorID)//别人攻击自己
				{
					TrusteeshipFightSoulManager.getInstance().startFightSoulAuto(state.attackerId,2);//战魂还击
				}
			}
			/**--------------------是否攻击任务怪-----------------*/
			
			if(state.attackerId.ToGID() == MainRoleManager.actorID)//自己攻击
			{
				if (info.hurtList.length > 0)
				{
					var targeter : SceneRole;
					var mdata:MonsterData;
					TaskAutoManager.getInstance().actTaskMonster=false;
					for each(hurt in info.hurtList )
					{
						targeter=SceneManager.getSceneObjByID(hurt.targetID) as SceneRole;
						if (targeter!=null)
						{
							mdata=targeter.data as MonsterData;
						}
						if (mdata!=null)
						{
							if(TaskMissionManager.isWillTaskMonster(mdata.monsterData.q_id))
							{
								TaskAutoManager.getInstance().actTaskMonster=true;
								break;
							}
						}
						
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
			
			if (role.isMainChar||role.ownerIsMainChar) 
			{
				var qSkill:Q_skill_model=SpellDataManager.getSpellData(msg.skillId);
				//打断了重置cd
				if (qSkill&&qSkill.q_cancel_cd==1) 
				{
					SkillCDManager.getInstance().cancelSkillCD(qSkill);
				}
				if (qSkill.q_singing_time!=0) 
				{
					EventManager.dispatchEvent(SkillEvent.SKILL_CANCEL);
				}
				MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_ATTACK_HARD);
				//主玩家自己走路打断
				if (CastSpellHelper.isCanCancelByMainPlayer(qSkill.q_cancel)&&MainRoleManager.actor.stateMachine.isWalkMoving&&msg.selfCancel==1) 
				{
					//自己取消
				}
				else
				{
					if (MainRoleManager.actor.stateMachine.isPrewarWaiting)
						MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR,null,true);
					else
						MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE,null,true);
				}
				
			}
			if (role.isPlayer)
			{
				SpellEffectRecordCtrl.testCancelEffect(msg.playerId.ToGID(),msg.skillId);
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
			info.atkorPos=new Point(role.x,role.z);
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
		
		/**预警消息*/
		private function onSCSkillWarningInfoMessage(msg : SCSkillWarningInfoMessage) : void 
		{
			
			var role : SceneRole = SceneManager.getSceneObjByID(msg.monsterId.ToGID()) as SceneRole;
			if (null == role || !role.usable) {
				return;
			}
			
			var skillInfo : Q_skill_model = SpellDataManager.getSpellDataWithID(msg.skillId);
			if (skillInfo == null)
			{
				return;
			}
			var warningData:Q_skill_warning=SpellDataManager.getWarningData(skillInfo.q_skillID);//获取预警技能关联
			if (warningData == null)
			{
				return;
			}
			
			if(msg.targets&&msg.targets.length>0)
			{
				for each(var targets:long in msg.targets)
				{
					var targetsRole : SceneRole = SceneManager.getSceneObjByID(targets.ToGID()) as SceneRole;
					if (role &&role.usable) {
						FightHeadEffectManager.addHeadWarningEffect(role,warningData.q_time);
					}
					
				}
			}
			
			var animationData : Q_SpellAnimation = AnimationDataManager.getData(warningData.q_warn_effect);
			if (msg.posList&&msg.posList.length>0&&animationData)
			{
				for each(var point:Position in msg.posList)
				{Lyt.a("预警点："+point.x+","+point.y);
					SpellAnimationHelper.addWarningEffect(role,point.x, point.y, 0, animationData);
				}
			}
			
			
			
			
			
				//SpellAnimationHelper.addSkillWarningEffect(animationData);
				//addSkillWarningEffect
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
