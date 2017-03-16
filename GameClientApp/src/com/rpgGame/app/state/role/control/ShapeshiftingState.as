package com.rpgGame.app.state.role.control
{
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.coreData.AvatarInfo;
	import com.rpgGame.coreData.cfg.ChangeModelCfgData;
	import com.rpgGame.coreData.clientConfig.ChangeModel;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleStateType;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.StringUtil;

	/**
	 * 变身状态处理 
	 * @author NEIL
	 * 
	 */	
	public class ShapeshiftingState extends BuffState
	{
        private var _oldBody : int = -1;
        private var _oldHair : int = -1;
        private var _oldCloths : int = -1;
        private var _oldWeapon : int = -1;
        private var _oldDeputyWeapon : int = -1;
        
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
                        var changeModel : ChangeModel = ChangeModelCfgData.getInfoById(buffInfo.q_change_model_res);
                        if (null == changeModel) {
                            return;
                        }
                        if (null == changeModel.q_body_res || 0 == changeModel.q_body_res.length) {
                            var heroData : HeroData = role.data as HeroData;
                            this._oldBody = heroData.body;
                            this._oldCloths = heroData.cloths;
                            this._oldHair = heroData.hair;
                            this._oldWeapon = heroData.weapon;
                            this._oldDeputyWeapon = heroData.deputyWeapon;
                            heroData.body = changeModel.heroModel;
                            heroData.cloths = changeModel.avatarClothesRes;
                            heroData.hair = changeModel.avatarHairRes;
                            heroData.weapon = changeModel.weapon;
                            heroData.deputyWeapon = 0;
                            AvatarManager.callEquipmentChange(role);
                        } else {
                            (role.data as HeroData).avatarInfo.clear();
                            (role.data as HeroData).avatarInfo.setBodyResID("pc/body/binjia_skin", null);
                            AvatarManager.updateAvatar(role);
                        }
                        
                        if (role.isMainChar) {
                            ShortcutsManger.getInstance().replaceToTempSpellByVector(
                                MainRoleManager.actorInfo.spellList.getAutoSpellList());
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
                if (-1 != this._oldBody) {
                    var heroData : HeroData = role.data as HeroData;
                    heroData.body = this._oldBody;
                    heroData.cloths = this._oldCloths;
                    heroData.hair = this._oldHair;
                    heroData.weapon = this._oldWeapon;
                    heroData.deputyWeapon = this._oldDeputyWeapon;
                }
                AvatarManager.callEquipmentChange(role);
                this._oldBody = -1;
                this._oldCloths = -1;
                this._oldHair = -1;
                this._oldWeapon = -1;
                this._oldDeputyWeapon = -1;
                if (role.isMainChar) {
                    ShortcutsManger.getInstance().reset();
                }
			}
		}
	}
}