package com.rpgGame.appModule.maps
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.SkillEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.AreaCfgData;
	import com.rpgGame.coreData.cfg.TransCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.clientConfig.Q_map_transfer;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import flash.geom.Point;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.component.text.textInput2_Skin;
	import org.mokylin.skin.component.text.textInput3_Skin;
	
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
		private var gTime : GameTimer;
		public function MapsPanel()
		{
			super();
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void 
		{
			var sceneData : SceneData = MapDataManager.currentScene;
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
				}
				_bigMap.onClearPath();
				onDrawPath();
				siteView();
				setMapName(sceneData.name);
				changeTab();
				addEvent();
			}
			
		}
		override public function hide():void 
		{
			super.hide();
			_bigMap.onClearPath();
			removeEvent();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			
			if(target.name==_skin.btn_go.name) 
			{
				var lx:int=int(_skin.locat_x.text);
				var ly:int=int(_skin.locat_y.text);
				lx=Math.abs(lx);
				ly=Math.abs(ly);
				if(lx>0&&ly>0)
				{
					_bigMap.roleWalk(lx,-ly);
				}
				
			}
			if(target.name=="btnSend_endFly") 
			{
				_bigMap.flayToEnd();
			}
			else
			{
				_scoll.onTouchTarget(target);
				roleSelect(target);
			}
		}
		
		
		private function addEvent() : void
		{
			_bigMap.thumbnaiSpr.addEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.addEvent(MapEvent.MAP_SWITCH_START, onMapChangeCompleteHandler);
			EventManager.addEvent(UserMoveEvent.MOVE_START, onDrawPathRoad);
			//EventManager.addEvent(UserMoveEvent.MOVE_END, onMoveEnd)
			EventManager.addEvent(MapEvent.MAP_CLICK,onMoveEnd);
			if (gTime == null)
			{
				gTime = new GameTimer("MapsPanel", 100, 0, onDrawPath);
			}
			gTime.start();
			
			
			/*EventManager.addEvent(UserMoveEvent.MOVE_THROUGH, onDrawPath);
			EventManager.addEvent(UserMoveEvent.MOVE_RESCHANGE, onDrawPath);
			EventManager.addEvent(MapEvent.MAP_JUMP_COMPLETE, onDrawPath);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,onDrawPath);*/
		}
		private function removeEvent() : void
		{
			_bigMap.skinSpr.removeEventListener(TouchEvent.TOUCH, onTouch);
			EventManager.removeEvent(MapEvent.MAP_SWITCH_START, onMapChangeCompleteHandler);
			EventManager.removeEvent(UserMoveEvent.MOVE_START, onDrawPathRoad);
			//EventManager.removeEvent(UserMoveEvent.MOVE_END, onMoveEnd)
			EventManager.removeEvent(MapEvent.MAP_CLICK,onMoveEnd);
			if (gTime != null)
			{
				gTime.stop();
			}
			/*EventManager.removeEvent(UserMoveEvent.MOVE_THROUGH, onDrawPath);
			EventManager.removeEvent(UserMoveEvent.MOVE_RESCHANGE, onDrawPath);
			EventManager.removeEvent(MapEvent.MAP_JUMP_COMPLETE, onDrawPath);
			EventManager.removeEvent(MapEvent.MAP_SWITCH_COMPLETE,onDrawPath);*/
		}
		private function onMapChangeCompleteHandler() : void 
		{
			hide();
			
		}
		private function onTimer() : void 
		{
			
			if (touch != null)
			{
				
				_bigMap.showTips(touchOldPoint.x,touchOldPoint.y);
				
			}
		}
		private function onDrawPathRoad() : void 
		{
			_bigMap.onDrawPathRoad();
		}
		private function onMoveEnd() : void 
		{
			_bigMap.onClearPath();
			
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
				

				if(touch.phase=="hover")
				{
					if(touchPoint.x!=touchOldPoint.x||touchPoint.y!=touchOldPoint.y)//over到不同地方就隐藏显示
					{
						_bigMap.hideTips();
						touchOldPoint.x=touchPoint.x;
						touchOldPoint.y=touchPoint.y;
						TweenLite.killDelayedCallsTo(onTimer);
						TweenLite.delayedCall(0.5, onTimer);
						
					}
				}
				else if(touch.phase=="began")
				{
					topchDownPoint.x=touchPoint.x;
					topchDownPoint.y=touchPoint.y;
					TweenLite.killDelayedCallsTo(onTimer);
				}
				else if(touch.phase=="ended")
				{
					if(topchDownPoint.x==touchPoint.x&&topchDownPoint.y==touchPoint.y)
					{
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
				//siteView();
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
		private function updataRoleData():void
		{
			var monsterList:Array=MonsterDataManager.getBigMapMonsterBySceneId(MapDataManager.currentScene.sceneId);
			var transList:Vector.<Q_map_transfer>=TransCfgData.getTranBySceneID(MapDataManager.currentScene.sceneId);
			
			var i:int,length:int;
			var roleMode:BigMapIocnDataMode;
			if(monsterList&&monsterList.length>0)
			{
				var monsterData:Object;
				length=monsterList.length;
				for(i=0;i<length;i++)
				{
					monsterData = monsterList[i];
					roleMode=new BigMapIocnDataMode();
					roleMode.name=monsterData.name;
					roleMode.level=monsterData.level;
					roleMode.show=monsterData.show;
					roleMode.x=monsterData.x;
					roleMode.y=monsterData.y;
					if(monsterData.type==4)
					{
						roleMode.type=SceneCharType.NPC;
						BigMapsData.mapsNpcData.push(roleMode);
					}
					else if(monsterData.type==5)
					{
						roleMode.type=SceneCharType.COLLECT;
						BigMapsData.mapsNpcData.push(roleMode);
					}
					else if(monsterData.type==6)
					{
						roleMode.type=SceneCharType.NPC;
						BigMapsData.mapsNpcData.push(roleMode);
					}
					else
					{
						roleMode.type=SceneCharType.MONSTER;
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
					if(transData.q_tran_dest_area_by_job!="")
					{
						var jobArea:Array=JSONUtil.decode(transData.q_tran_dest_area_by_job);
						if(jobArea&&jobArea.length>0)
						{
							for(var j:int=0;j<jobArea.length;j++)
							{
								if(jobArea[j][0]==MainRoleManager.actorInfo.job)
								{
									var mapID:int= AreaCfgData.getAreaMapidByID(jobArea[j][1]);
									var map:Q_map=MapDataManager.getMapInfo(mapID).getData();
									roleMode.name=map.q_map_name;
									break;
								}
							}
						}
					}
					roleMode.show=true;
					roleMode.x=transData.q_tran_res_x;
					roleMode.y=transData.q_tran_res_y;
					BigMapsData.mapsThansData.push(roleMode);
				}
			}
			
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