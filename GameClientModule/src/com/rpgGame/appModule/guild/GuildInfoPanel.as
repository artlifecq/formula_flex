package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.events.FeathersEventType;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Info_left;
	
	import starling.display.DisplayObject;
	
	public class GuildInfoPanel extends SkinUI
	{
		private var _skin:BangHui_Info_left
		public function GuildInfoPanel():void
		{
			_skin = new BangHui_Info_left();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_skin.lbXuanYan.addEventListener(FeathersEventType.FOCUS_OUT,forceoutHandler);
			
		}
		
		private function forceoutHandler(evt:Event):void
		{
			GuildManager.instance().reqGuildModifyNote(_skin.lbXuanYan.text);
		}
		override protected function onShow():void
		{
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			refeashView();
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
		}
		private function refeashView():void
		{
			if(guildData!=null)
			{
				this.visible = true;
				_skin.lbName.text = guildData.name;
				_skin.lbZhanli.text = guildData.battle.toString();
				_skin.lbLevel.text = guildData.level.toString();
				_skin.lbList.text = guildData.rank.toString();
				_skin.lbNum.text = guildData.memberNum.toString();
				
				_skin.lbXuanYan.text = guildData.note;
				_skin.lbXuanYan.wordWrap = true;
				_skin.lbXuanYan.isEnabled = GuildManager.instance().canNotice;
				
				var guildLevel:Q_guild = GuildManager.instance().guildLevelInfo;
				var percent:Number = guildData.active/guildLevel.q_active;
				if(percent >=1)
					percent = 1;
				_skin.proJindu.value = _skin.proJindu.maximum*percent;
				_skin.lbJindu.text =  guildData.active.toString()+"/"+guildLevel.q_active.toString();
				
				if(GuildManager.instance().getGuildHaveCityByIndex(0))
				{
					_skin.btnWeicheng.filter = null
				}else{
					GrayFilter.gray(_skin.btnWeicheng);
				}
				
				if(GuildManager.instance().getGuildHaveCityByIndex(1))
				{
					_skin.btnWangcheng.filter = null
				}else{
					GrayFilter.gray(_skin.btnWangcheng);
				}
				
				if(GuildManager.instance().getGuildHaveCityByIndex(2))
				{
					_skin.btnHuangcheng.filter = null
				}else{
					GrayFilter.gray(_skin.btnHuangcheng);
				}
				
				
			}else{
				this.visible = false;
			}
		}
		
		
		private function get guildData():GuildInfo
		{
			return GuildManager.instance().guildData;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnUp:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_UPLEVEL,null,false);
					break;
				case _skin.btnWeicheng:
				case _skin.btnWangcheng:
				case _skin.btnHuangcheng:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_WCZB2,null,false);
					break;
				case _skin.btnJuanxian:
					AppManager.showApp(AppConstant.GUILD_DONATE_PANEL);
					break;
				
			}
			
		}
		
		
	}
}