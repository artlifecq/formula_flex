package com.rpgGame.app.ui.scene
{
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.structs.Position;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.ShiJieBoss_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *世界boss追踪 
	 * @author dik
	 * 
	 */
	public class BossTrackerUI extends SceneTrackerUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var toPoint:Position;
		
		private var actId:int;
		private var actInfo:ActivetyInfo;
		private var rewardGrp:RewardGroup;
		
		public function BossTrackerUI()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			rewardGrp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.sec_ico1_0,RewardGroup.ALIN_LEFT,4);
			toPoint=new Position();
		}
		
		
		private function updateView():void
		{
			_skin.sec_info.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"下次刷新时间:14:00");
			_skin.headName.text=actInfo.actCfg.q_activity_name;
			
			
			
			toPoint.x=actInfo.actCfg.q_move_x;
			toPoint.y=actInfo.actCfg.q_move_y;
			//进入就自动挂机战斗
			//MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, toPoint.x, toPoint.y,finishWalk, 100);
			TrusteeshipManager.getInstance().startAutoFightToPos([SceneSwitchManager.currentMapId,toPoint.x,toPoint.y]);
			rewardGrp.clear();
			rewardGrp.setRewardByJsonStr(actInfo.actCfg.q_rewards);
			
			_skin.lbTime.htmlText=actInfo.actCfg.q_activity_timeshow;
			var currentTime:Date=SystemTimeManager.sysDateTime;
			var hour:int=currentTime.hours;
			var min:int=currentTime.minutes;
			var sec:int=hour*60*60+min*60;
			var timeStr:String=TimeUtil.formatTimeToTimeString(sec);
			var arrTime:Array=timeStr.split(":");
			var hm:int=int(arrTime[0]+arrTime[1]);
			var timeList:Array=ActivetyDataManager.getTimeList(actInfo.actCfg);
			timeList=timeList[4];//第四个才是刷新段
			var next:int=timeList[0];
			var num:int=timeList.length;
			var i:int=0;
			for(i=0;i<num;i++){
				if(timeList[i]>hm){
					if((i+1)!=num){
						next=timeList[i+1];
					}else{
						next=timeList[0];
					}
					break;
				}
			}
			_skin.lbTime.text="";
			for(i=0;i<num;i++){
				if(i%2==0){
					_skin.lbTime.text+=TimeUtil.changeIntHM2Str(timeList[i])+" ";
				}
			}
			
			if(actInfo.info&&actInfo.info.joinState==ActivityJoinStateEnum.JOINING){//进行中就是未击杀
				_skin.uiWeiJiSha.visible=true;
				_skin.uiYiTiaoZhan.visible=false;
				_skin.sec_info.visible=false;
			}else{
				_skin.uiWeiJiSha.visible=false;
				_skin.uiYiTiaoZhan.visible=true;
				_skin.sec_info.visible=true;
				_skin.sec_info.htmlText=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"下次刷新时间:"+TimeUtil.changeIntHM2Str(next));
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					var posta:Array=[SceneSwitchManager.currentMapId,toPoint.x,toPoint.y];
					TrusteeshipManager.getInstance().startAutoFightToPos(posta);
					//MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, toPoint.x, toPoint.y,finishWalk, 100);
					break;
				case _skin.sec_subbut2:
					SceneSender.reqOutMap();
					break;
			}
		}
		
		/*private function finishWalk(data:Object):void
		{
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}*/
		
		override protected function onShow() : void
		{
			super.onShow();
			initEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			EventManager.addEvent(ActivityEvent.UPDATE_ACTIVITY,updateBossAct);
		}
		
		private function updateBossAct(id:int):void
		{
			if(id==actId){
				actInfo=ActivetyCfgData.getActInfoById(actId);
				updateView();
			}
		}
		
		private function getActId(id:int):void
		{
			if(id!=ActivetyDataManager.jixianVo.activityid)
			{
				EventManager.removeEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
				AppManager.showAppNoHide(AppConstant.ACTIVETY_BOSS_HURTRANK,id);//打开伤害排行
				actId=id;
				actInfo=ActivetyCfgData.getActInfoById(actId);
				updateView();
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			EventManager.removeEvent(ActivityEvent.UPDATE_ACTIVITY,updateBossAct);
			actInfo=null;
			rewardGrp.clear();
		}
	}
}