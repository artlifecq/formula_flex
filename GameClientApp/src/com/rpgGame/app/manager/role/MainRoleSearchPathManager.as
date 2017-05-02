package com.rpgGame.app.manager.role
{
	import com.game.engine3D.events.SceneEvent;
	import com.game.engine3D.events.SceneEventAction3D;
	import com.game.engine3D.utils.MathUtil;
	import com.game.engine3D.vo.BaseObj3D;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.WorldMapEvent;
	import com.rpgGame.coreData.cfg.TranportsDataManager;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.SearchMapData;
	import com.rpgGame.coreData.info.SearchRoleData;
	import com.rpgGame.coreData.info.map.GotoTargetData;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import app.message.SceneTransportProto;
	
	import away3d.events.MouseEvent3D;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 主角跨场景寻路管理器
	 * @author wewell
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class MainRoleSearchPathManager
	{
		/**
		 * 跨场景寻路记录数组
		 * SearchMapData
		 *
		 */
		private static var _scenePath : Vector.<SearchMapData> = new Vector.<SearchMapData>();

		private static var _scMoveCallBack : WalkMoveStateReference;

		private static var _isAutoFinding : Boolean = false;

		/** 自动寻路大于多少距离自动上马  */
		public static const AUTO_MOUNT_UP_DISTANCE : int = 10;

		private static var currentSceneId : int;
		private static var _data : Object;
		private static var _onArrive:Function;
		
		/**当前要去的目标地图编号，只为跨地图寻路引导面板使用*/
		public static var gotoTargetData : GotoTargetData = new GotoTargetData();
		/**是否使用传送*/
		public static var isUseTransport : Boolean = false;

		public function MainRoleSearchPathManager()
		{

		}

		setup();

		private static function setup() : void
		{
			//注册场景交互事件
			EventManager.addEvent(SceneEvent.INTERACTIVE, onSceneInteractive);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onSwitchCmp);
		}

		private static function onSceneInteractive(action : String, mosEvt : MouseEvent3D, position : Vector3D, currTarget : BaseObj3D, target : BaseObj3D) : void
		{
			switch (action)
			{
				case SceneEventAction3D.SCENE_MAP_MOUSE_DOWN: //点击场景
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_DOWN: //点击实体
				case SceneEventAction3D.SCENE_ENTITY_MOUSE_RIGHT_DOWN: //点击实体
					clearAutoFindPath();
					break;
			}
		}

		public static function trySetSearchRoleData(roleData : MonsterData) : void
		{
			if (_data is SearchRoleData)
			{
				var searchRoleData : SearchRoleData = _data as SearchRoleData;
				if (roleData.modelID == searchRoleData.searchId)
				{
					searchRoleData.targetData = roleData;
				}
			}
		}

		private static function updateMapWaysGuild() : void
		{
			if (AppManager.isAppInScene(AppConstant.MAP_WAYS_GUILD_PANEL))
			{
				EventManager.dispatchEvent(WorldMapEvent.MAP_WAYS_GUILD_UPDATA_PATHS);
			}
			else
			{
				AppManager.showApp(AppConstant.MAP_WAYS_GUILD_PANEL);
				EventManager.dispatchEvent(WorldMapEvent.MAP_WAYS_GUILD_UPDATA_PATHS);
			}
		}

		/**
		 * 是否在自动寻路中
		 */
		public static function get isAutoFinding() : Boolean
		{
			return _isAutoFinding;
		}

		/**
		 * 跨场景寻路回调函数数据
		 *
		 */
		public static function get scMoveCallBack() : WalkMoveStateReference
		{
			return _scMoveCallBack;
		}

		//========================跨场景寻路========================================
		//跨场景寻路静态方法
		//===========================================================================================================

		public static function walkToScene(targetSceneId : int, posx : Number = -1, posy : Number = -1, onArrive : Function = null, spacing : int = 0, data : Object = null,noWalk:Function=null) : void
		{
//			var myContry:int = MainRoleManager.actorInfo.countryId;
//			var currentCountry:int = CountryManager.selfCountryData.sequence;

//			if(SceneSwitchManager.isUseTransport)
//			{
//				SceneSwitchManager.targetMapId = 7;
//				SceneSwitchManager.targetX = 15000;
//				SceneSwitchManager.targetY = 15000;
//				targetSceneId = SceneSwitchManager.targetMapId;
//				posx = SceneSwitchManager.targetX;
//				posy = SceneSwitchManager.targetY;
//			}

			TrusteeshipManager.getInstance().stopAll();
			var role : SceneRole = MainRoleManager.actor;
			//var position : Vector3D = new Vector3D(posx, role.y, posy);
			var position : Vector3D = new Vector3D(posx, posy, 0);
			walkToScenePos(role, targetSceneId, position, onArrive, spacing, data,noWalk);
		}

		/**
		 * 跨场景寻路
		 * @param role
		 * @param sceneId
		 * @param pos
		 * @param onArrive
		 */
		public static function walkToScenePos(role : SceneRole, targetSceneId : int, pos : Vector3D, onArrive : Function = null, spacing : int = 0, data : Object = null,noWalk:Function=null) : void
		{
			_data = data;
			var mapID : int = SceneSwitchManager.currentMapId;
			if (mapID == targetSceneId)
			{
				if (pos.x > -1 && (-pos.y)> -1)//if (pos.x > -1 && pos.z> -1)
				{
					RoleStateUtil.walkToPos(role, pos, spacing, _data, onArrive,null,null,noWalk);
					EventManager.dispatchEvent(WorldMapEvent.MAP_WAYS_GUILD_UPDATA_PATHS);
				}
			}
			else
			{
				//先清空
				clearAutoFindPath();
				if (checkCanAutoMove(targetSceneId, false))
				{
					
					//获取跨场景寻路信息
					var sceneArr : Vector.<SearchMapData> = search(SceneSwitchManager.currentMapId, targetSceneId);
					//如果路径存在
					if (sceneArr && sceneArr.length > 0)
					{
						sceneArr.push(new SearchMapData(targetSceneId, pos.x, pos.y, spacing));
						_scenePath = sceneArr;
						_isAutoFinding = true;
						trace("auto_SearchPath_CrossScene_Start");
						_onArrive=onArrive;
						onNextScene(mapID);
					}
				}
				updateMapWaysGuild();
			}
		}

		public static function walkToSceneByLink(data : String) : void
		{
			var scenePosArr : Array = data.split(",");
			var sceneId : int = scenePosArr[0];
			var x : int = scenePosArr[1];
			var y : int = scenePosArr[2];
			walkToScene(sceneId, x, y, null, 200);
		}

		private static function onSwitchCmp() : void
		{
			EventManager.dispatchEvent(WorldMapEvent.MAP_WAYS_GUILD_UPDATA_PATHS);
			TweenLite.killDelayedCallsTo(onNextScene);
			if (MainRoleSearchPathManager.isAutoFinding)
			{
				trace("delayAutoFind.autoFindNext");
				var mapID : int = SceneSwitchManager.currentMapId;
				TweenLite.delayedCall(0.5, onNextScene, [mapID]);
			}
		}

		/**
		 * 到达下一场景
		 * @param sceneId 当前所在场景ID
		 */
		private static function onNextScene(sceneId : int) : void
		{
			if (!_isAutoFinding)
			{
				return;
			}

			if (!_scenePath || !_scenePath.length)
			{
				clearAutoFindPath();
				return;
			}

			if (currentSceneId == sceneId)
			{
				return;
			}

			if (!checkCanAutoMove(sceneId, false))
			{
				return;
			}

			//取得最上一个(走到当前场景的某个传送点)
			var searchMapData : SearchMapData = _scenePath.shift();
			if (sceneId == searchMapData.mapId)
			{
				currentSceneId = sceneId;
				if (searchMapData.posX > -1 && searchMapData.posY < 0)
				{
					var pos : Vector3D = new Vector3D(searchMapData.posX, searchMapData.posY, 0);
					if (_scenePath.length == 0)
					{
						RoleStateUtil.walkToPos(MainRoleManager.actor, pos, searchMapData.spacing, _data, _onArrive);
						_onArrive=null;
					}
					else
					{
						RoleStateUtil.walkToPos(MainRoleManager.actor, pos, searchMapData.spacing, _data);
					}
					//RoleStateUtil.walk(MainRoleManager.actor, searchMapData.posX, searchMapData.posY, searchMapData.spacing, _data);
				}
				if (_scenePath.length == 0)
				{
					clearAutoFindPath();
				}
			}
		}

		/**清空跨场景寻路数据*/
		public static function clear() : void
		{
			_scenePath.length = 0;
		}

		/**
		 * 清空场景自动寻路
		 */
		public static function clearAutoFindPath() : void
		{
			TweenLite.killDelayedCallsTo(onNextScene);
			_scMoveCallBack = null;
			_isAutoFinding = false;
			_scenePath = null;
			currentSceneId = 0;
		}

		/**停止移动*/
		public static function stopAutoFind() : void
		{
			clearAutoFindPath();
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE);
			MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE);
		}

		/**
		 * 查询跨地图寻路数据
		 * @param currMapId
		 * @param targetMapId
		 * @return
		 */
		public static function findWayPaths(currMapId : int, targetMapId : int) : Vector.<SearchMapData>
		{
			//检查起始场景是否为终止场景
			if (currMapId == targetMapId)
				return null;
			return search(currMapId, targetMapId);
		}

		/**
		 * 跨场景寻路查询数组
		 * @param $fromScene
		 * @param $toScene
		 * return 数据格式：场景ID和此场景的一个传送点（出）ID，即[sceneID:int,transOutX:int，transOutY:int, dis:int=0]*，返回空数组[]则未找到路径
		 *
		 **/
		private static function search($fromScene : int, $toScene : int) : Vector.<SearchMapData>
		{
			//简单检查XML
			//if(!MapTransManager.mapResXML)return [];
			//检查起始场景是否为终止场景
			if ($fromScene == $toScene)
				return null;
			//检查指定的场景是否存在
			if (!hasScene($fromScene))
				return null;
			if (!hasScene($toScene))
				return null;
			//寻路
			return doSearchYT($fromScene, $toScene);
		}
		/**
		 * 
		 * 修改的 执行跨场景寻路查询数组-----yt
		 * @param $fromScene
		 * @param $toScene
		 * @param $crossSceneArr 经过的路径数组,递归用，首次默认即可
		 * return 数据格式：场景ID和此场景的一个传送点（出）ID，即[sceneID:int,transOutX:int，transOutY:int, dis:int=0]*，返回空数组[]则未找到路径
		 *
		 **/
		private static function doSearchYT($fromScene : int, $toScene : int, $crossSceneArr : Array = null) : Vector.<SearchMapData>
		{
			var pathArr : Vector.<SearchMapData> = new Vector.<SearchMapData>();
			
			//第一次给$crossSceneArr赋初值
			$crossSceneArr = $crossSceneArr || [];
			$crossSceneArr[$crossSceneArr.length] = $fromScene; //将当前场景添加进走过的数组
			
			//寻路
			//获取$fromScene所在场景的所有出口
			var transOuts : Array = TransCfgData.getSceneTransportObj($fromScene);
			//var transOuts : Array = TranportsDataManager.getSceneTransportProtos($fromScene, MainRoleManager.actorInfo.sceneSequence);
			
			if (!transOuts || transOuts.length == 0)
				return null;
			var stepPath : SearchMapData; //单步
			var followPath : Vector.<SearchMapData>; //后面的步
			var mapID : int; //传送点目标场景ID
			var polygon : Vector.<Point>;
			var center : Point;
			//直接找到的优先选择
			var transOutRes :Object;
			for each (transOutRes in transOuts)
			{
				mapID = transOutRes.destMapId;
				//如果目标场景在已经过的路径中则不处理
				if ($crossSceneArr.indexOf(mapID) != -1)
				{
					continue;
				}
				//目标一致,成功获取路径，并跳出
				if (mapID == $toScene)
				{
					//polygon = TranportsDataManager.getPolygon(transOutRes);
					//center = MathUtil.getPolygonCenter(polygon);
					//获取单步路径
					//格式：[sceneID:int,transOutX:int，transOutY:int, dis:int]
					stepPath = new SearchMapData($fromScene, transOutRes.x, transOutRes.y, 100);
					//直接返回最终或最后一步路径！！！
					pathArr.push(stepPath);
					return pathArr;
				}
			}
			//不能直接找到的放在后面递归寻找
			for each (transOutRes in transOuts)
			{
				mapID = transOutRes.destMapId;
				//如果目标场景在已经过的路径中则不处理
				if ($crossSceneArr.indexOf(mapID) != -1)
				{
					continue;
				}
				//递归
				followPath = doSearchYT(mapID, $toScene, $crossSceneArr.concat());
				if (followPath && followPath.length != 0) //连接没有断裂
				{
					//polygon = TranportsDataManager.getPolygon(transOutRes);
					//center = MathUtil.getPolygonCenter(polygon);
					//获取单步路径
					stepPath = new SearchMapData($fromScene, transOutRes.x, transOutRes.y, 0);
					//将这条路完整径保存起来！！！
					pathArr.push(stepPath);
					pathArr = pathArr.concat(followPath);
				}
			}
			return pathArr;
			
			//比较选择出一条最短的路径返回
			//			var tempArr : Array = [];
			//			var aPath : Array;
			//			for each (aPath in pathArr)
			//			{
			//				tempArr.push({stepNum: aPath.length, path: aPath});
			//			}
			//			tempArr.sortOn("stepNum", Array.NUMERIC);
			//			path = (tempArr.length > 0) ? tempArr[0].path : [];
			//
			//			return path;
		}
		/**
		 * 执行跨场景寻路查询数组
		 * @param $fromScene
		 * @param $toScene
		 * @param $crossSceneArr 经过的路径数组,递归用，首次默认即可
		 * return 数据格式：场景ID和此场景的一个传送点（出）ID，即[sceneID:int,transOutX:int，transOutY:int, dis:int=0]*，返回空数组[]则未找到路径
		 *
		 **/
		private static function doSearch($fromScene : int, $toScene : int, $crossSceneArr : Array = null) : Vector.<SearchMapData>
		{
			var pathArr : Vector.<SearchMapData> = new Vector.<SearchMapData>();

			//第一次给$crossSceneArr赋初值
			$crossSceneArr = $crossSceneArr || [];
			$crossSceneArr[$crossSceneArr.length] = $fromScene; //将当前场景添加进走过的数组

			//寻路
			//获取$fromScene所在场景的所有出口
			var transOuts : Array = TranportsDataManager.getSceneTransportProtos($fromScene, MainRoleManager.actorInfo.sceneSequence);

			if (!transOuts || transOuts.length == 0)
				return null;
			var stepPath : SearchMapData; //单步
			var followPath : Vector.<SearchMapData>; //后面的步
			var mapID : int; //传送点目标场景ID
			var polygon : Vector.<Point>;
			var center : Point;
			//直接找到的优先选择
			var transOutRes : SceneTransportProto;
			for each (transOutRes in transOuts)
			{
				mapID = transOutRes.destSceneDataId;
				//如果目标场景在已经过的路径中则不处理
				if ($crossSceneArr.indexOf(mapID) != -1)
				{
					continue;
				}
				//目标一致,成功获取路径，并跳出
				if (transOutRes.destSceneDataId == $toScene)
				{
					polygon = TranportsDataManager.getPolygon(transOutRes);
					center = MathUtil.getPolygonCenter(polygon);
					//获取单步路径
					//格式：[sceneID:int,transOutX:int，transOutY:int, dis:int]
					stepPath = new SearchMapData($fromScene, center.x, center.y, 0);
					//直接返回最终或最后一步路径！！！
					pathArr.push(stepPath);
					return pathArr;
				}
			}
			//不能直接找到的放在后面递归寻找
			for each (transOutRes in transOuts)
			{
				mapID = transOutRes.destSceneDataId;
				//如果目标场景在已经过的路径中则不处理
				if ($crossSceneArr.indexOf(mapID) != -1)
				{
					continue;
				}
				//递归
				followPath = doSearch(mapID, $toScene, $crossSceneArr.concat());
				if (followPath && followPath.length != 0) //连接没有断裂
				{
					polygon = TranportsDataManager.getPolygon(transOutRes);
					center = MathUtil.getPolygonCenter(polygon);
					//获取单步路径
					stepPath = new SearchMapData($fromScene, center.x, center.y, 0);
					//将这条路完整径保存起来！！！
					pathArr.push(stepPath);
					pathArr = pathArr.concat(followPath);
				}
			}
			return pathArr;

			//比较选择出一条最短的路径返回
//			var tempArr : Array = [];
//			var aPath : Array;
//			for each (aPath in pathArr)
//			{
//				tempArr.push({stepNum: aPath.length, path: aPath});
//			}
//			tempArr.sortOn("stepNum", Array.NUMERIC);
//			path = (tempArr.length > 0) ? tempArr[0].path : [];
//
//			return path;
		}

		/**
		 * 检查$sceneId指定的场景是否存在
		 * return
		 **/
		private static function hasScene($sceneId : int) : Boolean
		{
			var mapRes : SceneData = MapDataManager.getMapInfo($sceneId);
			return mapRes ? true : false;
		}


		/**
		 * 检测是否能自动寻路
		 * @return
		 *
		 */
		private static function checkCanAutoMove($targetMapId : int, $notice : Boolean = false) : Boolean
		{
			if (!hasScene($targetMapId))
				return false;
			if (MainRoleManager.actorInfo.totalStat.hp <= 0)
			{
				if ($notice)
				{
					NoticeManager.systemSwitchNotify("您已死亡，请复活后再寻路前往");
				}
				return false;
			}
			var mapRes : SceneData = MapDataManager.getMapInfo($targetMapId);
			if (!mapRes || (!mapRes.isNormalScene && $targetMapId != SceneSwitchManager.currentMapId))
			{
				if ($notice)
				{
					NoticeManager.systemSwitchNotify("特殊场景中不能寻路前往");
				}
				return false;
			}
			return true;
		}

	}
}
