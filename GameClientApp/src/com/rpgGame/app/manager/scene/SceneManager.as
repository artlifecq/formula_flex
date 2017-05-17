package com.rpgGame.app.manager.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine3D.core.GameScene3D;
	import com.game.engine3D.manager.GameScene3DManager;
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.game.engine3D.vo.BaseRole;
	import com.game.engine3D.vo.map.ClientMapData;
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.role.SceneDropGoodsManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.coreData.cfg.ClientSceneNpcCfgData;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.cfg.collect.CollectCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.ClientSceneNPC;
	import com.rpgGame.coreData.clientConfig.Q_map_transfer;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.info.collect.CollectObjcetInfo;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.type.AttachDisplayType;
	import com.rpgGame.coreData.type.GameScene3DType;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import away3d.pathFinding.DistrictWithPath;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 场景管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class SceneManager
	{
		/**
		 * 场景中最大渲染的角色的个数 
		 */		
		private static var _playerMaxRenderNum : int = 100;
		/**
		 * 场景中最大渲染的怪物个数 
		 */		
		private static var _monsterMaxRenderNum : int = 300;
		/**
		 * 场景中最大渲染的其它种类个数，比如说特效，采集物== 
		 */		
		private static var _otherMaxRenderNum : int = 100;
		/**
		 * 场景中最大渲染角色名字的个数 
		 */		
		private static var _maxRoleHeadNameNum : int = 100;
		/**
		 * 场景中的可视范围 
		 */		
		private static var _viewDistance : int = 4000;

		public static function setup() : void
		{
			if(!_scene)
			{
				_scene = new Scene(LayerManager.stage.stageWidth,LayerManager.stage.stageHeight,
					GameScene3DType.MAIN_SCENE,Stage3DLayerManager.getView(),_viewDistance,2);
				///
				LayerManager.stage.addEventListener(Event.RESIZE,onStageResize);
			}
//			var scene3d : GameScene3D = GameScene3DManager.createScene(GameScene3DType.MAIN_SCENE, Stage3DLayerManager.getView(), _viewDistance, 2);
			var scene3d:GameScene3D = _scene.gameScene3d;
			scene3d.cameraNear = 100;
			scene3d.sceneRenderLayer.setMaxRenderNum(SceneCharType.PLAYER, _playerMaxRenderNum);
			scene3d.sceneRenderLayer.setMaxRenderNum(SceneCharType.MONSTER, _monsterMaxRenderNum);
			scene3d.sceneRenderLayer.setMaxOtherRenderNum(_otherMaxRenderNum);
			scene3d.sceneRenderLayer.setMaxAttachNum(AttachDisplayType.ROLE_HEAD_NAME, _maxRoleHeadNameNum);

			SceneRoleSelectManager.setup();
			SceneDropGoodsManager.setup();

			EventManager.addEvent(TaskEvent.TASK_AREA_INFO_CHANGE, onUpdateTaskArea);
		}

		public static function get playerCount() : int
		{
			return SceneManager.getScene().sceneRenderLayer.getCurrRenderNum(SceneCharType.PLAYER);
		}

		public static function get monsterCount() : int
		{
			return SceneManager.getScene().sceneRenderLayer.getCurrRenderNum(SceneCharType.MONSTER);
		}

		public static function get otherCount() : int
		{
			return SceneManager.getScene().sceneRenderLayer.getCurrOtherRenderNum();
		}

		public static function get isSceneOtherRenderLimit() : Boolean
		{
			return SceneManager.getScene().sceneRenderLayer.isOtherRenderLimit();
		}

		public static function getScene(sceneName : String = GameScene3DType.MAIN_SCENE) : GameScene3D
		{
			return GameScene3DManager.getScene(sceneName);
		}

		public static function getDistrict(sceneName : String = GameScene3DType.MAIN_SCENE) : DistrictWithPath
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
				return scene.sceneMapLayer.district;
			return null;
		}

		public static function addSceneObjToScene(obj : BaseObj3D, clingGround : Boolean = false, needInViewDist : Boolean = true, renderLimitable : Boolean = true, sceneName : String = GameScene3DType.MAIN_SCENE) : void
		{
            if (null == obj) {
                return;
            }
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				scene.addSceneObj(obj, null, needInViewDist, renderLimitable);
				if (clingGround)
				{
					obj.clingGroundCalculate = scene.clingGround;
				}
			}
		}

		public static function removeSceneObjFromScene(obj : BaseObj3D, sceneName : String = GameScene3DType.MAIN_SCENE) : void
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				scene.removeSceneObj(obj);
			}
		}

		public static function get clientMapData() : ClientMapData
		{
			var scene : GameScene3D = getScene();
			if (scene && scene.sceneMapLayer && scene.sceneMapLayer.sceneMapData)
			{
				return scene.sceneMapLayer.sceneMapData.clientMapData;
			}
			return null;
		}

		public static function get otherMaxRenderNum() : int
		{
			return _otherMaxRenderNum;
		}

		public static function set otherMaxRenderNum(value : int) : void
		{
			_otherMaxRenderNum = value;
			var scene : GameScene3D = getScene();
			scene.sceneRenderLayer.setMaxOtherRenderNum(_otherMaxRenderNum);
		}

		public static function get maxRoleHeadNameNum() : int
		{
			return _maxRoleHeadNameNum;
		}

		public static function set maxRoleHeadNameNum(value : int) : void
		{
			_maxRoleHeadNameNum = value;
			var scene : GameScene3D = getScene();
			scene.sceneRenderLayer.setMaxAttachNum(AttachDisplayType.ROLE_HEAD_NAME, _maxRoleHeadNameNum);
		}

		public static function get monsterMaxRenderNum() : int
		{
			return _monsterMaxRenderNum;
		}

		public static function set monsterMaxRenderNum(value : int) : void
		{
			_monsterMaxRenderNum = value;
			var scene : GameScene3D = getScene();
			scene.sceneRenderLayer.setMaxRenderNum(SceneCharType.MONSTER, _monsterMaxRenderNum);
		}

		public static function get playerMaxRenderNum() : int
		{
			return _playerMaxRenderNum;
		}

		public static function set playerMaxRenderNum(value : int) : void
		{
			_playerMaxRenderNum = value;
			var scene : GameScene3D = getScene();
			scene.sceneRenderLayer.setMaxRenderNum(SceneCharType.PLAYER, _playerMaxRenderNum);
		}

		public static function set viewDistance(value : int) : void
		{
			_viewDistance = value;
			var scene : GameScene3D = getScene();
			if (scene)
				scene.viewDistance = _viewDistance;
		}

		public static function get viewDistance() : int
		{
			return _viewDistance;
		}

		public static function sceneBlur(blur : Boolean, sceneName : String = GameScene3DType.MAIN_SCENE) : void
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				scene.blur = blur;
				StarlingLayerManager.headFaceLayer.visible = !blur;
			}
		}

		/**
		 * 生成客户端场景NPC 
		 * 
		 */		
		public static function generateClientSceneNpcs() : void
		{
			var mapID : int = SceneSwitchManager.currentMapId;
			var sceneNpcs : Vector.<ClientSceneNPC> = ClientSceneNpcCfgData.getSceneNpcInfoList(mapID);
			if (sceneNpcs)
			{
				for each (var sceneNpc : ClientSceneNPC in sceneNpcs)
				{
					if (sceneNpc.isDynamicCreate)
					{
						continue;
					}
					var posList : Vector.<Point> = new Vector.<Point>();
					var pPosArr : Array = sceneNpc.bornPos.split(";");
					for each (var posStr : String in pPosArr)
					{
						if (posStr.length)
						{
							var pArr : Array = posStr.split("=");
							var p : Point = new Point(pArr[0], pArr[1]);
							posList.push(p);
						}
					}

					var bornPoses : Array = [];
					var grid : Point;
					if (posList.length > 2)
					{
						var grids : Array = MathUtil.polygonToGrids(posList, 50, 50);
						var gridsLen : int = grids.length;
						if (gridsLen > 1)
						{
							for (var n : int = 0; n < sceneNpc.bornCount; n++)
							{
								grid = grids[int(Math.random() * gridsLen)];
								var minX : int = grid.x;
								var minY : int = grid.y;
								var maxX : int = grid.x + 50;
								var maxY : int = grid.y + 50;

								var bpX : int = minX + int((maxX - minX) * Math.random());
								var bpY : int = minY + int((maxY - minY) * Math.random());
								bornPoses.push(new Point(bpX, bpY));
							}
						}
						else
						{
							grid = grids[0];
							bornPoses.push(grid);
						}
					}
					else
					{
						grid = posList[0];
						bornPoses.push(grid);
					}

					var bp : Point = bornPoses[0];
					if (bp)
					{
						//创建客户端场景NPC
						var data:MonsterData = new MonsterData( RoleType.CLIENT_NPC );
						data.id = sceneNpc.id;
						data.name = sceneNpc.name;
						data.modelID = sceneNpc.bindNpcModelId;
						data.needInViewDist = sceneNpc.needInViewDist;
						data.avatarInfo.setBodyResID( sceneNpc.avatarRes, null );
						data.x = bp.x;
						data.y = bp.y;
						data.sizeScale = sceneNpc.sizeScale > 0 ? sceneNpc.sizeScale : 1;
						var sceneClientRole:SceneRole = SceneRoleManager.getInstance().createMonster( data, SceneCharType.CLIENT_NPC );
						TouJingManager.setHuGuoSiEffect(data.modelID, sceneClientRole, true);
					}
				}
			}
		}

		/**
		 * 生成场景NPC
		 *
		 */
		public static function generateSceneNpcs() : void
		{
//			var mapID : int = MainRoleManager.actorInfo.mapID;
//			var npcList : Vector.<NpcProto> = NpcCfgData.getSceneNpc(mapID);
//			GameLog.add("生成NPC", npcList.length);
//			for each (var info : NpcProto in npcList)
//			{
//				var npcData : SceneNpcData = new SceneNpcData();
//				npcData.setProtocData(info);
//				SceneRoleManager.getInstance().createNpc(npcData);
//			}
		}

		/**
		 * 生成镖车
		 *
		 */
		public static function generateSceneBiaoche() : void
		{

		}

		/**
		 * 生成场景采集物
		 *
		 */
		public static function generateSceneCollects() : void
		{
			var mapID : int = SceneSwitchManager.currentMapId;
			var collectList : Vector.<CollectObjcetInfo> = CollectCfgData.getListBySceneID(mapID);
			GameLog.add("生成采集物", collectList.length);
			for each (var info : CollectObjcetInfo in collectList)
			{
				if (!info.isDynamicCreate)
				{
					var collectData : SceneCollectData = new SceneCollectData();
					collectData.setInfoData(info);
					SceneRoleManager.getInstance().createCollect(collectData);
				}
			}
		}

		/**
		 * 生成事件区域
		 *
		 */
		public static function generateEventArea() : void
		{
			if (SceneSwitchManager.isChangeSceneComplete)
			{
				AreaMapManager.updateTransportAreaMap();
				AreaMapManager.updateEscortAreaMap();
				AreaMapManager.updateExplorationAreaMap();
				AreaMapManager.updateMapDataAreaMap();
//				AreaMapManager.updateTriggerAreaMap();
			}
		}

		private static function onUpdateTaskArea() : void
		{
			AreaMapManager.updateEscortAreaMap();
			AreaMapManager.updateExplorationAreaMap();
		}

		/**
		 * 生成场景传送门
		 *
		 */
		public static function generateSceneTransports() : void
		{
			var mapID : int = SceneSwitchManager.currentMapId;
			//var sceneCountry : int = MainRoleManager.actorInfo.sceneSequence;
			//var transportList : Vector.<SceneTransportProto> = TranportsDataManager.getSceneTransport(mapID, sceneCountry);
            var transportList : Vector.<Q_map_transfer> = TransCfgData.getTranBySceneID(mapID);
			if(!transportList){
				return;
			}
			GameLog.add("[SceneManager] [generateSceneTransports]", "MapID:", mapID, ", transSize:", transportList.length);
            for each(var info : Q_map_transfer in transportList) {
                CONFIG::netDebug {
                    NetDebug.LOG("[ShowTrans] ID:", mapID,
                        "[ID]:", info.q_tran_id,
                        "[Name]:", info.q_name,
                        "[Res]:", info.q_tran_res,
                        "[SourceAreaID]:", info.q_tran_source_area_id,
                        "[DestAreaID]:", info.q_tran_dest_area_id,
                        "[ResDirection]:", info.q_tran_res_direction,
                        "[ResX]:", info.q_tran_res_x,
                        "[ResY]:", info.q_tran_res_y,
                        "[SceneID]:", info.q_map_id);
                }
                var tranportData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
                tranportData.setConfigData(info);
                SceneRoleManager.getInstance().createTranport(tranportData);
            }
			//for each (var info : SceneTransportProto in transportList)
			//{
			//	var tranportData : SceneTranportData = new SceneTranportData(RoleType.TYPE_TRANPORT_NORMAL);
			//	tranportData.setProtocData(info);
			//	SceneRoleManager.getInstance().createTranport(tranportData);
			//}
		}

		/**
		 * 通过ID获取场景对象.(只有服务器发过来的场景对象,才可以通过ID获取...其它的都不行...比如id+type)
		 * @param id
		 * @return
		 */
		public static function getSceneObjByID(id : Number, sceneName : String = GameScene3DType.MAIN_SCENE) : BaseObj3D
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var baseObj : BaseObj3D;
				for each (var type : String in SceneCharType.serverType)
				{
					baseObj = scene.getSceneObjByID(id, type);
					if (baseObj)
					{
						return baseObj;
					}
				}
			}
			return null;
		}

		public static function getSceneObjList(sceneName : String = GameScene3DType.MAIN_SCENE) : Vector.<BaseObj3D>
		{
			var objList : Vector.<BaseObj3D> = new Vector.<BaseObj3D>();
			//
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var typeList : Array = SceneCharType.serverType;
				var charList : Vector.<BaseObj3D> = scene.sceneObjList;
				for each (var type : String in typeList)
				{
					for each (var baseObj : BaseObj3D in charList)
					{
						if (baseObj && baseObj.usable && baseObj.type == type)
						{
							objList.push(baseObj);
						}
					}
				}
			}
			return objList;
		}

		public static function getSceneRoleList(sceneName : String = GameScene3DType.MAIN_SCENE) : Vector.<SceneRole>
		{
			var objList : Vector.<SceneRole> = new Vector.<SceneRole>();
			//
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var typeList : Array = SceneCharType.serverType;
				var charList : Vector.<BaseRole> = scene.sceneRoleList;
				for each (var type : String in typeList)
				{
					for each (var baseObj : SceneRole in charList)
					{
						if (baseObj && baseObj.usable && baseObj.type == type)
						{
							objList.push(baseObj);
						}
					}
				}
			}
			return objList;
		}

		/**
		 * 根据怪物配置id获取场景中的怪物列表
		 * @param modelId
		 * @return 符合条件的数组，默认为null
		 *
		 */
		public static function getMonsterListByCfgId(cfgId : int, sceneName : String = GameScene3DType.MAIN_SCENE) : Array
		{
			var monsters : Array;
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var arr : Array = scene.getSceneObjsByType(SceneCharType.MONSTER);
				if (arr)
				{
					var len : int = arr.length;
					for each (var sc : SceneRole in arr)
					{
						var monsterInfo : MonsterData = sc.data as MonsterData;
						if (monsterInfo.modelID == cfgId)
						{
							if (!monsters)
							{
								monsters = [sc];
							}
							else
							{
								monsters.push(sc);
							}
						}
					}
				}
			}
			return monsters;
		}

		/**
		 * 获取NPC模板ID
		 * @param id
		 * @return
		 *
		 */
		public static function getSceneNpcModelId(id : Number) : int
		{
			var role : SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
			if (role)
			{
				var roleData : MonsterData = role.data as MonsterData;
				if (roleData)
				{
					var monsterData : Q_monster = MonsterDataManager.getData(roleData.modelID);
					if (monsterData)
					{
						return monsterData.q_id;
					}
				}
			}
			return 0;
		}

		/**
		 * 由模板ID获取角色
		 * @param id
		 * @param sceneName
		 * @return
		 *
		 */
		public static function getSceneRolesByModelId(modelID : int, sceneName : String = GameScene3DType.MAIN_SCENE) : Vector.<SceneRole>
		{
			var roles : Vector.<SceneRole> = new Vector.<SceneRole>();
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var len : int;
				var sc : SceneRole;
				var monsterInfo : MonsterData;
				var arr : Array = scene.getSceneObjsByType(SceneCharType.NPC);
				if (arr)
				{
					len = arr.length;
					for each (sc in arr)
					{
						monsterInfo = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							roles.push(sc);
						}
					}
				}
				arr = scene.getSceneObjsByType(SceneCharType.PROTECT_NPC);
				if (arr)
				{
					len = arr.length;
					for each (sc in arr)
					{
						monsterInfo = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							roles.push(sc);
						}
					}
				}
				arr = scene.getSceneObjsByType(SceneCharType.MONSTER);
				if (arr)
				{
					len = arr.length;
					for each (sc in arr)
					{
						monsterInfo = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							roles.push(sc);
						}
					}
				}
			}
			return roles;
		}

		/**
		 * 由模板ID获取NPC
		 * @param id
		 * @param sceneName
		 * @return
		 *
		 */
		public static function getSceneNpcByModelId(modelID : int, sceneName : String = GameScene3DType.MAIN_SCENE) : SceneRole
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var arr : Array = scene.getSceneObjsByType(SceneCharType.NPC);
				if (arr)
				{
					var len : int = arr.length;
					for each (var sc : SceneRole in arr)
					{
						var monsterInfo : MonsterData = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							return sc;
						}
					}
				}
			}
			return null;
		}

		/**
		 * 由模板ID获取客户端NPC
		 * @param id
		 * @param sceneName
		 * @return
		 *
		 */
		public static function getSceneClientNpcByModelId(modelID : int, sceneName : String = GameScene3DType.MAIN_SCENE) : SceneRole
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var arr : Array = scene.getSceneObjsByType(SceneCharType.CLIENT_NPC);
				if (arr)
				{
					var len : int = arr.length;
					for each (var sc : SceneRole in arr)
					{
						var monsterInfo : MonsterData = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							return sc;
						}
					}
				}
			}
			return null;
		}

		/**
		 * 由模板ID获取粮仓
		 * @param id
		 * @param sceneName
		 * @return
		 *
		 */
		public static function getSceneLiangCangByModelId(modelID : int, sceneName : String = GameScene3DType.MAIN_SCENE) : SceneRole
		{
			var scene : GameScene3D = getScene(sceneName);
			if (scene)
			{
				var arr : Array = scene.getSceneObjsByType(SceneCharType.LIANG_CANG);
				if (arr)
				{
					var len : int = arr.length;
					for each (var sc : SceneRole in arr)
					{
						var monsterInfo : MonsterData = sc.data as MonsterData;
						if (monsterInfo.modelID == modelID)
						{
							return sc;
						}
					}
				}
			}
			return null;
		}
		
		private static var _scene:Scene;
		public static function get scene():Scene
		{
			return _scene;
		}
		
		public static function showScene():void
		{
			_scene.visible = true;
		}
		
		public static function hideScene():void
		{
			_scene.visible = false;
		}
		
		private static function onStageResize(e:Event):void
		{
			LayerManager.stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		protected static function onEnterFrame(event:Event):void
		{
			LayerManager.stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			var stageWidth:int = LayerManager.stage.stageWidth;
			var stageHeight:int = LayerManager.stage.stageHeight;
			_scene.reSize(stageWidth, stageHeight);
			//			SceneSender.chgViewRange();
		}
	}
}
