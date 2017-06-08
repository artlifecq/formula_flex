package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	
	import feathers.utils.filter.GrayFilter;
	
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
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_UPLEVEL);
					break;
				case _skin.btnWeicheng:
				case _skin.btnWangcheng:
				case _skin.btnHuangcheng:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_COMBAT);
					break;
				
			}
			
		}
		
		
	}
}