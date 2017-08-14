package com.rpgGame.app.scene.trigger.handler
{
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.scene.trigger.TriggerHandler;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.coreData.cfg.ClientTrigger;
	import com.rpgGame.coreData.cfg.SceneEffectCfgData;
	import com.rpgGame.coreData.cfg.TriggerCfgData;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	
	import flash.utils.Dictionary;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 *多人触发处理器
	 *@author dik
	 *2017-7-4
	 **/
	public class MultyTriggerHandler extends TriggerHandler
	{
		public function MultyTriggerHandler()
		{
			super();
		}
		
		override protected function init():void
		{
			
		}
		override protected function initEvent():void
		{
			EventManager.addEvent(DungeonEvent.ZONE_CUR_TRIGGER,triggerInit);
			EventManager.addEvent(DungeonEvent.ZONE_TO_TRIGGER,serverTrigger);
			EventManager.addEvent(DungeonEvent.ZONE_CLEAR_TRIGGER,clearTigerByZone);
		}
		override public function dispose():void
		{
			EventManager.removeEvent(DungeonEvent.ZONE_CUR_TRIGGER,triggerInit);
			EventManager.removeEvent(DungeonEvent.ZONE_TO_TRIGGER,serverTrigger);
			EventManager.removeEvent(DungeonEvent.ZONE_CLEAR_TRIGGER,clearTigerByZone);
		}
		override public function trigger(areaid:int):void
		{
			var triggerData : ClientTrigger = TriggerCfgData.getTriggerByAreaid(areaid);
			if (!triggerData)return;
			var pretriggerData : ClientTrigger;
			if(triggerData.isTrigging)return;//服务器 已触发不再触发
			if(triggerData.preTrigger!=null)//判定触发前置条件
			{
				var preTri:Array=triggerData.preTrigger;
				for each (var trid : int in preTri)
				{
					pretriggerData=TriggerCfgData.getClientTrigger(trid);
					if (pretriggerData&&!pretriggerData.isTrigging)
					{
						return;
					}
				}
			}
			DungeonSender.reqTrigger(triggerData.id);///通知服务器 触发消息
		}
		/**收到服务器触发消息*/
		public static function serverTrigger(triggerId : int):void
		{
			var triggerData : ClientTrigger = TriggerCfgData.getClientTrigger(triggerId);
			if (triggerData)
			{
				triggerData.isTrigging=true;
				if(triggerData.obstacleArea!=null&&triggerData.obstacleArea.length>0)
				{
					ClientTriggerManager.triggerCreateObstacle(triggerData);
				}
				if(triggerData.sceneEffectIds!=null&&triggerData.sceneEffectIds.length>0)
				{
					ClientTriggerManager.triggerCreateSceneEffect(triggerData);
				}
				if(triggerData.obstacleAreaRemove!=null&&triggerData.obstacleAreaRemove.length>0)
				{
					ClientTriggerManager.triggerClearObstacle(triggerData);
				}
				if(triggerData.sceneEffectRemove!=null&&triggerData.sceneEffectRemove.length>0)
				{
					ClientTriggerManager.triggerClearSceneEffect(triggerData);
				}
				if(triggerData.resetTriggers!=null&&triggerData.resetTriggers.length>0)
				{
					clearTigerList(triggerData.resetTriggers);
					
				}
				
			}
			
			
		}
		/**玩家进入触发信息初始化*/
		public static function triggerInit(tidLis:Vector.<int>):void
		{
			var trAreaList:Array=new Array();
			var trEffectList:Array=new Array();
			var triggerData : ClientTrigger;
			var i:int,j:int,k:int;
			for(i=0;i<tidLis.length;i++)
			{
				triggerData=TriggerCfgData.getClientTrigger(tidLis[i]);
				if (triggerData)
				{
					triggerData.isTrigging=true;
					if(triggerData.obstacleArea!=null&&triggerData.obstacleArea.length>0)
					{
						for(j=0;j<triggerData.obstacleArea.length;j++)
						{
							trAreaList.push(triggerData.obstacleArea[j]);
						}
						
					}
					if(triggerData.sceneEffectIds!=null&&triggerData.sceneEffectIds.length>0)
					{
						for(j=0;j<triggerData.sceneEffectIds.length;j++)
						{
							trEffectList.push(triggerData.sceneEffectIds[j]);
						}
					}
					if(triggerData.obstacleAreaRemove!=null&&triggerData.obstacleAreaRemove.length>0)
					{
						for(j=0;j<triggerData.obstacleAreaRemove.length;j++)
						{
							for(k=0;k<trAreaList.length;k++)
							{
								if(triggerData.obstacleAreaRemove[j]==trAreaList[k])
								{
									trAreaList[k]=0;
								}
							}
						}
					}
					if(triggerData.sceneEffectRemove!=null&&triggerData.sceneEffectRemove.length>0)
					{
						for(j=0;j<triggerData.sceneEffectRemove.length;j++)
						{
							for(k=0;k<trEffectList.length;k++)
							{
								if(triggerData.sceneEffectRemove[j]==trEffectList[k])
								{
									trEffectList[k]=0;
								}
							}
						}
					}
					/*if(triggerData.resetTriggers!=null&&triggerData.resetTriggers.length>0)
					{
					for(j=0;j<triggerData.resetTriggers.length;j++)
					{
					clearTigerByZone(triggerData.resetTriggers[j]);
					}
					
					}*/
				}
			}
			
			for(k=0;k<trAreaList.length;k++)
			{
				if(trAreaList[k]!=0)
				{
					AreaMapManager.addDynamicObstacleArea(trAreaList[k]);
				}
			}
			var effectData : ClientSceneEffect;
			for(k=0;k<trEffectList.length;k++)
			{
				if(trEffectList[k]!=0)
				{
					effectData = SceneEffectCfgData.getData(trEffectList[k]);
					ClientTriggerManager.createSceneEffect(effectData);
				}
			}
		}
		
		
		
		
		public static function clearTigerByZone(zid : int) : void
		{
			var triggerList:Vector.<ClientTrigger>=TriggerCfgData.getTriggerInZone(zid);
			for each(var triger:ClientTrigger in triggerList)
			{
				triger.isTrigging=false;
			}
		}
		private static function clearTigerList(triggers:Array) : void
		{
			var triger:ClientTrigger;
			for(var i:int=0;i<triggers.length;i++)
			{
				triger=TriggerCfgData.getClientTrigger(triggers[i]);
				if(triger)
				{
					triger.isTrigging=false;
				}
			}
		}
		
	}
}