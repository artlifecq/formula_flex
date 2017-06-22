package com.rpgGame.app.ui.main.dungeon
{
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import gs.TweenMax;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_Skin;
	import org.mokylin.skin.app.activety.zonghe.Active_LiJin_Tips;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;

	/**
	 * 天降礼金追踪
	 * @author YT
	 * 
	 */	
	public class LijinTrackerUI extends DungeonTrackerUI
	{
		
		private var _skin:Active_LiJin_Skin;
		private var _tipsSkin:Active_LiJin_Tips;
		private var tips:Sprite;
		private var tween:TweenMax;
		private var skinList:Array;
		private var ico1List:Vector.<IconCDFace>;
		private var icoBg1List:Vector.<UIAsset>;
		private var ico2List:Vector.<IconCDFace>;
		private var icoBg2List:Vector.<UIAsset>;
		
		public function LijinTrackerUI()
		{
			_skin=new Active_LiJin_Skin();
			_tipsSkin=new Active_LiJin_Tips();
			super(_skin);
			initUI();
		}
		
		private function initUI():void
		{
			tips=_tipsSkin.toSprite();
			tips.visible=false;
			_skin.qiang_box.addChild(tips);
			tips.x=-225;
			tips.y=50;
			var i:int;
			skinList=new Array();
			skinList.push(_skin.sec_navi1);
			skinList.push(_skin.chkAotu);
			skinList.push(_skin.btnSend);
			skinList.push(_skin.sec_ico1_0);
			skinList.push(_skin.sec_ico1_4);
			skinList.push(_skin.sec_navi0);
			skinList.push(_skin.sec_ico2_0);
			skinList.push(_skin.sec_ico2_4);
			skinList.push(_skin.sec_subbut1);
			var ico:IconCDFace;
			icoBg1List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg1List.push(_skin["sec_ico1_"+i]);
			}
			ico1List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg1List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg1List[i].x-6;
				ico.y=icoBg1List[i].y-6;
				ico.visible=false;
				icoBg1List[i].visible=false;
				ico1List.push(ico);
				_skin.task_box.addChild(ico);
			}
			icoBg2List=new Vector.<UIAsset>();
			for(i=0;i<8;i++)
			{
				icoBg2List.push(_skin["sec_ico2_"+i]);
			}
			ico2List=new Vector.<IconCDFace>();
			for(i=0;i<icoBg2List.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_48);
				ico.showCD=false;
				ico.x=icoBg2List[i].x-6;
				ico.y=icoBg2List[i].y-6;
				ico.visible=false;
				icoBg2List[i].visible=false;
				ico2List.push(ico);
				_skin.task_box.addChild(ico);
			}
			_skin.lbTime1.text="00:00:00";
			_skin.grpshuaxin.visible=false;
			_skin.grpto.visible=false;
			setUisite();
			
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "btn_qiang_close":
					setQiangBoxState(false);
					break;
				case "btn_qiang_open":
					setQiangBoxState(true);
					break;
				case "sec_subbut1"://自动任务
					
					break;
				case "sec_subbut2"://离开场景
					AppManager.showApp(AppConstant.ACTIVETY_LIJIN_RESULT);
					break;
				case "lbPaiHang"://排行榜
					//AppManager.showApp(AppConstant.ACTIVETY_LIJIN_SCORES);
					SpecialActivitySender.reqLijinRankInfo();
					break;
				case "lbTo":// 前往刷怪点
					
					break;
				
			}
		}
		override protected function onShow() : void
		{
			super.onShow();
			addEvent();
			setKill();
			setReword();
			setUisite();
			//setQianduoType();
			setCashgift(0);
			setTipsText();
		}
		override protected function onHide():void
		{
			super.onHide();
			removeEvent();
			var icon:IconCDFace;
			while(ico1List.length>0){
				icon=ico1List.pop();
				icon.destroy();
			}
			while(ico2List.length>0){
				icon=ico1List.pop();
				icon.destroy();
			}
			icon=null;
			tween.kill();
			tween=null;
		}
		private function addEvent():void
		{
			//EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			TaskUtil.addLabelEvet(_skin.lbDuiHua);
			TaskUtil.addLabelEvet(_skin.lbName);
			TaskUtil.addLabelEvet(_skin.lbName2);
			TaskUtil.addLabelEvet(_skin.lbPaiHang);
			TaskUtil.addLabelEvet(_skin.lbTo);
			_skin.lbName2.addEventListener(TouchEvent.TOUCH, onTouchTips);
			_skin.lbName.addEventListener(TouchEvent.TOUCH, onTouchTips);
			EventManager.addEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,setCashgift);
			EventManager.addEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,setTime);
			EventManager.addEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,setQianduoType);
		}
		private function removeEvent():void
		{
			//EventManager.addEvent(ActivityEvent.ENTER_ACTIVITY,getActId);
			TaskUtil.removeLabelEvet(_skin.lbDuiHua);
			TaskUtil.removeLabelEvet(_skin.lbName);
			TaskUtil.removeLabelEvet(_skin.lbName2);
			TaskUtil.removeLabelEvet(_skin.lbPaiHang);
			TaskUtil.removeLabelEvet(_skin.lbTo);
			_skin.lbName2.removeEventListener(TouchEvent.TOUCH, onTouchTips);
			_skin.lbName.removeEventListener(TouchEvent.TOUCH, onTouchTips);
			EventManager.removeEvent(ActivityEvent.LIJIN_CASHGIFT_CHANGE,setCashgift);
			EventManager.removeEvent(ActivityEvent.LIJIN_ACTIVITY_TIME,setTime);
			EventManager.removeEvent(ActivityEvent.LIJIN_MONSTER_CHANGE,setQianduoType);
		}
		
		private var isMouseOut : Boolean = true;
		private function onTouchTips(e:TouchEvent):void
		{
			var target : Label  = e.currentTarget as Label;
			var touch : Touch;
			touch = e.getTouch(target);
			if (touch == null&&target!= null )
			{
				isMouseOut = true;
				tips.visible=false;
				return;
			}
			
			touch = e.getTouch(target, TouchPhase.HOVER);
			if (touch != null&&target!= null && isMouseOut)
			{
				isMouseOut = false;
				tips.visible=true;
			}
		}
		
		
		
		
		private var remainTime:int;
		private function setTime(time:int):void
		{
			var rTime:int=time;
			if(rTime<0){
				_skin.lbTime1.text="未开始!";
			}else{
				remainTime=rTime;
				_skin.lbTime1.text=TimeUtil.format3TimeType(remainTime);
				TimerServer.remove(updateTime);
				TimerServer.addLoop(updateTime,1000);
			}
		}
		
		private function updateTime():void
		{
			remainTime--;
			_skin.lbTime1.text=TimeUtil.format3TimeType(remainTime);
			if(remainTime==0){
				TimerServer.remove(updateTime);
			}
		}
		private var remain2Time:int;
		private function setTime2(time:int):void
		{
			var rTime:int=time;
			if(rTime<0){
				_skin.lbTime.text="";
			}else{
				remain2Time=rTime;
				_skin.lbTime.text=TimeUtil.format3TimeType(remain2Time);
				TimerServer.remove(updateTime2);
				TimerServer.addLoop(updateTime2,1000);
			}
		}
		
		private function updateTime2():void
		{
			remain2Time--;
			_skin.lbTime.text=TimeUtil.format3TimeType(remain2Time);
			if(remain2Time==0){
				TimerServer.remove(updateTime2);
			}
		}
		/**设置目标*/		
		private function setKill():void
		{
			_skin.lbRenWu.htmlText="目标任务";//<font color='#5cb006'>("+10+"/"+20+")</font>
			_skin.lbDuiHua.width=300;
			_skin.lbDuiHua.htmlText="击杀：秦国士兵<font color='#cfc6ae'>("+5+"/"+15+")</font>";
			_skin.lbDuiHua.width=_skin.lbDuiHua.textWidth+2;
			_skin.btnSend.x=_skin.lbDuiHua.x+_skin.lbDuiHua.width;
		}
		/**设置奖励物品*/
		private function setReword():void
		{
			var i:int;
			for(i=0;i<icoBg1List.length;i++)
			{
				icoBg1List[i].visible=false;
				ico1List[i].visible=false;
				icoBg2List[i].visible=false;
				ico2List[i].visible=false;
			}
			
			setIcon(ico1List[0],201,10,icoBg1List[0]);
			setIcon(ico2List[0],202,10,icoBg2List[0]);
			
			_skin.sec_navi0.htmlText="【完成<font color='#ff0000'>("+5+"/"+15+")</font>环额外奖励】";
		}
		/**设置抢夺阶段*/
		private function setQianduoType(monsterNum:int,refresh:int):void
		{
			if(monsterNum>0&&refresh>0)
			{
				_skin.grpshuaxin.visible=true;
				_skin.grpto.visible=false;
				setTime2(refresh);
				
			}
			else if(monsterNum>0&&refresh==0)
			{
				_skin.grpshuaxin.visible=false;
				_skin.grpto.visible=true;
				_skin.lbTo.visible=true;
				_skin.lbName.htmlText="盗宝小怪    <font color='#e8c958'>(剩余"+monsterNum+")</font>";
				
			}
			else if(monsterNum==0&&refresh==0)
			{
				_skin.grpshuaxin.visible=false;
				_skin.grpto.visible=true;
				_skin.lbTo.visible=false;
				_skin.lbName.htmlText="盗宝小怪(4)<font color='#e8c958'>已抢夺完毕</font>";
			}
			
		}
		/**设置获得元宝*/
		private function setCashgift(num:int):void
		{
			_skin.numLiJin.label=""+num;
			
		}
		/**设置tips文字*/
		private function setTipsText():void
		{
			_tipsSkin.lbName.htmlText="盗宝小怪";
			_tipsSkin.lbTip.htmlText="1.活动开启则出现第一波盗宝小怪，<br>第<font color='#5DBD37'>5、10、15</font>分钟刷新。<br>2.冬季盗宝下怪必掉礼金。<br>3.攻击盗宝小怪额外获得<font color='#5DBD37'>5-10礼金</font>。";
		}
		private function setIcon(icon:IconCDFace,tiemId:int,num:int,bg:UIAsset=null):void
		{
			var item:Q_item=ItemConfig.getQItemByID(tiemId);
			if(item!=null&&icon!=null)
			{
				icon.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_48));
				icon.visible=true;
				if(bg)
				{
					bg.visible=true;
				}
				TaskUtil.setItemTips(icon,item,num);
			}
		
		}
		
		
		
		private function setQiangBoxState(state:Boolean):void
		{
			if(tween){
				tween.kill();
			}
			if(state){
				tween=TweenMax.to(_skin["qiang_box"],0.5,{x:0});
			}else{
				tween=TweenMax.to(_skin["qiang_box"],0.5,{x:_skin["qiang_box"].width});
			}
			_skin["btn_qiang_close"].visible = state;
			_skin["btn_qiang_open"].visible = !state;
		}
		
		/**设置UI位置*/
		private function setUisite():void
		{
			var i:int,count:int=0;
			for(i=1;i<skinList.length;i++)
			{
				if(skinList[i].visible)
				{
					skinList[i].y=skinList[count].y+skinList[count].height+3;
					count=i;
				}
			}
			_skin.ui_bg.height=skinList[count].y+skinList[count].height+7;
			_skin.lbTime1.y=_skin.sec_navi1.y;
			_skin.lbRenWu.y=_skin.chkLab.y=_skin.chkAotu.y+2;
			_skin.lbDuiHua.y=_skin.btnSend.y+2;
			_skin.sec_subbut2.y=_skin.sec_subbut1.y;
			_skin.btn_qiang_close.y=_skin.btn_qiang_open.y=_skin.qiang_box.y=_skin.ui_bg.height+5;
			
			var id:int;
			for(i=0;i<icoBg1List.length;i++)
			{
				id=int(i/4)*4;
				if(icoBg1List[i].visible)
				{
					icoBg1List[i].y=icoBg1List[id].y;
					ico1List[i].y=icoBg1List[id].y-6;
				}
				if(icoBg2List[i].visible)
				{
					icoBg2List[i].y=icoBg2List[id].y;
					ico2List[i].y=icoBg2List[id].y-6;
				}
			}
		}
	}
}