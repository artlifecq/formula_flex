package com.editor.operate
{
	import com.editor.cfg.ConfigData;
	import com.editor.data.ConfigDesc;
	import com.editor.data.FuncTagInfo;
	import com.editor.data.TabelData;
	import com.editor.data.TabelFieldData;
	import com.editor.enum.FeaturesType;
	import com.editor.events.ConfigListEvent;
	import com.editor.manager.DataManager;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.DecorateEntitiesManager;
	import com.editor.manager.FuncTagManager;
	import com.editor.manager.KeyboardManager;
	import com.editor.manager.SceneManager;
	import com.editor.scene.SceneRole;
	import com.game.engine3D.utils.PathFinderUtil;
	
	import flash.geom.Vector3D;
	
	import mx.controls.Alert;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 布置编辑操作
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-23 上午11:03:17
	 *
	 */
	public class DecorateEditOperate
	{
		public function DecorateEditOperate()
		{
		}

		public static function sceneMapClick(position : Vector3D) : Boolean
		{
			var currTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			var currSubTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedSubFuncTag;
			var mainTag : FuncTagInfo = null;
			if (currTag && currTag.featureType == FeaturesType.DECORATE_TYPE)
				mainTag = currTag;
			else if (currSubTag && currSubTag.subFeatureType == FeaturesType.DECORATE_TYPE)
				mainTag = currSubTag;
			if (!mainTag)
				return false;
			var tabel : TabelData = DataStructuresManager.getInstance().getTabel(mainTag.tabelName);
			var configDesc : ConfigDesc = tabel.getConfigDesc();
			if (KeyboardManager.getInstance().plus) //+
			{
				var areaField : TabelFieldData = tabel.getField(TabelFieldData.AREA_BLOCK_FIELD);
				if (!areaField)
					areaField = tabel.getField(TabelFieldData.DISTRIBUTE_BLOCK_FIELD);
                var p : Vector3D = position.clone();
                p.y = position.z;
                p.z = 0;
                if (PathFinderUtil.isSolid(SceneManager.getInstance().mainDistrict, p)) {
                    Alert.show("该区域不能安置！", "提示");
                    return true;
                }
				if (!DecorateEntitiesManager.getInstance().selectedEntity || !areaField)
				{
					var cfg : ConfigData = ConfigData.create(configDesc, null, null, tabel.dataConstructor, true);
					configDesc.selectedData = cfg;
					DataManager.getInstance().createDataSetParams(mainTag, cfg, position);
					EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, mainTag.tabelName);
				}
				else if (DecorateEntitiesManager.getInstance().selectedEntity)
				{
					if (DecorateEntitiesManager.getInstance().selectedEntity.checkPlacementPos(position.x, position.z))
					{
						DecorateEntitiesManager.getInstance().createPolygonVertex(DecorateEntitiesManager.getInstance().selectedEntity, position.x, position.z);
					}
					else
					{
						Alert.show("该区域不能安置！", "提示");
					}
				}
				return true;
			}
			else
			{
				if (DecorateEntitiesManager.getInstance().selectedEntity)
				{
					if (DecorateEntitiesManager.getInstance().selectedEntity.selectPolygonVertex) //移动顶点
					{
						if (KeyboardManager.getInstance().minus) //-
						{
							DecorateEntitiesManager.getInstance().removePolygonVertex(DecorateEntitiesManager.getInstance().selectedEntity, DecorateEntitiesManager.getInstance().selectedEntity.selectPolygonVertex);

							if (DecorateEntitiesManager.getInstance().selectedEntity.vertexesCount == 0)
							{
								ConfigData.remove(configDesc, DecorateEntitiesManager.getInstance().selectedEntity.data.id);
								DecorateEntitiesManager.getInstance().removeArea(DecorateEntitiesManager.getInstance().selectedEntity);
								EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, mainTag.tabelName);
							}
						}
						else
						{
							if (DecorateEntitiesManager.getInstance().selectedEntity.checkPlacementPos(position.x, position.z, DecorateEntitiesManager.getInstance().selectedEntity.selectPolygonVertex))
							{
								DecorateEntitiesManager.getInstance().setPolygonVertexPos(DecorateEntitiesManager.getInstance().selectedEntity, position.x, position.z);
							}
							else
							{
								Alert.show("该区域不能安置！", "提示");
							}
						}
					}
					else if (DecorateEntitiesManager.getInstance().selectedEntity.selectedArea) //移动区域
					{
						if (KeyboardManager.getInstance().minus) //-
						{
							ConfigData.remove(configDesc, DecorateEntitiesManager.getInstance().selectedEntity.data.id);
							DecorateEntitiesManager.getInstance().removeArea(DecorateEntitiesManager.getInstance().selectedEntity);
							EventManager.dispatchEvent(ConfigListEvent.PULL_CONFIG_LIST, mainTag.tabelName);
						}
						else
						{
                            // TODO : 坐标
							if (DecorateEntitiesManager.getInstance().selectedEntity.checkPlacementAreaByCenter(position.x, position.z))
							{
								DecorateEntitiesManager.getInstance().setAreaPos(DecorateEntitiesManager.getInstance().selectedEntity, position.x, position.z);
							}
							else
							{
								Alert.show("该区域不能安置！", "提示");
							}
						}
					}
					return true;
				}
			}
			return false;
		}

		public static function sceneEntityClick(role : SceneRole) : Boolean
		{
			var currTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedFuncTag;
			var currSubTag : FuncTagInfo = FuncTagManager.getInstance().currSelectedSubFuncTag;
			var mainTag : FuncTagInfo = null;
			if (currTag && currTag.featureType == FeaturesType.DECORATE_TYPE)
				mainTag = currTag;
			else if (currSubTag && currSubTag.subFeatureType == FeaturesType.DECORATE_TYPE)
				mainTag = currSubTag;
			if (!mainTag)
				return false;
			if (role.cfg)
			{
				DecorateEntitiesManager.getInstance().selectEntityByRole(role);
			}
			return true;
		}
	}
}
