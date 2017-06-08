package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.FunctionOpenManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.enum.EmFunctionID;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.netData.guild.bean.GuildInfo;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import org.mokylin.skin.app.banghui.BangHui_Info;
	
	import starling.display.DisplayObject;
	
	public class GuildInfoViewUI extends ViewUI
	{
		private var _skin:BangHui_Info;
		private var _guildInfo:GuildInfoPanel;
		private var _showAvatarData : RoleData;
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
			_avatar = new InterAvatar3D();
			_avatar.x = 594;
			_avatar.y = 478;
			this.addChild3D(_avatar);
			_showAvatarData = new RoleData(0);
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			
			refeashPanleInfo();
			updateRole();
		}
		
		
		private function refeashPanleInfo():void
		{
			_skin.NumZhanli.number = guildData.battle;
			_skin.lbBangZhu.text = guildData.chiefName;
			_skin.lbDengji.text = "Lv."+chiefGuildMemberInfo.level;
		}
		
		private function updateRole():void
		{
			var chiefAvatar:PlayerAppearanceInfo = guildData.chiefAvatar;
			if(chiefAvatar!=null)
			{
				var data:HeroData = MainRoleManager.actorInfo;
				this._showAvatarData.avatarInfo.setBodyResID(data.avatarInfo.bodyResID, data.avatarInfo.bodyAnimatResID);
				this._showAvatarData.avatarInfo.hairResID = data.avatarInfo.hairResID;
				this._showAvatarData.avatarInfo.weaponResID = data.avatarInfo.weaponResID;
				this._showAvatarData.avatarInfo.weaponEffectID = data.avatarInfo.weaponEffectID;
				this._showAvatarData.avatarInfo.weaponEffectScale = data.avatarInfo.weaponEffectScale;
				this._showAvatarData.avatarInfo.deputyWeaponResID = data.avatarInfo.deputyWeaponResID;
				this._showAvatarData.avatarInfo.deputyWeaponEffectID=data.avatarInfo.deputyWeaponEffectID;
				this._showAvatarData.avatarInfo.deputyWeaponEffectScale=data.avatarInfo.deputyWeaponEffectScale;
			}else{
				/*this._showAvatarData.avatarInfo.setBodyResID(chiefAvatar.bodyResID, data.avatarInfo.bodyAnimatResID);
				this._showAvatarData.avatarInfo.hairResID = data.avatarInfo.hairResID;
				this._showAvatarData.avatarInfo.weaponResID = data.avatarInfo.weaponResID;
				this._showAvatarData.avatarInfo.weaponEffectID = data.avatarInfo.weaponEffectID;
				this._showAvatarData.avatarInfo.weaponEffectScale = data.avatarInfo.weaponEffectScale;
				this._showAvatarData.avatarInfo.deputyWeaponResID = data.avatarInfo.deputyWeaponResID;
				this._showAvatarData.avatarInfo.deputyWeaponEffectID=data.avatarInfo.deputyWeaponEffectID;
				this._showAvatarData.avatarInfo.deputyWeaponEffectScale=data.avatarInfo.deputyWeaponEffectScale;*/
			}
			this._avatar.setRoleData(this._showAvatarData);
			this._avatar.curRole.setScale(1.7);	
		}
		
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.btnJineng:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_SPELL);
					break;
				case _skin.btnZhengba:
					FunctionOpenManager.openAppPaneById(EmFunctionID.EM_BANGHUI_COMBAT);
					break;
				case _skin.btnZhaoji:
					GuildManager.instance().guildConvene();
					break;
				case _skin.btnJiesan:
					GuildManager.instance().guildDissolve();
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