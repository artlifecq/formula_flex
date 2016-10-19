package com.rpgGame.appModule.role
{
	import com.game.engine3D.vo.FadeAlphaRectData;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.role.RoleData;
	
	import away3d.containers.ObjectContainer3D;
	import away3d.entities.Mesh;
	import away3d.materials.methods.FadeAlphaMethod;
	
	import org.mokylin.skin.app.role.RolePanelSkin;
	
	import starling.display.DisplayObject;
	import starling.display.Interoperation3DContainer;

	public class RolePanel extends SkinUIPanel
	{
		private var skin:RolePanelSkin;
		private var interoperation3DContainer:Interoperation3DContainer;
		
		private var fadeMethod 	: FadeAlphaMethod;
		private var fadeRectData : FadeAlphaRectData;
		private var _avatarOffX : int = 208;
		private var _avatarOffY : int = 460;
		private var avatar3D : InterAvatar3D;
		
		public function RolePanel()
		{
			skin= new RolePanelSkin();
			super(skin);
			initPlayer();
		}
		
		private function initPlayer() : void
		{
			avatar3D = new InterAvatar3D();
			avatar3D.x = _avatarOffX;
			avatar3D.y = _avatarOffY;
			addChild3D(avatar3D);
			updateAvatar(MainRoleManager.actor);
		}
		
		private function activeRenderObject(object : ObjectContainer3D, depthWrite : Boolean, rMask : Boolean, gMask : Boolean, bMask : Boolean, aMask : Boolean, srcFactor : String, dstFactor : String) : void {
			for (var i:int = 0; i < object.numChildren; i++) {
				var child : ObjectContainer3D = object.getChildAt(i);
				if (child is Mesh) {
					(child as Mesh).material;
				} else {
					activeRenderObject(child, depthWrite, rMask, gMask, bMask, aMask, srcFactor, dstFactor);
				}
			}
		}
		
		private function updateAvatar(role : SceneRole) : void
		{
			if (!role || !role.usable)
				return;
			var roleData : RoleData = role.data as RoleData;
			var showRoleData : RoleData = new RoleData(0);
			showRoleData.avatarInfo.setBodyResID(roleData.avatarInfo.bodyResID, roleData.avatarInfo.bodyAnimatResID);
			showRoleData.avatarInfo.hairResID = roleData.avatarInfo.hairResID;
			showRoleData.avatarInfo.weaponResID = roleData.avatarInfo.weaponResID;
			showRoleData.avatarInfo.weaponEffectID = roleData.avatarInfo.weaponEffectID;
			showRoleData.avatarInfo.weaponEffectScale = roleData.avatarInfo.weaponEffectScale;
			showRoleData.avatarInfo.deputyWeaponResID = roleData.avatarInfo.deputyWeaponResID;
			avatar3D.setRoleData(showRoleData);
			avatar3D.curRole.setScale(1.45);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case skin.btnClose:
					hide();
					break;
			}
		}
	}
}