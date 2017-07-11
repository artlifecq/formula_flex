package com.editor.display
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.AvatarInfo;
	import com.editor.data.RenderUnitType;
	import com.editor.data.RoleActionType;
	import com.editor.data.RoleData;
	import com.editor.data.RoleStateType;
	import com.editor.data.TabelData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.enum.SceneCharType;
	import com.editor.manager.AvatarManager;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.DecorateEntitiesManager;
	import com.editor.manager.SceneManager;
	import com.editor.manager.SceneRoleManager;
	import com.editor.scene.SceneRole;
	import com.editor.state.role.action.PlayActionStateReference;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.SoftOutlineData;
	
	import flash.geom.Vector3D;
	
	import mx.controls.Alert;
	
	import away3d.containers.ObjectContainer3D;

	/**
	 *
	 * 场景实体区域
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 下午2:03:17
	 *
	 */
	public class SceneEntityArea3D extends Area3D
	{
		private static var _selectedOutlineData : SoftOutlineData = new SoftOutlineData(0x00FF00, 0.8, 0.005, 5);

		private var _data : ConfigData;

		public function SceneEntityArea3D(parent : ObjectContainer3D, showBound : Boolean = false, showFill : Boolean = true)
		{
			super(parent, showBound, showFill);
		}

		public function setData(data : ConfigData) : void
		{
			_data = data;
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					var roleData : RoleData = role.data as RoleData;
					var avatarInfo : AvatarInfo = roleData.avatarInfo;
					var bodyId : String = TabelFieldHelper.getAvatarBodyRes(data);
					var hairId : String = TabelFieldHelper.getAvatarHairRes(data.tabelName, data);
					var weaponId : String = TabelFieldHelper.getAvatarWeaponRes(data);
					var mountId : String = TabelFieldHelper.getAvatarMountRes(data.tabelName, data);
					var mountAnimatId : String = TabelFieldHelper.getAvatarMountAnimatRes(data.tabelName, data);
					var effectReses : Array = TabelFieldHelper.getEffectRes(data);
					var effectId : String = effectReses ? effectReses[0] : null;
					if (avatarInfo.bodyResID != bodyId || avatarInfo.weaponResID != weaponId || avatarInfo.mountResID != mountId || avatarInfo.mountAnimatResID != mountAnimatId || avatarInfo.effectResID != effectId)
					{
						avatarInfo.setBodyResID(bodyId, null);
						avatarInfo.hairResID = hairId;
						avatarInfo.weaponResID = weaponId;
						avatarInfo.setMountResID(mountId, mountAnimatId);
						avatarInfo.effectResID = effectId;
						AvatarManager.callEquipmentChange(role);
						var ref : PlayActionStateReference = role.stateMachine.getReference(PlayActionStateReference) as PlayActionStateReference;
						ref.setParams(RoleActionType.IDLE);
						role.stateMachine.transition(RoleStateType.ACTION_PLAY_ACTION, ref);
					}
					var mDirection : int = TabelFieldHelper.getDirection(data.tabelName, data);
					var offsetY : int = TabelFieldHelper.getOffsetUp(data);
					var scale : int = TabelFieldHelper.getEntitySizeScale(data.tabelName, data);
					role.setGroundXY(pv.position.x, pv.position.y);
					role.rotationY = mDirection;
					role.offsetY = offsetY;
					role.setScale(scale > 0 ? (scale * 0.01) : 1);
				}
			}
			updateFill();
		}

		override public function createPolygonVertex(x : Number, z : Number) : PolygonVertex3D
		{
			var polygonVertex : PolygonVertex3D = super.createPolygonVertex(x, z);
			createRole(polygonVertex, _data);
			return polygonVertex;
		}

		override public function removePolygonVertex(pv : PolygonVertex3D) : void
		{
			var role : SceneRole = pv.data as SceneRole;
			if (role)
			{
				SceneManager.getInstance().mainScene.removeSceneObj(role);
				pv.data = null;
			}
			super.removePolygonVertex(pv);
		}

		private function createRole(polygonVertex : PolygonVertex3D, cfg : ConfigData) : void
		{
			var index : int = _polygonVertexes.indexOf(polygonVertex);
			var role : SceneRole = SceneManager.getInstance().mainScene.getSceneObjByID(cfg.id, SceneCharType.MONSTER_TB + cfg.tabelName + int(index + 1)) as SceneRole;
			if (!role)
			{
				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(cfg.tabelName);
				if (tabel)
				{
					var mDirection : int = TabelFieldHelper.getDirection(tabel.name, cfg);
					var mBodyRes : String = TabelFieldHelper.getAvatarBodyRes(cfg);
					var mHairRes : String = TabelFieldHelper.getAvatarHairRes(tabel.name, cfg);
					var mWeaponRes : String = TabelFieldHelper.getAvatarWeaponRes(cfg);
					var mMountRes : String = TabelFieldHelper.getAvatarMountRes(tabel.name, cfg);
					var effectReses : Array = TabelFieldHelper.getEffectRes(cfg);
					var mEffectRes : String = effectReses ? effectReses[0] : null;
					var offsetY : int = TabelFieldHelper.getOffsetUp(cfg);
					var scale : int = TabelFieldHelper.getEntitySizeScale(tabel.name, cfg);
					var roleId : int = SceneRoleManager.getInstance().createSceneEntityAvatar(index + 1, cfg.id, mBodyRes, mHairRes, mWeaponRes, mMountRes, mEffectRes, scale, cfg);
					role = SceneManager.getInstance().mainScene.getSceneObjByID(roleId, SceneCharType.MONSTER_TB + cfg.tabelName + int(index + 1)) as SceneRole;
					if (role)
					{
						role.setGroundXY(polygonVertex.position.x, polygonVertex.position.z);
						role.rotationY = mDirection;
						role.offsetY = offsetY;
						role.setScale(scale > 0 ? (scale * 0.01) : 1);
						role.mouseEnable = _areaMouseEnabled && !_selectedArea;
					}
				}
			}
			polygonVertex.data = role;
		}

		private function updateRolePos() : void
		{
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					role.setGroundXY(pv.position.x, pv.position.z);
				}
			}
		}

		private function updateGridsByData() : void
		{
			clearGrids();
			if (_data)
			{
				if (_data is ClientMapAreaData)
				{
					var areaData : ClientMapAreaData = _data as ClientMapAreaData;
					var bounds : Vector3D = MathUtil.getPolygonBounds(points);
					if (bounds)
					{
						var gridMaxCount : int = ((bounds[2] - bounds[0]) / areaData.mGridWidth) * ((bounds[3] - bounds[1]) / areaData.mGridHeight);
						if (gridMaxCount > 0)
						{
							if (gridMaxCount <= 500)
							{
								var polyGrids : Array = MathUtil.polygonToGrids(points, areaData.mGridWidth, areaData.mGridHeight, true);
								updateGrids(areaData.mGridWidth, areaData.mGridHeight, polyGrids);
							}
							else
							{
								Alert.show(_data.id + ":" + _data.name + "的栅格数超出限制500，目前已达到" + gridMaxCount + "！", "提示");
							}
						}
					}
				}
			}
		}

		public function selectRole(role : SceneRole) : void
		{
			selectPolygonVertex = null;
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var currRole : SceneRole = pv.data as SceneRole;
				if (!currRole)
					continue;
				if (role == currRole)
				{
					selectPolygonVertex = pv;
					role.forEachRenderUnit(setRoleMouseSelected);
				}
				else
				{
					currRole.forEachRenderUnit(setRoleMouseUnselected);
				}
			}
		}

		override protected function updateFill() : void
		{
			super.updateFill();
			updateRolePos();
			updateGridsByData();
		}

		override public function set selectPolygonVertex(pv : PolygonVertex3D) : void
		{
			super.selectPolygonVertex = pv;
			DecorateEntitiesManager.getInstance().selectedEntity = this;
		}

		override public function set selectedArea(value : Boolean) : void
		{
			super.selectedArea = value;
			if (value)
				DecorateEntitiesManager.getInstance().selectedEntity = this;

			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					updateRoleSelected(role);
					role.mouseEnable = _areaMouseEnabled && !_selectedArea;
				}
			}
		}

		override public function set areaMouseEnabled(value : Boolean) : void
		{
			super.areaMouseEnabled = value;
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					role.mouseEnable = _areaMouseEnabled && !_selectedArea;
				}
			}
		}

		override public function set selected(value : Boolean) : void
		{
			super.selected = value;
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					updateRoleSelected(role);
				}
			}
		}

		private function updateRoleSelected(role : SceneRole) : void
		{
			if (_selected)
			{
				role.forEachRenderUnit(setRoleMouseSelected);
			}
			else
			{
				role.forEachRenderUnit(setRoleMouseUnselected);
			}
		}

		private function setRoleMouseSelected(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					ru.setSoftOutline(_selectedOutlineData);
					break;
			}
		}

		private function setRoleMouseUnselected(role : SceneRole, ru : RenderUnit3D) : void
		{
			switch (ru.type)
			{
				case RenderUnitType.BODY:
				case RenderUnitType.HAIR:
				case RenderUnitType.WEAPON:
				case RenderUnitType.DEPUTY_WEAPON:
				case RenderUnitType.MOUNT:
					ru.setSoftOutline(null);
					break;
			}
		}

		public function get data() : ConfigData
		{
			return _data;
		}

		override public function dispose() : void
		{
			for each (var pv : PolygonVertex3D in _polygonVertexes)
			{
				var role : SceneRole = pv.data as SceneRole;
				if (role)
				{
					SceneManager.getInstance().mainScene.removeSceneObj(role);
				}
				pv.data = null;
			}
			_data = null;
			super.dispose();
		}
	}
}
