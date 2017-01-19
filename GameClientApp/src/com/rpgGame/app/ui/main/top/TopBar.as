package com.rpgGame.app.ui.main.top {
    import com.rpgGame.core.ui.SkinUI;
    
    import org.mokylin.skin.mainui.top.top_Right_Skin;
    
    public class TopBar extends SkinUI {
        private var _skin : top_Right_Skin;
		
        public function TopBar() {
            this._skin = new top_Right_Skin();
            super(this._skin);
        }
        
        public function resize(w : int, h : int) : void {
            this.y = 3;
            this.x = w - this._skin.width;
        }
    }
}