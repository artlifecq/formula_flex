package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.common.PageContainerUI;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityApplyInfoMessage;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaBaoMing;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *王城争霸申请面板 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyPanel extends SkinUIPanel
	{
		private var _skin:ZhengBaBaoMing;
		private var pageContainer:PageContainerUI;
		
		public function WczbWarApplyPanel()
		{
			_skin=new ZhengBaBaoMing();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.List.dataProvider=new ListCollection();
		}
		
		override protected function onStageResize(sw : int, sh : int) : void
		{
			this.x=(this.parent.width-this.width)/2;
			this.y=(this.parent.height-this.height)/2;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnClose1:
					this.hide();
					break;
			}
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_APPLYINFO,getInfos);
			GuildSender.reqGuildWarLeaveApplyPanel();
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			initEvent();
			GuildSender.reqGuildWarCityApplyInfo(1);			
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(GuildEvent.GUILD_WCZB_APPLYINFO,getInfos);
		}
		
		private function getInfos(msg:ResGuildWarCityApplyInfoMessage):void
		{
			_skin.List.dataProvider.removeAll();
			var i:int;
			var num:int=msg.citys.length;
			for(i=0;i<num;i++){
				_skin.List.dataProvider.addItem(msg.citys[i]);
			}
		}
	}
}