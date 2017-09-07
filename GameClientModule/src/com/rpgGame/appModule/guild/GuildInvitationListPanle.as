package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.YaoQinList;
	
	import starling.display.DisplayObjectContainer;
	
	public class GuildInvitationListPanle extends SkinUIPanel
	{
		private var _skin:YaoQinList;
	
		private var _pageCtrl:PageSelectUICtrl;
		private var maxCount:int=7;
		private var cellList:Vector.<GuildInvitationListCell>=new Vector.<GuildInvitationListCell>();
		public function GuildInvitationListPanle():void
		{
			_skin = new YaoQinList();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_pageCtrl=new PageSelectUICtrl(_skin.btnPrev,_skin.btnNext,_skin.lbNum,showPageData);
			var tmp:GuildInvitationListCell;
			var startX:int=14;
			var startY:int=70;
			for (var i:int = 0; i < maxCount; i++) 
			{
				tmp=new GuildInvitationListCell(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				cellList.push(tmp);
				tmp.setData(null);
			}
			MCUtil.BringToTop(_skin.grpFlip);
		}
		
		private function showPageData(data:*):void
		{
			// TODO Auto Generated method stub
			var list:Vector.<GuildInviteInfo>=data;
			var len:int=list.length;
			for (var i:int = 0; i < maxCount; i++) 
			{
				cellList[i].setData(i<len?list[i]:null);
			}
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			EventManager.addEvent(GuildEvent.GET_INVITE_GUILD_LIST,refeashView);
			GuildSender.reqGuildInviteList();
		}
		
		
		override public function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GET_INVITE_GUILD_LIST,refeashView);
		}
	
		private function refeashView(list:Vector.<GuildInviteInfo>):void
		{
			this._pageCtrl.setData(list,maxCount);
		}
	}
}