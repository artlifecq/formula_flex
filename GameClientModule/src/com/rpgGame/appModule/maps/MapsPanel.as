package com.rpgGame.appModule.maps
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.NpcConfigData;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_map_transfer;
	import com.rpgGame.coreData.clientConfig.Q_npc;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Touch;
	import starling.events.TouchEvent;

	/**
	 * 
	 * 大地图面板
	 * @author yt
	 */	
	public class MapsPanel extends MapsView
	{
		private var _timer : GameTimer;
		public function MapsPanel()
		{
			super();
			
			ListenerMove()
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			
			var sceneData : SceneData = MapDataManager.currentScene;
			_bigMap.skinSpr.addEventListener(TouchEvent.TOUCH, onTouch);
			if (sceneData) 
			{
				super.show(data, openTable, parentContiner);
				var sceneId:int=sceneData.sceneId;
				if(sceneId!=BigMapsData.currentMapId)//如果大地图上显示场景ID不是当前场景，则重新加载地图
				{
					BigMapsData.isMapLoadComplete=false;
					clearMapsData();
					clearMapsView();
					updataMapsData();
					loadBigMapView(sceneId);
					scollBoxView();
					siteView();
					setMapName(sceneData.name);
				}
			}
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			_scoll.onTouchTarget(target);
			roleSelect(target);
			
		}
		private function onMapChangeCompleteHandler() : void 
		{
			
			super.hide();
			_bigMap.skinSpr.removeEventListener(TouchEvent.TOUCH, onTouch);
			_timer.stop();
		}
		
		private function ListenerMove() : void
		{
			_timer = new GameTimer("bigmap", 500, 0, onTimer);
			EventManager.addEvent(MapEvent.MAP_SWITCH_START, onMapChangeCompleteHandler);
			
			EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, onDrawPath);
			EventManager.addEvent(UserMoveEvent.MOVE_START, onDrawPath);
			EventManager.addEvent(UserMoveEvent.MOVE_END, onDrawPath);
			//Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			//Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_OVER, onMouseMove);
			
			//target.removeEventListener(TouchEvent.TOUCH, onTouch);
			//_skin.addEventListener(MouseEvent.ROLL_OVER,onMouseMove);
			//_skin.addEventListener(MouseEvent.ROLL_OUT,onMouseMove);
			//_skin.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
		}
		
		private function onTimer() : void 
		{
			
			if (touch != null)
			{
				touchOldPoint.x=touchPoint.x;
				touchOldPoint.y=touchPoint.y;
				_bigMap.showTips(touchOldPoint.x,touchOldPoint.y);
				
			}
		}
		
		private var touch : Touch;
		private var touchPoint:Point;
		private var touchOldPoint:Point=new Point();
		private var topchDownPoint:Point=new Point();
		
		/**处理地图上的鼠标事件*/
		private function onTouch(e : TouchEvent) : void
		{
			touch=e.getTouch(e.currentTarget as DisplayObject);
			if (touch != null)
			{
				touchPoint=touch.getLocation(_bigMap.skinSpr);
				
				//LOG.a("onTouch:"+touch.phase);
				if(touch.phase=="hover")
				{
					if(touchPoint.x!=touchOldPoint.x||touchPoint.y!=touchOldPoint.y)//over到不同地方就隐藏显示
					{
						_bigMap.hideTips();
						_timer.stop();
						_timer.start();
					}
				}
				else if(touch.phase=="began")
				{
					topchDownPoint.x=touchPoint.x;
					topchDownPoint.y=touchPoint.y;
					
				}
				else if(touch.phase=="ended")
				{
					if(topchDownPoint.x==touchPoint.x&&topchDownPoint.y==touchPoint.y)
					{
						//LOG.a("寻路");
						_bigMap.mapWalk(touchPoint.x,touchPoint.y);
						
					}
				}
			}
			
			
			
			
			
			
			//touch = e.getTouch(target, TouchPhase.HOVER);
			
		}
		
		private function onDrawPath() : void
		{
			if(BigMapsData.isMapLoadComplete)//大地图是否加载
			{
				_bigMap.updateMyselfPos();
				siteView();
			}
		}
		
		/*override public function show():void 
		{
			BigMapsData.currentMapId=sceneId;
		}*/
		/**更新大地图面板数据*/
		private function updataMapsData():void
		{
			updataRoleData();
			
		}
		
		/**更新大地图图标数据*/
		private function logRoleData():void
		{
			var npcList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.NPC);
			var transList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.TRANS);
			var monsterList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			LOG.a("npcList="+npcList.length+";;transList="+transList.length+";;monsterList="+monsterList.length);
			
			var monsterArr:Array=MonsterDataManager.getSceneMonsterDatas(MapDataManager.currentScene.sceneId);
			
			
			LOG.a("monsterArr"+monsterArr.length);
		
		}
		/**更新大地图图标数据测试数据*/
		private function updataRoleDatabbbbbbbbbbbbbbb():void
		{
			
			var i:int;
			var sceneId:int=MapDataManager.currentScene.sceneId;
			var roleMode:BigMapIocnDataMode;
			if(sceneId==23)
			{
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="朱姬";
				roleMode.x=4770;
				roleMode.y=-3079;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="赵德";
				roleMode.x=4150;
				roleMode.y=-3300;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="星君";
				roleMode.x=3700;
				roleMode.y=-3550;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="6";
				roleMode.name="测试地图美术用<font color='#00cc00'>(10-20级)</font>";
				roleMode.x=5036;
				roleMode.y=-4249;
				BigMapsData.mapsThansData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="6";
				roleMode.name="乌家堡牧场<font color='#cc3300'>(20-30级)</font>";
				roleMode.x=1430;
				roleMode.y=-841;
				BigMapsData.mapsThansData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="秦国士兵3";
				roleMode.x=4590;
				roleMode.y=-3660;
				BigMapsData.mapsMonsterData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="秦国士兵5";
				roleMode.x=5590;
				roleMode.y=-3660;
				BigMapsData.mapsMonsterData.push(roleMode);
			}
			if(sceneId==24)
			{
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="秦始皇";
				roleMode.x=4770;
				roleMode.y=-3079;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="赵子龙";
				roleMode.x=4150;
				roleMode.y=-3300;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="项少龙";
				roleMode.x=3700;
				roleMode.y=-3550;
				BigMapsData.mapsNpcData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="3";
				roleMode.name="老者";
				roleMode.x=2700;
				roleMode.y=-1550;
				BigMapsData.mapsNpcData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="6";
				roleMode.name="马贼营塞<font color='#00cc00'>(10-20级)</font>";
				roleMode.x=1710;
				roleMode.y=-4960;
				BigMapsData.mapsThansData.push(roleMode);
				
				roleMode=new BigMapIocnDataMode();
				roleMode.type="6";
				roleMode.name="雷霆崖<font color='#cc3300'>(20-30级)</font>";
				roleMode.x=1430;
				roleMode.y=-841;
				BigMapsData.mapsThansData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="猛兽";
				roleMode.x=4590;
				roleMode.y=-3660;
				BigMapsData.mapsMonsterData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="狼人";
				roleMode.x=3590;
				roleMode.y=-2660;
				BigMapsData.mapsMonsterData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="妖怪";
				roleMode.x=4590;
				roleMode.y=-1660;
				BigMapsData.mapsMonsterData.push(roleMode);
				roleMode=new BigMapIocnDataMode();
				roleMode.type="2";
				roleMode.name="霸王龙";
				roleMode.x=2590;
				roleMode.y=-4060;
				BigMapsData.mapsMonsterData.push(roleMode);
			}
			
			
		}
		/**更新大地图图标数据*/
		private function updataRoleData():void
		{
			/*var npcList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.NPC);
			var transList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.TRANS);
			var monsterList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
			LOG.a("npcList="+npcList.length+";;transList="+transList.length+";;monsterList="+monsterList.length);*/
			
			var monsterList:Array=MonsterDataManager.getBigMapMonsterBySceneId(MapDataManager.currentScene.sceneId);
			//var npcList:Vector.<Q_npc>=NpcConfigData.getNpcBySceneID(MapDataManager.currentScene.sceneId);
			var transList:Vector.<Q_map_transfer>=TransCfgData.getTranBySceneID(MapDataManager.currentScene.sceneId);
			
			//LOG.a("trans"+transList.length+"monsterList"+monsterList.length);
			//LOG.a(JSON.stringify(transList));
			var i:int,length:int;
			var roleMode:BigMapIocnDataMode;
			//LOG.a(JSON.stringify(transList));
			if(monsterList&&monsterList.length>0)
			{
				var monsterData:Object;
				length=monsterList.length;
				for(i=0;i<length;i++)
				{
					monsterData = monsterList[i];
					roleMode=new BigMapIocnDataMode();
					if(monsterData.type==4)
					{
						roleMode.type=SceneCharType.NPC;
						roleMode.name=monsterData.name;
						roleMode.x=monsterData.x;
						roleMode.y=monsterData.y;
						BigMapsData.mapsNpcData.push(roleMode);
					}
					else
					{
						roleMode.type=SceneCharType.MONSTER;
						roleMode.name=monsterData.name;
						roleMode.x=monsterData.x;
						roleMode.y=monsterData.y;
						BigMapsData.mapsMonsterData.push(roleMode);
					}
				}
			}
			if(transList&&transList.length>0)
			{
				var transData:Q_map_transfer;
				length=transList.length;
				for(i=0;i<length;i++)
				{
					transData = transList[i];
					roleMode=new BigMapIocnDataMode();
					roleMode.type=SceneCharType.TRANS;
					roleMode.name=transData.q_name;
					roleMode.x=transData.q_tran_res_x;
					roleMode.y=transData.q_tran_res_y;
					BigMapsData.mapsThansData.push(roleMode);
				}
			}
			/*
			var roleData : SceneRole;
			var roleMode:BigMapIocnDataMode;
			if(npcList&&npcList.length>0)
			{
				length=npcList.length;
				for(i=0;i<length;i++)
				{
					roleData = npcList[i];
					roleMode=new BigMapIocnDataMode();
					roleMode.type=SceneCharType.NPC;
					roleMode.name=roleData.name;
					roleMode.x=roleData.x;
					roleMode.y=roleData.z;
					BigMapsData.mapsNpcData.push(roleMode);
				}
			}
			if(transList&&transList.length>0)
			{
				length=transList.length;
				for(i=0;i<length;i++)
				{
					roleData = transList[i];
					roleMode=new BigMapIocnDataMode();
					roleMode.type=SceneCharType.TRANS;
					roleMode.name=roleData.name;
					roleMode.x=roleData.x;
					roleMode.y=roleData.z;
					BigMapsData.mapsThansData.push(roleMode);
				}
			}
			if(monsterList&&monsterList.length>0)
			{
				length=monsterList.length;
				for(i=0;i<length;i++)
				{
					roleData = monsterList[i];
					roleMode=new BigMapIocnDataMode();
					roleMode.type=SceneCharType.MONSTER;
					roleMode.name=roleData.name;
					roleMode.x=roleData.x;
					roleMode.y=roleData.z;
					BigMapsData.mapsMonsterData.push(roleMode);
				}
			}
			*/
			//LOG.a(JSON.stringify(BigMapsData.mapsRoleData));
			
		}
		/**清除大地图数据*/
		private function clearMapsData():void
		{
			
			var i:int;
			for(i=BigMapsData.mapsNpcData.length-1; i>=0; i--) {
				BigMapsData.mapsNpcData.pop();
			}
			for(i=BigMapsData.mapsThansData.length-1; i>=0; i--) {
				BigMapsData.mapsThansData.pop();
			}
			for(i=BigMapsData.mapsMonsterData.length-1; i>=0; i--) {
				BigMapsData.mapsMonsterData.pop();
			}
		}
		
		
		
	}
	
	
	
}