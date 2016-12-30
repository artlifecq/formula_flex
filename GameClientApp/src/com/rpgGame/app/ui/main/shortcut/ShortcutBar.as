package com.rpgGame.app.ui.main.shortcut {
    import com.rpgGame.core.ui.SkinUI;
    
    import gameEngine2D.NetDebug;
    
    import org.mokylin.skin.mainui.shortcut.shortcut_Skin;
    
    public class ShortcutBar extends SkinUI {
        private var _skin : shortcut_Skin;
        
        public function ShortcutBar() {
            this._skin = new shortcut_Skin();
            super(this._skin);
        }
        
        public function resize(w : int, h : int) : void {
            this.x = (w - this._skin.width) >> 1;
            this.y = h - this._skin.height;
            CONFIG::netDebug{
                NetDebug.LOG("[ShortcutBar] [resize] x:" + this.x + ", y:" + this.y + ", w:" + this._skin.width + ", h:" + this._skin.height);
            }
        }
    }
}