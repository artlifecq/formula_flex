package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.BangHui_Home;
	
	import starling.display.DisplayObject;
	
	public class GuildCreateListPanel extends SkinUI
	{
		private var _skin:BangHui_Home;
		private var _cratePanel:CreateGuildPanel;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildCreateListPanel()
		{
			_skin = new BangHui_Home();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			if(_cratePanel == null)
				_cratePanel = new CreateGuildPanel();
			_cratePanel.x = 19;
			_cratePanel.y = 81;
			this.addChild(_cratePanel);
			
			_skin.lbNum.isEditable = false;
			_skin.ListItem.itemRendererType =GuildListInfoCell;
			_skin.ListItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider = new ListCollection([0,1,2,3,4,5,6,7,8,9,10]);
		}
		
		override protected function onShow():void
		{
			EventManager.addEvent(GuildEvent.GET_GUILD_LIST,refeashList);
			refeashList();
			requestPage(0);
		}
		
		private function refeashList():void
		{
			var msg:ResGuildListInfoMessage = GuildManager.instance().currentPageInfo;
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
			var isfull:int = _skin.chkGuolv.isSelected?1:0;
			GuildSender.reqGuildList(page,isfull,0);
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
				case _skin.chkGuolv:
					requestPage(_currentPage);
					break;
				case _skin.btnJoin:
					GuildSender.reqGuildJoin(new long(-1),0);
					break;
				case _skin.lbList:
					AppManager.showApp(AppConstant.GUILD_INVITATION_PANEL);
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