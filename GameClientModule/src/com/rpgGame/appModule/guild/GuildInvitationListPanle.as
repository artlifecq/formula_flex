package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.YaoQinList;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildInvitationListPanle extends SkinUIPanel
	{
		private var _skin:YaoQinList;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildInvitationListPanle():void
		{
			_skin = new YaoQinList();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.lbNum.isEditable = false;
			_skin.list.itemRendererType =GuildInvitationListCell;
			_skin.list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.list.snapToPages = true;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.list.layout = layout;
			_skin.list.dataProvider = new ListCollection([0,1,2,3,4,5,6]);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(GuildEvent.GET_INVITE_GUILD_LIST,refeashView);
		
			refeashView(null);
			GuildSender.reqGuildInviteList();
		}
		
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GET_INVITE_GUILD_LIST,refeashView);
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
		
		private function refeashView(list:Vector.<GuildInviteInfo>):void
		{
			if(list == null||list.length<=0)
			{
				_maxPage = 0;
			}else{
				_maxPage = _skin.list.maxVerticalPageIndex;
			}
			_skin.list.dataProvider.updateAll();
			requestPage(0);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
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