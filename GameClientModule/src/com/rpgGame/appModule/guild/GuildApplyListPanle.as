package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.PageSelectUICtrl;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.netData.guild.bean.GuildApplyInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.TanKuang_Shenqin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class GuildApplyListPanle extends SkinUIPanel
	{
		private var _skin:TanKuang_Shenqin;
		private var _pageCtrl:PageSelectUICtrl;
		private var maxCount:int=7;
		private var cellList:Vector.<GuildApplyInfoCell>=new Vector.<GuildApplyInfoCell>();
		private var _applyList:Vector.<GuildApplyInfo>;
		public function GuildApplyListPanle():void
		{
			_skin = new TanKuang_Shenqin();
			super(_skin);
			initView();
		}
		
		private function showPageData(data:*):void
		{
			// TODO Auto Generated method stub
			var list:Vector.<GuildApplyInfo>=data;
			var len:int=list.length;
			for (var i:int = 0; i < maxCount; i++) 
			{
				cellList[i].setData(i<len?list[i]:null);
			}
		}
		private function initView():void
		{
			
			_pageCtrl=new PageSelectUICtrl(_skin.btnPrev,_skin.btnNext,_skin.lbNum,showPageData);
			var tmp:GuildApplyInfoCell;
			var startX:int=16;
			var startY:int=69;
			for (var i:int = 0; i < maxCount; i++) 
			{
				tmp=new GuildApplyInfoCell(i);
				tmp.x=startX;
				tmp.y=startY+i*tmp.height;
				_skin.container.addChild(tmp);
				cellList.push(tmp);
				tmp.setData(null);
			}
			MCUtil.BringToTop(_skin.grpFlip);
			MCUtil.BringToTop(_skin.uiNull);
		}
		
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			
			
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(GuildEvent.GET_JOIN_GUILD_LIST,refeashView);
			EventManager.addEvent(GuildEvent.DELETE_GUILD_INVAITE,onDeleteOne);
			//refeashView(null);
			GuildSender.reqGuildApplyListInfo();
		}
		private function onDeleteOne(id:int):void
		{
			// TODO Auto Generated method stub
			
			var len:int=_applyList.length;
			for (var i:int=0;i<len;i++)
			{
				if (_applyList[i].id==id) 
				{
					//list.removeAt(i);
					_applyList.removeAt(i);
					_pageCtrl.setData(_applyList,maxCount);
					refreshState();
					break;
				}
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GET_JOIN_GUILD_LIST,refeashView);
			EventManager.removeEvent(GuildEvent.DELETE_GUILD_INVAITE,onDeleteOne);
		}
		private function refreshState():void
		{
			_skin.uiNull.visible=_applyList.length==0;
			_skin.grpFlip.visible=_applyList.length>0;
		}
		private function refeashView(list:Vector.<GuildApplyInfo>):void
		{
			_applyList=list;
			refreshState();
			_pageCtrl.setData(_applyList,maxCount);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnOk:
					GuildManager.instance().applyOperation(1,-1);
					//_skin.list.dataProvider.removeAll();
					_applyList.length=0;
					_pageCtrl.setData(_applyList,maxCount);
					break;
				case _skin.btnCancel:
					GuildManager.instance().applyOperation(0,-1);
					_applyList.length=0;
					_pageCtrl.setData(_applyList,maxCount);
					break;
			}
		}
		
	}
}