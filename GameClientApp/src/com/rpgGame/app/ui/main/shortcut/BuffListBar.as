package com.rpgGame.app.ui.main.shortcut
{
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.society.SocietyManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.StaticBuffCfgId;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.society.SocietySpellTotalData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.TipType;

	import flash.geom.Point;

	import gs.TweenMax;
	import gs.easing.Linear;

	import org.client.mainCore.manager.EventManager;
	import org.client.mainCore.utils.Tick;

	/**
	 *
	 * Buff列表栏
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-06 上午10:05:12
	 *
	 */
	public class BuffListBar extends SkinUI
	{
		private static const DISAPPEAR_FLASH_TIME : int = 3000;
		private var _ownerRole : SceneRole;
		private var _ownerRoleData : RoleData;
		private var _buffGridArr : Array;
		private var _debuffGridArr : Array;
		private var _showing : Boolean;
		private var _cdTicked : Boolean;
		private var _pool : Array;
		private var _iconSize : int;
		private var _gridBg : String;
		private var _hSpacing : int;
		private var _vSpacing : int;
		private var _rowCount : int;
		private var _maxKindCount : int;
		private var _onlyDebuff : Boolean;
		private var _areaBuffInfo : BuffInfo = null;
		private var _updateMapAreaFrame : int = 0;

		public function BuffListBar(ownerRole : SceneRole, iconSize : int, gridBg : String, hSpacing : int, vSpacing : int, rowCount : int, maxKindCount : int, onlyDebuff : Boolean = false)
		{
			super();
			_ownerRole = ownerRole;
			_ownerRoleData = _ownerRole ? RoleData(_ownerRole.data) : null;
			_iconSize = iconSize;
			_gridBg = gridBg;
			_hSpacing = hSpacing;
			_vSpacing = vSpacing;
			_rowCount = rowCount;
			_maxKindCount = maxKindCount;
			_onlyDebuff = onlyDebuff;
			init();
		}

		private function setAreaBuffInfo(areaData : ClientMapAreaData) : void
		{
			if (!_ownerRoleData)
				return;
			if (areaData)
			{
				if (!_areaBuffInfo || _areaBuffInfo.roleId != _ownerRoleData.id || _areaBuffInfo.specialData != areaData)
				{
					var icoName : String = "";
					switch (areaData.type)
					{
						case MapAreaTypeEnum.SAFE:
							icoName = "area_safe";
							break;
						case MapAreaTypeEnum.STALL:
							icoName = "area_stall";
							break;
						case MapAreaTypeEnum.SPELL_FORBID:
							icoName = "area_spell";
							break;
						case MapAreaTypeEnum.ATHLETICS:
							icoName = "area_pk";
							break;
					}
					_areaBuffInfo = new BuffInfo(_ownerRoleData.id);
					_areaBuffInfo.cfgId = StaticBuffCfgId.MAP_AREA_BUFF_CFG_ID;
					_areaBuffInfo.disappearTime = 0;
					_areaBuffInfo.icoName = icoName;
					_areaBuffInfo.isBuff = true;
					_areaBuffInfo.specialData = areaData;
				}
			}
			else
			{
				_areaBuffInfo = null;
			}
		}

		private function init() : void
		{
			_showing = false;
			_cdTicked = false;
			_buffGridArr = [];
			_debuffGridArr = [];
			_pool = [];
		}

		public function show() : void
		{
			if (_showing)
				return;
			EventManager.addEvent(BuffEvent.UPDATE_BUFF, onUpdateBuff);
			EventManager.addEvent(BuffEvent.ADD_BUFF, onAddBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, onRemoveBuff);
			if (_ownerRoleData && _ownerRoleData.id == MainRoleManager.actorID)
			{
				EventManager.addEvent(BuffEvent.UPDATE_SOCIETY_SPELL_BUFF, onUpdateSocietySpellBuff);
			}
			_showing = true;
			_updateMapAreaFrame = 0;
			updateBuffData();
			if (!_cdTicked)
			{
				Tick.addCallback(onCdUpdate);
				_cdTicked = true;
			}
		}

		public function hide() : void
		{
			if (!_showing)
				return;
			EventManager.removeEvent(BuffEvent.UPDATE_BUFF, onUpdateBuff);
			EventManager.removeEvent(BuffEvent.ADD_BUFF, onAddBuff);
			EventManager.removeEvent(BuffEvent.REMOVE_BUFF, onRemoveBuff);
			EventManager.removeEvent(BuffEvent.UPDATE_SOCIETY_SPELL_BUFF, onUpdateSocietySpellBuff);
			_showing = false;
			Tick.removeCallback(onCdUpdate);
			_cdTicked = false;
			clear();
		}

		private function onUpdateBuff(roleId : Number) : void
		{
			if (!_ownerRoleData)
			{
				return;
			}
			if (roleId != _ownerRoleData.id)
			{
				return;
			}
			updateBuffData();
		}

		private function updateBuffData() : void
		{
			if (!_ownerRoleData)
			{
				return;
			}

			removeAllGrid();
			if (_ownerRoleData.id == MainRoleManager.actorID)
			{
				var societySpellTotalData : SocietySpellTotalData = SocietyManager.societySpellTotalData;
				if (societySpellTotalData && societySpellTotalData.hasLearnSpell)
				{
					if (!_onlyDebuff || !societySpellTotalData.buffInfo.isBuff)
					{
						addGridInfo(societySpellTotalData.buffInfo);
					}
				}
			}
			updateMapAreaInfo();
			if (_areaBuffInfo)
			{
				if (!_onlyDebuff || !_areaBuffInfo.isBuff)
				{
					addGridInfo(_areaBuffInfo);
				}
			}

			var buffInfos : Vector.<BuffInfo> = _ownerRoleData.buffList;
			if (buffInfos && buffInfos.length > 0)
			{
				var buffInfo : BuffInfo = buffInfos[0];
				if (buffInfo.roleId != _ownerRoleData.id)
				{
					return;
				}
				for each (buffInfo in buffInfos)
				{
					if (!buffInfo.isHidden && (!_onlyDebuff || !buffInfo.isBuff))
					{
						addGridInfo(buffInfo);
					}
				}
				reLayout();
			}
		}

		private function updateMapAreaInfo() : void
		{
			var resultAreaData : ClientMapAreaData = null;
			if (_ownerRole)
			{
				var areaData : ClientMapAreaData = AreaMapManager.getRoleInMapDataArea(_ownerRole);
				if (areaData)
				{
					switch (areaData.type)
					{
						case MapAreaTypeEnum.SAFE:
							resultAreaData = areaData;
							break;
						case MapAreaTypeEnum.STALL:
							resultAreaData = areaData;
							break;
						case MapAreaTypeEnum.SPELL_FORBID:
							resultAreaData = areaData;
							break;
						case MapAreaTypeEnum.ATHLETICS:
							resultAreaData = areaData;
							break;
					}
				}
			}
			setAreaBuffInfo(resultAreaData);
		}

		private function onAddBuff(buffInfo : BuffInfo) : void
		{
			if (!_ownerRoleData)
			{
				return;
			}
			if (buffInfo.roleId != _ownerRoleData.id)
			{
				return;
			}
			if (!buffInfo.isHidden && (!_onlyDebuff || !buffInfo.isBuff))
			{
				addGridInfo(buffInfo);
				reLayout();
			}
		}

		private function onRemoveBuff(roleId : Number, buffId : int) : void
		{
			if (!_ownerRoleData)
			{
				return;
			}
			if (roleId != _ownerRoleData.id)
			{
				return;
			}
			var grid : IconCDFace = getGridByCfgId(buffId);
			if (grid)
			{
				removeGrid(grid);
				reLayout();
			}
		}

		private function onUpdateSocietySpellBuff() : void
		{
			if (_ownerRoleData && _ownerRoleData.id == MainRoleManager.actorID)
			{
				var societySpellTotalData : SocietySpellTotalData = SocietyManager.societySpellTotalData;
				if (societySpellTotalData.hasLearnSpell)
				{
					if (!_onlyDebuff || !societySpellTotalData.buffInfo.isBuff)
					{
						addGridInfo(societySpellTotalData.buffInfo, 0);
					}
				}
				else
				{
					var grid : IconCDFace = getGridByCfgId(StaticBuffCfgId.SOCIETY_SPELL_BUFF_CFG_ID);
					if (grid)
					{
						removeGrid(grid);
					}
				}
				reLayout();
			}
		}

		private function getGridByCfgId(id : int) : IconCDFace
		{
			var grid : IconCDFace;
			var buffInfo : BuffInfo;
			for each (grid in _buffGridArr)
			{
				buffInfo = grid.faceInfo as BuffInfo;
				if (buffInfo && buffInfo.cfgId == id)
					return grid;
			}
			for each (grid in _debuffGridArr)
			{
				buffInfo = grid.faceInfo as BuffInfo;
				if (buffInfo && buffInfo.cfgId == id)
					return grid;
			}
			return null;
		}

		private function addGridInfo(buffInfo : BuffInfo, index : int = -1) : void
		{
			var grid : IconCDFace = getGridByCfgId(buffInfo.cfgId);
			if (!grid)
			{
				if (_pool.length > 0)
				{
					grid = _pool.pop();
				}
				if (!grid)
				{
					grid = new IconCDFace(_iconSize);
					grid.setBg(_gridBg, 1);
					grid.setIconPoint(0, 0);
					grid.isReverse = true;
				}
				addChild(grid);
				if (buffInfo.isBuff)
				{
					if (index > -1 && index < _buffGridArr.length)
						_buffGridArr.splice(index, 0, grid);
					else
						_buffGridArr.push(grid);
				}
				else
				{
					if (index > -1 && index < _debuffGridArr.length)
						_debuffGridArr.splice(index, 0, grid);
					else
						_debuffGridArr.push(grid);
				}
			}
			if (grid.faceInfo != buffInfo)
			{
				grid.alpha = 1;
				TweenMax.killTweensOf(grid);
				if (buffInfo.specialData is SocietySpellTotalData)
				{
					FaceUtil.setBuffGrid(grid, buffInfo, false);
					TipTargetManager.show(grid, TargetTipsMaker.makeTips(TipType.SOCIETY_SPELL_TOTAL_TIP, buffInfo.specialData, false, new Point(this.x, this.y)));
				}
				else if (buffInfo.specialData is ClientMapAreaData)
				{
					FaceUtil.setBuffGrid(grid, buffInfo, false);
					TipTargetManager.show(grid, TargetTipsMaker.makeTips(TipType.MAP_AREA_TIP, buffInfo.specialData, false, new Point(this.x, this.y)));
				}
				else
				{
					FaceUtil.setBuffGrid(grid, buffInfo, true);
				}
				checkMaxCount();
			}
		}

		private function checkMaxCount() : void
		{
			checkMaxKindCount(_buffGridArr);
			checkMaxKindCount(_debuffGridArr);
		}

		private function checkMaxKindCount(gridArr : Array) : void
		{
			if (gridArr.length > _maxKindCount)
			{
				var buffInfo : BuffInfo;
				var minTime : int = int.MAX_VALUE;
				var minGrid : IconCDFace = null;
				for each (var grid : IconCDFace in gridArr)
				{
					buffInfo = grid.faceInfo as BuffInfo;
					if (buffInfo && buffInfo.disappearTime > 0)
					{
						var cdTime : Number = buffInfo.disappearTime - SystemTimeManager.curtTm;
						if (cdTime < minTime)
						{
							minTime = cdTime;
							minGrid = grid;
						}
					}
				}
				if (minGrid)
				{
					removeGrid(grid);
				}
			}
		}

		private function onCdUpdate(inv : uint = 0) : void
		{
			updateMapArea();
			updateGrids(_buffGridArr);
			updateGrids(_debuffGridArr);
		}

		private function updateMapArea() : void
		{
			_updateMapAreaFrame++;
			if (_updateMapAreaFrame > 60)
			{
				_updateMapAreaFrame = 0;
				updateMapAreaInfo();
				if (_areaBuffInfo)
				{
					if (!_onlyDebuff || !_areaBuffInfo.isBuff)
					{
						addGridInfo(_areaBuffInfo);
					}
				}
				else
				{
					var grid : IconCDFace = getGridByCfgId(StaticBuffCfgId.MAP_AREA_BUFF_CFG_ID);
					if (grid)
					{
						removeGrid(grid);
					}
				}
				reLayout();
			}
		}

		private function updateGrids(gridArr : Array) : void
		{
			var len : int = gridArr.length;
			if (len > 0)
			{
				var grid : IconCDFace;
				var buffInfo : BuffInfo;
				var currTime : Number;
				var totalTime : Number;
				var nowTime : Number = SystemTimeManager.curtTm;
				for (var i : int = len - 1; i >= 0; i--)
				{
					grid = gridArr[i];
					buffInfo = grid.faceInfo as BuffInfo;
					if (buffInfo.disappearTime > 0)
					{
						totalTime = buffInfo.totalTime;
						currTime = totalTime - (buffInfo.disappearTime - nowTime);
						if (currTime >= totalTime)
						{
							removeGrid(grid);
							reLayout();
						}
						else
						{
							grid.cdUpdate(currTime, buffInfo.totalTime);

							if (currTime >= totalTime - DISAPPEAR_FLASH_TIME)
							{
								if (!TweenMax.isTweening(grid))
								{
									TweenMax.killTweensOf(grid);
									TweenMax.to(grid, (DISAPPEAR_FLASH_TIME / 10) * 0.001, {alpha: 0, repeat: 10, yoyo: true, ease: Linear.easeNone});
								}
							}
						}
					}
				}
			}
		}

		private function removeGrid(grid : IconCDFace) : void
		{
			grid.clear();
			if (grid.parent)
			{
				grid.parent.removeChild(grid);
			}
			TweenMax.killTweensOf(grid);
			_pool.push(grid);
			var index : int = _buffGridArr.indexOf(grid);
			if (index > -1)
			{
				_buffGridArr.splice(index, 1);
			}
			index = _debuffGridArr.indexOf(grid);
			if (index > -1)
			{
				_debuffGridArr.splice(index, 1);
			}
		}

		/**
		 * 刷新坐标布局
		 *
		 */
		public function reLayout() : void
		{
			var i : int;
			var grid : IconCDFace;
			var toX : int;
			var toY : int;
			var len : int = _buffGridArr.length;
			for (i = 0; i < len; i++)
			{
				grid = _buffGridArr[i];
				toX = (i % _rowCount) * _hSpacing;
				toY = int(i / _rowCount) * _vSpacing;
				grid.x = toX;
				grid.y = toY;
			}
			var debuffY : int = len > 0 ? (int(len / _rowCount) + _vSpacing) : 0;
			len = _debuffGridArr.length;
			for (i = 0; i < len; i++)
			{
				grid = _debuffGridArr[i];
				toX = (i % _rowCount) * _hSpacing;
				toY = debuffY + int(i / _rowCount) * _vSpacing;
				grid.x = toX;
				grid.y = toY;
			}
		}

		public function get barWidth() : int
		{
			return 600;
		}

		public function get barHeight() : int
		{
			return 50;
		}

		public function updateOwnerRole(value : SceneRole) : void
		{
			if (_ownerRole == value)
				return;
			_ownerRole = value;
			_ownerRoleData = _ownerRole ? RoleData(_ownerRole.data) : null;
			if (_showing)
			{
				updateBuffData();
			}
		}

		public function updateOwnerRoleData(value : RoleData) : void
		{
			if (_ownerRoleData == value)
				return;
			_ownerRole = null;
			_ownerRoleData = value;
			if (_showing)
			{
				updateBuffData();
			}
		}

		private function removeAllGrid() : void
		{
			var grid : IconCDFace;
			for each (grid in _buffGridArr)
			{
				grid.clear();
				if (grid.parent)
				{
					grid.parent.removeChild(grid);
				}
				TweenMax.killTweensOf(grid);
				_pool.push(grid);
			}
			_buffGridArr.length = 0;
			for each (grid in _debuffGridArr)
			{
				grid.clear();
				if (grid.parent)
				{
					grid.parent.removeChild(grid);
				}
				TweenMax.killTweensOf(grid);
				_pool.push(grid);
			}
			_debuffGridArr.length = 0;
			reLayout();
		}

		public function clear() : void
		{
			removeAllGrid();
			_ownerRole = null;
			_ownerRoleData = null;
			_areaBuffInfo = null;
			_updateMapAreaFrame = 0;
		}
	}
}
