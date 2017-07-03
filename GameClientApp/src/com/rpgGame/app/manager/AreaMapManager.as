package com.rpgGame.app.manager
{
	import com.game.engine3D.core.AreaMap;
	import com.game.engine3D.vo.AreaMapData;
	import com.game.engine3D.vo.MapPointSet;
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.cfg.ClientTrigger;
	import com.rpgGame.coreData.cfg.TriggerCfgData;
	import com.rpgGame.coreData.enum.AreaMapTypeEnum;
	import com.rpgGame.coreData.enum.EnumAreaMapType;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;

	/**
	 *
	 * 区域图管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-7-15 上午10:26:37
	 *
	 */
	public class AreaMapManager
	{
		public function AreaMapManager()
		{
		}

		/**
		 * 更新摄像机区域图
		 *
		 */
		public static function updateCameraAreaMap() : void
		{
			var cameraAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.CAMERA_AREA);
			var cameraAreas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getCameraPropertyAreas();
			for each (var areaData : ClientMapAreaData in cameraAreas)
			{
				var areaMapData : AreaMapData = new AreaMapData(areaData.points.slice(), AreaMapTypeEnum.CAMERA_PROPERTY, areaData.id, areaData);
				cameraAreaMap.addFlag(areaMapData);
			}
		}

		/**
		 * 更新传送门区域图
		 *
		 */
		public static function updateTransportAreaMap() : void
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var transportList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.TRANS);
            CONFIG::netDebug {
                NetDebug.LOG("[AreaMapManager] [updateTransportAreaMap] len:" + transportList.length);
            }
			for each (var transRole : SceneRole in transportList)
			{
				var info : SceneTranportData = transRole.data as SceneTranportData;
                CONFIG::netDebug {
                    NetDebug.LOG("[AreaMapManager] [updateTransportAreaMap] data:" + info + ", polygon:" + info.polygon);
                }
				var polygon : Vector.<Point> = info.polygon.slice();
				var areaMapData : AreaMapData = new AreaMapData(polygon, AreaMapTypeEnum.TRANS, info.id, transRole);
				var color : String = otherAreaMap.addFlag(areaMapData);
                CONFIG::netDebug {
                    var str : String = "[";
                    for each(var p : Point in polygon) {
                        str += "(" + p.x + "," + p.y + "),";
                    }
                    str += "]";
                    NetDebug.LOG("[AreaMapManager] [updateTransportAreaMap] polgon:" + str + ", color:" + color);
                }
			}
		}

		/**
		 * 更新护送区域图
		 *
		 */
		public static function updateEscortAreaMap() : void
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			if (TaskInfoDecoder.currentEscortInfo)
			{
				var mapID : int = SceneSwitchManager.currentMapId;
				if (TaskInfoDecoder.currentEscortInfo.targetArea.sceneId == mapID)
				{
					var polygon : Vector.<Point> = new Vector.<Point>();
					var poses : Array = TaskInfoDecoder.currentEscortInfo.targetArea.pos;
					var posesLen : int = poses.length;
					for (var i : int = 0; i < posesLen; i += 2)
					{
						var x : int = poses[i];
						var y : int = poses[i + 1];
						polygon.push(new Point(x, y));
					}
					var areaMapData : AreaMapData = new AreaMapData(polygon, AreaMapTypeEnum.EVENT_AREA_PROPERTY, 1, TaskInfoDecoder.currentEscortInfo);
					otherAreaMap.addFlag(areaMapData);
				}
			}
			else
			{
				otherAreaMap.removeFlag(AreaMapTypeEnum.EVENT_AREA_PROPERTY, 1);
			}
		}

		/**
		 * 更新探索区域图
		 *
		 */
		public static function updateExplorationAreaMap() : void
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			if (TaskInfoDecoder.currentExplorationInfo)
			{
				var mapID : int = SceneSwitchManager.currentMapId;
				if (TaskInfoDecoder.currentExplorationInfo.targetArea.sceneId == mapID)
				{
					var polygon : Vector.<Point> = new Vector.<Point>();
					var poses : Array = TaskInfoDecoder.currentExplorationInfo.targetArea.pos;
					var posesLen : int = poses.length;
					for (var i : int = 0; i < posesLen; i += 2)
					{
						var x : int = poses[i];
						var y : int = poses[i + 1];
						polygon.push(new Point(x, y));
					}
					var areaMapData : AreaMapData = new AreaMapData(polygon, AreaMapTypeEnum.EVENT_AREA_PROPERTY, 2, TaskInfoDecoder.currentExplorationInfo);
					otherAreaMap.addFlag(areaMapData);
				}
			}
			else
			{
				otherAreaMap.removeFlag(AreaMapTypeEnum.EVENT_AREA_PROPERTY, 2);
			}
		}

		/**
		 * 更新触发区域图
		 *
		 */
		public static function updateTriggerAreaMap() : void
		{
			//
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var mapID : int = SceneSwitchManager.currentMapId;
			var triggerList : Vector.<ClientTrigger> = TriggerCfgData.getTriggerAreas(mapID);
			//var triggerList : Vector.<ClientTrigger> = ClientTriggerCfgData.getSceneTriggerList(mapID);
			for each (var trigger : ClientTrigger in triggerList)
			{
				var areaMapData : AreaMapData = new AreaMapData(AreaCfgData.getAreaPointsByID(trigger.areaId), AreaMapTypeEnum.TRIGGER_AREA_PROPERTY, trigger.id, trigger);
				otherAreaMap.addFlag(areaMapData);
				
				/*if (trigger.targetType == EnumClientTriggerType.AREA_TRIGGER)
				{
					var area : ClientArea = ClientAreaCfgData.getData(trigger.areaId);
					if (area)
					{
						var polygon : Vector.<Point> = new Vector.<Point>();
						var poses : Array = area.pos.split(";");
						var posesLen : int = poses.length;
						for (var i : int = 0; i < posesLen; i++)
						{
							var xy : Array = String(poses[i]).split("=");
							var x : int = int(xy[0]);
							var y : int = int(xy[1]);
							polygon.push(new Point(x, y));
						}
						var areaMapData : AreaMapData = new AreaMapData(polygon, AreaMapTypeEnum.TRIGGER_AREA_PROPERTY, trigger.id, trigger);
						otherAreaMap.addFlag(areaMapData);
					}
				}*/
			}
		}
		
		/**
		 *  添加动态阻挡区域
		 *
		 */
		public static function addDynamicObstacleArea(aid:int) : void
		{
			var obstacleArea : ClientMapAreaData = AreaCfgData.getDynamicObstacleAreas(aid);
			if(!obstacleArea)return;
			var mapPointSets : Vector.<MapPointSet> = new Vector.<MapPointSet>();
			mapPointSets.push(new MapPointSet("MapDataDynamicObstacleArea" + aid, obstacleArea.getVector2Ds()));
			SceneManager.getScene().sceneMapLayer.addObstaclePoints(mapPointSets);
		}
		/**
		 *  删除动态阻挡区域
		 */
		public static function removeDynamicObstacleArea(aid:int) : void
		{
			SceneManager.getScene().sceneMapLayer.removeObstaclePoints(["MapDataDynamicObstacleArea" + aid]);
		}
		
		public static function getRoleInMapDataSwimArea(role:SceneRole):ClientMapAreaData
		{
			var _local4:AreaMap = SceneManager.getScene().getAreaMap(4);
			var _local3:AreaMapData = _local4.getFlag(role.x, role.z);
			var _local2:Object = _local3 ? _local3.data : null;
			if (_local2 is ClientMapAreaData && ClientMapAreaData(_local2).type == 9)
			{
				return ClientMapAreaData(_local2);
			}
			return null;
		}

		/**
		 * 更新地图数据区域图
		 *
		 */
		public static function updateMapDataAreaMap() : void
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaDatas : Array = SceneManager.clientMapData.areaDatas;
			trace(areaDatas);
			for each (var areaData : ClientMapAreaData in areaDatas)
			{
				if (areaData.type == MapAreaTypeEnum.SAFE || areaData.type == MapAreaTypeEnum.ATHLETICS || areaData.type == MapAreaTypeEnum.SPELL_FORBID|| areaData.type == MapAreaTypeEnum.STALL)
				{
					var vector3Ds : Vector.<Vector3D> = areaData.getVector3Ds();
					var polygon : Vector.<Point> = new Vector.<Point>();
					for each (var vector3D : Vector3D in vector3Ds)
					{
						polygon.push(new Point(vector3D.x, vector3D.z));
					}
					var areaMapData : AreaMapData = new AreaMapData(polygon, AreaMapTypeEnum.MAP_DATA_AREA_PROPERTY, areaData.id, areaData);
					otherAreaMap.addFlag(areaMapData);
				}
			}
		}

		/**
		 * 获取角色在地图数据的区域
		 * @return
		 *
		 */
		public static function getRoleInMapDataArea(role : SceneRole) : ClientMapAreaData
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaMapData : AreaMapData = otherAreaMap.getFlag(role.x, role.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is ClientMapAreaData)
			{
				var areaData : ClientMapAreaData = flagObj as ClientMapAreaData;
				return areaData;
			}
			return null;
		}

		/**
		 * 获取角色在地图数据的区域类型
		 * @return
		 *
		 */
		public static function getRoleInMapDataAreaType(role : SceneRole) : int
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaMapData : AreaMapData = otherAreaMap.getFlag(role.x, role.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is ClientMapAreaData)
			{
				var areaData : ClientMapAreaData = flagObj as ClientMapAreaData;
				return areaData.type;
			}
			return 0;
		}

		/**
		 * 在区域内是否禁止该技能
		 * @param role
		 * @param spellType
		 * @return
		 *
		 */
		public static function forbidCastSpellInMapDataArea(role : SceneRole, spellID : int) : Boolean
		{
			var otherAreaMap : AreaMap = SceneManager.getScene().getAreaMap(EnumAreaMapType.OTHER_AREA);
			var areaMapData : AreaMapData = otherAreaMap.getFlag(role.x, role.z);
			var flagObj : Object = areaMapData ? areaMapData.data : null;
			if (flagObj is ClientMapAreaData)
			{
				var areaData : ClientMapAreaData = flagObj as ClientMapAreaData;
				if (areaData.type == MapAreaTypeEnum.SPELL_FORBID)
				{
					var spellIDs : Array = areaData.getForbidSpells();
					if (spellIDs && spellIDs.indexOf(spellID) > -1)
					{
						return true;
					}
				}
			}
			return false;
		}

		/**
		 * 更新主角进入区域信息
		 *
		 */
		public static function updateActorEnterAreaInfo() : void
		{
//			var actor : SceneRole = MainRoleManager.actor;
//			var areaType : int = AreaMapManager.getRoleInMapDataAreaType(actor);
//			if (areaType != actor.mapAreaType)
//			{
//				actor.mapAreaType = areaType;
//				switch (areaType)
//				{
//					case MapAreaTypeEnum.ATHLETICS:
//						NoticeManager.showNotify(LangQ_NoticeInfo.ENTER_ATHLETICS_AREA_INFO); //"您已进入竞技区！击杀本国、盟国玩家不会增加恶名值！"
//						break;
//					case MapAreaTypeEnum.SAFE:
//						NoticeManager.showNotify(LangQ_NoticeInfo.ENTER_SAFE_AREA_INFO); //"您已进入安全区！不能攻击其他玩家或被其他玩家攻击！"
//						break;
//					case MapAreaTypeEnum.STALL:
//						NoticeManager.showNotify(LangQ_NoticeInfo.ENTER_STALL_AREA_INFO); //"您已进入摆摊区！可自由摆摊！"
//						break;
//					case MapAreaTypeEnum.SPELL_FORBID:
//						NoticeManager.showNotify(LangQ_NoticeInfo.ENTER_SPELL_FORBID_AREA_INFO); //"您已进入技能禁止区！禁止使用部分技能！"
//						break;
//				}
//			}
		}
	}
}
