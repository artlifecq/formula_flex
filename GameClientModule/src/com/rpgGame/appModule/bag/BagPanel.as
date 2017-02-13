package com.rpgGame.appModule.bag {
    import com.rpgGame.app.display3D.InterAvatar3D;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.ui.SkinUIPanel;
    import com.rpgGame.coreData.role.HeroData;
    import com.rpgGame.coreData.role.RoleData;
    import com.rpgGame.coreData.type.CharAttributeType;
    
    import gameEngine2D.NetDebug;
    
    import org.mokylin.skin.app.beibao.beibao_Skin;
    
    import starling.display.DisplayObject;
    import starling.display.DisplayObjectContainer;
    
    public class BagPanel extends SkinUIPanel {
        private var _skin : beibao_Skin;
        
        private var _avatar : InterAvatar3D;
        private var _showAvatarData : RoleData;
        
        public function BagPanel() {
            this._skin = new beibao_Skin();
            super(this._skin);
            
            this._avatar = new InterAvatar3D();
            //this._avatar.x = 208;
            //this._avatar.y = 460;
            this._avatar.x = this._skin.weapons.x + (this._skin.weapons.width >> 1);
            this._avatar.y = this._skin.weapons.y + this._skin.weapons.height;
            this.addChild3D(this._avatar);
            this.setChildIndex(this._avatar, this.getChildIndex(this._skin.weapons) - 1);
            this._showAvatarData = new RoleData(0);
            
			
            CONFIG::netDebug {
                NetDebug.LOG("[AppModule] [BagPanel] init exp_pro[x:" + this._skin.pro_jinyan.x + 
                    ", y:" + this._skin.pro_jinyan.y +
                    ", w:" + this._skin.pro_jinyan.width +
                    ", h:" + this._skin.pro_jinyan.height +
                    "] zhenqi_pro[x:" + this._skin.pro_zhenqi.x +
                    ", y:" + this._skin.pro_zhenqi.y + 
                    ", w:" + this._skin.pro_zhenqi.width +
                    ", h:" + this._skin.pro_zhenqi.height + "]");
            }
            
            //this.initProperty(true);
        }
        
        override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void {
            super.show(data, openTable, parentContiner);
            CONFIG::netDebug {
                NetDebug.LOG("[AppModule] [BagPanel] show [x:" + this.x + ", y:" + this.y + ", w:" + this.width + ", h:" + this.height + "]");
            }
            this.updateAvatar();
            this.initProperty();
            CONFIG::netDebug {
                NetDebug.LOG("[AppModule] [BagPanel] show exp_pro[x:" + this._skin.pro_jinyan.x + 
                    ", y:" + this._skin.pro_jinyan.y +
                    ", w:" + this._skin.pro_jinyan.width +
                    ", h:" + this._skin.pro_jinyan.height +
                    "] zhenqi_pro[x:" + this._skin.pro_zhenqi.x +
                    ", y:" + this._skin.pro_zhenqi.y + 
                    ", w:" + this._skin.pro_zhenqi.width +
                    ", h:" + this._skin.pro_zhenqi.height + "]");
            }
        }
        
        override protected function onTouchTarget(target : DisplayObject) : void {
            super.onTouchTarget(target);
            CONFIG::netDebug {
                NetDebug.LOG("[AppModule] [BagPanel] [onTouchTarget] target:" + target.name);
            }
            switch (target) {
                case this._skin.btn_close:
                    CONFIG::netDebug {
                        NetDebug.LOG("[AppModule] [BagPanel] [onTouchTarget] btnclose");
                    }
                    this.hide();
                    break;
            }
        }
        
        private function updateAvatar() : void {
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
        
        private function initProperty(isClear : Boolean = false) : void {
            var info : HeroData = MainRoleManager.actorInfo;
            if (!isClear && null == info) {
                isClear = true;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[AppModule] [BagPanel] [initProperty]");
            }
            // 秒伤
       /*     this._skin.txt_cur.text = isClear ? "0" : "0"; //info.totalStat.getStatValueString(CharAttributeType.;
            // 经验
            this._skin.txt_jinyan.text = isClear ? "0/0" : info.curExp + "/" + info.upgradeExp;
            this._skin.pro_jinyan.value = isClear ? 0 : 10;//info.totalStat.getStatValue(CharAttributeType.EXP) / info.totalStat.getStatValue(CharAttributeType.MAX_EXP);
            // 真气
            this._skin.txt_zhenqi.text = isClear ? "0" : "0";
            this._skin.pro_zhenqi.value = isClear ? 0 : 70;
            // 力道
            this._skin.txt_t0.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.LIDAO);
            // 根骨
            this._skin.txt_t1.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.GENGU);
            // 慧根
            this._skin.txt_t2.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.HUIGEN);
            // 身法
            this._skin.txt_t3.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.SHENFA);
            // 气血
            this._skin.txt_t4.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.QI_XUE);
            // 外功
            this._skin.txt_t5.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.WAI_GONG);
            // 内功
            this._skin.txt_t6.text = isClear ? "0" : info.totalStat.getStatValueString(CharAttributeType.NEI_GONG);
            // 攻速
            this._skin.txt_t7.text = isClear ? "0/5秒" : info.totalStat.getStatValueString(CharAttributeType.ATT_SPEED) + "/5秒";
            // 命中率
            this._skin.txt_t8.text = isClear ? "0%" : info.totalStat.getStatValueString(CharAttributeType.HIT) + "%";
            // 暴击抗性
            this._skin.txt_t9.text = isClear ? "0%" : info.totalStat.getStatValueString(CharAttributeType.ANTI_CRIT_PER) + "%";
            // 闪避率
            this._skin.txt_t10.text = isClear ? "0%" : info.totalStat.getStatValueString(CharAttributeType.MISS) + "%";
            // 防御百分比
            this._skin.txt_t11.text = isClear ? "0%" : info.totalStat.getStatValueString(CharAttributeType.DEFENSE_PER) + "%";
            // 生命恢复速度
            this._skin.txt_t12.text = isClear ? "0/5秒" : info.totalStat.getStatValueString(CharAttributeType.HP_REC) + "/5秒";
            // 治疗效果提示
            this._skin.txt_t13.text = isClear ? "0%" : "0%";
            // 暴击率
            this._skin.txt_t14.text = isClear ? "0%" : info.totalStat.getStatValueString(CharAttributeType.CRIT_PER) + "%";
            // 暴击加成
            this._skin.txt_t15.text = isClear ? "0%" : "0%";
            
            // 等级
            this._skin.txt_level.text = isClear ? "Lv0" : "Lv" + info.totalStat.getStatValueString(CharAttributeType.LV);
            // 名字
            this._skin.txt_roleName.text = isClear ? "" : info.name;
            // 职业
            this._skin.txt_type.text = isClear ? "" : info.jobName;
            // 帮会名
            this._skin.txt_team.text = isClear ? "" : info.societyName;
            // 
            this._skin.txt_loveName.text = isClear ? "" : "";
            // 战斗力
            this._skin.Num_zhandouli.number = isClear ? 0 : 0;
            
            // 货币
            this._skin.txt0.text = isClear ? "0" : "0";
            this._skin.txt1.text = isClear ? "0" : "0";
            this._skin.txt2.text = isClear ? "0" : "0";
            this._skin.txt3.text = isClear ? "0" : "0";*/
        }
    }
}