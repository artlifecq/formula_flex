package com.rpgGame.appModule.fulidating
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.sender.FuliDaTingSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.events.ServerActiveEvent;
	import com.rpgGame.coreData.cfg.fulidating.ZaiXianCfg;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.fulidating.FLDT_Zaixianjiangli;
	
	public class ZaiXianJiangLiPanel extends ViewUI
	{
		private var _skin:FLDT_Zaixianjiangli;
		
		private var _items:Vector.<ZaiXianItem>;
		private var _timer:GameTimer;
		private var _time:Number;
		public function ZaiXianJiangLiPanel()
		{
			_skin=new FLDT_Zaixianjiangli();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_items=new Vector.<ZaiXianItem>();
			_timer=new GameTimer("ZaiXianJiangLiPanel",1000,0,updateTime);
			_timer.stop();
			var item:ZaiXianItem;
			var arr:Array=ZaiXianCfg.getOnLineArr();
			if(!arr) return;
			for(var i:int=0;i<arr.length;i++)
			{
				item=new ZaiXianItem();
				item.setData(arr[i]);
				item.x=i*(item.width+3);
				item.y=0;
				_skin.itemContainer.addChild(item);
				_items.push(item);
			}
		}
		
		override protected function onShow():void
		{
			super.onShow();
			clearPanel();
			EventManager.addEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_TIME,updateOnLineTest);
			FuliDaTingSender.onCSRefreshPanelMessage();
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(ServerActiveEvent.SERVERACTIVE_ONLINE_TIME,updateOnLineTest);
			if(_timer) _timer.stop();
		}
		
		private function updateOnLineTest(time:Number):void
		{
			_time=time;
			updateTime();
			if(!_timer.running)
				_timer.start();
			updateItems();
		}
		
		private function updateItems():void
		{
			if(_items){
				for(var i:int=0;i<_items.length;i++)
				{
					_items[i].updateBtnState();
				}
			}
		}
		
		
		private function updateTime():void
		{
			_time++;
			_skin.Time.label=TimeUtil.format3TimeToString(_time);
		}
		
		private function clearPanel():void
		{
			_skin.Time.label="00x00x00";
		}
	}
}