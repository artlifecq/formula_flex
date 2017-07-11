package com.rpgGame.appModule.redreward
{
	import com.rpgGame.app.manager.RedRewardManager;
	import com.rpgGame.app.sender.RedRewardSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.RedRewardEvent;
	import com.rpgGame.netData.redreward.bean.RedRewardLog;
	
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hongbao.HongBao_Log;
	
	public class RedRewardLogList extends ViewUI
	{
		private var _skin:HongBao_Log;
		public function RedRewardLogList():void
		{
			_skin = new HongBao_Log();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			this.x = 294;
			this.y = 117;
			_skin.ListItem.itemRendererType = RedRewardLogCell;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider  = new ListCollection();
		}
		override public function show(data:Object=null):void
		{
			EventManager.addEvent(RedRewardEvent.UPDATA_REDREWARDLOGS,updataListHandler);
			RedRewardSender.reqGetRedRewardLog();
		}
		private function updataListHandler():void
		{
			_skin.ListItem.dataProvider.removeAll();
			var list:Vector.<RedRewardLog> = RedRewardManager.instance().loglist;
			_skin.ListItem.dataProvider.data = list;
		}
	}
}