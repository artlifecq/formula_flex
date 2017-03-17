package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ChangeModelCfgData;
	import com.rpgGame.coreData.cfg.model.AvatarWeapontResCfgData;
	import com.rpgGame.coreData.clientConfig.AvatarWeaponRes;
	import com.rpgGame.coreData.clientConfig.ChangeModel;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.StringUtil;

	/**
	 * 变身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class ShapeshiftingState extends BuffState
	{
		public function ShapeshiftingState()
		{
			super(RoleStateType.CONTROL_SHAPESHIFTING);
		}
		
		override public function execute() : void
		{
			if (_machine && !_machine.isDisposed)
			{
				super.execute();
				if (_stateReference)
				{
					if (_stateReference is ShapeshiftingStateReference)
					{
						var role : SceneRole = _machine.owner as SceneRole;
                        var buffInfo : Q_buff = _stateReference.buffData.buffData;
                        if (null == buffInfo) {
                            return;
                        }
                        var changeModel : ChangeModel = ChangeModelCfgData.getInfoById(1);
                        if (null == changeModel) {
                            return;
                        }
                        if (null == changeModel.q_body_res || 0 == changeModel.q_body_res.length) {
                            (role.data as HeroData).avatarInfo.clear();
                            (role.data as HeroData).avatarInfo.setBodyResID(changeModel.avatarClothesRes, changeModel.heroModel);
                            (role.data as HeroData).avatarInfo.hairResID = changeModel.avatarHairRes;
                            var weaponRes : AvatarWeaponRes = AvatarWeapontResCfgData.getInfo(changeModel.weapon);
                            var weaponResID : String = null;
                            var weaponEffectResID : String = "";
                            var weaponEffectScale : int = 0;
                            var weaponEffectOffset : Vector3D = null;
                            if (weaponRes)
                            {
                                weaponResID = weaponRes.res;
                                weaponEffectResID = weaponRes.effectRes;
                                weaponEffectScale = weaponRes.effectScale;
                                weaponEffectOffset = new Vector3D(weaponRes.effectOffsetX, weaponRes.effectOffsetY, weaponRes.effectOffsetZ);
                            }
                            (role.data as HeroData).avatarInfo.weaponResID = weaponResID;
                            (role.data as HeroData).avatarInfo.weaponEffectID = weaponEffectResID;
                            (role.data as HeroData).avatarInfo.weaponEffectScale = weaponEffectScale;
                            (role.data as HeroData).avatarInfo.weaponEffectOffset = weaponEffectOffset;
                        } else {
                            (role.data as HeroData).avatarInfo.clear();
                            (role.data as HeroData).avatarInfo.setBodyResID("monster/pt_bing_2/pt_bing_2", null);
                            //(role.data as HeroData).avatarInfo.hairResID = "monster/pt_bing_2/pt_bing_2";
                        }
                        AvatarManager.updateAvatar(role);
                        
                        if (role.isMainChar) {
                            ShortcutsManger.getInstance().replaceToTempSpellByVector(
                                MainRoleManager.actorInfo.spellList.getShortcutSpellList());
                        }
					}
					else
						throw new Error("场景变身状态引用必须是ShapeshiftingStateReference类型！");
				}
			}
		}
		
		override public function afterLeave() : void
		{
			super.afterLeave();
			if (_machine && !_machine.isDisposed)
			{
				var role : SceneRole = _machine.owner as SceneRole;
                AvatarManager.callEquipmentChange(role);
                if (role.isMainChar) {
                    ShortcutsManger.getInstance().reset();
                }
			}
		}
	}
}