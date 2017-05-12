package com.rpgGame.app.ui.main.top {
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.ui.SkinUI;
    
    import org.mokylin.skin.mainui.top.top_Right_Skin;
    
    import starling.display.DisplayObject;
    
    public class TopBar extends SkinUI {
        private var _skin : top_Right_Skin;
		
        public function TopBar() {
            this._skin = new top_Right_Skin();
            super(this._skin);
        }
		override protected function onTouchTarget(target : DisplayObject) : void {
			CONFIG::netDebug {
				NetDebug.LOG("[MainUI] [TopBar] [onTouchTarget] target:" + target.name);
			}
				switch(target)
				{
					case this._skin.btn_set:
						AppManager.showApp(AppConstant.SYSTEMSET_PANEL);
						break;
					case this._skin.btn_mail:
						AppManager.showApp(AppConstant.MAIL_PANEL);
						break;
				}
		}
        public function resize(w : int, h : int) : void {
            this.y = 3;
            this.x = w - this._skin.width;
        }
    }
}