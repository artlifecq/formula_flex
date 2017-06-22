package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.TanKuang_Shenqin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildApplyListPanle extends SkinUIPanel
	{
		private var _skin:TanKuang_Shenqin;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildApplyListPanle():void
		{
			_skin = new TanKuang_Shenqin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.lbNum.isEditable = false;
			_skin.list.itemRendererType =GuildApplyInfoCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 10;
			_skin.list.layout = layout;
			_skin.list.dataProvider = new ListCollection();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			
			EventManager.addEvent(GuildEvent.GET_JOIN_GUILD_LIST,refeashView);
			refeashView(null);
			GuildManager.instance().reqGuildApplyListInfo();
		}
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GET_JOIN_GUILD_LIST,refeashView);
		}
		private function requestPage(page:int):void
		{
			if(page<0)
				page = 0;
			if(page>_maxPage)
				page = _maxPage;
			_currentPage =_skin.list.selectedIndex = page;
			_skin.lbNum.text = _currentPage.toString()+"/"+_maxPage.toString();
			_skin.btnPrev.visible = _currentPage>0;
			_skin.btnNext.visible = _currentPage< _maxPage;
		}
		
		private function refeashView(list:Vector.<GuildApplyInfo>):void
		{
			if(list == null||list.length<=0)
			{
				_skin.uiNull.visible = true;
				_skin.list.visible = false;
				_maxPage = 0;
			}else{
				_skin.uiNull.visible = false;
				_skin.list.visible = true;
				_skin.list.dataProvider.data = list;
				_maxPage = _skin.list.maxVerticalPageIndex;
			}
			requestPage(0);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnOk:
					GuildManager.instance().applyOperation(1,-1);
					break;
				case _skin.btnCancel:
					GuildManager.instance().applyOperation(0,-1);
					break;
				case _skin.btnPrev:
					requestPage(_currentPage-1);
					break;
				case _skin.btnNext:
					requestPage(_currentPage+1);
					break;
			}
		}
		
	}
}