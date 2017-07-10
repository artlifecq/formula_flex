package com.rpgGame.app.scene.trigger.handler
{
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.trigger.TriggerHandler;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.coreData.cfg.SceneEffectCfgData;
	import com.rpgGame.coreData.clientConfig.ClientSceneEffect;
	
	/**
	 *王城争霸触发处理器
	 *@author dik
	 *2017-7-4
	 **/
	public class WczbTriggerHandler extends TriggerHandler
	{
		private var areaids:Array=[10053,10054];
		
		public function WczbTriggerHandler()
		{
			super();
		}
		
		override protected function init():void
		{
			var eftList:Vector.<ClientSceneEffect>=SceneEffectCfgData.getSceneEffectInfoList(MainRoleManager.actorInfo.mapID);
			for each(var eft:ClientSceneEffect in eftList){
				ClientTriggerManager.createSceneEffect(eft);
			}
		}
		
		override public function  trigger(areaid:int):void
		{
			var checkId:int=areaids[MainRoleManager.actorInfo.faction-1];
			if(areaid==checkId){//是自己的矿石上缴区
				if((MainRoleManager.actor.headFace as HeadFace).hasGuildWarOre()){//有矿石
					GuildWarSender.reqTrunInOreMessage();
				}
			}
		}
	}
}