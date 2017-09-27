package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.TipsCfgData;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.type.TipType;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	import org.mokylin.skin.app.hongbao.HongBao_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class RedRewardInfoPanle extends TabBarPanel
	{
		private var _skin:HongBao_Skin;
		private var _view:RedRewardSendView;
		public function RedRewardInfoPanle()
		{
			_skin = new HongBao_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_view = new RedRewardSendView(_skin.skinFa.skin as HongBao_Fa,false);
			TipTargetManager.show( _skin.btnInfo,TargetTipsMaker.makeTips( TipType.NORMAL_TIP,TipsCfgData.getTipsInfo(31)));
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_tab,RedRewardListView,EmFunctionID.EM_REDREWARDList,true,294,117,"红包列表");
			addTabDatas(TabBarSkin_tab,RedRewardLogList,EmFunctionID.EM_REDREWARDGETLOG,true,294,117,"领取记录");
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDMONTHCOUNT,refashMothCountHandler);
			super.show(data,openTable,parentContiner);
			_view.refeashView();
			_skin.lbNum.text = RedRewardManager.instance().haveRewardCount.toString();
			refashMothCountHandler();
		}
		
		private function refashMothCountHandler():void
		{
			_skin.lbTotal.text = RedRewardManager.instance().mouthTotal.toString();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			_view.onTouchTarget(target);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(RedRewardEvent.UPDATA_REDREWARDMONTHCOUNT,refashMothCountHandler);
		}
	}
}