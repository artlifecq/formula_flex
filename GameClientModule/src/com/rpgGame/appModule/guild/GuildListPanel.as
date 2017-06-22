package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_List;
	
	import starling.display.DisplayObject;
	
	public class GuildListPanel extends SkinUI
	{
		private var _guildInfo:GuildInfoPanel;
		private var _skin:BangHui_List;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildListPanel():void
		{
			_skin = new BangHui_List();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			if(_guildInfo == null)
				_guildInfo = new GuildInfoPanel();
			_guildInfo.x = 19;
			_guildInfo.y = 81;
			this.addChild(_guildInfo);
			_skin.lbNum.isEditable = false;
			_skin.ListItem.itemRendererType =GuildListSeeInfoCell;
			_skin.ListItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 10;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider = new ListCollection([0,1,2,3,4,5,6,7,8,9,10]);
		}
		
		override protected function onShow():void
		{
			EventManager.addEvent(GuildEvent.GET_GUILD_LIST,refeashList);
			refeashList(null);
			requestPage(0);
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnExit.label = "解散帮会";
			}else{
				_skin.btnExit.label = "退出帮派";
			}
		}
		
		private function refeashList(msg:ResGuildListInfoMessage):void
		{
			msg = GuildManager.instance().currentPageInfo;
			if(msg==null)
			{
				_currentPage = 0;
				_maxPage = 1;
			}else{
				_currentPage = msg.curPage;
				_maxPage = msg.totalPage;
			}
			_skin.ListItem.dataProvider.updateAll();
			refeashPageGroup();
		}
		
		private function refeashPageGroup():void
		{
			_skin.lbNum.text = _currentPage.toString()+"/"+_maxPage.toString();
			_skin.btnPrev.visible = _currentPage >0;
			_skin.btnNext.visible = _currentPage< _maxPage;
		}
		
		private function requestPage(page:int):void
		{
			if(page<0)
				return ;
			if(page>_maxPage)
				return ;
			GuildManager.instance().reqGuildList(page,0,0);
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
				case _skin.btnExit:
					if(GuildManager.instance().canDissolve)
					{
						GuildManager.instance().guildDissolve();
					}else{
						GuildManager.instance().guildExit();
					}
					break;
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GET_GUILD_LIST,refeashList);
		}
	}
}