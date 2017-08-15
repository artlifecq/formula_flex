package com.rpgGame.appModule.guild.war
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildWarSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.netData.guildWar.bean.GuildWarCityApplyInfo;
	import com.rpgGame.netData.guildWar.message.ResGuildWarChangeMaxPriceMessage;
	import com.rpgGame.netData.guildWar.message.ResGuildWarCityApplyInfoMessage;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.wangcheng.ZhengBaBaoMing;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	import utils.TimerServer;
	
	/**
	 *王城争霸申请面板 
	 * @author dik
	 * 
	 */
	public class WczbWarApplyPanel extends SkinUIPanel
	{
		private var _skin:ZhengBaBaoMing;
		private var applyCityId:int;
		public function WczbWarApplyPanel()
		{
			_skin=new ZhengBaBaoMing();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.List.itemRendererType=WczbWarApplyItemRender;
			_skin.List.scrollBarDisplayMode =ScrollBarDisplayMode.NONE;
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
			EventManager.removeEvent(GuildEvent.GUILD_WCZB_CHANGEMAXPRICE,updateInfo);
			GuildWarSender.reqGuildWarLeaveApplyPanel();
			TimerServer.remove(updateTime);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			initEvent();
			GuildWarSender.reqGuildWarCityApplyInfo(1);			
			TimerServer.addLoop(updateTime,1000,null,0);
		}
		
		private function updateTime():void
		{
			var num:int=_skin.List.dataProvider.length;
			for(var i:int=0;i<num;i++){
				var item:WczbWarApplyItemRender=_skin.List.itemToItemRenderer(_skin.List.dataProvider.getItemAt(i)) as WczbWarApplyItemRender;
				if(item){
					item.updateTime();
				}
			}
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(GuildEvent.GUILD_WCZB_APPLYINFO,getInfos);
			EventManager.addEvent(GuildEvent.GUILD_WCZB_CHANGEMAXPRICE,updateInfo);
		}
		
		private function updateInfo(msg:ResGuildWarChangeMaxPriceMessage):void
		{
			var index:int=-1;
			var num:int=_skin.List.dataProvider.length;
			var myGuildId:String;
			if(GuildManager.instance().haveGuild){
				myGuildId=GuildManager.instance().guildData.id.hexValue;
			}
			for(var i:int=0;i<num;i++){
				var obj:GuildWarCityApplyInfo=_skin.List.dataProvider.getItemAt(i) as GuildWarCityApplyInfo;
				if(obj.id==msg.cityId){
					obj.curMaxPriceGuildId=msg.guildId;
					obj.curMaxPriceGuildName=msg.guildName;
					obj.curMaxPrice=msg.price;
					if(msg.guildId.hexValue==myGuildId){//是自己帮派申请了,那就请求一次城池信息,更新面板
						_skin.List.customData.applayCityId=msg.cityId;
						GuildWarSender.reqGuildWarCityInfo(0);
					}
					index=i;
					break;
				}
			}
			if(index!=-1){
				if(applyCityId!=-1){
					_skin.List.dataProvider.updateItemAt(index);
				}else{
					_skin.List.dataProvider.updateAll();
				}
			}
		}
		
		private function getInfos(msg:ResGuildWarCityApplyInfoMessage):void
		{
			_skin.List.dataProvider.removeAll();
			var i:int;
			var num:int=msg.citys.length;
			applyCityId=msg.applyCityId;
			if(!_skin.List.customData){
				_skin.List.customData=new Object();
			}
			_skin.List.customData.applayCityId=msg.applyCityId;
			for(i=0;i<num;i++){
				_skin.List.dataProvider.addItem(msg.citys[i]);
			}
		}
	}
}