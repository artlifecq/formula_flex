package com.rpgGame.app.fight.spell
{
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.SkillCDManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
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
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.role.BaseEntityData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.type.SpellTargetType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import away3d.pathFinding.DistrictWithPath;
	
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
			
			if(!relateSpells)
			{
				GameLog.add("这个技能没有连招哦！！！");
				return _caseSpell;
			}
			
			if (_relateSpellIndex < 0)
			{
				_relateSpellIndex++;
				return _caseSpell;
			}
			else if (_relateSpellIndex >= relateSpells.length)
			{
				_relateSpellIndex = 0;
				return _caseSpell;
			}
			else
			{
				var currIndex : int = _relateSpellIndex;
				_relateSpellIndex++;
				return relateSpells[currIndex];
			}
		}

		public static function shortcutsTryCaseSpell(spellID : int) : void
		{
			var cased : Boolean = tryCaseSpell(new CastSpellInfo(getSpellData(spellID)));
//			if (!cased)
//				TrusteeshipManager.getInstance().nextSpell = getSpellData(spellType);
		}

		public static function tryCaseSpell(caseInfo : CastSpellInfo, roleList : Vector.<SceneRole> = null, autoAtkNearRole : Boolean = false) : Boolean
		{
			_roleList = roleList;
			_autoAtkNearRole = autoAtkNearRole;
			var caseState : int = caseSpell(caseInfo, true);
			if (!caseInfo.caseSpellData)
				return false;
			var targerRole : SceneRole = null;
			if (caseState == CASE_STATE_SUCCEED)
			{
				requestReleaseSpell();
			}
			else if (caseState == CASE_STATE_NOT_IN_RELEASE_RANGE)//距离过远
			{
				if (caseInfo.targetPos)
				{
					if (caseInfo.targetID > 0)
						targerRole = SceneManager.getSceneObjByID(caseInfo.targetID) as SceneRole;
					RoleStateUtil.walk(MainRoleManager.actor, caseInfo.targetPos.x, caseInfo.targetPos.y, 0, caseInfo, onWalkArriveRelease, onWalkThroughCase);
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
					info.readFrom(1,null);
					ReleaseSpellHelper.releaseSpell(info);
				}
				else
				{
					var angle : int = (360 - caseInfo.angle) % 360;
					var ref : CastSpellLockStateReference = MainRoleManager.actor.stateMachine.getReference(CastSpellLockStateReference) as CastSpellLockStateReference;
					var spellEffectData : Q_SpellEffect = caseInfo.spellEffectData;
					ref.setParams(spellEffectData);
					MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_CAST_SPELL_LOCK, ref);
					SpellSender.releaseSpell(caseInfo.caseSpellData.q_skillID, caseInfo.releasePos.x, caseInfo.releasePos.y, angle, caseInfo.targetServerID);
				}
			}

			function onWalkArriveRelease(ref : WalkMoveStateReference) : void
			{
				caseState = caseSpell(caseInfo);
				if (caseState == CASE_STATE_SUCCEED)
				{
					requestReleaseSpell();
				}
			}

			function onWalkThroughCase(ref : WalkMoveStateReference) : void
			{
				if (!targerRole || !targerRole.usable || targerRole.stateMachine.isDeadState)
					return;
				var dist : Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, targerRole.x, targerRole.z);
				var range : int = caseInfo.range;
				if ((!ref.path || ref.path.length < 1) && dist <= range * range)
				{
					caseState = caseSpell(caseInfo);
					if (caseState == CASE_STATE_SUCCEED)
					{
						requestReleaseSpell();
					}
					else if (caseState == CASE_STATE_NOT_IN_RELEASE_RANGE)
					{
						if (caseInfo.targetPos)
						{
							RoleStateUtil.walk(MainRoleManager.actor, caseInfo.targetPos.x, caseInfo.targetPos.y, 0, caseInfo, onWalkArriveRelease, onWalkThroughCase);
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
		public static function caseSpell(castInfo : CastSpellInfo, relateSelectable : Boolean = false) : int
		{
			if (!castInfo.spellData)
			{
				return CASE_STATE_FAIL;
			}

			if (!ShortcutsManger.getInstance().isTempSpellBar)
			{
				//暂时不需要这个功能（没有武器时，不能释放技能）
//				var itemInfo : ItemInfo = MainRoleManager.actorInfo.equipInfo.getItemInfoByPos(EquipmentPos.POS_WEAPON);
//				if (itemInfo)
//				{
//					var race : int = ItemCfgData.getEquipmentRace(itemInfo.cfgId);
//					if (castInfo.spellData.race != race)
//					{
//						if (!_autoAtkNearRole)
//						{
//							NoticeManager.showNotify(LangNoticeInfo.CastSpellNoAccordWithWeapon); //"穿戴的武器不能释放该技能"
//						}
//						return CASE_STATE_FAIL;
//					}
//				}
//				else
//				{
//					if (!_autoAtkNearRole)
//					{
//						NoticeManager.showNotify(LangNoticeInfo.CastSpellHasNoWeapon); //"没有穿戴武器不能释放技能"
//					}
//					return CASE_STATE_FAIL;
//				}
			}

			if (MainRoleManager.actor.stateMachine.isDeadState)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsDead); //"已死亡不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isAttackHarding)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsHarding); //"技能硬直中"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isLockCaseSpell)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsLock); //"释放技能被锁定"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isBlinkMoving)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsBlinking); //"冲锋中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isBeatMoving)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsBeatMoving); //"被击退中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isStun)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsStun); //"眩晕中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (MainRoleManager.actor.stateMachine.isHush)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.CastSpellIsHush); //"沉默中不能放技能"
				}
				return CASE_STATE_FAIL;
			}
			else if (!MainRoleManager.actor.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
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
			GameLog.add("========================================将要释放技能：" + spellData.q_skillID);
			if (!spellData)
			{
				return CASE_STATE_FAIL;
			}
			//技能CD中不能释放技能
			if (SkillCDManager.getInstance().getSkillHasCDTime(spellData))
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.SpellIsCD); //"技能正在冷却"
				}
				return CASE_STATE_FAIL;
			}
			if (castInfo.isReleaseOnlyUpMount)
			{
				if (!_autoAtkNearRole)
				{
					NoticeManager.showNotify(LangNoticeInfo.SpellIsOnlyUpMount); //"该技能只能在马上释放"
				}
				return CASE_STATE_FAIL;
			}
			var state : int = setSpellTarget(castInfo);
			return state;
		}

		/**
		 * 获取技能目标,返回一个目标或者点
		 * @param spellData
		 * @return
		 *
		 */
		private static function setSpellTarget(castInfo : CastSpellInfo) : int
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
					NoticeManager.showNotify(LangNoticeInfo.CAST_SPELL_FORBID_IN_AREA); //"本区域内不能使用该技能"
				}
				return CASE_STATE_FAIL;
			}
			var releaseRange : int = spellData.q_range_limit * SceneConfig.TILE_HEIGHT;
//			var hurtRange : int = spellData.activeSpell.hurtRange;
			var targetServerID : long = null;
			var targetID:Number = 0;
			var targetRole : SceneRole = null;
			var releaseTargetPos : Point = null;
			var targetPos : Point = null;
			var releasePos : Point = null;
			var dist : int = 0;
			var radian : Number = 0;
			var angle : int = 0;
			var selfPos : Point = new Point(MainRoleManager.actor.x, MainRoleManager.actor.z);
			if (spellData.q_target == SpellTargetType.SELF) //对自己施放的技能
			{
				if (MainRoleManager.isDriveZhanChe)
				{
//					targetID = CountryWarZhanCheManager.getZhanCheID(MainRoleManager.actorID);
				}
				else
				{
					targetServerID = MainRoleManager.actorInfo.serverID;
					targetID = MainRoleManager.actorID;
				}
				angle = 270 - MainRoleManager.actor.rotationY;
				releaseTargetPos = new Point(selfPos.x, selfPos.y);
				targetPos = new Point(selfPos.x, selfPos.y);
				releasePos = new Point(selfPos.x, selfPos.y);
			}
			else if (spellData.is_locking_spell) //锁定技或者在挂机时都需要目标
			{
				var nearCanAtkRole : SceneRole;
				var selectedRole : SceneRole = SceneRoleSelectManager.selectedRole;
				if (selectedRole && (!_roleList || _roleList.indexOf(selectedRole) == -1) && !selectedRole.isInViewDistance)
				{
					selectedRole = null;
				}
				if (selectedRole && selectedRole.usable && selectedRole.isInViewDistance && !selectedRole.stateMachine.isDeadState)
				{
					var modeState : int = FightManager.getFightRoleState(selectedRole, spellData);
					if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY || modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_FRIEND)
					{
						if (selectedRole.type == SceneCharType.PLAYER)
						{
							if (_autoAtkNearRole)
							{
								nearCanAtkRole = getNearestCanAtkRole(spellData);
								if (nearCanAtkRole)
								{
									targetRole = nearCanAtkRole;
								}
							}
							else
							{
								if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY) //敌方
								{
									var areaType : int = AreaMapManager.getRoleInMapDataAreaType(MainRoleManager.actor);
									if (areaType == MapAreaTypeEnum.SAFE)
									{
										NoticeManager.showNotify(LangNoticeInfo.CAST_SPELL_IN_SAFE_AREA); //"您在安全区域，不能攻击其他玩家"
										return CASE_STATE_FAIL;
									}
									areaType = AreaMapManager.getRoleInMapDataAreaType(selectedRole);
									if (areaType == MapAreaTypeEnum.SAFE)
									{
										NoticeManager.showNotify(LangNoticeInfo.CAST_SPELL_TARGET_IN_SAFE_AREA); //"对方处于安全区中，不能被攻击"
										return CASE_STATE_FAIL;
									}

									if (MapDataManager.currentScene && MapDataManager.currentScene.isNewHeroProtect)
									{
										//新手保护
										var protectLevel : int = 35;
										if (ClientConfig.isBanShu) //版署
										{
											protectLevel = 69;
										}
										var selectedData : RoleData = selectedRole.data as RoleData;
										if (MainRoleManager.actorInfo.totalStat.level <= protectLevel)
										{
											NoticeManager.showNotify(LangNoticeInfo.SpellSelfIsProtect); //"70级以下为新手保护期，不能攻击其他玩家"
											return CASE_STATE_FAIL;
										}
										else if (MainRoleManager.actorInfo.totalStat.level > protectLevel && selectedData.totalStat.level <= protectLevel)
										{
											NoticeManager.showNotify(LangNoticeInfo.SpellSelectedIsProtect); //"70级以下为新手保护期，对方不能被攻击"
											return CASE_STATE_FAIL;
										}
									}
								}
								targetRole = selectedRole;
							}
						}
						else
						{
							if (selectedRole.type == SceneCharType.BIAO_CHE) //镖车
							{
//								if (CountryManager.isAtMyCountry())
//									NoticeManager.showNotify(LangNoticeInfo.SpellSelectedOnlyOtherCountryBiao); //"攻击本国镖车无效"
							}
							targetRole = selectedRole;
						}
					}
					else
					{
						if (_autoAtkNearRole)
						{
							nearCanAtkRole = getNearestCanAtkRole(spellData);
							if (nearCanAtkRole)
							{
								targetRole = nearCanAtkRole;
							}
						}
						else
						{
							if (selectedRole.type == SceneCharType.PLAYER)
							{
								if (spellData.q_target == SpellTargetType.FRIEND)
								{
									NoticeManager.showNotify(LangNoticeInfo.SpellSelectedOnlyUseToFriend); //"该技能只能对友方释放"
									return CASE_STATE_FAIL;
								}
								else if (spellData.q_target == SpellTargetType.TEAM)
								{
									NoticeManager.showNotify(LangNoticeInfo.SpellSelectedOnlyUseToTeam); //"该技能只能对队友释放"
									return CASE_STATE_FAIL;
								}
							}
							else if (selectedRole.type == SceneCharType.BIAO_CHE) //镖车
							{
//								if (CountryManager.isAtMyCountry())
//								{
//									NoticeManager.showNotify(LangNoticeInfo.SpellSelectedOnlyOtherCountryBiao); //"攻击本国镖车无效"
//									return CASE_STATE_FAIL;
//								}
							}
							NoticeManager.showNotify(LangNoticeInfo.SpellSelectedUnAttackable); //"当前选择的目标不可攻击"
							return CASE_STATE_FAIL;
						}
					}
				}
				else if (_autoAtkNearRole)
				{
					nearCanAtkRole = getNearestCanAtkRole(spellData);
					if (nearCanAtkRole)
					{
						targetRole = nearCanAtkRole;
					}
				}

				if (!targetRole)
				{
					if (spellData.q_target == SpellTargetType.FRIEND || spellData.q_target == SpellTargetType.TEAM) //对友方施放的技能，无目标默认对自己释放。
					{
						targetRole = MainRoleManager.actor;
					}
				}

				if (targetRole)
				{
					var targetRadius : int = (targetRole.data as RoleData).bodyRadius; //处理半径
					var keepSpacing : int = spellEffectData.keep_spacing;

					targetServerID = (targetRole.data as BaseEntityData).serverID;
					targetID = targetRole.id;
					releaseTargetPos = new Point(targetRole.x, targetRole.z);
					targetPos = new Point(selfPos.x, selfPos.y);
					releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);

					if (targetRole.isMainChar)
					{
						angle = 270 - MainRoleManager.actor.rotationY;
					}
					else
					{
						angle = MathUtil.getAngle(selfPos.x, selfPos.y, releaseTargetPos.x, releaseTargetPos.y);
					}
					radian = angle * Math.PI / 180;
					var dx : Number = Math.cos(radian);
					var dy : Number = Math.sin(radian);
					var releaseDist : int = Point.distance(selfPos, releaseTargetPos);

					var releaseRadius : int;
					var targetRangeSpacing : int;
					if (spellEffectData.blink_type == 0)
					{
						releaseRadius = releaseRange/* + hurtRange*/;
						targetRangeSpacing = (keepSpacing > 0 && keepSpacing < releaseRadius) ? keepSpacing : releaseRadius;
					}
					else
					{
						releaseRadius = releaseRange /*+ ((keepSpacing > 0 && keepSpacing < hurtRange) ? keepSpacing : hurtRange)*/;
						targetRangeSpacing = releaseRadius;
					}
					targetRangeSpacing = targetRangeSpacing + targetRadius - DEVIATION_RANGE;
					targetRangeSpacing = targetRangeSpacing < 0 ? 0 : targetRangeSpacing;
					dist = releaseDist - targetRangeSpacing;
					dist = dist < 0 ? 0 : dist;
					targetPos.x = selfPos.x + dist * dx;
					targetPos.y = selfPos.y + dist * dy;

					var releaseRangeSpacing : int = 0/*(keepSpacing > 0 && keepSpacing < hurtRange) ? keepSpacing : hurtRange*/;
					releaseRangeSpacing = releaseRangeSpacing + targetRadius - DEVIATION_RANGE;
					releaseRangeSpacing = releaseRangeSpacing < 0 ? 0 : releaseRangeSpacing;
					dist = releaseDist - releaseRangeSpacing;
					dist = dist < 0 ? 0 : dist;
					dist = dist > releaseRange ? releaseRange : dist;

					releasePos.x = selfPos.x + dist * dx;
					releasePos.y = selfPos.y + dist * dy;

					if (!targetRole.isMainChar)
						SceneRoleSelectManager.selectedRole = targetRole;
				}
				else
				{
					if (!_autoAtkNearRole)
					{
						NoticeManager.showNotify(LangNoticeInfo.SpellNeedSelectedAttackable); //"未选择目标，无法施放该技能"
					}
					return CASE_STATE_FAIL;
				}
			}
			else if (castInfo.isReleaseAtMouse) //对鼠标点施放的技能
			{
				var scenePosition : Vector3D = Stage3DLayerManager.getScenePositonByMousePositon(SceneManager.getScene().view, Stage3DLayerManager.stage.mouseX, Stage3DLayerManager.stage.mouseY, MainRoleManager.getActorSpellHandHight());
				if (scenePosition)
				{
					releaseRange = releaseRange - DEVIATION_RANGE;
					releaseRange = releaseRange < 0 ? 0 : releaseRange;

					var mousePos : Point = new Point(scenePosition.x, scenePosition.z);
					angle = MathUtil.getAngle(selfPos.x, selfPos.y, mousePos.x, mousePos.y);
					radian = angle * Math.PI / 180;
					dist = Point.distance(selfPos, mousePos);
					if (dist > releaseRange)
					{
						dist = dist - releaseRange;
						dist = dist < 0 ? 0 : dist;
					}
					releaseTargetPos = new Point();
					releaseTargetPos.x = selfPos.x + dist * Math.cos(radian);
					releaseTargetPos.y = selfPos.y + dist * Math.sin(radian);
					targetPos = new Point(releaseTargetPos.x, releaseTargetPos.y);
					releasePos = mousePos;
				}
			}
			else
			{
				if (spellEffectData.blink_type == 0)
				{
					releaseTargetPos = new Point(selfPos.x, selfPos.y);
					targetPos = new Point(selfPos.x, selfPos.y);
					releasePos = new Point(selfPos.x, selfPos.y);
				}
				else
				{
					angle = 270 - MainRoleManager.actor.rotationY;
					radian = angle * Math.PI / 180;
					releaseRange = releaseRange - DEVIATION_RANGE;
					releaseRange = releaseRange < 0 ? 0 : releaseRange;
					releaseTargetPos = new Point();
					releaseTargetPos.x = selfPos.x + releaseRange * Math.cos(radian);
					releaseTargetPos.y = selfPos.y + releaseRange * Math.sin(radian);
					targetPos = new Point(selfPos.x, selfPos.y);
					releasePos = new Point(releaseTargetPos.x, releaseTargetPos.y);
				}
			}

			var range : int = Point.distance(targetPos, releaseTargetPos);
			range = range + DEVIATION_RANGE;
			angle = (angle + 360) % 360;
			castInfo.targetServerID = targetServerID;
			castInfo.targetID = targetID;
			castInfo.targetPos = releaseTargetPos;
			castInfo.releasePos = releasePos;
			castInfo.angle = angle;
			castInfo.range = range;
			//判断范围
			tempVector3D.setTo(releaseTargetPos.x, 0, releaseTargetPos.y);
			var districtWithPath : DistrictWithPath = SceneManager.getDistrict();
			var path : Vector.<Vector3D> = PathFinderUtil.findPath(districtWithPath, MainRoleManager.actor.position, tempVector3D);
			dist = Point.distance(selfPos, releaseTargetPos);
			var inRange : Boolean;
			if (path)
			{
				inRange = (path.length == 2) && (dist <= range);
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

		private static function getNearestCanAtkRole(spellData : Q_skill_model) : SceneRole
		{
			var list : Vector.<SceneRole> = _roleList ? _roleList : SceneManager.getSceneRoleList();
			list.sort(onSortNearestRole);
			//
			for each (var role : SceneRole in list)
			{
				if (role && role.usable && role.isInViewDistance && !role.stateMachine.isDeadState)
				{
					var modeState : int = FightManager.getFightRoleState(role, spellData);
					if (modeState == FightManager.FIGHT_ROLE_STATE_CAN_FIGHT_ENEMY)
						return role;
				}
			}
			return null;
		}

		/**
		 * 比较两个角色里主角的距离
		 * @param charA
		 * @param charB
		 * @return
		 */
		private static function onSortNearestRole(roleA : SceneRole, roleB : SceneRole) : int
		{
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
			
//			var itemInfo : ItemInfo = MainRoleManager.actorInfo.equipInfo.getItemInfoByPos(EquipmentPos.POS_WEAPON);
//			if (itemInfo)
//			{
//				var race : int = ItemCfgData.getEquipmentRace(itemInfo.cfgId);
//				defaultSpell = RaceCfgData.getDefaultSpell(race);
//			}
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
	}
}
