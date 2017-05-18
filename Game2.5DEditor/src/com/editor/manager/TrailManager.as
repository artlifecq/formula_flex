package com.editor.manager
{
	import com.editor.cfg.AvatarFileResConfig;
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.InternalTabelName;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.data.TrailPathPoint;
	import com.editor.display.FlagPoint3D;
	import com.editor.display.TrailGroup;
	import com.editor.enum.FeaturesType;
	import com.editor.events.ConfigDataEvent;
	import com.editor.events.ConfigListEvent;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.RoleStateUtil;
	import com.editor.state.role.action.TrailStateReference;
	import com.editor.state.role.control.TrailMoveStateReference;

	import flash.geom.Vector3D;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 轨迹管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-06-20 下午2:03:17
	 *
	 */
	public class TrailManager
	{
		private static var _instance : TrailManager;

		public static function getInstance() : TrailManager
		{
			if (!_instance)
			{
				_instance = new TrailManager();
			}
			return _instance;
		}

		private var _trailGroups : Dictionary;
		private var _selectedFlag : FlagPoint3D;
		private var _selectedGroup : TrailGroup;
		private var _mouseEnabledFuncTag : FuncTagInfo;

		public function TrailManager()
		{
			_trailGroups = new Dictionary();
			EventManager.addEvent(ConfigListEvent.SELECTED_CONFIG_DATA, onConfigSelected);
			EventManager.addEvent(ConfigDataEvent.CONFIG_DATA_REMOVE, onConfigRemoved);
		}

		private function onConfigSelected(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (tabel)
			{
				if (tabel.mFeatureType == FeaturesType.TRAIL_TYPE || tabel.mSubFeatureType == FeaturesType.TRAIL_TYPE)
				{
					clear();
					initAddTrailPoint(data);
				}
				else
				{
					if (_mouseEnabledFuncTag && _mouseEnabledFuncTag.featureType == FeaturesType.TRAIL_TYPE)
					{
						selectFlagByData(data);
					}
				}
			}
		}

		private function initAddTrailPoint(data : ConfigData) : void
		{
			var isClingGround : Boolean = TabelFieldHelper.getMatchTerrain(data);
			var group : TrailGroup = _trailGroups[data];
			if (!group)
			{
				group = new TrailGroup(data);
				group.isClingGround = isClingGround;
				_trailGroups[data] = group;
			}
			var datas : Array = [];
			var xArr : Array = TabelFieldHelper.getTrailX(data, datas);
			var yArr : Array = TabelFieldHelper.getTrailY(data);
			var zArr : Array = TabelFieldHelper.getTrailZ(data);
			if (xArr)
			{
				var pos : Vector3D = new Vector3D();
				for (var i : int = 0; i < xArr.length; i++)
				{
					var x : int = xArr ? xArr[i] : 0;
					var y : int = yArr ? yArr[i] : 0;
					var z : int = zArr ? zArr[i] : 0;
					pos.setTo(x, y, z);
					group.addFlag(datas[i], pos);
				}
			}
			var funcTabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;
			group.mouseEnabled = funcTabel && funcTabel.name == group.data.tabelName;
			_selectedGroup = group;
		}

		public function createTrailPoint(data : ConfigData, position : Vector3D) : void
		{
			var funcTabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;

			var isClingGround : Boolean = TabelFieldHelper.getMatchTerrain(data);
			var group : TrailGroup = _trailGroups[data];
			if (!group)
			{
				group = new TrailGroup(data);
				group.isClingGround = isClingGround;
				_trailGroups[data] = group;
			}
			group.mouseEnabled = funcTabel && funcTabel.name == group.data.tabelName;
			_selectedGroup = group;
			group.createAddFlag(position);
		}

		public function setSelectedFlagPos(position : Vector3D) : void
		{
			if (selectedGroup && selectedFlag)
			{
				selectedFlag.changePosition(position, selectedGroup.isClingGround);
				selectedGroup.updateLines();
			}
		}

		public function deleteTrailPoint(flagPoint : FlagPoint3D) : void
		{
			DataStructuresManager.getInstance().removeValuesFromTabel(flagPoint.data);
		}

		private function onConfigRemoved(data : ConfigData) : void
		{
			var group : TrailGroup = _trailGroups[data];
			if (group)
			{
				group.dispose();
				_trailGroups[data] = null;
				delete _trailGroups[data];
				if (_selectedGroup == group)
				{
					_selectedGroup = null;
					_selectedFlag = null;
				}
			}
			else
			{
				for each (group in _trailGroups)
				{
					var flagPoint : FlagPoint3D = group.getFlagByData(data);
					if (flagPoint)
					{
						group.removeFlag(flagPoint);
						if (_selectedFlag == flagPoint)
						{
							_selectedFlag = null;
						}
						break;
					}
				}
			}
		}

		public function setMouseEnabledByFuncTag(funcInfo : FuncTagInfo) : void
		{
			_mouseEnabledFuncTag = funcInfo;
			var tabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;

			for each (var group : TrailGroup in _trailGroups)
			{
				if (tabel && group.data.tabelName == tabel.name)
					group.mouseEnabled = true;
				else
					group.mouseEnabled = false;
			}
			clear();
			if (tabel)
			{
				tabel.desc.selectedData = null;
			}
		}

		public function cancelSelect() : Boolean
		{
            var rs : Boolean = false;
			if (selectedFlag)
			{
				selectedFlag.selected = false;
				selectedFlag = null;
                rs = true;
			}
			_selectedGroup = null;
            return rs;
		}

		private function selectFlagByData(data : ConfigData) : Boolean
		{
			for each (var group : TrailGroup in _trailGroups)
			{
				var flagPoint : FlagPoint3D = group.getFlagByData(data);
				if (flagPoint)
				{
					selectedFlag = flagPoint;
					return true;
				}
			}
			return false;
		}

		public function set selectedFlag(flagPoint : FlagPoint3D) : void
		{
			if (_selectedFlag == flagPoint)
				return;
			if (_selectedFlag)
				_selectedFlag.selected = false;
			selectedGroupByFlag(flagPoint);
			_selectedFlag = flagPoint;
			if (_selectedFlag)
			{
				_selectedFlag.selected = true;
				if (_selectedFlag.position)
					SceneRoleManager.getInstance().targetPlayer.position = _selectedFlag.position;
				DataManager.getInstance().onSelectedConfigData(_selectedFlag.data);
			}
		}

		private function selectedGroupByFlag(flagPoint : FlagPoint3D) : void
		{
			var currGroup : TrailGroup = null;
			if (flagPoint)
			{
				for each (var group : TrailGroup in _trailGroups)
				{
					var flag : FlagPoint3D = group.getFlagByData(flagPoint.data);
					if (flag)
					{
						currGroup = group;
						break;
					}
				}
			}
			if (_selectedGroup != currGroup)
			{
				_selectedGroup = currGroup;
				if (_selectedGroup)
				{
					DataManager.getInstance().onSelectedConfigData(_selectedGroup.data);
				}
			}
		}

		public function get selectedFlag() : FlagPoint3D
		{
			return _selectedFlag;
		}

		public function get selectedGroup() : TrailGroup
		{
			return _selectedGroup;
		}

		public function clear() : void
		{
			cancelSelect();
			for (var data : * in _trailGroups)
			{
				var group : TrailGroup = _trailGroups[data];
				group.dispose();
				_trailGroups[data] = null;
				delete _trailGroups[data];
			}
			stop();
		}

		private var _currIsClingGround : Boolean = false;
		private var _trailPathPoints : Vector.<TrailPathPoint> = new Vector.<TrailPathPoint>();

		public function togglePlay() : void
		{
			var target : SceneRole = SceneRoleManager.getInstance().targetPlayer;
			if (target.stateMachine.isTrailMoving)
			{
				stop();
			}
			else
			{
				play();
			}
		}

		public function play() : void
		{
			if (_selectedGroup)
			{
				var mountAnimatRes : String = null;
				var mountRes : String = TabelFieldHelper.getAvatarMountRes(_selectedGroup.data.tabelName, _selectedGroup.data);
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.AvatarFileResConfigName);
				if (tabel)
				{
					var desc : ConfigDesc = tabel.getConfigDesc();
					var datas : Array = ConfigData.getCfgByFieldValue(desc, desc.majorKey, mountRes);
					if (datas.length > 0)
					{
						var avatarFileResConfig : AvatarFileResConfig = datas[0] as AvatarFileResConfig;
						mountAnimatRes = avatarFileResConfig.mAnimatRes;
					}
				}

				(SceneRoleManager.getInstance().targetPlayer.data as RoleData).avatarInfo.setMountResID(mountRes, mountAnimatRes);
				AvatarManager.callEquipmentChange(SceneRoleManager.getInstance().targetPlayer);

				_trailPathPoints.length = 0;
				var pathPoint : TrailPathPoint;

				_currIsClingGround = TabelFieldHelper.getMatchTerrain(_selectedGroup.data);
				var xArr : Array = TabelFieldHelper.getTrailX(_selectedGroup.data);
				var yArr : Array = TabelFieldHelper.getTrailY(_selectedGroup.data);
				var zArr : Array = TabelFieldHelper.getTrailZ(_selectedGroup.data);
				var speedArr : Array = TabelFieldHelper.getTrailSpeed(_selectedGroup.data);
				var tiltAngleArr : Array = TabelFieldHelper.getTiltAngle(_selectedGroup.data);
				var baseActionSpeedArr : Array = TabelFieldHelper.getBaseActionSpeed(_selectedGroup.data);
				var statusTypeArr : Array = TabelFieldHelper.getMotion(_selectedGroup.data);
				if (xArr)
				{
					for (var i : int = 0; i < xArr.length; i++)
					{
						var x : int = xArr ? xArr[i] : 0;
						var y : int = yArr ? yArr[i] : 0;
						var z : int = zArr ? zArr[i] : 0;
						var speed : int = speedArr ? speedArr[i] : 0;
						var tiltAngle : int = tiltAngleArr ? tiltAngleArr[i] : 0;
						var baseActionSpeed : int = baseActionSpeedArr ? baseActionSpeedArr[i] : 0;
						var statusType : String = statusTypeArr ? statusTypeArr[i] : "";

						pathPoint = new TrailPathPoint(x, y, z, speed, tiltAngle, baseActionSpeed, statusType);
						_trailPathPoints.push(pathPoint);
					}
				}

				EditorCameraManager.updateProperty();
				var target : SceneRole = SceneRoleManager.getInstance().targetPlayer;
				doTrailToPos(target, _trailPathPoints, _currIsClingGround, null, onTrailToComplete);
			}
		}

		private function onTrailToComplete(ref : TrailMoveStateReference) : void
		{
			stop();
		}

		public function stop() : void
		{
			var target : SceneRole = SceneRoleManager.getInstance().targetPlayer;
			target.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			target.stateMachine.transition(RoleStateType.ACTION_IDLE);
			_currIsClingGround = false;
			(SceneRoleManager.getInstance().targetPlayer.data as RoleData).avatarInfo.setMountResID(null, null);
			AvatarManager.callEquipmentChange(SceneRoleManager.getInstance().targetPlayer);
			EditorCameraManager.updateProperty();
		}

		public function changeClingGround(data : ConfigData) : void
		{
			if (_selectedGroup && _selectedGroup.data == data)
			{
				var isClingGround : Boolean = TabelFieldHelper.getMatchTerrain(data);
				_selectedGroup.isClingGround = isClingGround;
			}
		}

		public static function doTrailToPos(role : SceneRole, trailPathPoints : Vector.<TrailPathPoint>, isClingGround : Boolean, data : Object = null, onArrive : Function = null, onThrough : Function = null, onUpdate : Function = null) : Boolean
		{
			if (!role || !role.usable)
				return false;
			if (role.isMainChar)
			{
				var nowTime : int = getTimer();
				RoleStateUtil.lastWalkTime = nowTime;
			}
			var trailMoveRef : TrailMoveStateReference = role.stateMachine.getReference(TrailMoveStateReference) as TrailMoveStateReference;
			trailMoveRef.setParams(trailPathPoints, isClingGround, getTimer());
			trailMoveRef.data = data;
			trailMoveRef.onMove(onWalkMove);
			trailMoveRef.onUpdate(onUpdate);
			trailMoveRef.onThrough(onWalkThrough, onThrough);
			trailMoveRef.onArrive(onWalkArrivefunction, onArrive);
			trailMoveRef.onReady(onWalkReady);
			trailMoveRef.onStop(onWalkStop);
			trailMoveRef.onEnd(onWalkEnd);
			role.stateMachine.transition(RoleStateType.CONTROL_TRAIL_MOVE, trailMoveRef);
			return role.stateMachine.isTrailMoving;
		}

		private static function onWalkMove(ref : TrailMoveStateReference) : void
		{
			var trailRef : TrailStateReference = (ref.owner as SceneRole).stateMachine.getReference(TrailStateReference) as TrailStateReference;
			trailRef.setParams(ref.statusType, ref.speed, ref.baseActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_TRAIL, trailRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkThrough(onThrough : Function, ref : TrailMoveStateReference) : void
		{
			var trailRef : TrailStateReference = (ref.owner as SceneRole).stateMachine.getReference(TrailStateReference) as TrailStateReference;
			trailRef.setParams(ref.statusType, ref.speed, ref.baseActionSpeed);
			(ref.owner as SceneRole).stateMachine.transition(RoleStateType.ACTION_TRAIL, trailRef);
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
			else
			{
			}
			if (onThrough != null)
				onThrough(ref);
		}

		private static function onWalkArrivefunction(onArrive : Function, ref : TrailMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
			if (onArrive != null)
				onArrive(ref);
		}

		private static function onWalkReady(ref : TrailMoveStateReference) : void
		{
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkStop(ref : TrailMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		private static function onWalkEnd(ref : TrailMoveStateReference) : void
		{
			//派发事件
			if ((ref.owner as SceneRole).isMainChar)
			{
			}
		}

		public function get currIsClingGround() : Boolean
		{
			return _currIsClingGround;
		}

		public function get isPlaying() : Boolean
		{
			var target : SceneRole = SceneRoleManager.getInstance().targetPlayer;
			return target.stateMachine.isTrailMoving;
		}
	}
}
