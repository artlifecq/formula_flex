package com.editor.core
{
	import com.editor.cfg.GlobalConfig;
	import com.editor.cfg.ProjectConfig;
	import com.editor.data.ConfigDesc;
	import com.editor.data.InternalTabelName;
	import com.editor.data.TabelData;
	import com.editor.data.map.ClientMapAreaData;
	import com.editor.data.map.ClientMapCameraPropertyData;
	import com.editor.data.map.ClientMapTimeOfTheDayData;
	import com.editor.data.map.EditorClientMapData;
	import com.editor.data.map.MapAreaTypeEnum;
	import com.editor.manager.DataStructuresManager;
	import com.editor.manager.SceneBlockManager;
	import com.editor.manager.SceneManager;
	import com.editor.utils.FileUtil;
	import com.game.engine3D.pathFinding.HeightMapHelperProxy;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.map.ClientMapAreaGridData;
	
	import flash.filesystem.File;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import mx.controls.Alert;
	
	import app.message.NavMapData;
	import app.message.NavMapData.PolygonProto;
	import app.message.NavMapData.SpellLimitPolygonProto;
	import app.message.NavMapData.StallPolygonProto;
	import app.message.NavMapData.WalkablePolygonData;
	import app.message.NavMapData.StallPolygonProto.StallPolyGridProto;
	
	import away3d.pathFinding.PointsSet;
	
	import mapProtoV1.app.message.NavMapData_V1;
	import mapProtoV1.app.message.navMapData.PolygonProto_V1;
	import mapProtoV1.app.message.navMapData.SpellLimitPolygonProto_V1;
	import mapProtoV1.app.message.navMapData.WalkablePolygonData_V1;

	/**
	 *
	 * 场景地图块信息创建器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-29 下午8:26:37
	 *
	 */
	public class SceneMapBlockInfoCreater
	{
		private static var _instance : SceneMapBlockInfoCreater;

		public static function getInstance() : SceneMapBlockInfoCreater
		{
			if (!_instance)
			{
				_instance = new SceneMapBlockInfoCreater();
			}
			return _instance;
		}

		public function SceneMapBlockInfoCreater()
		{
		}

		private function exportMapAreas(mapData : EditorClientMapData) : void
		{
			if (mapData)
			{
				if (SceneManager.getInstance().mainScene.sceneMapLayer.isLoaded)
				{
					mapData.boundMinX = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMinX;
					mapData.boundMinY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMinZ;
					mapData.boundMaxX = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxX;
					mapData.boundMaxY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxZ;
                    if (HeightMapHelperProxy.MODE_XY == SceneManager.getInstance().xyzMode) {
                        mapData.boundMaxY = -SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMinY;
                        mapData.boundMinY = -SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxY;
                    } else if (HeightMapHelperProxy.MODE_XZ == SceneManager.getInstance().xyzMode) {
                        mapData.boundMaxY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxZ;
                        mapData.boundMinY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMinZ;
                    }
				}

				var tabel : TabelData = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapDataAreaConfigName);
				var configDesc : ConfigDesc = tabel ? tabel.getConfigDesc() : null;
				var cacheDic : Dictionary;
				var datas : Array;
				if (configDesc)
				{
					cacheDic = configDesc.cacheDic;
					datas = FileUtil.dictToArray(cacheDic);
					FileUtil.sortDatas(datas);

					mapData.areaDatas.length = 0;
					var len : int = datas.length;
					var stallGridId : int = 0;
					for (var i : int = 0; i < len; i++)
					{
						var areaData : ClientMapAreaData = datas[i];
						mapData.areaDatas.push(areaData);
						areaData.gridLen = 0;
						areaData.grids = null;
						if (areaData.mType == MapAreaTypeEnum.STALL)
						{
							var polygonPos : Vector.<Point> = areaData.getPoints();
							var bounds : Array = MathUtil.getPolygonBounds(polygonPos);
							if (bounds)
							{
								var gridMaxCount : int = ((bounds[2] - bounds[0]) / areaData.mGridWidth) * ((bounds[3] - bounds[1]) / areaData.mGridHeight);
								if (gridMaxCount > 0)
								{
									if (gridMaxCount <= 500)
									{
										var polyGrids : Array = MathUtil.polygonToGrids(polygonPos, areaData.mGridWidth, areaData.mGridHeight, true);
										var gridLen : int = polyGrids.length;
										areaData.gridLen = gridLen;
										areaData.grids = new Vector.<ClientMapAreaGridData>();
										for each (var gridPos : Point in polyGrids)
										{
											stallGridId++;
											var gridData : ClientMapAreaGridData = new ClientMapAreaGridData(stallGridId, gridPos.x, gridPos.y, areaData.mGridWidth, areaData.mGridHeight);
											areaData.grids.push(gridData);
										}
									}
									else
									{
										Alert.show(areaData.id + ":" + areaData.name + "的栅格数超出限制500，目前已达到" + gridMaxCount + "！", "提示");
									}
								}
							}
						}
					}
				}

				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapTimeOfTheDayConfigName);
				configDesc = tabel ? tabel.getConfigDesc() : null;
				if (configDesc)
				{
					cacheDic = configDesc.cacheDic;
					datas = FileUtil.dictToArray(cacheDic);
					var timeOfTheDayData : ClientMapTimeOfTheDayData = datas.length > 0 ? datas[0] : null;
					mapData.timeOfTheDayData = timeOfTheDayData;
				}
				tabel = DataStructuresManager.getInstance().getTabel(InternalTabelName.MapCameraPropertyConfigName);
				configDesc = tabel ? tabel.getConfigDesc() : null;
				if (configDesc)
				{
					cacheDic = configDesc.cacheDic;
					datas = FileUtil.dictToArray(cacheDic);
					var cameraPropertyData : ClientMapCameraPropertyData = datas.length > 0 ? datas[0] : null;
					mapData.cameraPropertyData = cameraPropertyData;
				}

				var isBlock : Boolean = SceneBlockManager.getInstance().isSceneBlock(SceneManager.getInstance().mapId);
				///客户端
				var clientBytes : ByteArray = new ByteArray();
				mapData.writeTo(clientBytes);
				clientBytes.compress();
				var dataFilePath : String = GlobalConfig.getMapDataPath(mapData.name);
				if (isBlock)
				{
					dataFilePath = GlobalConfig.getBlockData(mapData.name);
				}
				var dataFile : File = new File(dataFilePath);
				FileUtil.writeToFile(dataFile.nativePath, clientBytes);
			}
		}

		public function export(sceneMapBlockVersion : int, mapData : EditorClientMapData) : void
		{
			if (mapData && mapData.name && !SceneManager.getInstance().mainScene.isLoading)
			{
//				if (!SceneBlockManager.getInstance().exportMapArea(exortBlockInfo))
//				{
				//convertImages(mapData);
				exportMapAreas(mapData);
				exortBlockInfo(mapData, sceneMapBlockVersion);
//				}
			}
		}

		public function exortBlockInfo(mapData : EditorClientMapData, sceneMapBlockVersion : int, dynamicObstacleAreas : Vector.<ClientMapAreaData> = null, suffixName : String = null) : void
		{
			if (mapData)
			{
				var isBlock : Boolean = SceneBlockManager.getInstance().isSceneBlock(SceneManager.getInstance().mapId);
				//如果是地图块，就不生成服务器数据了
				if (isBlock)
				{
					Alert.show("导出成功！");
					return;
				}

				if (SceneManager.getInstance().mainScene.sceneMapLayer.isLoaded)
				{
					///服务器
					var boundPointsSet : Vector.<Vector3D> = SceneManager.getInstance().mainScene.sceneMapLayer.district.boundPointsSet.points;
					var internalPointsSets : Vector.<PointsSet> = SceneManager.getInstance().mainScene.sceneMapLayer.district.internalPointsSets;
					var polyCount : int = 0;
					var pointCount : int = 0;
					var path : String = ProjectConfig.sceneMapBlockInfoPath;
					var bytes : ByteArray = new ByteArray();
					var negativeInfo : String = "";
					var overflowInfo : String = "";
					var bp : Vector3D;
					var ips : PointsSet;
					var ip : Vector3D;
					var areaData : ClientMapAreaData;
					var areaPonit : Vector.<Vector3D>;
					var ap : Vector3D;
					var obstacleAreas : Vector.<ClientMapAreaData> = mapData.getObstacleAreas();
					if (dynamicObstacleAreas)
					{
						obstacleAreas = obstacleAreas.concat(dynamicObstacleAreas);
					}
					var pkAreas : Vector.<ClientMapAreaData> = mapData.getAthleticsAreas();
					var safeAreas : Vector.<ClientMapAreaData> = mapData.getSafeAreas();
					var stallAreas : Vector.<ClientMapAreaData> = mapData.getStallAreas();
					var spellForbidAreas : Vector.<ClientMapAreaData> = mapData.getSpellForbidAreas();

					if (sceneMapBlockVersion == 1)
					{
						var navMapDataV1 : NavMapData_V1 = new NavMapData_V1();

						navMapDataV1.numBlocksX = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxX;
						navMapDataV1.numBlocksY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxZ;
						navMapDataV1.walkablePoly = new WalkablePolygonData_V1();
						navMapDataV1.walkablePoly.isWalkable = true;
						navMapDataV1.walkablePoly.point = [];
						polyCount++;

						for each (bp in boundPointsSet)
						{
							if (bp.x < 0 || bp.z < 0)
							{
								negativeInfo += bp.x + "，" + bp.z + "\n";
							}
							if (bp.x > navMapDataV1.numBlocksX || bp.z > navMapDataV1.numBlocksY)
							{
								overflowInfo += bp.x + "，" + bp.z + "\n";
							}
							pointCount++;
							navMapDataV1.walkablePoly.point.push(bp.x, bp.z);
						}
						navMapDataV1.walkablePoly.subPoly = [];
						var walkablePoly_v1 : WalkablePolygonData_V1;
						for each (ips in internalPointsSets)
						{
							polyCount++;
							walkablePoly_v1 = new WalkablePolygonData_V1();
							walkablePoly_v1.isWalkable = false;
							walkablePoly_v1.point = [];
							navMapDataV1.walkablePoly.subPoly.push(walkablePoly_v1);
							for each (ip in ips.points)
							{
								if (ip.x < 0 || ip.z < 0)
								{
									negativeInfo += ip.x + "，" + ip.z + "\n";
								}
								if (ip.x > navMapDataV1.numBlocksX || ip.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ip.x + "，" + ip.z + "\n";
								}
								pointCount++;
								walkablePoly_v1.point.push(ip.x, ip.z);
							}
						}

						for each (areaData in obstacleAreas)
						{
							polyCount++;
							walkablePoly_v1 = new WalkablePolygonData_V1();
							walkablePoly_v1.isWalkable = false;
							walkablePoly_v1.point = [];
							navMapDataV1.walkablePoly.subPoly.push(walkablePoly_v1);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
								if (ap.x < 0 || ap.z < 0)
								{
									negativeInfo += ap.x + "，" + ap.z + "\n";
								}
								if (ap.x > navMapDataV1.numBlocksX || ap.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ap.x + "，" + ap.z + "\n";
								}
								pointCount++;
								walkablePoly_v1.point.push(ap.x, ap.z);
							}
						}

						var poly_v1 : PolygonProto_V1;
						for each (areaData in pkAreas)
						{
							polyCount++;
							poly_v1 = new PolygonProto_V1();
							poly_v1.point = [];
							navMapDataV1.pkablePoly.push(poly_v1);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
								if (ap.x < 0 || ap.z < 0)
								{
									negativeInfo += ap.x + "，" + ap.z + "\n";
								}
								if (ap.x > navMapDataV1.numBlocksX || ap.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ap.x + "，" + ap.z + "\n";
								}
								pointCount++;
								poly_v1.point.push(ap.x, ap.z);
							}
						}

						for each (areaData in safeAreas)
						{
							polyCount++;
							poly_v1 = new PolygonProto_V1();
							poly_v1.point = [];
							navMapDataV1.safePoly.push(poly_v1);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
								if (ap.x < 0 || ap.z < 0)
								{
									negativeInfo += ap.x + "，" + ap.z + "\n";
								}
								if (ap.x > navMapDataV1.numBlocksX || ap.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ap.x + "，" + ap.z + "\n";
								}
								pointCount++;
								poly_v1.point.push(ap.x, ap.z);
							}
						}

						for each (areaData in stallAreas)
						{
							polyCount++;
							poly_v1 = new PolygonProto_V1();
							poly_v1.point = [];
							navMapDataV1.tradePoly.push(poly_v1);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
								if (ap.x < 0 || ap.z < 0)
								{
									negativeInfo += ap.x + "，" + ap.z + "\n";
								}
								if (ap.x > navMapDataV1.numBlocksX || ap.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ap.x + "，" + ap.z + "\n";
								}
								pointCount++;
								poly_v1.point.push(ap.x, ap.z);
							}
						}

						var spellPoly_v1 : SpellLimitPolygonProto_V1;
						for each (areaData in spellForbidAreas)
						{
							polyCount++;
							spellPoly_v1 = new SpellLimitPolygonProto_V1();
							spellPoly_v1.poly = new PolygonProto_V1();
							spellPoly_v1.poly.point = [];
							spellPoly_v1.unlimitSpellType = areaData.getForbidSpells();
							navMapDataV1.spellLimitPoly.push(spellPoly_v1);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
								if (ap.x < 0 || ap.z < 0)
								{
									negativeInfo += ap.x + "，" + ap.z + "\n";
								}
								if (ap.x > navMapDataV1.numBlocksX || ap.z > navMapDataV1.numBlocksY)
								{
									overflowInfo += ap.x + "，" + ap.z + "\n";
								}
								pointCount++;
								spellPoly_v1.poly.point.push(ap.x, ap.z);
							}
						}
						navMapDataV1.writeTo(bytes);
					}
					else if (sceneMapBlockVersion == 2)
					{
						var navMapData : NavMapData = new NavMapData();

						navMapData.numBlocksX = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxX;
                        navMapData.numBlocksY = 0;
                        if (HeightMapHelperProxy.MODE_XY == SceneManager.getInstance().xyzMode) {
                            navMapData.numBlocksY = -SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMinY;
                        } else if (HeightMapHelperProxy.MODE_XZ == SceneManager.getInstance().xyzMode) {
                            navMapData.numBlocksY = SceneManager.getInstance().mainScene.sceneMapLayer.heightMapHelper.worldMaxZ;
                        }
						
						navMapData.walkablePoly = new WalkablePolygonData();
						navMapData.walkablePoly.isWalkable = true;
						navMapData.walkablePoly.point = [];
						polyCount++;
                        
                        function checkAndAdd(list : Array, point : Vector3D) : void {
                            var x : Number = point.x;
                            var y : Number = 0;
                            if (HeightMapHelperProxy.MODE_XY == SceneManager.getInstance().xyzMode) {
                                y = -point.y;
                            } else if (HeightMapHelperProxy.MODE_XZ == SceneManager.getInstance().xyzMode) {
                                y = point.z;
                            }
                            if (x < 0 || y < 0) {
                                negativeInfo += x + ", " + y + "\n";
                            }
                            if (x > navMapData.numBlocksX || y > navMapData.numBlocksY) {
                                overflowInfo += x + ", " + y + "\n";
                            }
                            pointCount++;
                            list.push(x, y);
                        }

						for each (bp in boundPointsSet)
						{
                            checkAndAdd(navMapData.walkablePoly.point, bp);
						}
						navMapData.walkablePoly.subPoly = [];
						var walkablePoly : WalkablePolygonData;
						for each (ips in internalPointsSets)
						{
							polyCount++;
							walkablePoly = new WalkablePolygonData();
							walkablePoly.isWalkable = false;
							walkablePoly.point = [];
							navMapData.walkablePoly.subPoly.push(walkablePoly);
							for each (ip in ips.points)
							{
                                checkAndAdd(walkablePoly.point, ip);
							}
						}

						for each (areaData in obstacleAreas)
						{
							polyCount++;
							walkablePoly = new WalkablePolygonData();
							walkablePoly.isWalkable = false;
							walkablePoly.point = [];
							navMapData.walkablePoly.subPoly.push(walkablePoly);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
                                checkAndAdd(walkablePoly.point, ap);
							}
						}

						var poly : PolygonProto;
						for each (areaData in pkAreas)
						{
							polyCount++;
							poly = new PolygonProto();
							poly.point = [];
							navMapData.pkablePoly.push(poly);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
                                checkAndAdd(poly.point, ap);
							}
						}

						for each (areaData in safeAreas)
						{
							polyCount++;
							poly = new PolygonProto();
							poly.point = [];
							navMapData.safePoly.push(poly);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
                                checkAndAdd(poly.point, ap);
							}
						}

						var stallPoly : StallPolygonProto;
						for each (areaData in stallAreas)
						{
							polyCount++;
							stallPoly = new StallPolygonProto();
							stallPoly.poly = new PolygonProto();
							stallPoly.poly.point = [];
							navMapData.stallPoly.push(stallPoly);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
                                checkAndAdd(stallPoly.poly.point, ap);
							}

							var polyGrids : Vector.<ClientMapAreaGridData> = areaData.grids;
							var gridLen : int = polyGrids ? polyGrids.length : 0;
							navMapData.stallGridLength = gridLen;
							stallPoly.grids = [];
							for (var i : int = 0; i < gridLen; i++)
							{
								var gridData : ClientMapAreaGridData = polyGrids[i];
								var gridProto : StallPolyGridProto = new StallPolyGridProto();
								gridProto.id = gridData.id;
								gridProto.x = gridData.gridX;
								gridProto.y = gridData.gridY;
								stallPoly.grids.push(gridProto);
							}
						}

						var spellPoly : SpellLimitPolygonProto;
						for each (areaData in spellForbidAreas)
						{
							polyCount++;
							spellPoly = new SpellLimitPolygonProto();
							spellPoly.poly = new PolygonProto();
							spellPoly.poly.point = [];
							spellPoly.unlimitSpellType = areaData.getForbidSpells();
							navMapData.spellLimitPoly.push(spellPoly);
							areaPonit = areaData.getVector3Ds();
							for each (ap in areaPonit)
							{
                                checkAndAdd(spellPoly.poly.point, ap);
							}
						}
						navMapData.writeTo(bytes);
					}

					var info : String = "";
					if (negativeInfo)
						negativeInfo = "地图区域内存在负方向的点！\n" + negativeInfo;
					if (overflowInfo)
						overflowInfo = "地图区域内存在溢出边界的点！\n" + overflowInfo;
					if (negativeInfo || overflowInfo)
						info = negativeInfo + overflowInfo;

					FileUtil.writeToFile(path + "/" + mapData.name + (suffixName ? "_" + suffixName : ""), bytes);
					Alert.show("导出场景地图块信息成功！版本：V" + sceneMapBlockVersion + "，多边形数目：" + polyCount + "，点数目：" + pointCount + //
						"，文件大小：" + bytes.length + (info ? ("\n存在问题：\n" + info) : ""), "提示");
				}
				else
				{
					Alert.show("导出场景数据信息成功，可进行下一步处理！版本：V" + sceneMapBlockVersion, "提示");
				}
			}
		}

		private function convertImages(mapData : EditorClientMapData) : void
		{
			if (mapData)
			{
				var convert : PowerOfTwoConvert;
				var miniMapUrl : String = GlobalConfig.getMiniMapName(/*mapData.mMapRes,*/ mapData.mMiniMapRes);
				convert = new PowerOfTwoConvert();
				convert.convert(miniMapUrl);
				var radarMapUrl : String = GlobalConfig.getRadarMapName(/*mapData.mMapRes,*/ mapData.mRadarMapRes);
				convert = new PowerOfTwoConvert();
				convert.convert(radarMapUrl);
			}
		}
	}
}
