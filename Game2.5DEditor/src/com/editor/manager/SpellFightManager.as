package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.display.ShapeArea3D;
	import com.editor.enum.FeaturesType;
	import com.editor.enum.SceneCharType;
	import com.editor.enum.SpellBlinkType;
	import com.editor.enum.SpellShapeType;
	import com.editor.events.ConfigListEvent;
	import com.editor.events.SpellFightEvent;
	import com.editor.fight.spell.ReleaseSpellHelper;
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.game.engine3D.utils.MathUtil;

	import mx.controls.Alert;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 技能战斗管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-22 上午10:30:12
	 *
	 */
	public class SpellFightManager
	{
		private static var _instance : SpellFightManager;

		public static function getInstance() : SpellFightManager
		{
			if (!_instance)
				_instance = new SpellFightManager();
			return _instance;
		}

		private var _lastCaseSpellInfo : ConfigData = null;
		private var _enemyEntities : Vector.<SceneRole>;
		private var _attackEntity : SceneRole;
		private var _relateSpellIndex : int = -1;
		private var _releaseRangeShapeArea3D : ShapeArea3D;
		private var _keepSpacingShapeArea3D : ShapeArea3D;
		private var _hurtRangeShapeArea3D : ShapeArea3D;
		public var spellInfo : ReleaseSpellInfo;

		public function SpellFightManager()
		{
		}

		public function init() : void
		{
			_enemyEntities = new Vector.<SceneRole>();
			for (var i : int = 0; i < 3; i++)
			{
				var enemyEntity : SceneRole = SceneRole.create(SceneCharType.MONSTER, i + 1000);
				var enemyData : RoleData = new RoleData();
				enemyEntity.data = enemyData;
				SceneManager.getInstance().addSceneObjToMainScene(enemyEntity, true);
				enemyEntity.canRemoved = false;
				enemyEntity.visible = false;
				_enemyEntities.push(enemyEntity);
			}

			_attackEntity = SceneRole.create(SceneCharType.PLAYER, int.MAX_VALUE);
			var attackData : RoleData = new RoleData();
			_attackEntity.data = attackData;
			SceneManager.getInstance().addSceneObjToMainScene(_attackEntity, true);
			_attackEntity.canRemoved = false;
			_attackEntity.visible = false;

			EventManager.addEvent(SpellFightEvent.HIDE_ENEMY, onHideEnemy);
			EventManager.addEvent(ConfigListEvent.SELECTED_CONFIG_DATA, onReleaseSpell);
		}

		public function updateEnemyEntities(bodyId : String, weaponId : String, mountId : String, mountAnimat : String, hairId : String, animatRes : String) : void
		{
			for each (var enemyEntity : SceneRole in _enemyEntities)
			{
				(enemyEntity.data as RoleData).avatarInfo.setBodyResID(bodyId, animatRes);
				(enemyEntity.data as RoleData).avatarInfo.weaponResID = weaponId;
				(enemyEntity.data as RoleData).avatarInfo.setMountResID(mountId, mountAnimat);
				(enemyEntity.data as RoleData).avatarInfo.hairResID = hairId;
				//执行主换装更新
				AvatarManager.callEquipmentChange(enemyEntity);
				enemyEntity.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
		}

		public function get attackEntity() : SceneRole
		{
			return _attackEntity;
		}

		private function onShowEnemy() : void
		{
			_attackEntity.visible = true;
			for each (var enemyEntity : SceneRole in _enemyEntities)
			{
				enemyEntity.visible = true;
			}
		}

		private function onHideEnemy() : void
		{
			_attackEntity.visible = false;
			for each (var enemyEntity : SceneRole in _enemyEntities)
			{
				enemyEntity.visible = false;
			}
			if (_releaseRangeShapeArea3D)
			{
				_releaseRangeShapeArea3D.dispose();
				_releaseRangeShapeArea3D = null;
			}
			if (_hurtRangeShapeArea3D)
			{
				_hurtRangeShapeArea3D.dispose();
				_hurtRangeShapeArea3D = null;
			}
			if (_keepSpacingShapeArea3D)
			{
				_keepSpacingShapeArea3D.dispose();
				_keepSpacingShapeArea3D = null;
			}
		}

		public function get enemyEntities() : Vector.<SceneRole>
		{
			return _enemyEntities;
		}

		public function get hurtRangeShapeArea3D() : ShapeArea3D
		{
			return _hurtRangeShapeArea3D;
		}

		public function onReleaseSpell(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
			{
				return;
			}
			if (tabel.mFeatureType != FeaturesType.SPELL_TYPE && tabel.mSubFeatureType != FeaturesType.SPELL_TYPE)
				return;
			var avatarTabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
			var avatarConfigDesc : ConfigDesc = avatarTabel ? avatarTabel.getConfigDesc() : null;
			if (!avatarConfigDesc || !avatarConfigDesc.selectedData)
			{
				Alert.show("请选择一个换装角色用于技能展示！", "提示");
				return;
			}
			onShowEnemy();

			if (!_attackEntity.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
				return;
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			var caseSpellData : ConfigData = data;
			var rootData : ConfigData = tabel.desc.selectedData;
			if (!caseSpellData && _lastCaseSpellInfo && tabel.desc.selectedData)
			{
				if (_lastCaseSpellInfo.id == tabel.desc.selectedData.id)
				{
					var list : Array = TabelFieldHelper.getRelateSpellList(tabel.desc.selectedData);
					if (list)
					{
						if (_relateSpellIndex < 0)
						{
							caseSpellData = tabel.desc.selectedData;
						}
						else if (_relateSpellIndex >= list.length - 1)
						{
							caseSpellData = tabel.desc.selectedData;
							_lastCaseSpellInfo = null;
							_relateSpellIndex = -1;
						}
						else
						{
							var relateId : int = list[_relateSpellIndex];
							caseSpellData = ConfigData.getCfg(configDesc, relateId);
						}
						_relateSpellIndex++;
					}
					else
					{
						caseSpellData = null;
					}
				}
				else
				{
					caseSpellData = null;
				}
			}
			if (!caseSpellData)
			{
				caseSpellData = tabel.desc.selectedData;
				_lastCaseSpellInfo = null;
				_relateSpellIndex = -1;
			}

			if (!caseSpellData)
				return;
//			if (_attackEntity.stateMachine.isBlinking)
//				return;
//			if (_attackEntity.stateMachine.isBeatBack)
//				return;
//			if (_attackEntity.stateMachine.isAttacking && !_attackEntity.stateMachine.passTo(RoleStateType.ACTION_ATTACK))
//				return;
//			if (_attackEntity.stateMachine.isDead)
//				return;

			/////////////////////////
			var releaseRange : int = TabelFieldHelper.getReleaseRange(data.tabelName, caseSpellData);
			var keepSpacing : int = TabelFieldHelper.getKeepSpacing(data.tabelName, caseSpellData);
			var hurtRange : int = TabelFieldHelper.getHurtRange(data.tabelName, caseSpellData);
			var hurtShape : int = TabelFieldHelper.getHurtShape(data.tabelName, caseSpellData);
			var hurtAngle : int = TabelFieldHelper.getHurtAngle(data.tabelName, caseSpellData);
			var mBlinkType : int = TabelFieldHelper.getBlinkType(data.tabelName, caseSpellData);
			var isTrackTarget : Boolean = TabelFieldHelper.getIsTrackTarget(data.tabelName, caseSpellData);

			var roleRange : int = releaseRange;
			if (roleRange <= 0)
			{
				roleRange = hurtRange;
			}

			if (mBlinkType == 0)
			{
				if (keepSpacing > 0 && keepSpacing < roleRange)
					roleRange = keepSpacing;
				keepSpacing = 0;
			}

			var enemyEntity : SceneRole;
			var targetEnemyEntity : SceneRole = _enemyEntities[0];
			if ((targetEnemyEntity.data as RoleData).hp <= 0)
			{
				for each (enemyEntity in _enemyEntities)
				{
					(enemyEntity.data as RoleData).hp = 100;
					enemyEntity.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
				}
			}

			if (!_attackEntity.stateMachine.isAttacking)
			{
				var rotationY : int = AvatarPreviewManager.rotationY;
				var enemyDist : int = roleRange * 0.5;
				var dx : int = MathUtil.getDxByAngle(enemyDist, rotationY);
				var dy : int = MathUtil.getDyByAngle(enemyDist, rotationY);
				_attackEntity.setGroundXY(SceneRoleManager.getInstance().targetPlayer.x - dx, SceneRoleManager.getInstance().targetPlayer.z - dy);
				_attackEntity.rotationY = rotationY;
				var len : int = _enemyEntities.length;
				var enemyAngle : int = rotationY - 90;
				for (var i : int = 0; i < len; i++)
				{
					enemyEntity = _enemyEntities[i];
					(enemyEntity.data as RoleData).moveSpeed = 400; //RoleStateUtil.BENCHMARK_MOVE_SPEED * KeyMoveManager.getInstance().speed;
					enemyEntity.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
					if (i == 0)
					{
						enemyDist = roleRange;
						dx = MathUtil.getDxByAngle(enemyDist, rotationY);
						dy = MathUtil.getDyByAngle(enemyDist, rotationY);
						enemyEntity.setGroundXY(_attackEntity.x + dx, _attackEntity.z + dy);
						_attackEntity.faceToGround(enemyEntity.x, enemyEntity.z, 0);
						if (isTrackTarget)
							RoleStateUtil.walk(enemyEntity, enemyEntity.x + 200, enemyEntity.z - 800);
						else
							enemyEntity.faceToGround(_attackEntity.x, _attackEntity.z, 0);
					}
					else
					{
						enemyDist = hurtRange;
						dx = MathUtil.getDxByAngle(enemyDist, enemyAngle);
						dy = MathUtil.getDyByAngle(enemyDist, enemyAngle);
						enemyEntity.setGroundXY(targetEnemyEntity.x + dx, targetEnemyEntity.z + dy);
						enemyEntity.faceToGround(_attackEntity.x, _attackEntity.z, 0);
						enemyAngle += 180;
					}
				}
			}

			var mFlyTime : int = TabelFieldHelper.getFlyTime(data.tabelName, caseSpellData);
			var mFlySpeed : int = TabelFieldHelper.getFlySpeed(data.tabelName, caseSpellData);
			var mHurtDelayTime : int = TabelFieldHelper.getHurtDelayTime(data.tabelName, caseSpellData);
			var mReleaseDelayTime : int = TabelFieldHelper.getReleaseDelayTime(data.tabelName, caseSpellData);

			var repeatTimes : int = TabelFieldHelper.getRepeatTimes(data.tabelName, caseSpellData);
			var repeatInterval : int = TabelFieldHelper.getRepeatInterval(data.tabelName, caseSpellData);
			var spaceGap : int = 0;
			var offsetX : int = 0;
			var hurtRangeNum : int = 0;
			if (mFlyTime > 0)
			{
				hurtRangeNum = 1;
			}
			else
			{
				hurtRangeNum = repeatTimes;
				spaceGap = repeatInterval * mFlySpeed * 0.001;
				offsetX = spaceGap;
			}

			/////////////////////////
			var mCaromStartFrameTime : int = TabelFieldHelper.getCaromStartFrameTime(data.tabelName, caseSpellData);
			var mBreakFrameTime : int = TabelFieldHelper.getBreakableFrameTime(data.tabelName, caseSpellData);
			var mHitFrameTime : int = TabelFieldHelper.getHitFrameTime(data.tabelName, caseSpellData);
			var mThrowDelayTime : int = TabelFieldHelper.getThrowDelayTime(data.tabelName, caseSpellData);
			var mCastTime : int = TabelFieldHelper.getCastTime(data.tabelName, caseSpellData);
			var ghostEffect : Boolean = TabelFieldHelper.getGhostEffect(data.tabelName, caseSpellData);
			var matchTerrain : Boolean = TabelFieldHelper.getMatchTerrain(caseSpellData);
			var mIsFlyCross : Boolean = TabelFieldHelper.getIsFlyCross(data.tabelName, caseSpellData);
			var mIsAdaptiveTargetHeight : Boolean = TabelFieldHelper.getIsAdaptiveTargetHeight(data.tabelName, caseSpellData);
			var mIsTrapSpell : Boolean = TabelFieldHelper.getIsTrapSpell(data.tabelName, caseSpellData);

			var isRelateAction : Boolean = (_lastCaseSpellInfo && (_lastCaseSpellInfo != rootData));
			spellInfo = new ReleaseSpellInfo();
			var targetX : int;
			var targetY : int;
			if (mBlinkType == SpellBlinkType.JI_TUI)
			{
				targetX = _attackEntity.x - releaseRange;
				targetY = targetEnemyEntity.z;
			}
			else
			{
				targetX = targetEnemyEntity.x - keepSpacing;
				targetY = targetEnemyEntity.z;
			}
			spellInfo.setData(caseSpellData, _attackEntity, _attackEntity.x, _attackEntity.z, targetEnemyEntity, targetX, targetY, //
				mBlinkType, mCastTime, mFlySpeed, isRelateAction, isTrackTarget, mIsFlyCross, mIsAdaptiveTargetHeight, repeatTimes, repeatInterval, mIsTrapSpell);
			spellInfo.setFrameTime(mCaromStartFrameTime, mBreakFrameTime, mHitFrameTime, mThrowDelayTime, mReleaseDelayTime, mHurtDelayTime, ghostEffect, matchTerrain);
			if (_lastCaseSpellInfo == rootData)
				spellInfo.hurtLife = 0;
			else
				spellInfo.hurtLife = 20;

			/////////////////////////
			if (_releaseRangeShapeArea3D)
			{
				_releaseRangeShapeArea3D.dispose();
				_releaseRangeShapeArea3D = null;
			}
			_releaseRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
			_releaseRangeShapeArea3D.updateFill(_attackEntity.x, 10, _attackEntity.z, 0x00ff00, 2, releaseRange, 0);
			/////////////////////////
			if (_hurtRangeShapeArea3D)
			{
				_hurtRangeShapeArea3D.dispose();
				_hurtRangeShapeArea3D = null;
			}

			if (hurtShape == SpellShapeType.CIRCLE) //圆形
			{
				_hurtRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
				_hurtRangeShapeArea3D.updateFill(spellInfo.targetPos.x, 20, spellInfo.targetPos.y, 0xff0000, 2, hurtRange, 0, hurtRangeNum, spaceGap, offsetX);
			}
			else if (hurtShape == SpellShapeType.SQUARE) //正方形
			{
				_hurtRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
				_hurtRangeShapeArea3D.updateFill(spellInfo.targetPos.x, 20, spellInfo.targetPos.y, 0xff0000, 4, hurtRange, hurtRange, hurtRangeNum, spaceGap, offsetX);
			}
			else if (hurtShape == SpellShapeType.SECTOR) //扇形
			{
				_hurtRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
				_hurtRangeShapeArea3D.updateFill(spellInfo.targetPos.x, 20, spellInfo.targetPos.y, 0xff0000, 3, hurtRange, hurtAngle * 2, hurtRangeNum, spaceGap, offsetX);
			}
			else if (hurtShape == SpellShapeType.LINE) //直线
			{
				_hurtRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
				_hurtRangeShapeArea3D.updateFill(spellInfo.targetPos.x, 20, spellInfo.targetPos.y, 0xff0000, 1, releaseRange, hurtRange, hurtRangeNum, spaceGap, offsetX);
			}
			else //圆形
			{
				_hurtRangeShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
				_hurtRangeShapeArea3D.updateFill(spellInfo.targetPos.x, 20, spellInfo.targetPos.y, 0xff0000, 2, hurtRange, 0, hurtRangeNum, spaceGap, offsetX);
			}
			/////////////////////////
			if (_keepSpacingShapeArea3D)
			{
				_keepSpacingShapeArea3D.dispose();
				_keepSpacingShapeArea3D = null;
			}
			_keepSpacingShapeArea3D = new ShapeArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer);
			_keepSpacingShapeArea3D.updateFill(spellInfo.targetPos.x, 30, spellInfo.targetPos.y, 0x0000ff, 1, keepSpacing, 100);
			/////////////////////////
			_lastCaseSpellInfo = rootData;
			ReleaseSpellHelper.releaseSpell(spellInfo);
		}
	}
}
