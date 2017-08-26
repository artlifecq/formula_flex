package com.rpgGame.app.ui.scene.dungeon
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.pop.UIPopManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.sender.PetSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.DungeonEvent;
	import com.rpgGame.core.events.PetEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.DailyZoneMonsterCfgData;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_dailyzone_monster;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.zone.bean.KillMonsterInfo;
	
	import flash.geom.Point;
	
	import feathers.controls.SkinnableContainer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.meiren.MeiRenBoss_Item;
	import org.mokylin.skin.app.meiren.MeiRen_ZhuiZong;
	
	import starling.display.DisplayObject;
	
	import utils.TimerServer;
	
	public class MeiRenTrackerBar extends DungeonTrackerUI
	{
		private var _skin:MeiRen_ZhuiZong;
		
		private var skinList:Array;
		private var killButList:Vector.<SkinnableContainer>;
		
		private var zoneId:int=0;
		private var remainTime:int;
		private var alertOk:AlertSetInfo;
		
		private var goldBuyText:String="";
		private var goldBuyMod:Q_global;
		private var bindGoldBuyMod:Q_global;
		
		public function MeiRenTrackerBar()
		{
			_skin=new MeiRen_ZhuiZong();
			super(_skin);
			initPanel();
		}
		
		private function initPanel():void
		{
			goldBuyMod=GlobalSheetData.getSettingInfo(845);
			bindGoldBuyMod=GlobalSheetData.getSettingInfo(846);
			
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.killbut_0);
			skinList.push(_skin.killbut_1);
			skinList.push(_skin.sec_navi2);
			skinList.push(_skin.sec_shanghai);
			skinList.push(_skin.sec_fangyu);
			skinList.push(_skin.sec_tishi);
			skinList.push(_skin.sec_info);
			skinList.push(_skin.sec_subbut2);
			
			var i:int;
			killButList=new Vector.<SkinnableContainer>();
			for(i=0;i<2;i++)
			{
				killButList.push(_skin["killbut_"+i]);
				TaskUtil.addLabelEvet(_skin["killbut_"+i].skin.labelDisplay);			
			}
			alertOk=new AlertSetInfo(LangAlertInfo.ZONE_EXIT_SURE);
		}
		
		override protected function onShow() : void
		{
			addEvent();
			enterZone();
			finishWalk(null);
			onBuyNumChange();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			clear();		
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.killbut_0:
					touchBut(0);
					break;
				case _skin.killbut_1:				
					touchBut(1);
					break;
				case _skin.sec_subbut2:				
					zoneOutToGame();
					break;
				case _skin.btnYuanbao:
					onGoldAdd();
					break;
				case _skin.btnLijin:
					onBindGoldAdd();
					break;
			}		
		}
		
		private function addEvent():void
		{
			EventManager.addEvent(PetEvent.PET_BUYNUM_CHANGE,onBuyNumChange);
			EventManager.addEvent(DungeonEvent.ENTER_ZONE,enterZone);//进入副本
			EventManager.addEvent(DungeonEvent.OUT_ZONE,outZone);//退出
			EventManager.addEvent(DungeonEvent.ZONE_STAGE_CHANGE,setTageChange);//副本状态
			EventManager.addEvent(DungeonEvent.ZONE_REMAIN_TIME,setTime);//副本时间
			EventManager.addEvent(DungeonEvent.ZONE_SKILL_INFOS,setKillInfo);//击杀列表
			EventManager.addEvent(DungeonEvent.ZONE_SKILL_INFO,setKillInfo);//击杀单个
		}
		private function removeEvent():void
		{
			EventManager.removeEvent(PetEvent.PET_BUYNUM_CHANGE,onBuyNumChange);
			EventManager.removeEvent(DungeonEvent.ENTER_ZONE,enterZone);//进入副本
			EventManager.removeEvent(DungeonEvent.OUT_ZONE,outZone);//退出
			EventManager.removeEvent(DungeonEvent.ZONE_STAGE_CHANGE,setTageChange);//副本状态
			EventManager.removeEvent(DungeonEvent.ZONE_REMAIN_TIME,setTime);//副本时间
			EventManager.removeEvent(DungeonEvent.ZONE_SKILL_INFOS,setKillInfo);//击杀列表
			EventManager.removeEvent(DungeonEvent.ZONE_SKILL_INFO,setKillInfo);//击杀单个
			TimerServer.remove(updateTime);
			TweenLite.killDelayedCallsTo(walkTo);
			for(var i:int=0;i<killButList.length;i++)
			{
				TaskUtil.removeLabelEvet(_skin["killbut_"+i].skin.labelDisplay);
			}
		}
		
		private function isCanChangeNum(type:int):Boolean
		{
			if(type==1)
			{
				var arr:Array=JSONUtil.decode(goldBuyMod.q_string_value);
				var nowNum:int=Mgr.petMgr.glodNum;
				var maxNum:int=arr.length;
				if(nowNum>=maxNum)
				{
					NoticeManager.showNotifyById(21000);
					return false;
				}
				else if(arr[nowNum]>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_GOLD))
				{
					NoticeManager.showNotifyById(21005);
					return false;
				}
			}
			else
			{
				arr=JSONUtil.decode(bindGoldBuyMod.q_string_value);
				nowNum=Mgr.petMgr.bindGlodNum;
				maxNum=arr.length;
				if(nowNum>=maxNum)
				{
					NoticeManager.showNotifyById(21000);
					return false;
				}
				else if(arr[nowNum]>MainRoleManager.actorInfo.totalStat.getResData(CharAttributeType.RES_BIND_GOLD))
				{
					NoticeManager.showNotifyById(2013);
					return false;
				}
			}
			return true;
		}
		
		private function touchBut(id:int):void
		{
			walkWave(id);
		}
		
		private function walkTo():void
		{
			walkWave(DungeonManager.getKillNoAllID());
		}
		
		private function walkWave(id:int):void
		{
			TweenLite.killDelayedCallsTo(walkTo);
			var pos:Point=DungeonManager.getStagePos(id);
			if(pos)
			{
				MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, pos.x, pos.y,finishWalk, 100);
			}
		}
		
		private function finishWalk(data:Object):void
		{
			TrusteeshipManager.getInstance().findDist=1000;
			TrusteeshipManager.getInstance().startAutoFight();
		}
		
		private function enterZone():void
		{
			if(DungeonManager.curryZoneId==0||zoneId==DungeonManager.curryZoneId)
			{
				return;
			}			
			zoneId=DungeonManager.curryZoneId;
			setKillInfo();
			setTime();
			setUisite();
			updateAtt();
			if(DungeonManager.zoneStage==1)
			{
				UIPopManager.showAlonePopUI(DungeonFightPop);
			}		
		}
		
		private function onBindGoldAdd():void
		{
			// TODO Auto Generated method stub
			if(isCanChangeNum(2))
			{
				PetSender.reqExaBuyMessage(2);
			}
		}
		
		private function onGoldAdd():void
		{
			// TODO Auto Generated method stub
			if(isCanChangeNum(1))
			{
				PetSender.reqExaBuyMessage(1);
			}
		}
		
		private function onBuyNumChange():void
		{
			// TODO Auto Generated method stub
			var price:int;
			var nowNum:int;
			var maxNum:int;
			var arr:Array;
			arr=JSONUtil.decode(goldBuyMod.q_string_value);
			nowNum=Mgr.petMgr.glodNum;
			maxNum=arr.length;
			if(nowNum<maxNum)
			{
				price=arr[nowNum];
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"消耗")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,price.toString())+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"元宝临时提高实力")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"（已使用"+nowNum+"/"+maxNum+"次）\n")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可获得伤害加深")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"或防御提升")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%");
			}
			else
			{
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"已达上限");					
			}
			TipTargetManager.show( _skin.btnYuanbao, TargetTipsMaker.makeSimpleTextTips(goldBuyText));
			
			arr=JSONUtil.decode(bindGoldBuyMod.q_string_value);
			nowNum=Mgr.petMgr.bindGlodNum;
			maxNum=arr.length;
			if(nowNum<maxNum)
			{
				price=arr[nowNum];
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"消耗")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,price.toString())+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"礼金临时提高实力")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"（已使用"+nowNum+"/"+maxNum+"次）\n")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"可获得伤害加深")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%")+
					HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"或防御提升")+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"+3%");
			}
			else
			{
				goldBuyText=HtmlTextUtil.getTextColor(StaticValue.GRAY_TEXT,"已达上限");					
			}
			updateAtt();
			TipTargetManager.show( _skin.btnLijin, TargetTipsMaker.makeSimpleTextTips(goldBuyText));
		}
		
		private function updateAtt():void
		{
			var golbAtt:int=3*Mgr.petMgr.glodNum;
			var bindGolbAtt:int=3*Mgr.petMgr.bindGlodNum;
			_skin.sec_shanghai.text="伤害加深:"+golbAtt+"%";
			_skin.sec_fangyu.text="防御提升:"+bindGolbAtt+"%";
		}
		
		private function outZone():void
		{
			_skin.task_box.visible=false;
		}
		
		private function zoneOutToGame():void
		{
			GameAlert.showAlert(alertOk,onAlert);
		}
		
		private function onAlert(gameAlert:GameAlert):void
		{
			if(gameAlert.clickType==AlertClickTypeEnum.TYPE_SURE)
			{
				DungeonSender.reqQuitDungeon();
			}		
		}
		
		private function setTageChange():void
		{
			enterZone();
			setUisite();
			autoWalk();
		}
		
		private function autoWalk():void
		{
			TweenLite.killDelayedCallsTo(walkTo);
			TweenLite.delayedCall(1, walkTo);
		}
		
		private function setKillInfo():void
		{
			var i:int=0;
			for(i=0;i<killButList.length;i++)
			{
				killButList[i].visible=false;
			}
			var killList:Vector.<KillMonsterInfo>=DungeonManager.killInfos;
			var qzm:Q_dailyzone_monster;
			if(killList&&killList.length>0)
			{
				for(i=0;i<killList.length;i++)
				{
					qzm=DailyZoneMonsterCfgData.getZoneCfg(killList[i].monsterModelId);
					if(qzm&&i<killButList.length)
					{
						(killButList[i].skin as MeiRenBoss_Item).labelDisplay.htmlText="击杀：<u>"+MonsterDataManager.getMonsterName(qzm.q_monsterId)+"</u><font color='#cfc6ae'>("+killList[i].count+"/"+qzm.q_monsterNum+")</font>";
						killButList[i].visible=true;
					}				
				}
			}		
			setUisite();
		}
		
		private function setTime():void
		{
			var rTime:int=DungeonManager.remainTime;
			if(rTime<=0){
				_skin.sec_info.text="未开始挑战!";
			}else{
				remainTime=rTime/1000;
				_skin.sec_info.text="副本剩余时间："+TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.sec_info.text=TimeUtil.format3TimeType(remainTime);
			if(remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible==true)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}		
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
		}
		
		private function clear():void
		{
			var i:int,lenth:int;
			var iocn:IconCDFace;
			skinList=null;
			killButList=null;
			iocn=null;
			GameAlert.closeAlert(LangAlertInfo.ZONE_EXIT_SURE);
			alertOk=null;
			_skin.dispose();
			_skin=null;
		}
	}
}