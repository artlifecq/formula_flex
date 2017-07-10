package com.rpgGame.appModule.hunyin
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.netData.marriage.bean.MarriageLoggerInfo;
	import com.rpgGame.netData.marriage.message.SCInteractionMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.hunyin.AlertFuQiRiZi;
	
	public class FuQiRiZhiPanelExt extends SkinUIPanel
	{
		private var _skin:AlertFuQiRiZi;
		
		private var _marriageLoggerInfos:Vector.<MarriageLoggerInfo>;
		public function FuQiRiZhiPanelExt()
		{
			_skin=new AlertFuQiRiZi();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListRizi.itemRendererType = FuQiRiZhiRender;
			_skin.ListRizi.clipContent = true;
			_skin.ListRizi.verticalScrollBarPosition = "right";
			_skin.ListRizi.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.ListRizi.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListRizi.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_skin.ListRizi.padding=0;
			_skin.ListRizi.dataProvider = new ListCollection();
		}
		
		override protected function onShow():void
		{
			super.onShow();
			showRiZi();
			EventManager.addEvent(HunYinEvent.HUNYIN_HUDONG,showRiZi);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			_marriageLoggerInfos=null;
			_skin.ListRizi.dataProvider.removeAll();
			EventManager.removeEvent(HunYinEvent.HUNYIN_HUDONG,showRiZi);
		}
		
		public function showRiZi(msg:SCInteractionMessage=null):void
		{
			_marriageLoggerInfos=Mgr.hunyinMgr.marriageLoggerInfos;
			if(_marriageLoggerInfos==null||_marriageLoggerInfos.length==0) return;
			_skin.ListRizi.dataProvider.removeAll();
			var len:int=_marriageLoggerInfos.length;
			for(var i:int=0;i<_marriageLoggerInfos.length;i++)
			{
				_skin.ListRizi.dataProvider.addItem(_marriageLoggerInfos[i]);
			}
			_skin.ListRizi.scrollToBottom(0);
		}
	}
}