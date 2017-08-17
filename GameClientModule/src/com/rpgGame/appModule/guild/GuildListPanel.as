package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.appModule.battle.dfdj.D1v1RankPageSelectCtrl;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_List;
	
	import starling.display.DisplayObject;
	
	public class GuildListPanel extends SkinUI
	{
		private var _guildInfo:GuildInfoPanel;
		private var _skin:BangHui_List;
	
		private var _pageCtrl:D1v1RankPageSelectCtrl;
		private var _cellList:Vector.<GuildListInfoCell>=new Vector.<GuildListInfoCell>();
		private const MAX_COUNT:int=12;
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
			_pageCtrl=new D1v1RankPageSelectCtrl(_skin.btnNext,_skin.btnPrev,null,null,_skin.lbNum,1,1,onPageChange);
			_pageCtrl.needSpeed=false;
			var tmp:GuildListInfoCell;
			var startX:int=299;
			var startY:int=119;
			
			for (var i:int = 0; i < MAX_COUNT; i++) 
			{
				tmp=new GuildListInfoCell(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				_cellList.push(tmp);
				tmp.setData(null);
			}
		}
		private function onPageChange(val:int):void
		{
			GuildSender.reqGuildList(val-1,0,0);
		}
		override protected function onShow():void
		{
			EventManager.addEvent(GuildEvent.GET_GUILD_LIST,refeashList);
			//refeashList();
			//onPageChange(1);
			_pageCtrl.setDefault();
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnExit.label = "解散帮会";
			}else{
				_skin.btnExit.label = "退出帮派";
			}
		}
		
		private function refeashList():void
		{
			var msg:ResGuildListInfoMessage = GuildManager.instance().currentPageInfo;
			var dataLen:int=msg.guildList.length;
			for (var i:int = 0; i < MAX_COUNT; i++) 
			{
				_cellList[i].setData(i<dataLen?msg.guildList[i]:null);
			}
			_pageCtrl.updateMax(msg.totalPage,msg.totalPage,false);
			_pageCtrl.resetText();
		}
		
	

		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
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