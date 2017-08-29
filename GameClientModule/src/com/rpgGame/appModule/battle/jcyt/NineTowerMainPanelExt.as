package com.rpgGame.appModule.battle.jcyt
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.NineTowerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.TipType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jiucengyaota.JiuCengYaoTa_Skin;
	
	import starling.display.DisplayObject;
	
	public class NineTowerMainPanelExt extends ViewUI
	{
		private var _skin:JiuCengYaoTa_Skin;
		private var _eff:Inter3DContainer;
		private var _gReward:RewardGroup;
		public function NineTowerMainPanelExt()
		{
			_skin=new JiuCengYaoTa_Skin();
			super(_skin);
			//_skin.gBtn.touchGroup=true;
			_skin.btnOpen.touchable=false;
			_skin.btnStart.touchable=false;
			_gReward=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1,0);
			TipTargetManager.show(_skin.iconSw, TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(29)));
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
				case _skin.lbRank:
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
			AppManager.showApp(AppConstant.BATTLE_NINE_TOWER_LOG_PANEL);
		}
		
		private function onMate():void
		{
			// TODO Auto Generated method stub
			Mgr.nineTowerMgr.reqEnterTower();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,onStateResChange);
			EventManager.addEvent(NineTowerEvent.GET_PANEL_DATA,onGetPanelData);
			onStateResChange(CharAttributeType.RES_PRESTIGE);
			setReward();
			Mgr.nineTowerMgr.reqPanelData();
		}
		private function setReward():void
		{
			_gReward.setRewardByJsonStr(GlobalSheetData.getStrValue(825));
		}
		private function onGetPanelData(...arg):void
		{
			// TODO Auto Generated method stub
	
			
			var state:int=arg[0];
			var bool:Boolean=state==1;
			showRewardEffect(state==1);
			_skin.btnOpen.visible=!bool;
			_skin.btnStart.visible=bool;
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
			EventManager.removeEvent(NineTowerEvent.GET_PANEL_DATA,onGetPanelData);
			showRewardEffect(false);
			_gReward.clear();
		}
	}
}