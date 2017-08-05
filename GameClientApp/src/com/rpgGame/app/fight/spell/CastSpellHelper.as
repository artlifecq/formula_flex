package com.rpgGame.app.fight.spell
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.ctrl.ControlAutoFightSelectSkill;
	import com.rpgGame.app.manager.fight.FightManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.CastSpellLockStateReference;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.fight.spell.CastSpellInfo;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.EnumSkillId;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.role.BaseEntityData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.SpellTargetType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import gameEngine2D.PolyUtil;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 *
	 * 投放技能助手
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class CastSpellHelper
	{
		/**
		 *  投放技能失败
		 */		
		private static const CASE_STATE_FAIL : int = 0;
		/**
		 * 投放技能不在释放范围
		 */		
		private static const CASE_STATE_NOT_IN_RELEASE_RANGE : int = 1;
		/**
		 * 投放技能成功
		 */		
		private static const CASE_STATE_SUCCEED : int = 2;
		/**
		 * 偏差；误差；背离 范围 
		 */
		private static const DEVIATION_RANGE : int = 50;

		private static var _caseSpell : Q_skill_model = null;
		private static var _lastCaseSpell : Q_skill_model = null;
		private static var _relateSpellIndex : int = -1;
		private static var tempVector3D : Vector3D = new Vector3D();
		private static var _roleList : Vector.<SceneRole>;
		private static var _autoAtkNearRole : Boolean = false;

		public function CastSpellHelper()
		{
		}

		private static function getNextRelateSpell() : Q_skill_model
		{
			if (!_caseSpell)
				return null;
			
			var relateSpells:Vector.<Q_skill_model> = SpellDataManager.getRelateSpells(_caseSpell.q_relate_spells);
			
			if(!relateSpells || relateSpells.length == 0)
			{
//				GameLog.add("这个技能没有连招哦！！！");
				return _caseSpell;
			}
			
			_relateSpellIndex++;
			if (_relateSpellIndex < 0)
			{
				_relateSpellIndex = 0;
			}
			else if (_relateSpellIndex >= relateSpells.length)
			{
				_relateSpellIndex = 0;
			}
			
			return relateSpells[_relateSpellIndex];
		}
		
		/**玩家主动放技能优先*/
		public static function shortcutsTryCaseSpell(spellID : int, ignoreLock : Boolean = false) : void
		{
			var caseInfo : CastSpellInfo = new CastSpellInfo(getSpellData(spellID));
			var spKey:Boolean=tryCaseSpell(caseInfo, null, false, ignoreLock);
			if(!spKey)
			{
				TrusteeshipManager.getInstance().nextSpell = getSpellData(spellID);
			}
		}
		
		public static function tryCaseSpell(caseInfo : CastSpellInfo, roleList : Vector.<SceneRole> = null, autoAtkNearRole : Boolean = false, ignoreLock : Boolean = false) : Boolean
		{
			_roleList = roleList;
			_autoAtkNearRole = autoAtkNearRole;
            var info : HeroData = MainRoleManager.actorInfo;
			var caseState : int = caseSpell(caseInfo, true, ignoreLock);
			//三连击释放失败
			if (CASE_STATE_FAIL==caseState) 
			{
				TrusteeshipManager.getInstance().isNormalSpell = false;
				//把动作切换为战斗待机状态
				if (TrusteeshipManager.getInstance().tripleSkillCtrl.isTripleSkill(caseInfo.spellData.q_skillID)) 
				{
					MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR, null, false, false, [RoleStateType.CONTROL_WALK_MOVE]);
				}
			}
			if (!caseInfo.caseSpellData)
				return false;
            if (caseInfo.caseSpellData.q_need_mp > info.totalStat.mp) {
                NoticeManager.showNotify(LangQ_NoticeInfo.ErrorMsgNoticeManager_22);
                return false;
            }
			var targerRole : SceneRole = null;
			if (caseState == CASE_STATE_SUCCEED)
			{
				requestReleaseSpell();
			}
			else if (caseState == CASE_STATE_NOT_IN_RELEASE_RANGE)//距离过远
			{
				//三连击的话直接发送请求
				if (TrusteeshipManager.getInstance().tripleSkillCtrl.isTripleSkill(caseInfo.spellData.q_skillID)) 
				{
					caseInfo.targetServerID=null;//改成空放
					caseInfo.releasePos.x=MainRoleManager.actor.x;
					caseInfo.releasePos.y=MainRoleManager.actor.z;
					requestReleaseSpell();
					return true;
				}
				if (caseInfo.targetPos)
				{
					if (caseInfo.targetID > 0)
						targerRole = SceneManager.getSceneObjByID(caseInfo.targetID) as SceneRole;
					RoleStateUtil.walk(MainRoleManager.actor, caseInfo.targetPos.x, caseInfo.targetPos.y, 0, caseInfo, onWalkArriveRelease, onWalkThroughCase,null,true);
				}
			}

			function requestReleaseSpell() : void
			{
				if (ClientConfig.isSingle)
				{
					var buffer : ByteBuffer = new ByteBuffer();
					buffer.writeVarint32(caseInfo.caseSpellData.q_skillID);
					buffer.writeVarint32(0);
//					buffer.writeVarint32(caseInfo.caseSpellData.sp);
					buffer.writeVarint64(MainRoleManager.actorID);
					buffer.writeVarint32(MainRoleManager.actor.x);
					buffer.writeVarint32(MainRoleManager.actor.z);
					buffer.writeVarint64(0);
					buffer.writeVarint32(caseInfo.releasePos.x);
					buffer.writeVarint32(caseInfo.releasePos.y);
					buffer.position = 0;

					var info : ReleaseSpellInfo = new ReleaseSpellInfo();
					info.readFrom(null);
					ReleaseSpellHelper.releaseSpell(info);
				}
				else
				{
					var angle : int = (360 - caseInfo.angle) % 360;
					var ref : CastSpellLockStateReference = MainRoleManager.actor.stateMachine.getReference(CastSpellLockStateReference) as CastSpellLockStateReference;
					var spellData : Q_skill_model = caseInfo.spellData;
					ref.setParams(spellData);
					MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_CAST_SPELL_LOCK, ref);
					if (/*spellData.q_relate_spells!=null || */spellData.q_relate_spells!="") 
					{
						TrusteeshipManager.getInstance().tripleSkillCtrl.setParams(spellData.q_skillID);
					}
					
					SpellSender.releaseSpell(caseInfo.caseSpellData.q_skillID, caseInfo.releasePos.x, caseInfo.releasePos.y, angle, caseInfo.targetServerID);
					
					if(TrusteeshipManager.getInstance().tripleSkillCtrl.isLastTripleSkill(caseInfo.caseSpellData.q_skillID))
					{
						TrusteeshipManager.getInstance().isNormalSpell = false;
					}
				}
			}

			function onWalkArriveRelease(ref : WalkMoveStateReference) : void
			{
//				caseState = caseSpell(caseInfo,false,true);
//				if (caseState == CASE_STATE_SUCCEED)
//				{
					requestReleaseSpell();
//				}
			}

			function onWalkThroughCase(ref : WalkMoveStateReference) : void
			{
				if (!targerRole || !targerRole.usable || targerRole.stateMachine.isDeadState)
					return;
				var dist : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, targerRole.x, targerRole.z);
				var range : int = caseInfo.range;
				if ((!ref.path || ref.path.length < 1) && dist <= range * range)
				{
					caseState = caseSpell(caseInfo, false, ignoreLock);
					if (caseState == CASE_STATE_SUCCEED)
					{
						requestReleaseSpell();
					}
					else if (caseState == CASE_STATE_NOT_IN_RELEASE_RANGE)
					{
						if (caseInfo.targetPos)
						{
							RoleStateUtil.walk(MainRoleManager.actor, caseInfo.targetPos.x, caseInfo.targetPos.y, 0, caseInfo, onWalkArriveRelease, onWalkThroughCase,null,true);
						}
					}
				}
			}
			EventManager.dispatchEvent(SpellEvent.SPELL_HERO_RELEASE_SPELL);
			return true;
		}

		/**
		 * 判断技能可以释放及技能相关的信息设置
		 * @param castInfo  待释放的技能信息
		 * @param relateSelectable 是否开启连招判断 
		 * @return 
		 * 
		 */		
		public static function caseSpell(castInfo : CastSpellInfo, relateSelectable : Boolean = false, ignoreLock : Boolean = false) : int
		{
			if (!castInfo.spellData)
			{
				return CASE_STATE_FAIL;
			}

			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsDead); //"已死亡不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isAttackHarding)
			{
				if (!_autoAtkNearRole)
				{
					//NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsHarding); //"技能硬直中"
				}
				GameLog.addShow("技能僵直中不能释放=============");
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isSpriteUp)
			{
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isLockCaseSpell)
			{
				if (!_autoAtkNearRole)
				{
					//NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsLock); //"释放技能被锁定"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isBlinkMoving)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsBlinking); //"冲锋中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isBeatMoving)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsBeatMoving); //"被击退中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isStun)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsStun); //"眩晕中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isHush)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CastSpellIsHush); //"沉默中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (!MainRoleManager.actor.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
			{
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isJumping||MainRoleManager.actor.stateMachine.isJumpRising)//跳跃中不不能放技能
			{
				return CASE_STATE_FAIL;
			}
			
			
			if (_caseSpell)
			{
				if (_caseSpell.q_skillID != castInfo.spellData.q_skillID)
				{
					_caseSpell = null;
					_relateSpellIndex = -1;
				}
			}
			_caseSpell = castInfo.spellData;
			var spellData : Q_skill_model = relateSelectable ? getNextRelateSpell() : _lastCaseSpell;
			_lastCaseSpell = spellData;
			castInfo.caseSpellData = spellData;
			GameLog.add("====================将要释放技能：" + spellData.q_skillID);
			if (!spellData)
			{
				return CASE_STATE_FAIL;
			}
			//技能CD中不能释放技能
			if (SkillCDManager.getInstance().getSkillHasCDTime(spellData))
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.SpellIsCD); //"技能正在冷却"
				}
				return CASE_STATE_FAIL;
			}
			if (castInfo.isReleaseOnlyUpMount)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.SpellIsOnlyUpMount); //"该技能只能在马上释放"
				}
				return CASE_STATE_FAIL;
			}
			var state : int = setSpellTarget(castInfo, ignoreLock);
			return state;
		}
		private static function findTarget2Cure(skill:Q_skill_model):SceneRole
		{
			var select:SceneRole=SceneRoleSelectManager.selectedRole;
			var model:int;
			if (select!=null) 
			{
				if (SceneCharType.PLAYER==select.type) 
				{
					//自己当然可以
					if (select.isMainChar) 
					{
						return select;
					}
					model=FightManager.getFightRoleState(select, skill);
					//不能攻击的模式才能加血
					if (FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY!=model) 
					{
						return select;
					}
				}
			}
			//选了目标的情况，但是目标不满住条件
			if (Mgr.teamMgr.hasTeam) 
			{
				var nearstTeam:SceneRole=Mgr.teamMgr.getNearstHpTeammerber();
				if (nearstTeam!=null) 
				{
					model=FightManager.getFightRoleState(nearstTeam, skill);
					if (FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY!=model)
					{
						return nearstTeam;
					}
				}
			}
			return MainRoleManager.actor;
		}
		/**
		 * 获取技能目标,返回一个目标或者点
		 * @param spellData
		 * @return
		 *
		 */
		private static function setSpellTarget(castInfo : CastSpellInfo, ignoreLock : Boolean = false) : int
		{
			var spellData : Q_skill_model = castInfo.caseSpellData;
			var spellEffectData : Q_SpellEffect = castInfo.spellEffectData;
			if (!spellData)
			{
				return CASE_STATE_FAIL;
			}
			if (AreaMapManager.forbidCastSpellInMapDataArea(MainRoleManager.actor, spellData.q_skillID))
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangQ_NoticeInfo.CAST_SPELL_FORBID_IN_AREA); //"本区域内不能使用该技能"
				}
				return CASE_STATE_FAIL;
			}
			var releaseRange : int = spellData.q_range_limit * SceneConfig.TILE_HEIGHT;
//			var hurtRange : int = spellData.activeSpell.hurtRange;
			var targetServerID : long = null;
			var targetID:Number = 0;
			var targetRole : SceneRole = null;
			// 释放技能目标点
			var releaseTargetPos : Point = null;
			//var targetPos : Point = null;
			// 释放技能的位置
			var releasePos : Point = null;
			var dist : int = 0;
			var radian : Number = 0;
			var angle : int = 0;
			var selfPos : Point = new Point(MainRoleManager.actor.x, MainRoleManager.actor.z);
            var lockTarget : SceneRole = null;
            do {
                if (SpellTargetType.SELF == spellData.q_target) {
                    //对自己施放的技能
                    targetServerID = MainRoleManager.actorInfo.serverID;
                    targetID = MainRoleManager.actorID;
                    angle = 270 - MainRoleManager.actor.rotationY;
                    releaseTargetPos = new Point(selfPos.x, selfPos.y);
                    releasePos = new Point(selfPos.x, selfPos.y);
                    break;
                }
				
                releaseRange = releaseRange - DEVIATION_RANGE;
                releaseRange = releaseRange < 0 ? 0 : releaseRange;
				//医家加血
				if (EnumSkillId.SKILL_3005==spellData.q_skillID||EnumSkillId.SKILL_3007==spellData.q_skillID)
				{
					lockTarget=findTarget2Cure(spellData);
					break;
				}
                var distance : int = spellData.q_search_range * spellData.q_search_range;
                var enemy_list : Vector.<SceneRole> = _roleList ? _roleList : SceneManager.getSceneRoleList();
                enemy_list.sort(onSortNearestRole);
                
                if (4 == spellData.q_skill_type) {
                    // 位移类忽略锁定目标
                    ignoreLock = true;
                }
                if (2 == spellData.q_is_locking_spell) {
                   // 锁定死亡
                   lockTarget = getCanAtkRole(enemy_list, spellData, true, distance);
                   if (null == lockTarget) {
                       NoticeManager.showNotify(LangQ_NoticeInfo.SkillError_24);
                       return CASE_STATE_FAIL;
                   }
                } else if (1 == spellData.q_is_locking_spell) {
                    // 必须锁定目标
                    lockTarget = getCanAtkRole(enemy_list, spellData, false, distance);
                    if (null == lockTarget) {
                        switch (spellData.q_target) {
                            case SpellTargetType.FRIEND:
                            case SpellTargetType.TEAM:
                                NoticeManager.showNotify(LangQ_NoticeInfo.SkillError_23);
                                break;
                            case SpellTargetType.ENEMY:
                                NoticeManager.showNotify(LangQ_NoticeInfo.NotAttack);
                                break;
                            
                        }
                        return CASE_STATE_FAIL;
                    }
                    break;
                } else if (0 == spellData.q_is_locking_spell) {
                    if (ignoreLock) {
                        break;
                    }
                    lockTarget = getCanAtkRole(enemy_list, spellData, false, distance);
                }
            } while (false);
            if (null != lockTarget) {
                SceneRoleSelectManager.selectedRole = lockTarget;
                targetRole = lockTarget;
                var targetRadius : int = (targetRole.data as RoleData).bodyRadius; //处理半径
                var keepSpacing : int = spellData.q_keep_spacing;
                
                targetServerID = (targetRole.data as BaseEntityData).serverID;
                targetID = targetRole.id;
                releaseTargetPos = new Point(targetRole.x, targetRole.z);
                releasePos = new Point(selfPos.x, selfPos.y);
                
                MainRoleManager.actor.faceToGround(releaseTargetPos.x, releaseTargetPos.y);
                
                if (targetRole.isMainChar) {
                    angle = 270 - MainRoleManager.actor.rotationY;
                } else {
                    angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
                }
                radian = angle * Math.PI / 180;
                var dx : Number = Math.cos(radian);
                var dy : Number = Math.sin(radian);
                
                if (0 == spellData.q_blink_type) {
                    //angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
                    radian = angle * Math.PI / 180;
                    var temp : Number = Point.distance(selfPos, releaseTargetPos);
                    dist = temp;
                    if (0 != releaseRange && dist > releaseRange) {
                        dist = dist - releaseRange;
                        // 距离大于最大释放距离
                        while (dist < temp) {
                            dist = dist < 0 ? 0 : dist;
                            releasePos.x = selfPos.x + dist * Math.cos(radian);
                            releasePos.y = selfPos.y + dist * Math.sin(radian);
                            if (PathFinderUtil.isPointInSide(SceneManager.getDistrict(), new Vector3D(releasePos.x, releasePos.y, 0))) {
                                break;
                            }
                            dist += SceneConfig.TILE_HEIGHT;
                        }
                    }
                } else {
                    angle = 270 - MainRoleManager.actor.rotationY;
                    radian = angle * Math.PI / 180;
                    releaseTargetPos = new Point();
                    releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
                    releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
                    releasePos = new Point(selfPos.x, selfPos.y);
                }
            } else {
                // 对鼠标点释放
                var scenePosition : Vector3D = Stage3DLayerManager.getPickPositonByMousePositon(SceneManager.getScene().view, Stage3DLayerManager.stage.mouseX, Stage3DLayerManager.stage.mouseY/*, MainRoleManager.getActorSpellHandHight()*/);
                if (null == scenePosition) {
                    // 无效释放点
                    NoticeManager.showNotify(LangQ_NoticeInfo.TargetInvalid);
                    return CASE_STATE_FAIL;
                }
                MainRoleManager.actor.faceToGround(scenePosition.x, scenePosition.y);
                if (0 == spellData.q_blink_type) {
                    var mousePos : Point = new Point(scenePosition.x, scenePosition.y);
                    angle = MathUtil.getAngle(selfPos.x, selfPos.y, mousePos.x, mousePos.y);
                    radian = angle * Math.PI / 180;
                    dist = Point.distance(selfPos, mousePos);
                    releaseTargetPos = new Point();
                    if (dist > releaseRange) {
                        // 距离大于最大释放距离
                        mousePos.x = selfPos.x + releaseRange * Math.cos(radian);
                        mousePos.y = selfPos.y + releaseRange * Math.sin(radian);
                    }
                    releaseTargetPos = new Point(mousePos.x, mousePos.y);
                    releasePos = new Point(selfPos.x, selfPos.y);
                } else {
                    angle = 270 - MainRoleManager.actor.rotationY;
                    radian = angle * Math.PI / 180;
                    releaseTargetPos = new Point();
                    releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
                    releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
                    releasePos = new Point(selfPos.x, selfPos.y);
                }
            }
//			if (spellData.q_target == SpellTargetType.SELF) //对自己施放的技能
//			{
//                targetServerID = MainRoleManager.actorInfo.serverID;
//                targetID = MainRoleManager.actorID;
//				angle = 270 - MainRoleManager.actor.rotationY;
//				releaseTargetPos = new Point(selfPos.x, selfPos.y);
//				//targetPos = new Point(selfPos.x, selfPos.y);
//				releasePos = new Point(selfPos.x, selfPos.y);
//			} 
//			else 
//			{
//                releaseRange = releaseRange - DEVIATION_RANGE;
//                releaseRange = releaseRange < 0 ? 0 : releaseRange;
//                if (4 == spellData.q_skill_type) {
//                    // 位移类忽略锁定目标
//                    ignoreLock = true;
//                }
//                do {
//                    if (null == SceneRoleSelectManager.selectedRole || ignoreLock) {
//                        // 如果没有锁定目标
//                        if (1 == spellData.q_is_locking_spell) {
//                            // 该技能需要锁定目标才能释放
//                            NoticeManager.showNotify(LangQ_NoticeInfo.NeedLockSpell);
//                            return CASE_STATE_FAIL;
//                        }
//                        if (castInfo.isReleaseAtMouse) {
//                            // 对鼠标点释放
//                            var scenePosition : Vector3D = Stage3DLayerManager.getPickPositonByMousePositon(SceneManager.getScene().view, Stage3DLayerManager.stage.mouseX, Stage3DLayerManager.stage.mouseY/*, MainRoleManager.getActorSpellHandHight()*/);
//                            if (null == scenePosition) {
//                                // 无效释放点
//                                NoticeManager.showNotify(LangQ_NoticeInfo.TargetInvalid);
//                                return CASE_STATE_FAIL;
//                            }
//                            MainRoleManager.actor.faceToGround(scenePosition.x, scenePosition.y);
//                            if (0 == spellData.q_blink_type) {
//                                var mousePos : Point = new Point(scenePosition.x, scenePosition.y);
//                                angle = MathUtil.getAngle(selfPos.x, selfPos.y, mousePos.x, mousePos.y);
//                                radian = angle * Math.PI / 180;
//                                dist = Point.distance(selfPos, mousePos);
//                                releaseTargetPos = new Point();
//                                if (dist > releaseRange) {
//                                    // 距离大于最大释放距离
//                                    //dist = dist - releaseRange;
//                                    //dist = dist < 0 ? 0 : dist;
//                                    //releaseTargetPos.x = selfPos.x + dist * Math.cos(radian);
//                                    //releaseTargetPos.y = selfPos.y + dist * Math.sin(radian);
//                                    //releaseTargetPos.x = selfPos.x;
//                                    //releaseTargetPos.y = selfPos.y;
//                                    mousePos.x = selfPos.x + releaseRange * Math.cos(radian);
//                                    mousePos.y = selfPos.y + releaseRange * Math.sin(radian);
//                                }
//                                //targetPos = new Point(selfPos.x, selfPos.y);
//                                //releasePos = mousePos;
//								releaseTargetPos = new Point(mousePos.x, mousePos.y);
//								releasePos = new Point(selfPos.x, selfPos.y);
//                            } else {
//                                angle = 270 - MainRoleManager.actor.rotationY;
//                                radian = angle * Math.PI / 180;
//                                releaseTargetPos = new Point();
//                                releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
//                                releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
//                                //targetPos = new Point(selfPos.x, selfPos.y);
//                                releasePos = new Point(selfPos.x, selfPos.y);
//                            }
//                            break;
//                        }
//                        // 在鼠标点释放 暂时无效
//                        if (0 == spellData.q_blink_type) {
//                            releaseTargetPos = new Point(selfPos.x, selfPos.y);
//                            //targetPos = new Point(selfPos.x, selfPos.y);
//                            releasePos = new Point(selfPos.x, selfPos.y);
//                            angle = 270 - MainRoleManager.actor.rotationY;
//                        } else {
//                            angle = 270 - MainRoleManager.actor.rotationY;
//                            radian = angle * Math.PI / 180;
//                            releaseTargetPos = new Point();
//                            releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
//                            releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
//                            //targetPos = new Point(selfPos.x, selfPos.y);
//                            releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//                        }
//                        break;
//                    }
//                    var modeState : int = FightManager.getFightRoleState(SceneRoleSelectManager.selectedRole);
//                    if (modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY &&
//                        modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND) {
//                        NoticeManager.showNotify(LangQ_NoticeInfo.NotAttack);
//                        return CASE_STATE_FAIL;
//                    }
//                    CONFIG::netDebug {
//                        NetDebug.LOG("CastSpellHelper setSpellTarget spellID:" + spellData.q_skillID + " q_hurt_type:" + spellData.q_hurt_type + " releaseRange:" + releaseRange);
//                    }
//                    if (0 == spellData.q_hurt_type) {
//                        // 攻击技能
//                        if (modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY) {
//                            NoticeManager.showNotify(LangQ_NoticeInfo.NotAttack);
//                            return CASE_STATE_FAIL;
//                        }
//                    } else {
//                        // 其他技能
//                        if (modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND) {
//                            NoticeManager.showNotify(LangQ_NoticeInfo.SpellTarget);
//                            return CASE_STATE_FAIL;
//                        }
//                    }
//                    // 符合攻击目标
//                    var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
//                    if ((!_roleList || _roleList.indexOf(selectedRole) == -1) && 
//                        !selectedRole.isInViewDistance) {
//                        // 不在视野范围
//                        NoticeManager.showNotify(LangQ_NoticeInfo.TargetNotInViewDistance);
//                        return CASE_STATE_FAIL;
//                    }
//                    if (selectedRole.stateMachine.isDeadState) {
//                        // 目标已经死亡
//                        NoticeManager.showNotify(LangQ_NoticeInfo.DeadTarget);
//                        return CASE_STATE_FAIL;
//                    }
//                    if (SceneCharType.PLAYER == selectedRole.type) {
//                        // 目标是玩家
//                        if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY) { //敌方 
//                            var areaType : int = AreaMapManager.getRoleInMapDataAreaType(MainRoleManager.actor);
//                            if (areaType == MapAreaTypeEnum.SAFE) {
//                                NoticeManager.showNotify(LangQ_NoticeInfo.CAST_SPELL_IN_SAFE_AREA); //"您在安全区域，不能攻击其他玩家"
//                                return CASE_STATE_FAIL;
//                            }
//                            areaType = AreaMapManager.getRoleInMapDataAreaType(selectedRole);
//                            if (areaType == MapAreaTypeEnum.SAFE) {
//                                NoticeManager.showNotify(LangQ_NoticeInfo.CAST_SPELL_TARGET_IN_SAFE_AREA); //"对方处于安全区中，不能被攻击"
//                                return CASE_STATE_FAIL;
//                            }
//                            
//                            if (MapDataManager.currentScene && MapDataManager.currentScene.isNewHeroProtect) {
//                                //新手保护
//                                var protectLevel : int = 35;
//                                if (ClientConfig.isBanShu) { //版署 
//                                    protectLevel = 69;
//                                }
//                                var selectedData : RoleData = selectedRole.data as RoleData;
//                                if (MainRoleManager.actorInfo.totalStat.level <= protectLevel) {
//                                    NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelfIsProtect); //"70级以下为新手保护期，不能攻击其他玩家"
//                                    return CASE_STATE_FAIL;
//                                } else if (MainRoleManager.actorInfo.totalStat.level > protectLevel && 
//                                    selectedData.totalStat.level <= protectLevel) {
//                                    NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedIsProtect); //"70级以下为新手保护期，对方不能被攻击"
//                                    return CASE_STATE_FAIL;
//                                }
//                            }
//                        }
//                    }
//                    targetRole = selectedRole;
//                    //MainRoleManager.actor.faceToGround(targetRole.x, targetRole.y);
//                    var targetRadius : int = (targetRole.data as RoleData).bodyRadius; //处理半径
//                    var keepSpacing : int = spellData.q_keep_spacing;
//                    
//                    targetServerID = (targetRole.data as BaseEntityData).serverID;
//                    targetID = targetRole.id;
//                    releaseTargetPos = new Point(targetRole.x, targetRole.z);
//                    //targetPos = new Point(selfPos.x, selfPos.y);
//                    releasePos = new Point(selfPos.x, selfPos.y);
//
//                    MainRoleManager.actor.faceToGround(releaseTargetPos.x, releaseTargetPos.y);
//                    
//                    if (targetRole.isMainChar) {
//                        angle = 270 - MainRoleManager.actor.rotationY;
//                    } else {
//                        angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
//                    }
//                    radian = angle * Math.PI / 180;
//                    var dx : Number = Math.cos(radian);
//                    var dy : Number = Math.sin(radian);
//                    
//                    if (0 == spellData.q_blink_type) {
//                        //var mousePos : Point = new Point(releasePos.x, releasePos.y);
//                        angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
//                        radian = angle * Math.PI / 180;
//                        dist = Point.distance(selfPos, releaseTargetPos);
//                        //releaseTargetPos = new Point(selfPos.x, selfPos.y);
//                        if (dist > releaseRange) {
//                            // 距离大于最大释放距离
//                            dist = dist - releaseRange;
//                            dist = dist < 0 ? 0 : dist;
//							releasePos.x = selfPos.x + dist * Math.cos(radian);
//							releasePos.y = selfPos.y + dist * Math.sin(radian);
//                            //releaseTargetPos.x = selfPos.x;
//                            //releaseTargetPos.y = selfPos.y;
//                            //mousePos.x = selfPos.x + releaseRange * Math.cos(radian);
//                            //mousePos.y = selfPos.y + releaseRange * Math.sin(radian);
//                        } else {
//							//releaseTargetPos.x = mousePos.x;
//							//releaseTargetPos.y = mousePos.y;
//						}
//                        //targetPos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//                    } else {
//                        angle = 270 - MainRoleManager.actor.rotationY;
//                        radian = angle * Math.PI / 180;
//                        releaseTargetPos = new Point();
//                        releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
//                        releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
//                        //targetPos = new Point(selfPos.x, selfPos.y);
//                        releasePos = new Point(selfPos.x, selfPos.y);
//                    }
//                } while (false);
//            }
//			else if (spellData.q_is_locking_spell) //锁定技或者在挂机时都需要目标
//			{
//				var nearCanAtkRole : SceneRole;
//				var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
//				if (selectedRole && (!_roleList || _roleList.indexOf(selectedRole) == -1) && !selectedRole.isInViewDistance)
//				{
//					selectedRole = null;
//				}
//				if (selectedRole && selectedRole.usable && selectedRole.isInViewDistance && !selectedRole.stateMachine.isDeadState)
//				{
//					var modeState : int = FightManager.getFightRoleState(selectedRole, spellData);
//					if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY || modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
//					{
//						if (selectedRole.type == SceneCharType.PLAYER)
//						{
//							if (_autoAtkNearRole)
//							{
//								nearCanAtkRole = getNearestCanAtkRole(spellData);
//								if (nearCanAtkRole)
//								{
//									targetRole = nearCanAtkRole;
//								}
//							}
//							else
//							{
//								if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY) //敌方
//								{
//									var areaType : int = AreaMapManager.getRoleInMapDataAreaType(MainRoleManager.actor);
//									if (areaType == MapAreaTypeEnum.SAFE)
//									{
//										NoticeManager.showNotify(LangQ_NoticeInfo.CAST_SPELL_IN_SAFE_AREA); //"您在安全区域，不能攻击其他玩家"
//										return CASE_STATE_FAIL;
//									}
//									areaType = AreaMapManager.getRoleInMapDataAreaType(selectedRole);
//									if (areaType == MapAreaTypeEnum.SAFE)
//									{
//										NoticeManager.showNotify(LangQ_NoticeInfo.CAST_SPELL_TARGET_IN_SAFE_AREA); //"对方处于安全区中，不能被攻击"
//										return CASE_STATE_FAIL;
//									}
//
//									if (MapDataManager.currentScene && MapDataManager.currentScene.isNewHeroProtect)
//									{
//										//新手保护
//										var protectLevel : int = 35;
//										if (ClientConfig.isBanShu) //版署
//										{
//											protectLevel = 69;
//										}
//										var selectedData : RoleData = selectedRole.data as RoleData;
//										if (MainRoleManager.actorInfo.totalStat.level <= protectLevel)
//										{
//											NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelfIsProtect); //"70级以下为新手保护期，不能攻击其他玩家"
//											return CASE_STATE_FAIL;
//										}
//										else if (MainRoleManager.actorInfo.totalStat.level > protectLevel && selectedData.totalStat.level <= protectLevel)
//										{
//											NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedIsProtect); //"70级以下为新手保护期，对方不能被攻击"
//											return CASE_STATE_FAIL;
//										}
//									}
//								}
//								targetRole = selectedRole;
//							}
//						}
//						else
//						{
//							if (selectedRole.type == SceneCharType.BIAO_CHE) //镖车
//							{
////								if (CountryManager.isAtMyCountry())
////									NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedOnlyOtherCountryBiao); //"攻击本国镖车无效"
//							}
//							targetRole = selectedRole;
//						}
//					}
//					else
//					{
//						if (_autoAtkNearRole)
//						{
//							nearCanAtkRole = getNearestCanAtkRole(spellData);
//							if (nearCanAtkRole)
//							{
//								targetRole = nearCanAtkRole;
//							}
//						}
//						else
//						{
//							if (selectedRole.type == SceneCharType.PLAYER)
//							{
//								if (spellData.q_target == SpellTargetType.FRIEND)
//								{
//									NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedOnlyUseToFriend); //"该技能只能对友方释放"
//									return CASE_STATE_FAIL;
//								}
//								else if (spellData.q_target == SpellTargetType.TEAM)
//								{
//									NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedOnlyUseToTeam); //"该技能只能对队友释放"
//									return CASE_STATE_FAIL;
//								}
//							}
//							else if (selectedRole.type == SceneCharType.BIAO_CHE) //镖车
//							{
////								if (CountryManager.isAtMyCountry())
////								{
////									NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedOnlyOtherCountryBiao); //"攻击本国镖车无效"
////									return CASE_STATE_FAIL;
////								}
//							}
//							NoticeManager.showNotify(LangQ_NoticeInfo.SpellSelectedUnAttackable); //"当前选择的目标不可攻击"
//							return CASE_STATE_FAIL;
//						}
//					}
//				}
//				else if (_autoAtkNearRole)
//				{
//					nearCanAtkRole = getNearestCanAtkRole(spellData);
//					if (nearCanAtkRole)
//					{
//						targetRole = nearCanAtkRole;
//					}
//				}
//
//				if (!targetRole)
//				{
//					if (spellData.q_target == SpellTargetType.FRIEND || spellData.q_target == SpellTargetType.TEAM) //对友方施放的技能，无目标默认对自己释放。
//					{
//						targetRole = MainRoleManager.actor;
//					}
//				}
//
//				if (targetRole)
//				{
//					var targetRadius : int = (targetRole.data as RoleData).bodyRadius; //处理半径
//					var keepSpacing : int = spellData.q_keep_spacing;
//
//					targetServerID = (targetRole.data as BaseEntityData).serverID;
//					targetID = targetRole.id;
//					releaseTargetPos = new Point(targetRole.x, targetRole.z);
//					targetPos = new Point(selfPos.x, selfPos.y);
//					releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//
//					if (targetRole.isMainChar)
//					{
//						angle = 270 - MainRoleManager.actor.rotationY;
//					}
//					else
//					{
//						angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
//					}
//					radian = angle * Math.PI / 180;
//					var dx : Number = Math.cos(radian);
//					var dy : Number = Math.sin(radian);
//					var releaseDist : int = Point.distance(selfPos, releaseTargetPos);
//
//					var releaseRadius : int;
//					var targetRangeSpacing : int;
//					if (spellData.q_blink_type == 0)
//					{
//						releaseRadius = releaseRange/* + hurtRange*/;
//						targetRangeSpacing = (keepSpacing > 0 && keepSpacing < releaseRadius) ? keepSpacing : releaseRadius;
//					}
//					else
//					{
//						releaseRadius = releaseRange /*+ ((keepSpacing > 0 && keepSpacing < hurtRange) ? keepSpacing : hurtRange)*/;
//						targetRangeSpacing = releaseRadius;
//					}
//					targetRangeSpacing = targetRangeSpacing + targetRadius - DEVIATION_RANGE;
//					targetRangeSpacing = targetRangeSpacing < 0 ? 0 : targetRangeSpacing;
//					dist = releaseDist - targetRangeSpacing;
//					dist = dist < 0 ? 0 : dist;
//					targetPos.x = selfPos.x + dist * dx;
//					targetPos.y = selfPos.y + dist * dy;
//
//					var releaseRangeSpacing : int = 0/*(keepSpacing > 0 && keepSpacing < hurtRange) ? keepSpacing : hurtRange*/;
//					releaseRangeSpacing = releaseRangeSpacing + targetRadius - DEVIATION_RANGE;
//					releaseRangeSpacing = releaseRangeSpacing < 0 ? 0 : releaseRangeSpacing;
//					dist = releaseDist - releaseRangeSpacing;
//					dist = dist < 0 ? 0 : dist;
//					dist = dist > releaseRange ? releaseRange : dist;
//
//					releasePos.x = selfPos.x + dist * dx;
//					releasePos.y = selfPos.y + dist * dy;
//
//					if (!targetRole.isMainChar)
//						SceneRoleSelectManager.selectedRole = targetRole;
//				}
//				else
//				{
//					if (!_autoAtkNearRole)
//					{
//						NoticeManager.showNotify(LangQ_NoticeInfo.SpellNeedSelectedAttackable); //"未选择目标，无法施放该技能"
//					}
//					return CASE_STATE_FAIL;
//				}
//			}
//			else if (castInfo.isReleaseAtMouse) //对鼠标点施放的技能
//			{
//				var scenePosition : Vector3D = Stage3DLayerManager.getPickPositonByMousePositon(SceneManager.getScene().view, Stage3DLayerManager.stage.mouseX, Stage3DLayerManager.stage.mouseY/*, MainRoleManager.getActorSpellHandHight()*/);
//				if (spellData.q_blink_type == 0)
//				{
//					if (scenePosition)
//					{
//						releaseRange = releaseRange - DEVIATION_RANGE;
//						releaseRange = releaseRange < 0 ? 0 : releaseRange;
//	
//						var mousePos : Point = new Point(scenePosition.x, scenePosition.y);
//						angle = MathUtil.getAngle(selfPos.x, selfPos.y, mousePos.x, mousePos.y);
//						radian = angle * Math.PI / 180;
//						dist = Point.distance(selfPos, mousePos);
//						
//						releaseTargetPos = new Point();
//						if (dist > releaseRange)
//						{
//							dist = dist - releaseRange;
//							dist = dist < 0 ? 0 : dist;
//							
//							releaseTargetPos.x = selfPos.x + dist * Math.cos(radian);
//							releaseTargetPos.y = selfPos.y + dist * Math.sin(radian);
//						}
//						else
//						{
//							releaseTargetPos.x = selfPos.x;
//							releaseTargetPos.y = selfPos.y;
//						}
//						
//						targetPos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//						releasePos = mousePos;
//					}
//				}
//				else
//				{
//					if (scenePosition)
//					{
//						MainRoleManager.actor.faceToGround(scenePosition.x, scenePosition.y);
//					}
//					
//					angle = 270 - MainRoleManager.actor.rotationY;
//					radian = angle * Math.PI / 180;
//					releaseRange = releaseRange - DEVIATION_RANGE;
//					releaseRange = releaseRange < 0 ? 0 : releaseRange;
//					releaseTargetPos = new Point();
//					releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
//					releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
//					targetPos = new Point(selfPos.x, selfPos.y);
//					releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//				}
//			}
//			else
//			{
//				if (spellData.q_blink_type == 0)
//				{
//					releaseTargetPos = new Point(selfPos.x, selfPos.y);
//					targetPos = new Point(selfPos.x, selfPos.y);
//					releasePos = new Point(selfPos.x, selfPos.y);
//					angle = 270 - MainRoleManager.actor.rotationY;
//				}
//				else
//				{
//					angle = 270 - MainRoleManager.actor.rotationY;
//					radian = angle * Math.PI / 180;
//					releaseRange = releaseRange - DEVIATION_RANGE;
//					releaseRange = releaseRange < 0 ? 0 : releaseRange;
//					releaseTargetPos = new Point();
//					releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
//					releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
//					targetPos = new Point(selfPos.x, selfPos.y);
//					releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);
//				}
//			}
//			}

			var range : int =  Point.distance(releasePos, releaseTargetPos);
			range = range + DEVIATION_RANGE;
			angle = (angle + 360) % 360;
			castInfo.targetServerID = targetServerID;
			castInfo.targetID = targetID;
			castInfo.targetPos = releasePos;
			castInfo.releasePos = releaseTargetPos;
			castInfo.angle = angle;
			castInfo.range = range;
			//判断范围
			tempVector3D.setTo(releasePos.x, releasePos.y, 0);
			var districtWithPath : DistrictWithPath = SceneManager.getDistrict();
			//var path : Vector.<Vector3D> = PathFinderUtil.findPath(districtWithPath, MainRoleManager.actor.position, tempVector3D);
			var path : Vector.<Vector3D> = PolyUtil.findPath(districtWithPath, MainRoleManager.actor.position, tempVector3D);
			dist = Point.distance(selfPos, releaseTargetPos);
			var inRange : Boolean;
			
			if (spellData.q_blink_type != 0)
			{
				return CASE_STATE_SUCCEED;
			}
			
			if (path)
			{
				inRange = (path.length == 2) && (dist <= 50);
				if (!inRange)
				{
					return CASE_STATE_NOT_IN_RELEASE_RANGE;
				}
			}
			else
			{
				inRange = dist <= range;
				if (!inRange)
				{
					return CASE_STATE_NOT_IN_RELEASE_RANGE;
				}
			}
			return CASE_STATE_SUCCEED;
		}

		/**
		 * 目标技能区域点　@L.L.M.Sunny 20150819
		 * @param spellData
		 * @return
		 *
		 */
		/*private static function getRangeTargetPos(spellData : Q_skill_model) : Point
		{
			var range : int = getReleaseRangle(spellData);
			range = range < 0 ? 0 : range;
			var angle : Number = 270 - MainRoleManager.actor.rotationY;
			var angleRad : Number = angle * Math.PI / 180;
			var cosV : Number = Math.cos(angleRad);
			var sinV : Number = Math.sin(angleRad);
			var targetPos : Point = new Point(MainRoleManager.actor.x + range * cosV, MainRoleManager.actor.z + range * sinV);
			return targetPos;
		}*/
        
        private static function getCanAtkRole(list : Vector.<SceneRole>, skillInfo : Q_skill_model, isDie : Boolean, distance : int = int.MAX_VALUE) : SceneRole {
            if (null == list || list.length < 1) {
                return null;
            }
            var selectRole : SceneRole = null;
            var modeState : int;
            if (null != SceneRoleSelectManager.selectedRole) {
                if (isDie != SceneRoleSelectManager.selectedRole.stateMachine.isDeadState) {
                    goto check_relation_auto_lock;
                }
                if (0 == skillInfo.q_check_relation) {
                    return SceneRoleSelectManager.selectedRole;
                }
                modeState = FightManager.getFightRoleState(SceneRoleSelectManager.selectedRole, skillInfo);
                if (FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT != modeState) {
                    return SceneRoleSelectManager.selectedRole;
                }
                check_relation_auto_lock:if (1 == skillInfo.q_check_relation_auto_lock) {
                    goto find;
                }
            }
            if (0 == skillInfo.q_auto_lock) {
                return null;
            }
            find:
				
				for each (var role : SceneRole in list)
				{
					if (MainRoleManager.actor == role) {
						// 自己
						continue;
					}
					if (!role || !role.usable || !role.isInViewDistance) {
						continue;
					}
					if (isDie != role.stateMachine.isDeadState) {
						continue;
					}
					if (0 != distance && distance != int.MAX_VALUE) {
						var disA : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, role.x, role.z);
						if (disA > distance) {
							continue;
						}
					}
					
					if (0 == skillInfo.q_check_relation) {
						return role;
					}
					modeState = FightManager.getFightRoleState(role, skillInfo);
					if (FightManager.FIGHT_ROLE_STATE_CAN_NOT_FIGHT == modeState)
					{
						continue;
					}
                return role;
                break;
            }
            return null;
        }
		
		
		
		
		/**搜索视野中所有元素*/
		public static function getNearestCanAtkRole(spellData : Q_skill_model, next : Boolean) : SceneRole
		{
			var list : Vector.<SceneRole> = _roleList ? _roleList : SceneManager.getSceneRoleList();
			list.sort(onSortNearestRole);
			//
            var find : Boolean = false;
			for each (var role : SceneRole in list)
			{
				if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var modeState : int = FightManager.getFightRoleState(role, spellData);
					if (modeState != FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY) {
                        continue;
                    }
                    if (MainRoleManager.actor == role) {
                        // 自己
                        continue;
                    }
                    var dis : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, role.x, role.z);
                    if (dis > 250000) {
                        // 超过10格
                        if (SceneCharType.PLAYER == role.type) {
                            continue;
                        }
                        break;
                    }
                    if (SceneCharType.PLAYER == role.type) {
                        return role;
                    }
                    if (null == SceneRoleSelectManager.selectedRole) {
                        return role;
                    }
                    if (!next) {
                        return role;
                    }
                    if (SceneRoleSelectManager.selectedRole == role) {
                        find = true;
                    } else if (find) {
                        return role;
                    }
				}
			}
            if (find) {
                return getNearestCanAtkRole(spellData, false);
            }
			return null;
		}

		/**
		 * 比较两个角色里主角的距离
		 * @param charA
		 * @param charB
		 * @return
		 */
		public static function onSortNearestRole(roleA : SceneRole, roleB : SceneRole) : int
		{
            if (roleA.type != roleB.type) {
                return parseInt(roleA.type) - parseInt(roleB.type);
            }
			var disA : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleA.x, roleA.z);
			var disB : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleB.x, roleB.z);
			if (disA > disB)
			{
				return 1;
			}
			else
			{
				return -1;
			}
			return 0;
		}

		/**
		 * 获得一个可以释放的技能数据 
		 * @param spellID
		 * @return 
		 * 
		 */		
		public static function getSpellData(spellID : int) : Q_skill_model
		{
			var spellProto : Q_skill_model = ShortcutsManger.getInstance().getTempSellProto(spellID);
			if (spellProto != null)
			{
				return spellProto;
			}
			return MainRoleManager.actorInfo.spellList.getSpell(spellID);
		}

		public static function hasSpellCanCast() : Boolean
		{
			var defaultSpell : Q_skill_model = getDefaultSpell();
			return defaultSpell != null;
		}

		public static function getDefaultSpell() : Q_skill_model
		{
			var defaultSpell : Q_skill_model = MainRoleManager.actorInfo.spellList.getDefaultSpell();
			return defaultSpell;
		}

		public static function getNextCastSpell() : Q_skill_model
		{
			//我们没有要求必须拿武器才能放技能
//			var race : int = 0;
//			var itemInfo : ItemInfo = MainRoleManager.actorInfo.equipInfo.getItemInfoByPos(EquipmentPos.POS_WEAPON);
//			if (itemInfo)
//			{
//				race = ItemCfgData.getEquipmentRace(itemInfo.cfgId);
//			}
//			else //没有穿戴武器不能释放技能
//			{
//				return null;
//			}

			var castSpell : Q_skill_model = null;
			var spellData : Q_skill_model;
			var i : int = 0;
			var len : int = MainRoleManager.actorInfo.spellList.getAutoSpellLen();
			while (i++ < len)
			{
				var spellID : int = MainRoleManager.actorInfo.spellList.getNextAutoSpellID();
				spellData = getSpellData(spellID);
				if (spellData && !SkillCDManager.getInstance().getSkillHasCDTime(spellData))
				{
					castSpell = spellData;
					break;
				}
			}
			if (!castSpell)
			{
				spellData = getDefaultSpell();
				if (spellData)
				{
					if (!SkillCDManager.getInstance().getSkillHasCDTime(spellData))
					{
						castSpell = spellData;
					}
					else
					{
						var relateSpells : Vector.<Q_skill_model> = SpellDataManager.getRelateSpells(spellData.q_relate_spells);
						for each (var tmpData : Q_skill_model in relateSpells)
						{
							if (!SkillCDManager.getInstance().getSkillHasCDTime(tmpData))
							{
								castSpell = spellData;
								break;
							}
						}
					}
				}
			}
			return castSpell;
		}
		
		public static function checkCanUseSpell(spellData:Q_skill_model):Boolean
		{
			return spellData && !SkillCDManager.getInstance().getSkillHasCDTime(spellData) && getspellIsOK(spellData);
		}
		
		/**找一个合适的技能释放。根据优先级*/
		public static function getSortCastSpell() : Q_skill_model
		{
		
			var castSpell : Q_skill_model = null;
			var spellData : Q_skill_model;
			
			var i : int = 0;
			
			var ctrl:ControlAutoFightSelectSkill=TrusteeshipManager.getInstance().autoSkillCtrl;
			var len : int = ctrl.skillNum;
			var skillId:int=0;
			for(i=0;i<len;i++)
			{
				skillId=ctrl.getNextSkillId();
				//没学习过
				if (MainRoleManager.actorInfo.spellList.getSkillInfo(skillId)==null) 
				{
					continue;
				}
				spellData=MainRoleManager.actorInfo.spellList.getSpell(skillId);
				if (spellData && checkCanUseSpell(spellData))
				{
					castSpell = spellData;
					break;
				}
			}
			/*
			if (false&&!castSpell)
			{
				spellData = getDefaultSpell();
				if (spellData)
				{
					if (!SkillCDManager.getInstance().getSkillHasCDTime(spellData))
					{
						castSpell = spellData;
					}
					else
					{
						var relateSpells : Vector.<Q_skill_model> = SpellDataManager.getRelateSpells(spellData.q_relate_spells);
						for each (var tmpData : Q_skill_model in relateSpells)
						{
							if (!SkillCDManager.getInstance().getSkillHasCDTime(tmpData))
							{
								castSpell = spellData;
								break;
							}
						}
					}
				}
			}*/
			
			if (!castSpell)
			{
				castSpell=MainRoleManager.actorInfo.spellList.getFirstSpell();
			}
			//ChatManager.addMsgInChat("释放技能："+castSpell.q_skillID,0);
			return castSpell;
		}
		
		/**技能是否满足是否条件*/
		public static function getspellIsOK(spell : Q_skill_model):Boolean
		{
			var nuta:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_TA);
			var nuqi:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_NU_QI);
			var nengliang:int = MainRoleManager.actorInfo.totalStat.getStatValue(CharAttributeType.MP);
			var jingzheng:int = MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_JING_ZHENG);
			var recovers:String=spell.q_recovers;
			var recoObj:Object;
			var recoData:Array;
			var isGary:Boolean=false;
			if(recovers!="")
			{
				recoObj=JSON.parse(recovers);
			}
			else
			{
				return true;
			}
			if(recoObj!=null)
			{
				recoData=recoObj as Array;
			}
			
			if(recoData!=null&&recoData.length>0)
			{
				var i:int,length:int;
				length=recoData.length;
				for(i=0;i<length;i++)
				{
					switch(recoData[i].rt)
					{
						case 100://仇恨
							
							break;
						case 101://血量
							
							break;
						case 102://能量
							if(nengliang>=(-recoData[i].rv))
							{
								isGary=true;
							}
							else
							{
								return false;
							}
							break;
						case 12://怒气
							if(nuqi>=(-recoData[i].rv))
							{
								isGary=true;
							}
							else
							{
								return false;
							}
							break;
						case 13://金针
							if(jingzheng>=(-recoData[i].rv))
							{
								isGary=true;
							}
							else
							{
								return false;
							}
							break;
						case 14://弩塔
							if(nuta>=(-recoData[i].rv))
							{
								isGary=true;
							}
							else
							{
								return false;
							}
							break;
					}
				}
			}
			return isGary;
		}
	}
}
