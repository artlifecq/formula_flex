package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	import feathers.layout.VerticalLayout;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Member;
	
	import starling.display.DisplayObject;
	
	public class GuildPlayerListViewUI extends ViewUI
	{
		private var _skin:BangHui_Member;
		private var _currentPage:int = 1;
		private var _maxPage:int = 0;
		private var _currentOriderValue:String = "";
		private static const PROP_JOB:String = "memberType";
		private static const PROP_BATTLE:String = "battle";
		private static const PROP_LEVEL:String = "level";
		private static const PROP_CURACTIVE:String = "curActive";
		private static const PROP_ALLACTIVE:String = "allActive";
		public function GuildPlayerListViewUI():void
		{
			_skin = new BangHui_Member();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.lbNum.isEditable  = false;
			_skin.ListItem.snapToPages = true;
			_skin.ListItem.itemRendererType =GuildPlayerInfoCell;
			_skin.ListItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.ListItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			var layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			_skin.ListItem.layout = layout;
			_skin.ListItem.dataProvider = new ListCollection();
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			EventManager.addEvent(GuildEvent.GUILD_FAMILY_CHANGE,refeashList);
			sortByType("");
			_skin.chkAuto.isSelected = GuildManager.instance().guildData.isAutoApply==1;
			_skin.chkAuto.visible = GuildManager.instance().canJoin;
			_skin.labchkAuto.visible = GuildManager.instance().canJoin;
			requestPage(0);
			_skin.btnZhaoJi.visible = GuildManager.instance().canConvene;
			_skin.btnZhaoMu.visible = GuildManager.instance().canRecrui;
			_skin.btnApply.visible = GuildManager.instance().canJoin;
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnJoin.label = "解散帮会";
			}else{
				_skin.btnJoin.label = "退出帮派";
			}
		}
		private function refeashAppoint(msg:ResGuildOperateResultMessage):void
		{
			if(msg.result==0)
				return ;
			refeashList();
		}
		
		private function sortByType(type:String):void
		{
			if(_currentOriderValue==type)
				_currentOriderValue = "";
			else
				_currentOriderValue = type;
			refeashList();
		}
		private function refeashList():void
		{
			var totalPage:int = GuildManager.instance().sortGuildMemberInfo(_currentOriderValue,_skin.chkOnLine.isSelected);
			_maxPage = totalPage;
			requestPage(_currentPage);
			if(_currentOriderValue=="")
			{
				_skin.arrowZhiwei_Down.visible = true;
				_skin.arrowZhanli_Down.visible = true;
				_skin.arrowDengji_Down.visible = true;
				_skin.arrowZhouHuoyue_Down.visible = true;
				_skin.arrowZongHuoyue_Down.visible = true;
			}else{
				_skin.arrowZhiwei_Down.visible = _currentOriderValue == PROP_JOB;
				_skin.arrowZhanli_Down.visible = _currentOriderValue == PROP_BATTLE;
				_skin.arrowDengji_Down.visible = _currentOriderValue == PROP_LEVEL;
				_skin.arrowZhouHuoyue_Down.visible = _currentOriderValue == PROP_CURACTIVE;
				_skin.arrowZongHuoyue_Down.visible = _currentOriderValue == PROP_ALLACTIVE;
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
					GuildSender.guildConvene();
					break;
				case _skin.btnZhaoMu:
					GuildSender.guildConvene();
					break;
				case _skin.btnJoin:
					if(GuildManager.instance().canDissolve)
					{
						GuildManager.instance().guildDissolve();
					}else{
						GuildManager.instance().guildExit();
					}
					break;
				case _skin.btnApply:
					AppManager.showApp(AppConstant.GUILD_APPLAYLIST_PANEL);
					break;
				case _skin.uiZhiWei:
					sortByType(PROP_JOB);
					break;
				case _skin.uiZhanli:
					sortByType(PROP_BATTLE);
					break;
				case _skin.uiDengji:
					sortByType(PROP_LEVEL);
					break;
				case _skin.uiZhouHuoYue:
					sortByType(PROP_CURACTIVE);
					break;
				case _skin.uiZongHuoYue:
					sortByType(PROP_ALLACTIVE);
					break;
			}
		}
		
		private function requestPage(page:int):void
		{
			if(page<1)
				page = 1;
			if(page>_maxPage)
				page = _maxPage;
			_skin.ListItem.dataProvider.removeAll();
			var starValue:int = (page-1)*GuildManager.MaxPlayerListPageCount
			var endValue:int = page*GuildManager.MaxPlayerListPageCount;
			for(var i:int = starValue;i<endValue;i++)
			{
				_skin.ListItem.dataProvider.push(i);
			}
			_currentPage =page;
			refeahShowPageLable();
		}
		
		private function refeahShowPageLable():void
		{
			_skin.lbNum.text = _currentPage.toString()+"/"+_maxPage.toString();
			_skin.btnPrev.visible = _currentPage>1;
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