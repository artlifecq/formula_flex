package com.rpgGame.app.ui.scene.dungeon
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.ctrl.TouchCtrl;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.map.BigMapsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.sender.NineTowerSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.TextUtil;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NineTowerCfg;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_nine_tower;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
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
			
			_gReward=new RewardGroup(IcoSizeEnum.ICON_48,_skin.sec_ico1_0);
			
			_timer=new GameTimer("NineTowerTrackUIExt",1000);
			_timer.onUpdate=onTimer;
			_initNameStr=_skin.labOwner.text;
			TipTargetManager.show( _skin.btnMsg, TargetTipsMaker.makeTips( TipType.TWOER_TIP,null));
			
			var touch:TouchCtrl=new TouchCtrl(_skin.labOwner,onClickOwner);
		}
		
		private function onClickOwner():void
		{
			// TODO Auto Generated method stub
			NineTowerSender.reqTrackFlagPlayer();
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var left:int=(_endTime-getTimer())/1000;
			if (left>0) 
			{
				
				_skin.sec_time.text=NotifyCfgData.getNotifyTextByID(61046)+TextUtil.SecondToHMS3(left);
			}
			var left2:int=(_flagEndTime-getTimer())/1000;
			if (left2>0) 
			{
				_skin.labOwnerTime.htmlText=NotifyCfgData.getNotifyTextByID(61050)+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,TextUtil.SecondToHMS3(left2));
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
		private var zhanqiIcoId:int;
		private function setFlagData(...arg):void
		{
			// TODO Auto Generated method stub
			Mgr.nineTowerMgr.flagData=null;
			var data:SCWarChessMessage=arg[0];
			_skin.gFlag.visible=data!=null;
			var name:String=NotifyCfgData.getNotifyTextByID(61051);
			if (data.playerName!=null) 
			{
				name=data.playerName;
			}
			_skin.labOwner.htmlText=LanguageConfig.replaceStr(_initNameStr,["<u>"+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,MainRoleManager.getPlayerName(name))+"</u>"]);
			if (data.time!=0) 
			{
				_flagEndTime=data.time*1000+getTimer();
			}
			_skin.labOwnerTime.htmlText=NotifyCfgData.getNotifyTextByID(61050)+HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,TextUtil.SecondToHMS3(data.time));
			if(name=="无")
			{
				var monsterAreaData:Q_scene_monster_area=MonsterDataManager.getMonsterById(14009);
				var monsterName:String=MonsterDataManager.getMonsterName(monsterAreaData.q_monster_model);
				if(monsterAreaData!=null)
				{
					if(zhanqiIcoId>0)
					{
						BigMapsManager.removeMapsIcon(zhanqiIcoId);
					}
					zhanqiIcoId=BigMapsManager.showMapsIcon("",monsterName,monsterAreaData.q_center_x,monsterAreaData.q_center_y,0,true,"ui/app/maps/zhanqi.png");
				}
			}
			else
			{
				BigMapsManager.removeMapsIcon(zhanqiIcoId);
				zhanqiIcoId=0;
				//
			}
		
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
			
			_skin.lbHeadName.text=TextUtil.ConectParam(NotifyCfgData.getNotifyTextByID(61049),[level]);
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
				_skin.labPer.text=NotifyCfgData.getNotifyTextByID(61048);
			}
			else
			{
				_skin.labPer.text=NotifyCfgData.getNotifyTextByID(61047);
			}
			_skin.uiLinQu.visible=data.drawAward==1;
			_endTime=getTimer()+data.time*1000;
			if (_timer.running==false) 
			{
				_timer.start();
			}
			_skin.sec_time.text=NotifyCfgData.getNotifyTextByID(61046)+TextUtil.SecondToHMS3(data.time);
			//最大层
			_skin.gFlag.visible=qTower.q_next_tower==0;
			_skin.gLevel.visible=qTower.q_next_tower!=0;
			_skin.labMax.visible=qTower.q_next_tower==0;
		}
	}
}