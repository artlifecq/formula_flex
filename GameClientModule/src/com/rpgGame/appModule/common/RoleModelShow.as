package com.rpgGame.appModule.common
{
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;

	/**
	 * 简要造型展示
	 * @author yfl
	 * 
	 */	
	public class RoleModelShow extends InterAvatar3D
	{
		
		public function RoleModelShow()
		{
			super();
		}
		public function setData(appearanceInfo:PlayerAppearanceInfo):void
		{
			var _showAvatarData:RoleData = new RoleData(0);
//			_showAvatarData.avatarInfo.setBodyResID(_roleData.avatarInfo.bodyResID, _roleData.avatarInfo.bodyAnimatResID);
//			_showAvatarData.avatarInfo.hairResID = _roleData.avatarInfo.hairResID;
//			_showAvatarData.avatarInfo.weaponResID = _roleData.avatarInfo.weaponResID;
//			_showAvatarData.avatarInfo.weaponEffectID = _roleData.avatarInfo.weaponEffectID;
//			_showAvatarData.avatarInfo.weaponEffectScale = _roleData.avatarInfo.weaponEffectScale;
//			_showAvatarData.avatarInfo.deputyWeaponResID = _roleData.avatarInfo.deputyWeaponResID;
//			_showAvatarData.avatarInfo.deputyWeaponEffectID=_roleData.avatarInfo.deputyWeaponEffectID;
//			_showAvatarData.avatarInfo.deputyWeaponEffectScale=_roleData.avatarInfo.deputyWeaponEffectScale;
			
			setRoleData(_showAvatarData);
		}
		
	}
}