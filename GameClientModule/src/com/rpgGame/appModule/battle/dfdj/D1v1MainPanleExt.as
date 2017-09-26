package com.rpgGame.appModule.battle.dfdj
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.dianfeng.bean.DianFengDataInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DianFeng_Skin;
	
	import starling.display.DisplayObject;
	
	public class D1v1MainPanleExt extends ViewUI
	{
		private var _skin:DianFeng_Skin;
		private var _eff:Inter3DContainer;
		
		private var _effEftContaner:Inter3DContainer;
		private var _eff1:InterObject3D;
		public function D1v1MainPanleExt()
		{
			_skin=new DianFeng_Skin();
			super(_skin);
			_skin.btnOpen.touchable=false;
			_skin.btnStart.touchable=false;
			initView();
			TipTargetManager.show(_skin.icon,TargetTipsMaker.makeTips(TipType.D1V1_RANK_TIP,new DynamicTipData()));
			TipTargetManager.show(_skin.icoSw, TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(29)));
		}
		
		private function initView():void
		{
			_effEftContaner=new Inter3DContainer();
			_skin.container.addChildAt(_effEftContaner,1);
			_eff1=_effEftContaner.playInter3DAt(ClientConfig.getEffect("ui_dianfengduijue_mianban"),489,341,0);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target)
			switch(target)
			{
				case _skin.uiCon:
				{
					onMate();
					break;
				}
				case _skin.btnChakan:
				{
					onRank();
					break;
				}
				case _skin.btnShengwang:
				{
					onShop();
					break;
				}
			}
		}
		
		private function onShop():void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_SHOP_PANEL);
		}
		
		private function onRank():void
		{
			// TODO Auto Generated method stub
			AppManager.showApp(AppConstant.BATTLE_D1V1_RANK_PANEL);
		}
		
		private function onMate():void
		{
			// TODO Auto Generated method stub
			Mgr.d1v1Mgr.reqDFMatch();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			EventManager.addEvent(D1v1Event.GET_PANEL_DATA,onGetPanelData);
			onStateResChange(CharAttributeType.RES_PRESTIGE);
			Mgr.d1v1Mgr.reqPanelData();
			if(_eff1) _eff1.start(); 
		}
		
		private function onGetPanelData(...arg):void
		{
			// TODO Auto Generated method stub
			var data:DianFengDataInfo=Mgr.d1v1Mgr.data;
			var rank:int=data.level;
			var score:int=data.currentIntegral;
			var qRank:Q_battle_rank=BattleRankCfg.getRank(rank);
			if (!qRank) 
			{
				return;
			}
			_skin.lbDuanwei.text=score+"/"+qRank.q_score;
			var per:Number=score/qRank.q_score;
			_skin.Pro_duanwei.value=per*100;
			_skin.icon.styleName=Mgr.d1v1Mgr.getRankIconUrl(rank,0);
			_skin.iconName.styleName="ui/app/zhanchang/icon/name/"+qRank.q_subrank_id+".png";
			_skin.lbCiShu.text=data.currentNumber+"/"+GlobalSheetData.getIntValue(816);
			_skin.lbSheng.text=data.reputation+"";
			
			var state:int=arg[0];
			var bool:Boolean=state==1;
			showRewardEffect(state==1);
			_skin.btnOpen.visible=!bool;
			_skin.btnStart.visible=bool;
			if (!bool) 
			{
				GrayFilter.gray(_skin.gBtn);
			}
			else
			{
				GrayFilter.unGray(_skin.gBtn);
			}
		}
		private function addEft(render:RenderUnit3D):void
		{
			render.play(0);
		}
		private function showRewardEffect(bool:Boolean):void
		{
			
			if (bool) 
			{
				if (!_eff) 
				{
					_eff=new Inter3DContainer();
					_skin.uiCon.addChild(_eff);
					_eff.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JJBREWARD),232/2,60,0,null,addEft);
				}
			}
			else
			{
				if (_eff) 
				{
					_eff.dispose();
					MCUtil.removeSelf(_eff);
					_eff=null;
				}
			}
		}
		private function onStateResChange(type:int=0):void
		{
			// TODO Auto Generated method stub
			if (CharAttributeType.RES_PRESTIGE==type) 
			{
				_skin.lbShengwang.text=MainRoleManager.actorInfo.totalStat.getResData(type)+"";
			}
			
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			EventManager.removeEvent(D1v1Event.GET_PANEL_DATA,onGetPanelData);
			showRewardEffect(false);
			if(_eff1) _eff1.stop();
		}
	}
}