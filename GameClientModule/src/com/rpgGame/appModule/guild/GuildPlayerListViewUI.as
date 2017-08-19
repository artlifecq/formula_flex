package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.guild.message.ResGuildOperateResultMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Member;
	
	import starling.display.DisplayObject;
	
	public class GuildPlayerListViewUI extends ViewUI
	{
		private var _skin:BangHui_Member;
	
		private var _currentOriderValue:String = "";
		private static const PROP_JOB:String = "memberType";
		private static const PROP_BATTLE:String = "battle";
		private static const PROP_LEVEL:String = "level";
		private static const PROP_CURACTIVE:String = "curActive";
		private static const PROP_ALLACTIVE:String = "allActive";
		
		private var _pageCtrl:PageSelectUICtrl;
		private var maxCount:int=12;
		private var cellList:Vector.<GuildPlayerInfoCell>=new Vector.<GuildPlayerInfoCell>();
		public function GuildPlayerListViewUI():void
		{
			_skin = new BangHui_Member();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_pageCtrl=new PageSelectUICtrl(_skin.btnPrev,_skin.btnNext,_skin.lbNum,showPageData);
			var tmp:GuildPlayerInfoCell;
			var startX:int=25;
			var startY:int=118;
			for (var i:int = 0; i < maxCount; i++) 
			{
				tmp=new GuildPlayerInfoCell(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				cellList.push(tmp);
				tmp.setData(null);
			}
			MCUtil.BringToTop(_skin.grpFlip);
			addNode(RTNodeID.GUILD_MEM,RTNodeID.GUILD_MEM_APPLY,_skin.btnApply,88,GuildManager.instance().hasApplyList);
		}
		private function showPageData(data:*):void
		{
			// TODO Auto Generated method stub
			var list:Vector.<GuildMemberInfo>=data;
			var len:int=list.length;
			for (var i:int = 0; i < maxCount; i++) 
			{
				cellList[i].setData(i<len?list[i]:null);
			}
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.addEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			EventManager.addEvent(GuildEvent.GUILD_FAMILY_CHANGE,refeashList);
			EventManager.addEvent(GuildEvent.GET_JOIN_GUILD_LIST,onGetApplyList);
			sortByType("");
			_skin.chkAuto.isSelected = GuildManager.instance().guildData.isAutoApply==1;
			_skin.chkAuto.visible = GuildManager.instance().canJoin;
			_skin.labchkAuto.visible = GuildManager.instance().canJoin;
			
			_skin.btnZhaoJi.visible = GuildManager.instance().canConvene;
			_skin.btnZhaoMu.visible = GuildManager.instance().canRecrui;
			_skin.btnApply.visible = GuildManager.instance().canJoin;
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnJoin.label = "解散帮会";
			}else{
				_skin.btnJoin.label = "退出帮派";
			}
			
			notifyUpdate(RTNodeID.GUILD_MEM_APPLY);
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
			// GuildManager.instance().sortGuildMemberInfo(_currentOriderValue,_skin.chkOnLine.isSelected);
			this._pageCtrl.setData( GuildManager.instance().sortGuildMemberInfo(_currentOriderValue,_skin.chkOnLine.isSelected),maxCount);
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
		
	
		
	
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_OPERATERESULT,refeashAppoint);
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashList);
			EventManager.removeEvent(GuildEvent.GUILD_FAMILY_CHANGE,refeashList);
			EventManager.removeEvent(GuildEvent.GET_JOIN_GUILD_LIST,onGetApplyList);
			GuildManager.instance().reqGuildSetAutoAccept(_skin.chkAuto.isSelected);
		}
		
		private function onGetApplyList(...arg):void
		{
			// TODO Auto Generated method stub
			notifyUpdate(RTNodeID.GUILD_MEM_APPLY);
		}
	}
}