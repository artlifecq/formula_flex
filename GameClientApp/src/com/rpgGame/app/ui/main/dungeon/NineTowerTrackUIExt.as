package com.rpgGame.app.ui.main.dungeon
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NineTowerCfg;
	import com.rpgGame.coreData.clientConfig.Q_nine_tower;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.yaota.message.SCUpdateYaoTaMessage;
	import com.rpgGame.netData.yaota.message.SCWarChessMessage;
	
	import flash.utils.getTimer;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.fubenzhuizong.JiuCengYaoTaTrack_Skin;
	
	import starling.display.DisplayObject;

	/**
	 *九层妖塔 
	 * @author yfl
	 * 
	 */	
	public class NineTowerTrackUIExt extends DungeonTrackerUI
	{
		private var _skin:JiuCengYaoTaTrack_Skin;
		private var _gReward:RewardGroup;
		private var _timer:GameTimer;
		private var _lastLevel:int=-1;
		private var _endTime:int;
		private var _flagEndTime:int;
		private var _initNameStr:String;
		
		public function NineTowerTrackUIExt()
		{
			_skin=new JiuCengYaoTaTrack_Skin();
			super(_skin);
			
			_gReward=new RewardGroup(_skin.sec_ico1_0);
			
			_timer=new GameTimer("NineTowerTrackUIExt",1000);
			_timer.onUpdate=onTimer;
			_initNameStr=_skin.labOwner.text;
			TipTargetManager.show( _skin.btnMsg, TargetTipsMaker.makeTips( TipType.TWOER_TIP,null));
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				
				_skin.sec_time.text="剩余时间："+TextUtil.SecondToHMS3(left);
			}
			var left2:int=(_flagEndTime-getTimer())/1000;
			if (left2>0) 
			{
				_skin.labOwnerTime.text="倒计时："+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,TextUtil.SecondToHMS3(left2));
			}
			if (left<=0&&left2<=0) 
			{
				_timer.stop();
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.sec_subbut1:
				{
					onQuit();
					break;
				}
				case _skin.lbPaihang:
				{
					onRank();
					break;
				}
				case _skin.btn_close:
				{
					if (AppManager.isAppInScene(AppConstant.BATTLE_NINE_TOWER_SCORE_PANEL)) 
					{
						AppManager.hideApp(AppConstant.BATTLE_NINE_TOWER_SCORE_PANEL);
					}
					break;
				}
			}
		}
		
		private function onRank():void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_SCORE_PANEL);
		}
		
		private function onQuit():void
		{
			// TODO Auto Generated method stub
			Mgr.nineTowerMgr.reqQuitTower();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(NineTowerEvent.GET_TRACK_DATA,setData);
			EventManager.addEvent(NineTowerEvent.GET_TRACK__FLAG_DATA,setFlagData);
			if (Mgr.nineTowerMgr.data!=null) 
			{
				setData(Mgr.nineTowerMgr.data);
			}
			if (Mgr.nineTowerMgr.flagData!=null) 
			{
				setFlagData(Mgr.nineTowerMgr.flagData);
			}
		}
		
		private function setFlagData(...arg):void
		{
			// TODO Auto Generated method stub
			Mgr.nineTowerMgr.flagData=null;
			var data:SCWarChessMessage=arg[0];
			_skin.gFlag.visible=data!=null;
			var name:String="暂无";
			if (data.playerName!=null) 
			{
				name=data.playerName;
			}
			_skin.labOwner.htmlText=LanguageConfig.replaceStr(_initNameStr,[HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,name)]);
			if (data.time!=0) 
			{
				_flagEndTime=data.time*1000+getTimer();
			}
			_skin.labOwnerTime.text="倒计时："+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,TextUtil.SecondToHMS3(data.time));
		}
		override protected function onHide():void
		{
			super.onHide();
			if (_timer) 
			{
				_timer.stop();
				_timer.destroy();
				_timer=null;
			}
			_gReward.clear();
			_lastLevel=-1;
			EventManager.removeEvent(NineTowerEvent.GET_TRACK_DATA,setData);
			EventManager.removeEvent(NineTowerEvent.GET_TRACK__FLAG_DATA,setFlagData);
			if (AppManager.isAppInScene(AppConstant.BATTLE_NINE_TOWER_SCORE_PANEL)) 
			{
				AppManager.hideApp(AppConstant.BATTLE_NINE_TOWER_SCORE_PANEL);
			}
		}
		public function setData(...arg):void
		{
			var data:SCUpdateYaoTaMessage=arg[0];
			Mgr.nineTowerMgr.data=null;
			if (data==null) 
			{
				return;
			}
			var level:int=data.tier;
			var score:int=data.currentIntegral;
			
			_skin.lbHeadName.text=TextUtil.ConectParam("第{0}层",[level]);
			_skin.lbMyNum.text=data.integral+"";
			var qTower:Q_nine_tower=NineTowerCfg.getTower(level);
			if (!qTower) 
			{
				return;
			}
			_skin.lbNum.text=score+"/"+qTower.q_score;
			_skin.pro_bar.value=score/qTower.q_score*100;
			if (_lastLevel!=level) 
			{
				_lastLevel=level;
				_gReward.setRewardByJsonStr(qTower.q_tower_reward);
			}
			if (qTower.q_per==0) 
			{
				_skin.labPer.text="本层死亡复活不会降层";
			}
			else
			{
				_skin.labPer.text="本层死亡复活有几率会降层"
			}
			_skin.uiLinQu.visible=data.drawAward==1;
			_endTime=getTimer()+data.time*1000;
			if (_timer.running==false) 
			{
				_timer.start();
			}
			_skin.sec_time.text="剩余时间："+TextUtil.SecondToHMS3(data.time);
			//最大层
			_skin.gFlag.visible=qTower.q_next_tower==0;
			_skin.gLevel.visible=qTower.q_next_tower!=0;
			_skin.labMax.visible=qTower.q_next_tower==0;
		}
	}
}