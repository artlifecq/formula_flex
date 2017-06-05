package com.rpgGame.app.cmdlistener
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneIdInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneMonsterCountMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZonePanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneTimeInfoMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianPanelInfosMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianResultMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianTimeMessage;
	import com.rpgGame.netData.zone.message.SCClientTriggerValiedMessage;
	import com.rpgGame.netData.zone.message.SCCurTriggerMessage;
	import com.rpgGame.netData.zone.message.SCEnterZoneMessage;
	import com.rpgGame.netData.zone.message.SCKillInfoMessage;
	import com.rpgGame.netData.zone.message.SCKillInfosMessage;
	import com.rpgGame.netData.zone.message.SCMultiZonePanelInfosMessage;
	import com.rpgGame.netData.zone.message.SCMultiZonePanelSingleInfoMessage;
	import com.rpgGame.netData.zone.message.SCMultiZoneResultMessage;
	import com.rpgGame.netData.zone.message.SCMultiZoneRewardMessage;
	import com.rpgGame.netData.zone.message.SCOutZoneMessage;
	import com.rpgGame.netData.zone.message.SCRemainTimeMessage;
	import com.rpgGame.netData.zone.message.SCZoneStageChangeMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	/**
	 *副本相关信息处理
	 *@author dik
	 *2017-5-8下午1:32:21
	 */
	public class DungeonCmdListener extends BaseBean
	{
		public function DungeonCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			/*——————————————————————————论剑消息————————————————————————————————————————————*/
			SocketConnection.addCmdListener(227501, onSCLunJianPanelInfosMessage );
			SocketConnection.addCmdListener(227502, onSCLunJianTimeStartMessage );
			SocketConnection.addCmdListener(227503, onSCLunJianResultMessage );
			/*——————————————————————————单人副本————————————————————————————————————————————*/
			SocketConnection.addCmdListener(400101, getSCDailyZonePanelInfoMessage);
			SocketConnection.addCmdListener(400102, getSCDailyZoneMonsterCountMessage);
			SocketConnection.addCmdListener(400103, getSCDailyZoneTimeInfoMessage);
			SocketConnection.addCmdListener(400104, getSCDailyZoneRewardPanelInfoMessage);
			SocketConnection.addCmdListener(400105, getSCDailyZoneIdInfoMessage);
			
			/*——————————————————————————多人副本————————————————————————————————————————————*/
			SocketConnection.addCmdListener(155136, onSCClientTriggerValiedMessage );//多人副本触发信息
			SocketConnection.addCmdListener(155137, onSCEnterZoneMessage );//进入副本
			SocketConnection.addCmdListener(155138, onSCOutZoneMessage );//退出副本
			SocketConnection.addCmdListener(155139, onSCZoneStageChangeMessage );//副本状态
			SocketConnection.addCmdListener(155140, onSCRemainTimeMessage );//声音时间
			SocketConnection.addCmdListener(155141, onSCKillInfosMessage );//击杀列表
			SocketConnection.addCmdListener(155142, onSCKillInfoMessage );//单个击杀
			SocketConnection.addCmdListener(155143, onSCCurTriggerMessage );//已经触发列表
			SocketConnection.addCmdListener(155144, onSCMultiZoneResultMessage );//准备退出副本
			SocketConnection.addCmdListener(155145, onSCMultiZoneRewardMessage );//多人副本奖励
			SocketConnection.addCmdListener(155146, onSCMultiZonePanelInfosMessage );//面板列表
			SocketConnection.addCmdListener(155147, onSCMultiZonePanelSingleInfoMessage );//面板列表单个
			
			finish();
		}
		/*——————————————————————————论剑消息————————————————————————————————————————————*/
		private function onSCLunJianResultMessage(msg:SCLunJianResultMessage):void
		{
			if(msg.success==1){
				AppManager.showApp(AppConstant.SWORD_RESULT_SUCCESS,msg.ljId);
			}else{
				AppManager.showApp(AppConstant.SWORD_RESULT_FAIL,msg.ljId);
			}
		}
		
		private function onSCLunJianTimeStartMessage(msg:SCLunJianTimeMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_LUNJIAN_TIME,msg.ljId,msg.remainTime);
		}
		
		private function onSCLunJianPanelInfosMessage(msg:SCLunJianPanelInfosMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_LUNJIAN_PANEL,msg.lunJianInfos);
		}
		
		/*——————————————————————————单人副本————————————————————————————————————————————*/
		private function getSCDailyZonePanelInfoMessage(msg:SCDailyZonePanelInfoMessage):void
		{
			DailyZoneDataManager.instance().updataDailyList(msg.panelInfos);
		}
		
		private function getSCDailyZoneMonsterCountMessage(msg:SCDailyZoneMonsterCountMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATA_WAVE_INFO,msg.currentWaveId,msg.currentWaveKill);
		}
		
		private function getSCDailyZoneTimeInfoMessage(msg:SCDailyZoneTimeInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_DAILYZONE_TIME,msg.endTime.fValue);
		}
		
		private function getSCDailyZoneRewardPanelInfoMessage(msg:SCDailyZoneRewardPanelInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATA_DAILYZONE_ENDINFO,msg.success,msg.star);
			if(msg.success==1){
				AppManager.showApp(AppConstant.DAILY_DUNGEON_SUCCESS,msg);
			}else if(msg.success == -1){
				AppManager.showApp(AppConstant.ZONEDIE_PANEL);
			}else{
				AppManager.showApp(AppConstant.SWORD_RESULT_FAIL);
			}
		}
		
		private function getSCDailyZoneIdInfoMessage(msg:SCDailyZoneIdInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.UPDATE_DAILYZONE_INFO,msg.dailyZoneId);
		}
		
		
		/*——————————————————————————多人副本————————————————————————————————————————————*/
		private function onSCClientTriggerValiedMessage(msg:SCClientTriggerValiedMessage):void
		{////L.l("服务器#触发:"+msg.triggerId);
			ClientTriggerManager.serverTrigger(msg.triggerId);
		}
		private function onSCEnterZoneMessage(msg:SCEnterZoneMessage):void
		{//L.l("服务器#进入");
			DungeonManager.curryZoneId=msg.zoneId;
			ClientTriggerManager.clearTigerByZone(msg.zoneId);
			EventManager.dispatchEvent(DungeonEvent.ENTER_ZONE);
			
		}
		private function onSCOutZoneMessage(msg:SCOutZoneMessage):void
		{//L.l("服务器#退出");
			TrusteeshipManager.getInstance().findDist=0;
			TrusteeshipManager.getInstance().stopAll();
			EventManager.dispatchEvent(TaskEvent.AUTO_WALK_STOP);
			EventManager.dispatchEvent(DungeonEvent.OUT_ZONE);
		}
		
		private function onSCZoneStageChangeMessage(msg:SCZoneStageChangeMessage):void
		{//L.l("服务器#阶段变化:"+msg.zoneModelId+":"+msg.stage+":"+msg.wave);
			DungeonManager.curryZoneId=msg.zoneModelId;
			DungeonManager.zoneStage=msg.stage;
			DungeonManager.zoneWave=msg.wave;
			EventManager.dispatchEvent(DungeonEvent.ZONE_STAGE_CHANGE);
			
		}
		private function onSCRemainTimeMessage(msg:SCRemainTimeMessage):void
		{//L.l("服务器#时间:"+msg.remainTime);
			DungeonManager.remainTime=msg.remainTime;
			EventManager.dispatchEvent(DungeonEvent.ZONE_REMAIN_TIME);
		}
		private function onSCKillInfosMessage(msg:SCKillInfosMessage):void
		{//L.l("服务器#击杀列表:"+msg.infos.length);
			DungeonManager.killInfos=msg.infos;
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFOS);
		}
		private function onSCKillInfoMessage(msg:SCKillInfoMessage):void
		{//L.l("服务器#击杀单个:"+msg.info.monsterModelId);
			DungeonManager.setKillInfos(msg.info);
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFO);
		}
		private function onSCCurTriggerMessage(msg:SCCurTriggerMessage):void
		{//L.l("服务器#初始化触发:"+msg.curTriggerIds.length);
			ClientTriggerManager.triggerInit(msg.curTriggerIds);
			EventManager.dispatchEvent(DungeonEvent.ZONE_CUR_TRIGGER);
		}
		private function onSCMultiZoneResultMessage(msg:SCMultiZoneResultMessage):void
		{//L.l("服务器#准备退出:"+msg.outTime);
			DungeonManager.outTime=msg.outTime;
			if(msg.success==1)
			{
				AppManager.showApp(AppConstant.MULTY_EXITTIME_PANL);
			}
			else
			{
				AppManager.showApp(AppConstant.SWORD_RESULT_FAIL);
			}
			EventManager.dispatchEvent(DungeonEvent.ZONE_OUT_RESULT);
			
		}
		private function onSCMultiZoneRewardMessage(msg:SCMultiZoneRewardMessage):void
		{//L.l("服务器#奖励:"+msg.passReward+"=="+msg.extraReward);
			DungeonManager.curryZoneId=msg.zoneID;
			DungeonManager.passReward=msg.passReward;
			DungeonManager.extraReward=msg.extraReward;
			if(DungeonManager.passReward==1||DungeonManager.extraReward==1)
			{
				DungeonManager.isReward=true;
				if (!AppManager.isAppInScene(AppConstant.MULTY_PANL))
				{
					AppManager.showApp(AppConstant.MULTY_PANL);
				}
			}
			//EventManager.dispatchEvent(DungeonEvent.ZONE_REWARD);
		}
		private function onSCMultiZonePanelInfosMessage(msg:SCMultiZonePanelInfosMessage):void
		{//L.l("服务器#面板信息:"+msg.panelInfos.length+"=="+msg.challengeCount);
			DungeonManager.challengeCount=msg.challengeCount;
			DungeonManager.panelInfos=msg.panelInfos;
		}
		private function onSCMultiZonePanelSingleInfoMessage(msg:SCMultiZonePanelSingleInfoMessage):void
		{//L.l("服务器#面板单个:"+msg.zoneId+"=="+msg.count+"=="+msg.rewardCount+"=="+msg.challengeCount);
			DungeonManager.challengeCount=msg.challengeCount;
			DungeonManager.setPanelInfos(msg.zoneId,msg.count,msg.rewardCount);
			
		}
	}
}