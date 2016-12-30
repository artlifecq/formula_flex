package com.rpgGame.app.ui.main.head {
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.app.display3D.InterAvatar3D;
    import com.rpgGame.app.manager.AvatarManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.utils.RoleFaceMaskEffectUtil;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.GlobalSettingCfgData;
    import com.rpgGame.coreData.cfg.res.AvatarResConfigSetData;
    import com.rpgGame.coreData.clientConfig.AvatarResConfig;
    import com.rpgGame.coreData.clientConfig.GlobalSetting;
    import com.rpgGame.coreData.configEnum.EnumGlobalSetting;
    import com.rpgGame.coreData.role.RoleData;
    
    import org.mokylin.skin.mainui.head.head_main_Skin;
    
    import starling.display.DisplayObject;

    public class PlayerHeadBar extends SkinUI {
        private var _skin : head_main_Skin;
        private var _head : InterAvatar3D;

        public function PlayerHeadBar() {
            this._skin = new head_main_Skin();
            super(this._skin);
            this._skin.btn_banghui.visible = false;
            this._skin.btn_duiwu.visible = false;
            this._skin.btn_heping.visible = true;
            this._skin.btn_quanti.visible = false;
            this._skin.btn_shane.visible = false;
            
            this._head = new InterAvatar3D();
            // 配置
            var globalSetting : GlobalSetting = GlobalSettingCfgData.getSettingInfo(EnumGlobalSetting.DEFAULT_SETTING);
            if (globalSetting) {
                this._head.x = RoleFaceMaskEffectUtil.getFaceOffsetX(globalSetting.headFaceOffset);
                this._head.y = RoleFaceMaskEffectUtil.getFaceOffsetY(globalSetting.headFaceOffset);
            } else {
               this._head.x = 0;
               this._head.y = 0;
            }
            this.addChild3D(this._head);
            this.setChildIndex(this._head, 1);
            
            this.updateNameAndLevel(MainRoleManager.actorInfo.name, MainRoleManager.actorInfo.totalStat.level);
            this.updateBattleValue(0);
            this.updateJob(MainRoleManager.actorInfo.job);
            this.updateHead();
            
            // event
        }

        public function resize(w : int, h : int) : void {
            this.x = 0;
            this.y = 0;//28;
        }

        public function updateNameAndLevel(name : String, level : int) : void {
            this._skin.role_name.text = name + " " + level +"(级)";
        }

        public function updateBattleValue(battleValue : int) : void {
            this._skin.role_zhandou.number = battleValue;
        }
        
        public function updateJob(job : int) : void {
            this._skin.UI_bingjia.visible = 1 == job;
            this._skin.UI_mojia.visible = 2 == job;
            this._skin.UI_yijia.visible = 3 == job;
        }
        
        public function updateHead() : void {
            var roleData : RoleData = new RoleData(0);
            roleData.avatarInfo.setBodyResID(MainRoleManager.actorInfo.avatarInfo.bodyResID,
                MainRoleManager.actorInfo.avatarInfo.bodyAnimatResID);
            roleData.avatarInfo.hairResID = MainRoleManager.actorInfo.avatarInfo.hairResID;
            
            this._head.setRoleData(roleData);
            AvatarManager.updateAvatar(this._head.curRole);
            var cfg : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
            // 配置
            if (cfg) {
                RoleFaceMaskEffectUtil.addHeadFaceMaskEffect(this._head.curRole);
                this._head.curRole.setScale(RoleFaceMaskEffectUtil.getFaceMaskScale(cfg.headFaceMask));
                this._head.curRole.rotationY = RoleFaceMaskEffectUtil.getFaceMaskRotation(cfg.headFaceMask);
            } else {
                this._head.curRole.setScale(1);
                this._head.curRole.rotationY = 0;
                RoleFaceMaskEffectUtil.removeFaceMaskEffect(this._head.curRole);
            }
            
            this.updateFadeAlphaRectPos();
        }
        
        override protected function onUpdateFadeAlphaRectPos(sr3D : InterObject3D, x : int, y : int) : void {
            super.onUpdateFadeAlphaRectPos(sr3D, x, y);
            var avatar3D : InterAvatar3D = sr3D as InterAvatar3D;
            if (avatar3D && avatar3D.curRole) {
                var roleData : RoleData = avatar3D.curRole.data as RoleData;
                // 配置
                var cfg : AvatarResConfig = AvatarResConfigSetData.getInfo(roleData.avatarInfo.bodyResID);
                if (cfg) {
                    var fadeX : int = RoleFaceMaskEffectUtil.getFaceMaskX(cfg.headFaceMask);
                    var fadeY : int = RoleFaceMaskEffectUtil.getFaceMaskY(cfg.headFaceMask);
                    avatar3D.curRole.x = fadeX;
                    avatar3D.curRole.y = fadeY;
                    RoleFaceMaskEffectUtil.updateFadeAlphaRectPos(avatar3D.curRole, x + avatar3D.x, y + avatar3D.y);
                }
            }
        }
        
        override protected function onTouchTarget(target : DisplayObject) : void {
            switch (target) {
                case this._skin.btn_banghui:
                case this._skin.btn_duiwu:
                case this._skin.btn_heping:
                case this._skin.btn_quanti:
                case this._skin.btn_shane:
                    this.showPKMode(target);
                    break;
            }
        }
        
        // private
        private function showPKMode(target : DisplayObject) : void {
            
        }
    }
}
