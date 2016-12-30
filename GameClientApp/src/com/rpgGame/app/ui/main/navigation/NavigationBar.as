package com.rpgGame.app.ui.main.navigation {
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.ui.SkinUI;
    
    import gameEngine2D.NetDebug;
    
    import gs.TweenLite;
    
    import org.mokylin.skin.mainui.navigation.navigation_main_Skin;
    
    import starling.display.DisplayObject;
    
    public class NavigationBar extends SkinUI {
        private var _skin : navigation_main_Skin;
        
        private var _tween : TweenLite;
        
        private var _normalN1X : int;
        private var _normalN1W : int;
        private var _gapN1X : int;
        private var _gapN2X : int;
        private var _gapN3X : int;
        private var _gapN4X : int;
        private var _gapN5X : int;
        private var _gapN6X : int;
        
        public function NavigationBar() {
            this._skin = new navigation_main_Skin();
            super(this._skin);
            
            this._gapN1X = this._skin.btn_n1.x;
            this._gapN2X = this._skin.btn_n2.x - this._skin.btn_n1.x;
            this._gapN3X = this._skin.btn_n3.x - this._skin.btn_n1.x;
            this._gapN4X = this._skin.btn_n4.x - this._skin.btn_n1.x;
            this._gapN5X = this._skin.btn_n5.x - this._skin.btn_n1.x;
            this._gapN6X = this._skin.btn_n6.x - this._skin.btn_n1.x;
            this.setState(true);
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
                case this._skin.btn_n2:
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
            this._tween = TweenLite.to(this._skin.btn_n1, 0.5, {x : targetX, onUpdate : onUpdateDisplayObjectsPos});
            this._skin.btn_close.visible = isOpen;
            this._skin.btn_open.visible = !isOpen;
        }
        
        private function onUpdateDisplayObjectsPos() : void {
            this._skin.btn_n2.x = this._skin.btn_n1.x + this._gapN2X;
            this._skin.btn_n3.x = this._skin.btn_n1.x + this._gapN3X;
            this._skin.btn_n4.x = this._skin.btn_n1.x + this._gapN4X;
            this._skin.btn_n5.x = this._skin.btn_n1.x + this._gapN5X;
            this._skin.btn_n6.x = this._skin.btn_n1.x + this._gapN6X;
        }
    }
}