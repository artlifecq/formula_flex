package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.appModule.common.RoleModelShow;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.BangHui_Info;
	
	import starling.display.DisplayObject;
	
	public class GuildInfoViewUI extends ViewUI
	{
		private var _skin:BangHui_Info;
		private var _guildInfo:GuildInfoPanel;
		private var _showAvatarData : RoleData;
		private var _roleModel:RoleModelShow;
		private var _avatar : InterAvatar3D;
		public function GuildInfoViewUI()
		{
			_skin = new BangHui_Info();
			super(_skin);
			initView();
		}
		private function initView():void
		{
			_guildInfo = new GuildInfoPanel();
			_guildInfo.x = 19;
			_guildInfo.y = 81;
			this.addChild(_guildInfo);
			_showAvatarData = new RoleData(0);
			initAvatar();
		}
		
		private function initAvatar():void
		{
			_roleModel = new RoleModelShow();
			_roleModel.x = 594;
			_roleModel.y = 478;
			this.addChild(_roleModel);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			EventManager.addEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
			refeashView();
		}
		
		override protected function onHide():void
		{
			EventManager.removeEvent(GuildEvent.GUILD_DATA_INIT,refeashView);
		}
		
		private function refeashView():void
		{
			if(guildData ==null)
				return ;
			refeashPanleInfo();
			updateRole();
		}
		
		private function refeashPanleInfo():void
		{
			_skin.NumZhanli.number = guildData.battle;
			_skin.lbBangZhu.text = guildData.chiefName;
			_skin.lbDengji.text = "Lv."+chiefGuildMemberInfo.level;
			_skin.btnZhaoji.visible = GuildManager.instance().canConvene;
			if(GuildManager.instance().canDissolve)
			{
				_skin.btnJiesan.label = "解散帮会";
			}else{
				_skin.btnJiesan.label = "退出帮派";
			}
		}
		
		private function updateRole():void
		{
			var chiefAvatar:PlayerAppearanceInfo = guildData.chiefAvatar;
			if(chiefAvatar!=null)
			{
				_roleModel.setData(chiefAvatar,1.7);
			}
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnJineng:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_SPELL,null,false);
					break;
				case _skin.btnZhengba:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_COMBAT,null,false);
					break;
				case _skin.btnZhaoji:
					GuildManager.instance().guildConvene();
					break;
				case _skin.btnJiesan:
					if(GuildManager.instance().canDissolve)
					{
						GuildManager.instance().guildDissolve();
					}else{
						GuildManager.instance().guildExit();
					}
					break;
			}
		}
		private function get guildData():GuildInfo
		{
			return GuildManager.instance().guildData;
		}
		public function get chiefGuildMemberInfo():GuildMemberInfo
		{
			return GuildManager.instance().chiefGuildMemberInfo;
		}
	}
}