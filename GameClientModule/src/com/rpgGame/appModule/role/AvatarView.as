package com.rpgGame.appModule.role
{
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	
	import org.mokylin.skin.app.beibao.beibao_Skin;

	/**
	 *装备部分
	 * @author dik
	 * 
	 */
	public class AvatarView
	{
		private var _skin : beibao_Skin;
		
		private var _avatar : InterAvatar3D;
		private var _showAvatarData : RoleData;
		private var _panel:RolePanel;
		
		public function AvatarView(skin:beibao_Skin)
		{
			_skin=skin;
			_panel=_skin.container as RolePanel;
			initAvatar();
		}
		
		private function initAvatar():void
		{
			_avatar = new InterAvatar3D();
			_avatar.x = _skin.weapons.x + (_skin.weapons.width >> 1);
			_avatar.y = _skin.weapons.y + _skin.weapons.height;
			_panel.addChild3D(_avatar);
			_panel.setChildIndex(_avatar, _panel.getChildIndex(_skin.weapons) - 1);
			_showAvatarData = new RoleData(0);
		}
		
		public function updateAvatar():void
		{
			updateRole();
			updateBaseInfo();
		}
		
		private function updateBaseInfo():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			var zoneInddex:int=MainRoleManager.actorInfo.name.indexOf("]")+1;
			var zone:String=MainRoleManager.actorInfo.name.substr(0,zoneInddex);
			var roleName:String=MainRoleManager.actorInfo.name.substr(zoneInddex);
			_skin.txt_roleName.text=roleName;
			_skin.txt_qu.text=zone;
			_skin.txt_type.text=info.jobName;
			_skin.txt_team.text=info.societyName;
			_skin.txt_loveName.text=info.loveName;
			_skin.txt_level.text="Lv"+info.totalStat.level;
			
		}
		
		private function updateRole():void
		{
			var player : SceneRole = MainRoleManager.actor;
			if (null == player || !player.usable) {
				return;
			}
			var playerData : RoleData = player.data as RoleData;
			this._showAvatarData.avatarInfo.setBodyResID(playerData.avatarInfo.bodyResID, playerData.avatarInfo.bodyAnimatResID);
			this._showAvatarData.avatarInfo.hairResID = playerData.avatarInfo.hairResID;
			this._showAvatarData.avatarInfo.weaponResID = playerData.avatarInfo.weaponResID;
			this._showAvatarData.avatarInfo.weaponEffectID = playerData.avatarInfo.weaponEffectID;
			this._showAvatarData.avatarInfo.weaponEffectScale = playerData.avatarInfo.weaponEffectScale;
			this._showAvatarData.avatarInfo.deputyWeaponResID = playerData.avatarInfo.deputyWeaponResID;
			
			this._avatar.setRoleData(this._showAvatarData);
			this._avatar.curRole.setScale(1.45);			
		}
	}
}