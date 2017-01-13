package com.rpgGame.app.ui.main.navigation {
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ClientConfig;
    
    import flash.utils.setInterval;
    
    import feathers.controls.Button;
    
    import gameEngine2D.NetDebug;
    
    import gs.TweenLite;
    import gs.easing.EaseLookup;
    import gs.easing.Elastic;
    import gs.easing.Expo;
    
    import org.mokylin.skin.mainui.navigation.navigation_main_Skin;
    
    import starling.display.DisplayObject;
    
    public class NavigationBar extends SkinUI {
        private var _skin : navigation_main_Skin;
        
        private var _tween : TweenLite;
        
        private var _normalN1X : int;
        private var _normalN1W : int;
        private var _gapN1X : int;
        
        public function NavigationBar() {
            this._skin = new navigation_main_Skin();
            super(this._skin);
            
            this._gapN1X = this._skin.btns.x;
			
			this._skin.btns.parent.setChildIndex(this._skin.btns,0);
            this.setState(true);
			
			
			if (!ClientConfig.isBanShu)
			{
				TipTargetManager.show(_skin.btn_juese, TargetTipsMaker.makeSimpleTextTips("人物<br/>快捷键：C"));
				TipTargetManager.show(_skin.btn_beibao, TargetTipsMaker.makeSimpleTextTips("背包<br/>快捷键：B"));
				TipTargetManager.show(_skin.btn_jineng, TargetTipsMaker.makeSimpleTextTips("技能<br/>快捷键：V"));
				TipTargetManager.show(_skin.btn_banghui, TargetTipsMaker.makeSimpleTextTips("队伍<br/>快捷键：P"));
				TipTargetManager.show(_skin.btn_shejiao, TargetTipsMaker.makeSimpleTextTips("社会<br/>快捷键：J"));
				TipTargetManager.show(_skin.btn_shangcheng, TargetTipsMaker.makeSimpleTextTips("商店<br/>快捷键：O"));
			}
			
        }
		
        
        public function resize(w : int, h : int) : void {
            this.x = w - this._skin.width;
            this.y = h - this._skin.height;
        }
        
        override protected function onTouchTarget(target : DisplayObject) : void {
            CONFIG::netDebug {
                NetDebug.LOG("[MainUI] [NavigationBar] [onTouchTarget] target:" + target.name);
            }
            switch (target) {
                case this._skin.btn_open:
                    // 打开
                    this.setState(true);
                    break;
                case this._skin.btn_close:
                    // 关闭
                    this.setState(false);
                    break;
                case this._skin.btn_beibao:
                    // 背包
                    AppManager.showApp(AppConstant.BACK_PACK_PANEL);
                    break;
            }
        }
        
        private function setState(isOpen : Boolean) : void {
            if (this._tween) {
                this._tween.kill();
            }
            var targetX : int = 0;
            if (isOpen) {
                targetX = this._gapN1X;
            } else {
                targetX = this.width + this._gapN1X;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[NavigationNar] [setState] isOpen:" + isOpen + ", targetX:" + targetX);
            }
            this._tween = TweenLite.to(this._skin.btns, 0.5, {x : targetX,ease:Expo.easeIn});
            this._skin.btn_close.visible = isOpen;
            this._skin.btn_open.visible = !isOpen;
        }
    }
}