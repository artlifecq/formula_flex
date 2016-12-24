package com.editor.manager
{
	import com.editor.cfg.ConfigData;
	import com.editor.cfg.TabelFieldHelper;
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.MapAreaTypeEnum;
	import com.editor.display.PolygonVertex3D;
	import com.editor.display.SceneEntityArea3D;
	import com.editor.enum.FeaturesType;
	import com.editor.events.ConfigListEvent;
	import com.editor.events.MapEvent;
	import com.editor.events.SceneEntityEvent;
	import com.editor.scene.SceneRole;
	import com.game.engine3D.controller.CameraController;

	import flash.geom.Point;
	import flash.geom.Vector3D;

	import mx.controls.Alert;

	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 布置实体管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 下午2:03:17
	 *
	 */
	public class DecorateEntitiesManager
	{
		private static var _instance : DecorateEntitiesManager;

		public static function getInstance() : DecorateEntitiesManager
		{
			if (!_instance)
			{
				_instance = new DecorateEntitiesManager();
			}
			return _instance;
		}

		private var _entityAreas : Array;
		private var _selectedEntity : SceneEntityArea3D;
		private var _mouseEnabledFuncTag : FuncTagInfo;

		public function DecorateEntitiesManager()
		{
			_entityAreas = [];
			EventManager.addEvent(SceneEntityEvent.SCENE_ENTITY_CHANGE_DATA, onChangeData);
			EventManager.addEvent(SceneEntityEvent.CREATE_SCENE_ENTITY, onCreateEntity);
			EventManager.addEvent(SceneEntityEvent.REMOVE_SCENE_ENTITY, onRemoveEntityByData);
			EventManager.addEvent(ConfigListEvent.SELECTED_CONFIG_DATA, onConfigSelecetd);
		}

		private function onChangeData(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (tabel.mFeatureType == FeaturesType.DECORATE_TYPE || tabel.mSubFeatureType == FeaturesType.DECORATE_TYPE)
			{
				var sceneField : TabelFieldData = DataStructuresManager.getInstance().getCorrelationField(tabel, TabelFieldData.SCENE_FIELD);
				var sceneId : int = SceneManager.getInstance().mapId;
				if (sceneField)
					sceneId = TabelFieldHelper.getScene(data.tabelName, data);

				var area : SceneEntityArea3D;
				if (sceneId == SceneManager.getInstance().mapId)
				{
					createArea(data);
					area = getAreaByData(data);
					area.setData(data);
				}
				else
				{
					area = getAreaByData(data);
					deleteArea(area);
				}

				selectEntityById(data.tabelName, data.id);

                if (null != area) {
                    EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
                }
			}
		}

		private function getAreaByData(data : ConfigData) : SceneEntityArea3D
		{
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				if (area.data == data)
				{
					return area;
				}
			}
			return null;
		}

		private function onCreateEntity(funcInfo : FuncTagInfo, data : ConfigData, position : Vector3D) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(funcInfo.tabelName);
			if (!tabel)
				return;

			var area : SceneEntityArea3D = createArea(data, position);
			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
			if (areaField)
			{
				TabelFieldHelper.setArea(tabel, data, areaField, area.getBornArae());
			}
			else
			{
				var posXField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_X_FIELD);
				if (posXField)
					data.setValue(posXField.mFieldName, int(position.x));
				var posYField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_Y_FIELD);
				if (posYField)
					data.setValue(posYField.mFieldName, int(position.y));

				var direField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_DIRECTION_FIELD);
				if (direField)
					data.setValue(direField.mFieldName, 0);
			}
			selectedEntity = area;
		}

		private function onRemoveEntityByData(funcInfo : FuncTagInfo, data : ConfigData) : void
		{
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				if (area.data == data)
				{
					deleteArea(area);
					return;
				}
			}
		}

		public function createPolygonVertex(area : SceneEntityArea3D, x : Number, z : Number) : void
		{
			var data : ConfigData = area.data;
			if (!data)
				return;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
				return;

			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
			if (areaField)
			{
				var isBoundArea : Boolean = TabelFieldHelper.isBoundArea(tabel, areaField);
				if (isBoundArea && area.vertexesCount >= 4)
				{
					Alert.show("边界类型的区域不能超过4个顶点！", "提示");
				}
				else
				{
					area.createPolygonVertex(x, z);
					TabelFieldHelper.setArea(tabel, data, areaField, area.getBornArae());
				}
			}
			else
			{
				area.setAreaPos(x, z);
				var posXField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_X_FIELD);
				if (posXField)
					data.setValue(posXField.mFieldName, int(x));
				var posYField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_Y_FIELD);
				if (posYField)
					data.setValue(posYField.mFieldName, int(z));

				var direField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_DIRECTION_FIELD);
				if (direField)
					data.setValue(direField.mFieldName, 0);
			}
			area.updateSelected();

			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
		}

		public function setAreaPos(area : SceneEntityArea3D, x : Number, z : Number) : void
		{
			area.setAreaPos(x, z);
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(area.data.tabelName);
			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
			if (areaField)
			{
				TabelFieldHelper.setArea(tabel, area.data, areaField, area.getBornArae());
			}

			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
		}

		public function setPolygonVertexPos(area : SceneEntityArea3D, x : Number, z : Number) : void
		{
			area.setPolygonVertexPos(x, z);
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(area.data.tabelName);
			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
			if (areaField)
			{
				TabelFieldHelper.setArea(tabel, area.data, areaField, area.getBornArae());
			}
			else
			{
				var configDesc : ConfigDesc = tabel.getConfigDesc();
				var data : ConfigData = ConfigData.getCfg(configDesc, area.data.id);

				var posXField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_X_FIELD);
				if (posXField)
					data.setValue(posXField.mFieldName, int(x));
				var posYField : TabelFieldData = tabel.getField(TabelFieldData.ENTITY_POS_Y_FIELD);
				if (posYField)
					data.setValue(posYField.mFieldName, int(z));
			}

			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
		}

		public function removePolygonVertex(area : SceneEntityArea3D, pv : PolygonVertex3D) : void
		{
			area.removePolygonVertex(pv);
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(area.data.tabelName);
			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
			if (areaField)
				TabelFieldHelper.setArea(tabel, area.data, areaField, area.getBornArae());

			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
		}

		public function removeArea(area : SceneEntityArea3D) : void
		{
			deleteArea(area);
		}

		private function onConfigSelecetd(data : ConfigData) : void
		{
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			if (!tabel)
			{
				return;
			}
			if (tabel.mFeatureType != FeaturesType.DECORATE_TYPE && tabel.mSubFeatureType != FeaturesType.DECORATE_TYPE)
				return;
			if (data)
				selectEntityById(data.tabelName, data.id);
		}

		public function setMouseEnabledByFuncTag(funcInfo : FuncTagInfo) : void
		{
			_mouseEnabledFuncTag = funcInfo;
			var tabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;

			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				if (tabel && area.data.tabelName == tabel.name)
				{
					area.visible = true;
				}
				else
				{
					area.visible = false;
				}
			}
			cancelSelect();
		}

		private function updateAllAreaMouseEnabled() : void
		{
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				var funcTabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;
				area.areaMouseEnabled = funcTabel && funcTabel.name == area.data.tabelName && (!_selectedEntity || _selectedEntity == area);
			}
		}

		public function get monsterAreas() : Array
		{
			return _entityAreas;
		}

		public function get selectedEntity() : SceneEntityArea3D
		{
			return _selectedEntity;
		}

		public function set selectedEntity(area : SceneEntityArea3D) : void
		{
			if (_selectedEntity == area)
				return;
			if (_selectedEntity)
				_selectedEntity.selected = false;
			_selectedEntity = area;
			if (_selectedEntity)
			{
				_selectedEntity.selected = true;

				var avatarId : String = TabelFieldHelper.getAvatarBodyRes(area.data);
				SceneRoleManager.getInstance().setSelectedAvatarId(avatarId);

				DataManager.getInstance().onSelectedConfigData(area.data);
				if (_selectedEntity.position)
					SceneRoleManager.getInstance().targetPlayer.position = _selectedEntity.position;
				//摄像机调整暂时放这里
				if (_selectedEntity.data is ClientMapAreaData)
				{
					var mapAreaData : ClientMapAreaData = _selectedEntity.data as ClientMapAreaData;
					if (mapAreaData.mType == MapAreaTypeEnum.CAMERA_PROPERTY)
					{
						CameraController.lockedOnPlayerController.xDeg = mapAreaData.mCameraXDeg;
						CameraController.lockedOnPlayerController.yDeg = mapAreaData.mCameraYDeg;
						CameraController.lockedOnPlayerController.distance = mapAreaData.mCameraDistance;
					}
				}
			}
			updateAllAreaMouseEnabled();
		}

		public function selectEntityById(tabelName : String, id : int) : Boolean
		{
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				if (area.data.tabelName == tabelName && area.data.id == id)
				{
					selectedEntity = area;
					return true;
				}
			}
			return false;
		}

		public function selectEntityByRole(role : SceneRole) : Boolean
		{
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				if (area.data == role.cfg)
				{
					selectedEntity = area;
					area.selectRole(role);
					return true;
				}
			}
			return false;
		}

		public function cancelSelect() : void
		{
			if (selectedEntity)
			{
				selectedEntity.selected = false;
				selectedEntity = null;
			}
			updateAllAreaMouseEnabled();
		}

		public function initAddArea(data : ConfigData) : String
		{
			var area : SceneEntityArea3D = createArea(data);
			var isSolid : Boolean = !area.checkPlacementArea();
			if (isSolid)
				return data.id + ":" + data.name;
			return null;
		}

		public function createArea(data : ConfigData, position : Vector3D = null) : SceneEntityArea3D
		{
			var area : SceneEntityArea3D = getAreaByData(data);
			if (area)
				return area;

			var isArea : Boolean = true;
			var isBoundArea : Boolean = false;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(data.tabelName);
			var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
			if (!areaField)
			{
				areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
				isArea = false;
			}
			if (areaField)
			{
				isBoundArea = TabelFieldHelper.isBoundArea(tabel, areaField);
			}
			area = new SceneEntityArea3D(SceneManager.getInstance().mainScene.sceneRenderLayer, isBoundArea, isArea);
			_entityAreas.push(area);
			area.setData(data);

			if (position)
			{
				area.createPolygonVertex(position.x, position.z);
			}
			else
			{
				if (areaField)
				{
					var mPos : String = TabelFieldHelper.getArea(tabel, data, areaField);
					if (mPos)
					{
						var monsterAreaVPosArr : Array = mPos.split(";");
						for each (var mposStr : String in monsterAreaVPosArr)
						{
							if (mposStr.length)
							{
								var pArr : Array = mposStr.split("=");
								var p : Point = new Point(pArr[0], pArr[1]);
								area.createPolygonVertex(p.x, p.y);
							}
						}
					}
				}
				else
				{
					var mPosX : int = TabelFieldHelper.getPosX(tabel.name, data);
					var mPosY : int = TabelFieldHelper.getPosY(tabel.name, data);
					area.createPolygonVertex(mPosX, mPosY);
				}
			}
			var funcTabel : TabelData = _mouseEnabledFuncTag ? DataStructuresManager.getInstance().getTabel(_mouseEnabledFuncTag.tabelName) : null;
			area.areaMouseEnabled = funcTabel && funcTabel.name == area.data.tabelName && (!_selectedEntity || _selectedEntity == area);
			return area;
		}

		private function deleteArea(area : SceneEntityArea3D) : void
		{
			if (!area)
				return;
			if (_selectedEntity == area)
				_selectedEntity = null;

			var index : int = _entityAreas.indexOf(area);
			if (index != -1)
				_entityAreas.splice(index, 1);
			area.dispose();

			EventManager.dispatchEvent(MapEvent.MINI_MAP_UPDATE_MONSTER_AREA, area.data);
		}

		public function clear() : void
		{
			_selectedEntity = null;
			for each (var area : SceneEntityArea3D in _entityAreas)
			{
				area.dispose();
			}
			_entityAreas.length = 0;
		}
	}
}
