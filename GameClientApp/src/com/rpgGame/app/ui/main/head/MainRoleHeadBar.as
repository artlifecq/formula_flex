package com.rpgGame.app.ui.main.head {
    import com.game.engine3D.display.Inter3DContainer;
    import com.game.engine3D.display.InterObject3D;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleSelectManager;
    import com.rpgGame.core.events.MainPlayerEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.enum.JobEnum;
    import com.rpgGame.coreData.role.HeroData;
    import com.rpgGame.coreData.type.AssetUrl;
    import com.rpgGame.coreData.type.CharAttributeType;
    import com.rpgGame.coreData.type.EffectUrl;
    
    import feathers.controls.UIAsset;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.head.head_main_Skin;
    
    import starling.display.DisplayObject;

    public class MainRoleHeadBar extends SkinUI {
        private var _skin : head_main_Skin;
		
		private var _zhandouliEftContaner:Inter3DContainer;
		private var _zhandouliEft:InterObject3D;
		private var _headImg:UIAsset;

        public function MainRoleHeadBar() {
            this._skin = new head_main_Skin();
            super(this._skin);
            this._skin.btn_banghui.visible = false;
            this._skin.btn_duiwu.visible = false;
            this._skin.btn_heping.visible = true;
            this._skin.btn_quanti.visible = false;
            this._skin.btn_shane.visible = false;
			_headImg=new UIAsset();
			_headImg.x=18;
			_headImg.y=4;
			_skin.container.addChildAt(_headImg,1);
			_zhandouliEftContaner=new Inter3DContainer();
			_skin.container.addChildAt(_zhandouliEftContaner,1);
			_zhandouliEftContaner.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JIEMIAN_ZHANDOULI),160,55,0);
            // event
			
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateFight);//基本属性改变
			updateAll();
        }
		
		private function updateFight():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			this._skin.role_zhandouli.number = info.totalStat.getStatValue(CharAttributeType.FIGHTING);
			this._skin.role_name.text = info.name + " (" + info.totalStat.level +"级)";
		}
		
		private function updateAll():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
		
			this._skin.UI_bingjia.visible = JobEnum.ROLE_1_TYPE==info.job;
			this._skin.UI_mojia.visible = JobEnum.ROLE_2_TYPE==info.job||JobEnum.ROLE_3_TYPE==info.job;
			this._skin.UI_yijia.visible = JobEnum.ROLE_4_TYPE==info.job;
			//styleName = "ui/mainui/head/zhiye/bingjia.png";
			switch(info.job){
				case JobEnum.ROLE_1_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_1;
					break;
				case JobEnum.ROLE_2_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_2;
					break;
				case JobEnum.ROLE_3_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_3;
					break;
				case JobEnum.ROLE_4_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_4;
					break;
			}
			
			updateFight();
		}
		
        public function resize(w : int, h : int) : void {
            this.x = 0;
            this.y = 29;//28;
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
                case this._headImg:
                    SceneRoleSelectManager.selectedRole = MainRoleManager.actor;
                    break;
            }
        }
        
        // private
        private function showPKMode(target : DisplayObject) : void {
            
        }
    }
}
