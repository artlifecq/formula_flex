package com.rpgGame.app.state.role.control
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ChangeModelCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarDeputyWeaponResCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarDeputyWeaponRes;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.ChangeModel;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;

	/**
	 * 变身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class ShapeshiftingState extends BuffState
	{
    	private var avatarInfo:AvatarInfo;
        
		public function ShapeshiftingState()
		{
			super(RoleStateType.CONTROL_SHAPESHIFTING);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_ref is ShapeshiftingStateReference)
				{
					_stateReference = _ref as ShapeshiftingStateReference;
					
					var role : SceneRole = _machine.owner as SceneRole;
//					var clientData:Object = _stateReference.buffData.clientData;
					
//					trace("要变身的模型ID:\t" + clientData.model);
                    
                    var changeModel : ChangeModel = ChangeModelCfgData.getInfoById(2/*_stateReference.buffData.clientData.model*/);
                    if (null == changeModel)
					{
                        return;
                    }
                    
                    var heroData : HeroData = role.data as HeroData;
					
					avatarInfo = heroData.avatarInfo.clone();
					
					heroData.avatarInfo.clear();
					
					heroData.avatarInfo.setBodyResID(changeModel.q_body_res,changeModel.q_animator_res==""?null:changeModel.q_animator_res);
					heroData.avatarInfo.hairResID = changeModel.q_hair_res;
					
					var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(changeModel.q_weapon_res);
					/*	if (!weaponRes)
					{
					weaponRes = AvatarWeapontResCfgData.getInfo(clothesRes.weaponResId);
					}*/
					if (weaponRes)
					{
						heroData.avatarInfo.weaponResID = weaponRes.res;
						heroData.avatarInfo.weaponEffectID = weaponRes.effectRes;
						heroData.avatarInfo.weaponEffectScale = weaponRes.effectScale;
						heroData.avatarInfo.weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
					}
					var deputyWeaponRes : AvatarDeputyWeaponRes = AvatarDeputyWeaponResCfgData.getInfo(changeModel.q_deputyweapon_res);
					if (deputyWeaponRes)
					{
						heroData.avatarInfo.deputyWeaponResID = deputyWeaponRes.res;
						heroData.avatarInfo.deputyWeaponEffectID = deputyWeaponRes.effectRes;
						heroData.avatarInfo.deputyWeaponEffectScale = deputyWeaponRes.effectScale;
						heroData.avatarInfo.deputyWeaponEffectOffset = new Vector3D(deputyWeaponRes.effectOffsetX, deputyWeaponRes.effectOffsetY, deputyWeaponRes.effectOffsetZ);
					}

					AvatarManager.updateAvatar(role);
                    if (role.isMainChar)
					{
                        ShortcutsManger.getInstance().replaceToTempSpellByVector(MainRoleManager.actorInfo.spellList.getAutoSpellList());
                    }
				}
				else
					throw new Error("场景变身状态引用必须是ShapeshiftingStateReference类型！");
			}
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
               
				var heroData : HeroData = role.data as HeroData;
				heroData.avatarInfo.clear();
				
				heroData.avatarInfo = avatarInfo;
				
				AvatarManager.updateAvatar(role);
                if (role.isMainChar)
				{
                    ShortcutsManger.getInstance().reset();
                }
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			avatarInfo = null;
		}
	}
}