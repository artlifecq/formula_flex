package com.rpgGame.app.ui.main.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.ShiJieBoss_Skin;
	
	import starling.display.DisplayObject;
	
	/**
	 *世界boss追踪 
	 * @author dik
	 * 
	 */
	public class BossTrackerUI extends DungeonTrackerUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var iconList:Vector.<IconCDFace>;
		private var _bgList:Vector.<UIAsset>;
		private var toPoint:Point;

		private var actId:int;

		private var actInfo:ActivetyInfo;
		
		public function BossTrackerUI()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			iconList=new Vector.<IconCDFace>();
			_bgList=new Vector.<UIAsset>();
			for(var i:int=0;i<4;i++){
				_bgList.push(_skin["sec_ico1_"+i]);
			}
			toPoint=new Point();
		}
		
		
		private function updateView():void
		{
			_skin.sec_info.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,"下次刷新时间:14:00");
			_skin.lbHeadName.text=actInfo.actCfg.q_activity_name;
			
			toPoint.x=actInfo.actCfg.q_move_x;
			toPoint.y=actInfo.actCfg.q_move_y;
			
			var arr:Array;
			if(actInfo.actCfg.q_rewards){
				arr=JSONUtil.decode(actInfo.actCfg.q_rewards);
			}else{
				arr=[];
			}
			var num:int=arr.length;
			for(var i:int=0;i<4;i++){
				iconList.push(IconCDFace.create(IcoSizeEnum.ICON_48));
				if(i<num){
					var itemInfo:ClientItemInfo=new ClientItemInfo(arr[i].mod);
					itemInfo.itemInfo=new ItemInfo();
					itemInfo.itemInfo.isbind=arr[i].bind;
					FaceUtil.SetItemGrid(iconList[i],itemInfo);
				}else{
					iconList[i].clear();
				}
			}
			
			_skin.lbTime.htmlText=actInfo.actCfg.q_activity_timeshow;
			var currentTime:Date=SystemTimeManager.sysDateTime;
			var hour:int=currentTime.hours;
			var min:int=currentTime.minutes;
			var hm:int=int(hour.toString()+min.toString());
			var timeList:Array=ActivetyDataManager.getTimeList(actInfo.actCfg);
			timeList=timeList[4];//第四个才是刷新段
			var next:int=timeList[0];
			num=timeList.length;
			for(i=0;i<num;i++){
				if(timeList[i]>hm){
					next=timeList[i];
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
				_skin.sec_info.htmlText=HtmlTextUtil.getTextColor(StaticValue.UI_RED1,"下次刷新时间:"+TimeUtil.changeIntHM2Str(next));
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.sec_subbut1:
					MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, toPoint.x, toPoint.y,finishWalk, 100,null,finishWalk);
					break;
				case _skin.sec_subbut2:
					break;
			}
		}
		
		private function finishWalk(data:Object):void
		{
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}
		
		override protected function onShow() : void
		{
			super.onShow();
			initEvent();
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
		}
		
		private function getActId(id:int):void
		{
			EventManager.removeEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			AppManager.showAppNoHide(AppConstant.ACTIVETY_BOSS_HURTRANK,id);//打开伤害排行
			actId=id;
			actInfo=ActivetyDataManager.getActInfoById(actId);
			updateView();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			while(iconList.length>0){
				var icon:IconCDFace=iconList.pop();
				icon.destroy();
			}
			actInfo=null;
		}
	}
}