package com.rpgGame.appModule.battle.jjzb
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.alert.GameCheckAlertExt;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.zhengba.bean.ZhengBaData;
	
	import away3d.events.Event;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiChan1_Skin;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiPaiMing;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJi_Info;
	
	import starling.display.DisplayObject;
	
	public class JJBattlePanelExt extends ViewUI
	{
		private var _skin:JingJiChan1_Skin;
		private var _normalView:SubNormalView;
		private var _top3View:SubTop3View;
		private var _fightView:JJBattleSceneView;
		private var _infoSkin:JingJi_Info;
		private var _logSkin:JingJiPaiMing;
		private var _initTimesStr:String;
		private var _initPowerStr:String;
		private var _initPointStr:String;
		private var _isShowLog:Boolean=false;
		/**
		 *0普通挑战1三巨头2战斗面板 
		 */		
		private var _showState:int=0;
		private var _curSub:ISubBattleView;
		private var _rewardPanel:JJBattleRewardPanelExt;
		private var _costArr:Array;
		private var _lastState:int=-1;
		public function JJBattlePanelExt()
		{
			_skin=new JingJiChan1_Skin();
			super(_skin);
			
			_normalView=new SubNormalView(_skin.gNormal,[_skin.skinRole3,_skin.skinRole2,_skin.skinRole4,_skin.skinRole1,_skin.skinRole5],_skin.btnTiaoZhan);
			_top3View=new SubTop3View(_skin.gTop,[_skin.top3,_skin.top1,_skin.top2],_skin.btnBack);
			_fightView=new JJBattleSceneView(_skin.skinBattke);
			_infoSkin=_skin.skinInfo.skin as JingJi_Info;
			_logSkin=_skin.item_msg.skin as JingJiPaiMing;
			_initTimesStr=_infoSkin.lbCiShu.text;
			_initPowerStr=_infoSkin.lbZhanLi.text;
			_initPointStr=_infoSkin.lbShengWang.text;
			_logSkin.uiUp.visible=false;
			_logSkin.labTitle0.visible=false;
			_logSkin.imgBg.height=27;
			
			_costArr=JSONUtil.decode(GlobalSheetData.getStrValue(809));
			regEvent();
		}
		private function regEvent():void
		{
			this._skin.btnBack.addEventListener(Event.TRIGGERED,onBack);
			this._skin.btnTiaoZhan.addEventListener(Event.TRIGGERED,onFightTop3);
			this._skin.btnJiangli.addEventListener(Event.TRIGGERED,onShowReward);
			
			_infoSkin.btnAdd1.addEventListener(Event.TRIGGERED,onBuyTimes);
			_infoSkin.btnAdd2.addEventListener(Event.TRIGGERED,onBuyFightPwoer);
			_infoSkin.btnDui.addEventListener(Event.TRIGGERED,onShowShop);
		}
		
		private function onShowReward(eve:Event):void
		{
			// TODO Auto Generated method stub
			if (!_rewardPanel) 
			{
				_rewardPanel=new JJBattleRewardPanelExt();
			}
			if (_rewardPanel.stage==null) 
			{
				this.addChild(_rewardPanel);
			}
			else
			{
				MCUtil.removeSelf(_rewardPanel);
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target.parent==_skin.item_msg) 
			{
				showHideBattleLog();
			}
			
		}
		
		private function showHideBattleLog():void
		{
			// TODO Auto Generated method stub
			var bool:Boolean=!_isShowLog;
			if (bool) 
			{
				var data:ZhengBaData=Mgr.jjBattleMgr.data;
				if (data==null||data.logs.length==0) 
				{
					return;
				}
			}
			_isShowLog=!_isShowLog;
			_logSkin.uiUp.visible=_isShowLog;
			_logSkin.uiDown.visible=!_isShowLog;
			if (_isShowLog) 
			{
				_logSkin.labTitle0.visible=_isShowLog;
				_logSkin.imgBg.height=_logSkin.labTitle0.y+_logSkin.labTitle0.textHeight+6;
			}
			else
			{
				_logSkin.labTitle0.visible=false;
				_logSkin.imgBg.height=27;
			}
			
		}
		private function onShowShop(eve:Event):void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_SHOP_PANEL);
		}
		
		private function onBuyFightPwoer(eve:Event):void
		{
			// TODO Auto Generated method stub
			var val:int=0;
			if (_costArr) 
			{
				val=_costArr[1];
			}
			var str:String=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,"饮酒壮行");
			var numStr:String=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,val+"");
			str+=LanguageConfig.replaceStr("可以提高本人当日的竞技战斗力消耗{0}元宝或{1}礼金（优先消耗礼金）",[numStr,numStr]);
			GameCheckAlertExt.show(GameCheckAlertExt.T_JJB_BUY_POWER,str,Mgr.jjBattleMgr.reqBuyTimesOrPower,[2]);
		}
		
		private function onBuyTimes(eve:Event):void
		{
			// TODO Auto Generated method stub
			var val:int=0;
			if (_costArr) 
			{
				val=_costArr[0];
			}
			GameCheckAlertExt.show(GameCheckAlertExt.T_JJB_BUY_TIMES,LanguageConfig.replaceStr("花费{0}元宝增加一次挑战次数？",[HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,val+"")]),Mgr.jjBattleMgr.reqBuyTimesOrPower,[1]);
		}
		
		private function onFightTop3(eve:Event):void
		{
			// TODO Auto Generated method stub
			_showState=1;
			updateShowState();
		}
		
		private function onBack(eve:Event):void
		{
			// TODO Auto Generated method stub
			_showState=0;
			updateShowState();
		}
		private function updateShowState():void
		{
			if (_curSub) 
			{
				_curSub.hide();
			}
			if (_showState==0) 
			{
				_curSub=_normalView;
			
			} 
			else if(_showState==1)
			{
				_curSub=_top3View;
			}
			else
			{
				_curSub=_fightView;
			}
			_curSub.show();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(JJBattleEvent.GET_PANEL_DATA,onGetPanelData);
			EventManager.addEvent(JJBattleEvent.GET_FIGHTERS_DATA,onGetFighters);
			EventManager.addEvent(JJBattleEvent.GET_FIGHT_RESULT,onGetFightResult);
			EventManager.addEvent(JJBattleEvent.GOBACK,goBack);
			if (_showState==2) 
			{
				_showState=_lastState;
			}
			updateShowState();
		}
		
		private function onGetFightResult(...arg):void
		{
			// TODO Auto Generated method stub
			_lastState=_showState;
			_showState=2;
			updateShowState();
			//_fightView.show();
			_fightView.setData(arg[0]);
		}
		public function goBack():void
		{
			if (_lastState!=-1) 
			{
				_showState=_lastState;
				updateShowState();
			}
		}
		private function onGetFighters(...arg):void
		{
			// TODO Auto Generated method stub
			//显示普通挑战面板
			var type:int=arg[0];
			if (type==1) 
			{
				_normalView.setData(arg[1]);
			}
			else
			{
				_top3View.setData(arg[1]);
			}
		}
		
		private function onGetPanelData(...arg):void
		{
			// TODO Auto Generated method stub
			var data:ZhengBaData=Mgr.jjBattleMgr.data;
			
			_infoSkin.lbCiShu.text=LanguageConfig.replaceStr(_initTimesStr,[data.currentNumber+"/"+data.maxNumber]);
			_infoSkin.lbZhanLi.text=LanguageConfig.replaceStr(_initPowerStr,[(data.fightPower)+"(+"+data.tempFightPower+"%)"]);
			_infoSkin.lbShengWang.text=LanguageConfig.replaceStr(_initPointStr,[data.reputation]);
			
			_skin.numZhanli.label=data.rank+"";
			
			//未领奖
			if (data.drawAward==0) 
			{
				
			}
			var logLen:int=data.logs.length;
			//日志
			if (logLen>0) 
			{
				_logSkin.labTitle.htmlText=data.logs[logLen-1];
				var arrStr:String="";
				for (var i:int = logLen-1; i >-1; i--) 
				{
					arrStr+=data.logs[i];
					if (i!=0) 
					{
						arrStr+="<br>"
					}
				}
				_logSkin.labTitle0.htmlText=arrStr;
				if (_isShowLog) 
				{
					_logSkin.imgBg.height=_logSkin.labTitle0.y+_logSkin.labTitle0.textHeight+6;
				}
			}
			else
			{
				_logSkin.labTitle.htmlText="暂无记录";
				
			}
			
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(JJBattleEvent.GET_PANEL_DATA,onGetPanelData);
			EventManager.removeEvent(JJBattleEvent.GET_FIGHTERS_DATA,onGetFighters);
			EventManager.removeEvent(JJBattleEvent.GET_FIGHT_RESULT,onGetFightResult);
			EventManager.removeEvent(JJBattleEvent.GOBACK,goBack);
			_curSub.hide();
			if (_isShowLog) 
			{
				showHideBattleLog();
			}
			if (_rewardPanel) 
			{
				MCUtil.removeSelf(_rewardPanel);
			}
			_showState=0;
		}
		
	

		public function get rewardPanel():JJBattleRewardPanelExt
		{
			return _rewardPanel;
		}

	}
}