package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.coreData.enum.EmFunctionID;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_Fa;
	import org.mokylin.skin.app.hongbao.HongBao_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	
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
			_view = new RedRewardSendView(_skin.skinFa.skin as HongBao_Fa);
		}
		
		override protected function initTabBarDatas():void
		{
			addTabDatas(TabBarSkin_pack,RedRewardListView,EmFunctionID.EM_REDREWARDList);
			addTabDatas(TabBarSkin_pack,RedRewardLogList,EmFunctionID.EM_REDREWARDGETLOG);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_view.refeashView();
			_skin.lbNum.text = RedRewardManager.instance().haveRewardCount.toString();
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDMONTHCOUNT,refashMothCountHandler);
			refashMothCountHandler();
		}
		
		private function refashMothCountHandler():void
		{
			_skin.lbNum.text = RedRewardManager.instance().mouthTotal.toString();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			_view.onTouchTarget(target);
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(RedRewardEvent.UPDATA_REDREWARDMONTHCOUNT,refashMothCountHandler);
		}
	}
}