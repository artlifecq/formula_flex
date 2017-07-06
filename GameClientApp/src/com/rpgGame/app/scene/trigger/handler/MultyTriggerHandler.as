package com.rpgGame.app.scene.trigger.handler
{
	import com.rpgGame.app.scene.trigger.TriggerHandler;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.coreData.cfg.ClientTrigger;
	import com.rpgGame.coreData.cfg.TriggerCfgData;
	
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
	}
}