package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.D1v1Event;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.BattleRankCfg;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.netData.pvp.bean.DianFengDataInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DianFeng_Skin;
	
	import starling.display.DisplayObject;
	
	public class D1v1MainPanleExt extends ViewUI
	{
		private var _skin:DianFeng_Skin;
		public function D1v1MainPanleExt()
		{
			_skin=new DianFeng_Skin();
			super(_skin);
			TargetTipsMaker.makeTips( TipType.MERIDIAN_TIP, this );
			TipTargetManager.show( _skin.btnMsg, TargetTipsMaker.makeTips( TipType.D1V1_TIP,null));
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target)
			switch(target)
			{
				case _skin.btnOpen:
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
			//_skin.icon.styleName
			
			_skin.numCishu.label=data.currentNumber+"";
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
		}
	}
}