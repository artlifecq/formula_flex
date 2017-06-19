package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Up;
	
	import starling.display.DisplayObject;
	
	public class GuildUPViewUI extends ViewUI
	{
		private var _skin:BangHui_Up;
		
		public function GuildUPViewUI()
		{
			_skin = new BangHui_Up();
			super(_skin);
		}
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashValue);
			refeashValue();
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashValue);
		}
		
		private function refeashValue():void
		{
			if(guildInfo==null)
				return ;
			
			var currentGuildInfo:Q_guild = GuildCfgData.getLevelInfo(guildInfo.level);
			if(currentGuildInfo!=null)
			{
				_skin.lbMsg1.htmlText = currentGuildInfo.q_privilege_show;
			}
			var nextGuildInfo:Q_guild= GuildCfgData.getLevelInfo(guildInfo.level+1);
			if(nextGuildInfo!=null)
				_skin.lbMsg2.htmlText = nextGuildInfo.q_privilege_show;
			else
				_skin.lbMsg2.htmlText = "已满级";
			
			
			if(GuildManager.instance().getGuildHaveCityByIndex(0))
			{
				_skin.btnRenwu.filter = null
			}else{
				GrayFilter.gray(_skin.btnRenwu);
			}
			
			if(GuildManager.instance().getGuildHaveCityByIndex(1))
			{
				_skin.btnZhengba.filter = null
			}else{
				GrayFilter.gray(_skin.btnZhengba);
			}
			
			if(GuildManager.instance().getGuildHaveCityByIndex(2))
			{
				_skin.btnJuanxian.filter = null
			}else{
				GrayFilter.gray(_skin.btnJuanxian);
			}
			
			
			var startActive:int = 0;
			var lastGuildInfo:Q_guild = GuildCfgData.getLevelInfo(guildInfo.level-1);
			if(lastGuildInfo!=null)
				startActive = lastGuildInfo.q_active;
			var have:int = guildInfo.active - startActive;
			var need:int = currentGuildInfo.q_active - startActive;
			var percent:Number = have/need;
			if(percent >=1)
				percent = 1;
			_skin.proJindu.value = _skin.proJindu.maximum*percent;
			_skin.lbJindu.text =  have.toString()+"/"+need.toString();
			
			_skin.lbBanhuiZhanli.text = guildInfo.battle.toString();
			_skin.lbBanhuiDengji.text = guildInfo.level.toString();
			_skin.btnUp.visible = GuildManager.instance().canUpgrad;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnRenwu:
				case _skin.btnZhengba:
				case _skin.btnJuanxian:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_COMBAT,null,false);
					break;
				case _skin.btnUp:
					GuildManager.instance().guildLevelup();
					break;
			}
		}
		private function get guildInfo():GuildInfo
		{
			return GuildManager.instance().guildData;
		}
		
	}
}