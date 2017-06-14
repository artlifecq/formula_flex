package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.BangHui_Home;
	
	import starling.display.DisplayObject;
	
	public class GuildListVewUI extends ViewUI
	{
		private var _skin:BangHui_Home;
		private var _cratePanel:CreateGuildPanel;
		private var _guildInfo:GuildInfoPanel;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildListVewUI()
		{
			_skin = new BangHui_Home();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_skin.ListItem.itemRendererType =GuildListInfoCell;
			_skin.ListItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 15;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider = new ListCollection();
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			refeashLiftPane();
			EventManager.addEvent(GuildEvent.GET_GUILD_LIST,refeashList);
			refeashList(null);
			requestPage(0);
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
				_skin.ListItem.dataProvider.data = msg.guildList;
			}
			refeashPageGroup();
		}
		
		private function refeashPageGroup():void
		{
			_skin.lbNum.text = _currentPage.toString()+"/"+_maxPage.toString();
			_skin.btnPrev.visible = _currentPage<=0;
			_skin.btnNext.visible = _currentPage>= _maxPage;
		}
		
		private function requestPage(page:int):void
		{
			if(page<0)
				return ;
			if(page>_maxPage)
				return ;
			var isfull:int = _skin.chkGuolv.isSelected?1:0;
			GuildManager.instance().reqGuildList(page,isfull,0);
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
				case _skin.btnJoin:
					GuildManager.instance().reqGuildJoin(new long(-1),0);
					break;
				case _skin.lbList:
//					trace("邀请列表")
					AppManager.showApp(AppConstant.GUILD_APPLAYLIST_PANEL);
					break;
			}
		}
		private function refeashLiftPane():void
		{
			if(!GuildManager.instance().haveGuild)
			{
				if(_guildInfo!=null&&_guildInfo.parent!=null)
					this.removeChild(_guildInfo);
				if(_cratePanel == null)
					_cratePanel = new CreateGuildPanel();
				_cratePanel.x = 19;
				_cratePanel.y = 81;
				this.addChild(_cratePanel);
			}else{
				if(_cratePanel!=null&&_cratePanel.parent!=null)
					this.removeChild(_cratePanel);
				if(_guildInfo == null)
					_guildInfo = new GuildInfoPanel();
				_guildInfo.x = 19;
				_guildInfo.y = 81;
				this.addChild(_guildInfo);
			}
		}
	}
}