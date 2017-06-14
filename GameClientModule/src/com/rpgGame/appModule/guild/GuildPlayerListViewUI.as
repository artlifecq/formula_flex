package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.BangHui_Member;
	
	import starling.display.DisplayObject;
	
	public class GuildPlayerListViewUI extends ViewUI
	{
		private var _skin:BangHui_Member;
		private var _currentPage:int = 0;
		private var _maxPage:int = 0;
		public function GuildPlayerListViewUI():void
		{
			_skin = new BangHui_Member();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.snapToPages = true;
			_skin.ListItem.itemRendererType =GuildPlayerInfoCell;
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
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			EventManager.addEvent(GuildEvent.GUILD_FAMILY_CHANGE,refeashList);
			refeashList();
			_maxPage = _skin.ListItem.maxVerticalPageIndex;
			_skin.chkAuto.isSelected = GuildManager.instance().guildData.isAutoApply==1;
			requestPage(0);
			_skin.btnZhaoJi.visible = GuildManager.instance().canConvene;
			_skin.btnZhaoMu.visible = GuildManager.instance().canRecrui;
			_skin.btnApply.visible = GuildManager.instance().canJoin;
//			_skin.btnJoin.visible = GuildManager.instance().canConvene;
			
		}
		private function refeashAppoint(msg:ResGuildOperateResultMessage):void
		{
			_skin.ListItem.dataProvider.updateAll();
		}
		
		private function refeashList():void
		{
			var list:Vector.<GuildMemberInfo> = GuildManager.instance().memberList;
			if(list == null)
				return ;
			_skin.ListItem.dataProvider.removeAll();
			for each(var info:GuildMemberInfo in list)
			{
				if(_skin.chkOnLine.isSelected)
				{
					if(info.online==1)
						_skin.ListItem.dataProvider.push(info);
				}else{
					_skin.ListItem.dataProvider.push(info);
				}
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.chkOnLine:
					refeashList();
					break;
				case _skin.btnPrev:
					requestPage(_currentPage-1);
					break;
				case _skin.btnNext:
					requestPage(_currentPage+1);
					break;
				case _skin.btnZhaoJi:
					GuildManager.instance().guildConvene();
					break;
				case _skin.btnZhaoMu:
					GuildManager.instance().guildConvene();
					break;
				case _skin.btnJoin:
					GuildManager.instance().reqGuildJoin(new long(0),0);
					break;
				case _skin.btnApply:
					AppManager.showApp(AppConstant.GUILD_APPLAYLIST_PANEL);
					break;
			}
		}
		
		private function requestPage(page:int):void
		{
			if(page<0)
				page = 0;
			if(page>_maxPage)
				page = _maxPage;
			_currentPage =_skin.ListItem.selectedIndex = page;
			_skin.lbNum.text = _currentPage.toString()+"/"+_maxPage.toString();
			_skin.btnPrev.visible = _currentPage>0;
			_skin.btnNext.visible = _currentPage< _maxPage;
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.removeEvent(GuildEvent.GUILD_FAMILY_CHANGE,refeashList);
			GuildManager.instance().reqGuildSetAutoAccept(_skin.chkAuto.isSelected);
		}
	}
}