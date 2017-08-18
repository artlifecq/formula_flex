package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.appModule.battle.dfdj.D1v1RankPageSelectCtrl;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.netData.guild.message.ResGuildListInfoMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.BangHui_Home;
	
	import starling.display.DisplayObject;
	
	public class GuildCreateListPanel extends SkinUI
	{
		private var _skin:BangHui_Home;
		private var _cratePanel:CreateGuildPanel;
	
		private var _pageCtrl:D1v1RankPageSelectCtrl;
		private var _cellList:Vector.<GuildListInfoCell>=new Vector.<GuildListInfoCell>();
		private const MAX_COUNT:int=12;
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
			MCUtil.BringToTop(_skin.grpFlip);
		}
		private function onPageChange(val:int):void
		{
			var isfull:int = _skin.chkGuolv.isSelected?1:0;
			GuildSender.reqGuildList(val-1,isfull,0);
		}
		override protected function onShow():void
		{
			EventManager.addEvent(GuildEvent.GET_GUILD_LIST,refeashList);
			
			//onPageChange(0);
			_pageCtrl.setDefault();
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
				
				case _skin.chkGuolv:
					onPageChange(_pageCtrl.getValue());
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