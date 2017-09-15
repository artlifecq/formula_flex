package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.netData.redreward.bean.RedRewardState;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_List;

	public class RedRewardListView extends ViewUI
	{
		private var _skin:HongBao_List;
		public function RedRewardListView():void
		{
			_skin = new HongBao_List();
			super(_skin);
			initView();
		}
		private function initView():void
		{
//			this.x = 294;
//			this.y = 117;
			_skin.ListItem.itemRendererType = RedRewardListCell;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.ListItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider  = new ListCollection();
		}
		override public function show(data:Object=null):void
		{
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDSTATES,updataListHandler);
			RedRewardSender.reqRewardInfos();
		}
		private function updataListHandler():void
		{
			_skin.ListItem.dataProvider.removeAll();
			var list:Vector.<RedRewardState> = RedRewardManager.instance().redRewards;
			_skin.ListItem.dataProvider.data = list;
		}
	}
}