package com.rpgGame.appModule.common
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.model.AvatarClothesResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarHairResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.cfg.model.HeroModelCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarClothesRes;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarHairRes;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.HeroModel;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.netData.player.bean.PlayerAppearanceInfo;
	
	import flash.geom.Vector3D;

	/**
	 * 简要造型展示,根据AvatarView和AvatarManager改造
	 * @author yfl
	 * 
	 */	
	public class RoleModelShow extends Inter3DContainer
	{
		private var _avatar:InterAvatar3D;
		public function RoleModelShow()
		{
			super();
			
		}
		public function setData(appearanceInfo:PlayerAppearanceInfo,scaleRole:Number):void
		{
			if (!avatar) 
			{
				_avatar=new InterAvatar3D();
				this.addChild3D(avatar);
			}
			var _showAvatarData:RoleData = new RoleData(0);
			
			var animatResID : String = null;
			var bodyResID : String = null;
			var hairResID : String = null;
			var mountResID : String = null;
			var mountAnimatResID : String = null;
			var weaponResID : String = null;
			var weaponEffectResID : String = "";
			var weaponEffectScale : int = 0;
			var weaponEffectOffset : Vector3D = null;
			var deputyWeaponResID : String = null;
			var deputyWeaponEffectResID : String = "";
			var deputyWeaponEffectScale : int = 0;
			var deputyWeaponEffectOffset : Vector3D = null;
			
			var bodyEffectResID : String = null;
	
			var bodyMethodTypeEffectResID : String = null;
			var heroModel : HeroModel = HeroModelCfgData.getInfo(appearanceInfo.body);
			var mountModel :Q_horse = HorseConfigData.getMountDataById(appearanceInfo.mount);
		
			var clothesRes : AvatarClothesRes = AvatarClothesResCfgData.getInfo(appearanceInfo.cloths);
			if (!clothesRes)
			{
				clothesRes = AvatarClothesResCfgData.getInfo(appearanceInfo.job);
			}
			
			if (clothesRes)
			{
				bodyResID = clothesRes.bodyRes;
				bodyEffectResID = clothesRes.effectRes;
				
				var hairRes : AvatarHairRes = AvatarHairResCfgData.getInfo(appearanceInfo.hair);
				if (!hairRes)
				{
					hairRes = AvatarHairResCfgData.getInfo(clothesRes.hairResId);
				}
				hairResID = hairRes.hairRes;
				switch (appearanceInfo.job)
				{
					case 1:
						animatResID = heroModel.animatRes_bingjia;	
						break;
					case 2:
						if(appearanceInfo.sex)
						{
							animatResID = heroModel.animatRes_mojia_man;
						}
						else
						{
							animatResID = heroModel.animatRes_mojia_woman;
						}
						break;
					case 3:
						if(appearanceInfo.sex)
						{
							animatResID = heroModel.animatRes_mojia_man;
						}
						else
						{
							animatResID = heroModel.animatRes_mojia_woman;
						}
						break;
					case 4:
						animatResID = heroModel.animatRes_yijia;
						break;
					case 5:
						animatResID = heroModel.animatRes_waibao;
						break;
				}
				
				if (mountModel)
				{
					mountResID = mountModel.q_scene_show_url;
					mountAnimatResID = HorseConfigData.mountAnimatResID;
				}

				
				var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(appearanceInfo.weapon);
				/*	if (!weaponRes)
				{
				weaponRes = AvatarWeapontResCfgData.getInfo(clothesRes.weaponResId);
				}*/
				if (weaponRes)
				{
					weaponResID = weaponRes.res;
					weaponEffectResID = weaponRes.effectRes;
					weaponEffectScale = weaponRes.effectScale;
					weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
				}
				var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(appearanceInfo.second_weapon);
				if (deputyWeaponRes)
				{
					deputyWeaponResID = deputyWeaponRes.res;
					deputyWeaponEffectResID = deputyWeaponRes.effectRes;
					deputyWeaponEffectScale = deputyWeaponRes.effectScale;
					deputyWeaponEffectOffset = new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
				}
			}
			
			_showAvatarData.avatarInfo.setBodyResID(bodyResID, animatResID);
			_showAvatarData.avatarInfo.hairResID = hairResID;
			_showAvatarData.avatarInfo.weaponResID = weaponResID;
			_showAvatarData.avatarInfo.weaponEffectID =weaponEffectResID;
			_showAvatarData.avatarInfo.weaponEffectScale =weaponEffectScale;
			_showAvatarData.avatarInfo.deputyWeaponResID =deputyWeaponResID;
			_showAvatarData.avatarInfo.deputyWeaponEffectID=deputyWeaponEffectResID;
			_showAvatarData.avatarInfo.deputyWeaponEffectScale=deputyWeaponEffectScale;
			
			this.avatar.setRoleData(_showAvatarData);
			this.avatar.curRole.setScale(scaleRole);
		}
		override public function dispose():void
		{
			
			if (avatar) 
			{
				MCUtil.removeSelf(avatar);
				avatar.dispose();
				_avatar=null;
			}
			super.dispose();
		}

		public function get avatar():InterAvatar3D
		{
			return _avatar;
		}

	}
}