package com.rpgGame.app.cmdlistener
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.DailyZoneDataManager;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.TaskEvent;
	import com.rpgGame.netData.cross.message.SCCancelTeamMatchMessage;
	import com.rpgGame.netData.cross.message.SCStartTeamMatchMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneIdInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneMonsterCountMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZonePanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneRewardPanelInfoMessage;
	import com.rpgGame.netData.dailyzone.message.SCDailyZoneTimeInfoMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianPanelInfosMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianResultMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianTimeMessage;
	import com.rpgGame.netData.team.message.SCZoneTeamVoteResultMessage;
	import com.rpgGame.netData.zone.message.SCClientTriggerValiedMessage;
	import com.rpgGame.netData.zone.message.SCCurTriggerMessage;
	import com.rpgGame.netData.zone.message.SCEnterZoneMessage;
	import com.rpgGame.netData.zone.message.SCKillInfoMessage;
	import com.rpgGame.netData.zone.message.SCKillInfosMessage;
	import com.rpgGame.netData.zone.message.SCLimitTrackInfoMessage;
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
			SocketConnection.addCmdListener(250264, onSCCancelTeamMatchMessage );//取消匹配
			SocketConnection.addCmdListener(250265, onSCStartTeamMatchMessage );//服务器开始匹配
			
			SocketConnection.addCmdListener(109117, onSCZoneTeamVoteResultMessage);//队伍投票
			
			SocketConnection.addCmdListener(155148, onSCLimitTrackInfoMessage);//极限挑战追踪
			
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
		{
			EventManager.dispatchEvent(DungeonEvent.ZONE_TO_TRIGGER,msg.triggerId);
		}
		private function onSCEnterZoneMessage(msg:SCEnterZoneMessage):void
		{
			DungeonManager.teamZid=0;
			DungeonManager.curryZoneId=msg.zoneId;
			EventManager.dispatchEvent(DungeonEvent.ZONE_CLEAR_TRIGGER,msg.zoneId);
			EventManager.dispatchEvent(DungeonEvent.ENTER_ZONE);
			AppManager.hideApp(AppConstant.MULTY_PANL);
		}
		private function onSCOutZoneMessage(msg:SCOutZoneMessage):void
		{
			DungeonManager.teamZid=0;
			TrusteeshipManager.getInstance().findDist=0;
			TrusteeshipManager.getInstance().stopAll();
			EventManager.dispatchEvent(TaskEvent.AUTO_WALK_STOP);
			EventManager.dispatchEvent(DungeonEvent.OUT_ZONE);
		}
		
		private function onSCZoneStageChangeMessage(msg:SCZoneStageChangeMessage):void
		{
			DungeonManager.curryZoneId=msg.zoneModelId;
			DungeonManager.zoneStage=msg.stage;
			DungeonManager.zoneWave=msg.wave;
			EventManager.dispatchEvent(DungeonEvent.ZONE_STAGE_CHANGE);
			
		}
		private function onSCRemainTimeMessage(msg:SCRemainTimeMessage):void
		{
			DungeonManager.remainTime=msg.remainTime;
			EventManager.dispatchEvent(DungeonEvent.ZONE_REMAIN_TIME);
		}
		private function onSCKillInfosMessage(msg:SCKillInfosMessage):void
		{
			DungeonManager.killInfos=msg.infos;
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFOS);
		}
		private function onSCKillInfoMessage(msg:SCKillInfoMessage):void
		{
			DungeonManager.setKillInfos(msg.info);
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFO);
		}
		private function onSCCurTriggerMessage(msg:SCCurTriggerMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.ZONE_CUR_TRIGGER,msg.curTriggerIds);
		}
		private function onSCMultiZoneResultMessage(msg:SCMultiZoneResultMessage):void
		{
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
			TrusteeshipManager.getInstance().stopAll();
			
		}
		private function onSCMultiZoneRewardMessage(msg:SCMultiZoneRewardMessage):void
		{
			DungeonManager.curryZoneId=msg.zoneID;
			DungeonManager.passReward=msg.passReward;
			DungeonManager.extraReward=msg.extraReward;
			if(DungeonManager.passReward==1||DungeonManager.extraReward==1)
			{
				DungeonManager.isReward=true;
				AppManager.showAppNoHide(AppConstant.MULTY_PANL);
			}
			//EventManager.dispatchEvent(DungeonEvent.ZONE_REWARD);
		}
		private function onSCMultiZonePanelInfosMessage(msg:SCMultiZonePanelInfosMessage):void
		{
			DungeonManager.challengeCount=msg.challengeCount;
			DungeonManager.panelInfos=msg.panelInfos;
		}
		private function onSCMultiZonePanelSingleInfoMessage(msg:SCMultiZonePanelSingleInfoMessage):void
		{Lyt.a("多人副本："+msg.zoneId+":"+msg.count+":"+msg.rewardCount);
			DungeonManager.challengeCount=msg.challengeCount;
			DungeonManager.setPanelInfos(msg.zoneId,msg.count,msg.rewardCount);
			
		}
		private const ACTIBUTID:int=105;
		private function onSCCancelTeamMatchMessage(msg:SCCancelTeamMatchMessage):void
		{
			DungeonManager.teamZid=0;
			MainButtonManager.closeActivityButton(ACTIBUTID);
			MainButtonManager.clearUptimeActivityButton(ACTIBUTID);
			EventManager.dispatchEvent(DungeonEvent.ZONE_EXIT_TEAM);
		}
		private function onSCStartTeamMatchMessage(msg:SCStartTeamMatchMessage):void
		{
			DungeonManager.teamZid=msg.zoneModelId;
			MainButtonManager.openActivityButton(ACTIBUTID);
			MainButtonManager.setUptimeActivityButton(ACTIBUTID);
			EventManager.dispatchEvent(DungeonEvent.ZONE_ENTER_TEAM);
		}
		
		
		private function onSCZoneTeamVoteResultMessage(msg:SCZoneTeamVoteResultMessage):void
		{
			
			if(msg.result==0)
			{
				DungeonManager.teamZid=0;
				DungeonManager.voteZid=0;
				AppManager.hideApp(AppConstant.MULTY_TEAM_PANL);
				AppManager.showAppNoHide(AppConstant.MULTY_TEAM_CANCEL_PANL,msg.playerId.ToGID());
				
			}
			else
			{
				DungeonManager.createZoneTeam(msg.zoneModelid,msg.playerId,msg.result);
				if(DungeonManager.voteList.length==TeamManager.ins.teamInfo.memberinfo.length)
				{
					DungeonManager.voteZid=0;
					AppManager.hideApp(AppConstant.MULTY_TEAM_PANL);
				}
				else
				{
					AppManager.showAppNoHide(AppConstant.MULTY_TEAM_PANL);
					EventManager.dispatchEvent(DungeonEvent.ZONE_TEAM_VOTE);
				}
			}		
		}
		
		private function onSCLimitTrackInfoMessage(msg:SCLimitTrackInfoMessage):void
		{
			EventManager.dispatchEvent(DungeonEvent.ZONE_JIXIAN_TIME,msg);
		}		
	}
}