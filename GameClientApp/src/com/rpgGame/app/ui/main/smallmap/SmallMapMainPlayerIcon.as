package com.rpgGame.app.ui.main.smallmap {
    import com.game.engine3D.vo.map.ClientMapData;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.scene.SceneRole;
    
    import flash.geom.Point;
    
    import feathers.controls.UIAsset;
    
    import starling.display.Sprite;
    
    public class SmallMapMainPlayerIcon extends Sprite {
        private var _ico : UIAsset;
        private var _pos : Point;
        
        public function SmallMapMainPlayerIcon() {
            super();
            this._ico = new UIAsset();
            this._ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
            this._ico.styleName = "ui/mainui/map/jiantou.png";
            this._ico.x = -12;
            this._ico.y = -15;
            this.addChild(this._ico);
            this.touchable = false;
            this._pos = new Point(0, 0);
        }
        
        public function updatePos(point : Point) : void {
            if (null == point) {
                return;
            }
            if (this._pos.x == point.x && this._pos.y == point.y) {
                return;
            }
            var mapData : ClientMapData = SceneManager.clientMapData;
            if (null == mapData) {
                return;
            }
            this._pos.x = point.x;
            this._pos.y = point.y;
            this.x = point.x;
            this.y = point.y;
            var player : SceneRole = MainRoleManager.actor;
            var r : Number;
            r = player.rotationY;
            r += mapData.miniCorrectRoll;
            this.rotation = (r + 90) * Math.PI / 180;
        }
    }
}
