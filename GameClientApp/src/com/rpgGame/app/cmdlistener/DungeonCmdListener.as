package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.netData.lunjian.message.SCLunJianPanelInfosMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianResultMessage;
	import com.rpgGame.netData.lunjian.message.SCLunJianTimeMessage;
	import com.rpgGame.netData.zone.message.SCClientTriggerValiedMessage;
	import com.rpgGame.netData.zone.message.SCCurTriggerMessage;
	import com.rpgGame.netData.zone.message.SCEnterZoneMessage;
	import com.rpgGame.netData.zone.message.SCKillInfoMessage;
	import com.rpgGame.netData.zone.message.SCKillInfosMessage;
	import com.rpgGame.netData.zone.message.SCMultiZoneResultMessage;
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
			SocketConnection.addCmdListener(227501, onSCLunJianPanelInfosMessage );
			SocketConnection.addCmdListener(227502, onSCLunJianTimeStartMessage );
			SocketConnection.addCmdListener(227503, onSCLunJianResultMessage );
			SocketConnection.addCmdListener(155136, onSCClientTriggerValiedMessage );//多人副本触发信息
			SocketConnection.addCmdListener(155137, onSCEnterZoneMessage );//进入副本
			SocketConnection.addCmdListener(155138, onSCOutZoneMessage );//退出副本
			SocketConnection.addCmdListener(155139, onSCZoneStageChangeMessage );//副本状态
			SocketConnection.addCmdListener(155140, onSCRemainTimeMessage );//声音时间
			SocketConnection.addCmdListener(155141, onSCKillInfosMessage );//击杀列表
			SocketConnection.addCmdListener(155142, onSCKillInfoMessage );//单个击杀
			SocketConnection.addCmdListener(155143, onSCCurTriggerMessage );//已经触发列表
			SocketConnection.addCmdListener(155144, onSCMultiZoneResultMessage );//准备退出副本
			
			finish();
		}
		
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
		private function onSCClientTriggerValiedMessage(msg:SCClientTriggerValiedMessage):void
		{
			ClientTriggerManager.serverTrigger(msg.triggerId);
		}
		private function onSCEnterZoneMessage(msg:SCEnterZoneMessage):void
		{//L.l("SCEnterZoneMessage");
			DungeonManager.curryZoneId=msg.zoneId;
			ClientTriggerManager.clearTigerByZone(msg.zoneId);
			EventManager.dispatchEvent(DungeonEvent.ENTER_ZONE);
			
		}
		private function onSCOutZoneMessage(msg:SCOutZoneMessage):void
		{//L.l("SCEnterZoneMessage");
			EventManager.dispatchEvent(DungeonEvent.OUT_ZONE);
		}
		
		private function onSCZoneStageChangeMessage(msg:SCZoneStageChangeMessage):void
		{//L.l("SCZoneStageChangeMessage");
			DungeonManager.curryZoneId=msg.zoneModelId;
			DungeonManager.zoneStage=msg.stage;
			DungeonManager.zoneWave=msg.wave;
			EventManager.dispatchEvent(DungeonEvent.ZONE_STAGE_CHANGE);
			
		}
		private function onSCRemainTimeMessage(msg:SCRemainTimeMessage):void
		{//L.l("SCRemainTimeMessage");
			DungeonManager.remainTime=msg.remainTime;
			EventManager.dispatchEvent(DungeonEvent.ZONE_REMAIN_TIME);
		}
		private function onSCKillInfosMessage(msg:SCKillInfosMessage):void
		{//L.l("SCKillInfosMessage");
			DungeonManager.killInfos=msg.infos;
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFOS);
		}
		private function onSCKillInfoMessage(msg:SCKillInfoMessage):void
		{//L.l("SCKillInfoMessage");
			DungeonManager.changeKillInfos(msg.info);
			EventManager.dispatchEvent(DungeonEvent.ZONE_SKILL_INFO);
		}
		private function onSCCurTriggerMessage(msg:SCCurTriggerMessage):void
		{//L.l("SCCurTriggerMessage");
			ClientTriggerManager.triggerInit(msg.curTriggerIds);
			EventManager.dispatchEvent(DungeonEvent.ZONE_CUR_TRIGGER);
		}
		private function onSCMultiZoneResultMessage(msg:SCMultiZoneResultMessage):void
		{//L.l("SCMultiZoneResultMessage");
			EventManager.dispatchEvent(DungeonEvent.ZONE_OUT_RESULT);
		}
		
	}
}