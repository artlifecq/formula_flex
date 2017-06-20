package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossKillerNameMessage;
	import com.rpgGame.netData.monster.message.SCWorldBossResultMessage;
	import com.rpgGame.netData.specialactivities.bean.ActivityNotifyInfo;
	import com.rpgGame.netData.specialactivities.bean.SpecialActivityInfo;
	import com.rpgGame.netData.specialactivities.message.SCActivitiesNotifyListMessage;
	import com.rpgGame.netData.specialactivities.message.SCEnterActivityMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivitiesListMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityCloseMessage;
	import com.rpgGame.netData.specialactivities.message.SCSpecialActivityOpenMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	public class SpecialActivitiesCmdListener extends BaseBean
	{
		public function SpecialActivitiesCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection.addCmdListener(162101,onSCSpecialActivitiesListMessage);
			SocketConnection.addCmdListener(162102,onSCSpecialActivityOpenMessage);
			SocketConnection.addCmdListener(162103,onSCSpecialActivityCloseMessage);
			SocketConnection.addCmdListener(162104,onSCActivitiesNotifyListMessage);
			SocketConnection.addCmdListener(162105,onSCEnterActivityMessage);
			
			SocketConnection.addCmdListener(114118,onSCWorldBossResultMessage);
			SocketConnection.addCmdListener(114119,onSCWorldBossKillerNameMessage);
			SocketConnection.addCmdListener(114115,onResBossDamageInfosToClientMessage);
			finish();
		}
		
		private function onSCWorldBossResultMessage(msg:SCWorldBossResultMessage):void
		{
			AppManager.showApp(AppConstant.ACTIVETY_BOSS_RESULT,msg);
		}
		
		private function onResBossDamageInfosToClientMessage(msg:ResBossDamageInfosToClientMessage):void
		{
			EventManager.dispatchEvent(ActivityEvent.UPDATE_BOSS_HURT_RANK,msg);
		}
		
		private function onSCEnterActivityMessage(msg:SCEnterActivityMessage):void
		{
			EventManager.dispatchEvent(ActivityEvent.ENTER_ACTIVITY,msg.activity);
		}
		
		private function onSCWorldBossKillerNameMessage(msg:SCWorldBossKillerNameMessage):void
		{
			ActivetyDataManager.updateBossKiller(msg.activityId,msg.killerName);
		}
		
		/**
		 *活动预告信息 
		 * @param msg
		 * 
		 */
		private function onSCActivitiesNotifyListMessage(msg:SCActivitiesNotifyListMessage):void
		{
			//通过活动id去找该活动id对应的新功能id，然后看该新功能是够开启，然后再在活动按钮里面设置倒计时；
			//或者去窗口链接信息表找对应的icon，开启对应icon的状态；
			var list:Vector.<ActivityNotifyInfo>=msg.activityNotifyInfolist;
			var num:int=list.length;
			var info:ActivetyInfo;
			for (var i:int = 0; i <num; i++) 
			{
				info=ActivetyDataManager.getActInfoById(list[i].activityId);
				if(info.actCfg.q_panel_id!=0){//有独立的功能icon
					if(info.actCfg.q_panel_pre_time*60>list[i].notifyTime&&list[i].notifyTime!=0){//在预告时间内
						updateActLeftTime(info.actCfg.q_panel_id,list[i].notifyTime);
					}
				}
			}
		}
		
		private function onSCSpecialActivitiesListMessage(msg:SCSpecialActivitiesListMessage):void
		{
			var list:Vector.<SpecialActivityInfo>=msg.activityInfolist;
			var num:int=list.length;
			
			var info:ActivetyInfo;
			for (var i:int = 0; i <num; i++) 
			{
				ActivetyDataManager.updateInfo(list[i]);
				info=ActivetyDataManager.getActInfoById(list[i].activityId);
				if(info.actCfg.q_panel_id!=0){//有独立的功能icon
					if(info.actCfg.q_panel_pre_time*60>list[i].notifyTime&&list[i].notifyTime!=0){//在预告时间内
						updateActLeftTime(info.actCfg.q_panel_id,list[i].notifyTime);
					}
				}
				EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,list[i].activityId);
			}
			ActivetyDataManager.sortAllDatas();
		}
		
		/**
		 *更新活动剩余时间 
		 * @param q_panel_id 窗口链接表id
		 * @param notifyTime   剩余的时间秒
		 * 
		 */
		private function updateActLeftTime(q_panel_id:int, notifyTime:int):void
		{
			MainButtonManager.openActivityButton(q_panel_id);
			MainButtonManager.setUptimeActivityButton(q_panel_id,notifyTime);
		}
		
		private function onSCSpecialActivityCloseMessage(msg:SCSpecialActivityCloseMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.CLOSE);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
			var info:ActivetyInfo=ActivetyDataManager.getActInfoById(msg.activityId);
			if(info.actCfg.q_panel_id!=0){//有独立的功能icon
				MainButtonManager.closeActivityButton(info.actCfg.q_panel_id);
			}
		}
		
		private function onSCSpecialActivityOpenMessage(msg:SCSpecialActivityOpenMessage):void
		{
			ActivetyDataManager.setActState(msg.activityId,ActivityJoinStateEnum.OPEN);
			EventManager.dispatchEvent(ActivityEvent.UPDATE_ACTIVITY,msg.activityId);
			var info:ActivetyInfo=ActivetyDataManager.getActInfoById(msg.activityId); 
			if(info.actCfg.q_show_notice==1){
				AppManager.showAppNoHide(AppConstant.ACTIVETY_OPEN,info);
			}
		}
	}
}