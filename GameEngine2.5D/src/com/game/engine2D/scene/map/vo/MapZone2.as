package com.game.engine2D.scene.map.vo
{
    import com.game.engine2D.config.GlobalConfig2D;
    import com.game.engine2D.config.SceneConfig;
    import com.game.engine2D.core.AsyncByteTexture;
    import com.game.engine2D.interfaces.IZoneMesh;
    import com.game.engine2D.utils.MaterialUtils;
    import com.game.engine3D.manager.Stage3DLayerManager;

    import gameEngine2D.NetDebug;
    import gameEngine2D.IDispose;
    
    import away3d.containers.ObjectContainer3D;
    import away3d.entities.EntityLayerType;
    import away3d.entities.Mesh;
    import away3d.events.Event;
    import away3d.materials.TextureMaterial;

    public class MapZone2 implements IDispose {
        public static const STATE_INVALID : int = 0;    // 无效状态
        public static const STATE_VALID : int = 1;      // 有效状态
        public static const STATE_LOADING : int = 2;    // 加载中
        public static const STATE_LOADED : int = 3;     // 加载完毕
        public static const STATE_WAIT : int = 4;       // 等待
        public static const STATE_DRAW : int = 5;       // 渲染
        public static const STATE_CLEAR : int = 6;      // 销毁
        public static const STATE_WAIT_CLEAR : int = 7; // 等待销毁

        CONFIG::netDebug {
            //private static const STATE_DESC : Array = ["无效状态",
            //                                           "有效状态",
            //                                           "加载中",
            //                                           "加载完毕",
            //                                           "等待",
            //                                           "渲染",
            //                                           "销毁",
            //                                           "等待销毁"];
            private static const STATE_DESC : Array = ["INVALID",
                                                       "VALID",
                                                       "LOADING",
                                                       "LOADED",
                                                       "WAIT",
                                                       "DRAW",
                                                       "CLEAR",
                                                       "WAIT_CLEAR"];
        }
        
        private var _piexlX : Number = 0;               // 像素坐标X
        private var _piexlY : Number = 0;               // 像素坐标Y
        private var _titleX : int = 0;                  // 逻辑坐标X
        private var _titleY : int = 0;                  // 逻辑坐标Y
        
        private var _state : int = 1;                   // 状态
        
        private var _key : String = "";                 // key
        private var _completeHandler : Function = null; // 加载完成回调
        
        private var _mesh : IZoneMesh = null;
        private var _textureMaterial : TextureMaterial = null;
        private var _texture : AsyncByteTexture = null;
        
        public function MapZone2() {
            this._state = STATE_VALID;
        }
        
        public static function getKey(x : int, y : int) : String {
            return x + "_" + y;
        }
        
        public function setContainer(container : ObjectContainer3D, x : int, y : int) : void {
            if (null == this._mesh) {
                this._mesh = GlobalConfig2D.MapZoneClass["create"](null);
                this._mesh.width = SceneConfig.ZONE_WIDTH;
                this._mesh.height = SceneConfig.ZONE_HEIGHT;
                this._key = getKey(this._titleX, this._titleY);
                (this._mesh as Mesh).name = this._key;
            }
            if (container != this._mesh.parent) {
                container.addChild(this._mesh as Mesh);
            }
            this._mesh.x = x;
            this._mesh.y = y;
            this._mesh.z = -200;
            this._mesh.run();
            this._mesh.depth = -300;
            this._mesh.layerType = EntityLayerType.DEFAULT | EntityLayerType.POST_GLASS;
        }
        
        public function load(filePath : String, priority : int, userData : Object, cb : Function) : Boolean {
            if (STATE_VALID != this._state && STATE_CLEAR != this._state) {
                CONFIG::netDebug {
                    NetDebug.LOG("[MapZone] ", "[load] ", "key:", this._key, " 已经在加载中或者渲染中");
                }
                return false;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[MapZone] ", "[load] ", "key:", this._key, " state:", STATE_DESC[this._state]);
            }
            this._state = STATE_LOADING;
            this._completeHandler = cb;
            if (null == this._texture) {
                this._texture = new AsyncByteTexture(false);
                this._texture.addEventListener(Event.COMPLETE, onLoaderComplete);
            }
            this._texture.url = filePath;
            this._texture.userData = userData;
            this._texture.load(filePath);
            return true;
        }
        
        public function draw() : void {
            if (STATE_LOADED != this._state &&
                STATE_DRAW != this._state) {
                CONFIG::netDebug {
                    NetDebug.LOG("[MapZone] ", "[draw] ", "key:", this._key, " 已经还没加载完成或者已经销毁了");
                }
                return;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[MapZone] ", "[draw] ", "key:", this._key, " state:", STATE_DESC[this._state]);
            }
            this._state = STATE_DRAW;
            if (this._textureMaterial.texture) {
                this._textureMaterial.texture.getTextureForStage3D(Stage3DLayerManager.stage3DProxy);
            }
            this._mesh.material = this._textureMaterial;
            this._mesh.run();
        }

        public function waitDispose() : void {
            CONFIG::netDebug {
                NetDebug.LOG("[MapZone] ", "[wiatDispose] ", "key:", this._key, " state:", STATE_DESC[this._state]);
            }
            this._state = STATE_WAIT_CLEAR;
        }
        
        public function dispose() : void {
            CONFIG::netDebug {
                if (STATE_LOADING == this._state) {
                    NetDebug.LOG("[MapZone] ", "[dispose] ", "key:", this._key, " 还在加载中");
                }
            }
            if (this._mesh) {
                GlobalConfig2D.MapZoneClass["recycle"](this._mesh);
                this._mesh = null;
            }
            if (this._texture) {
                this._texture.removeEventListener(Event.COMPLETE, onLoaderComplete);
                this._texture.dispose();
                this._texture = null;
            }
            if (this._textureMaterial) {
                this._textureMaterial.dispose();
                this._textureMaterial = null;
            }
            this._completeHandler = null;
            CONFIG::netDebug {
                NetDebug.LOG("[MapZone] ", "[dispose] ", "key:", this._key, " state:", STATE_DESC[this._state]);
            }
            this._state = STATE_CLEAR;
        }
        
        private function onLoaderComplete(e : Event) : void {
            //this._texture.removeEventListener(Event.COMPLETE, onLoaderComplete);
            if (STATE_LOADING != this._state) {
                CONFIG::netDebug {
                    NetDebug.LOG("[MapZone] ", "[onLoaderComplete] ", "key:", this._key, " 已经不再加载中 当前状态:", STATE_DESC[this._state]);
                }
                if (null != this._completeHandler) {
                    this._completeHandler(this);
                }
                return;
            }
            CONFIG::netDebug {
                NetDebug.LOG("[MapZone] ", "[onLoaderComplete] ", "key:", this._key, " state:", STATE_DESC[this._state]);
            }
            this._state = STATE_LOADED;
            this._textureMaterial = MaterialUtils.getMaterialMapZoneByTexture(this._texture);
            if (null != this._completeHandler) {
                this._completeHandler(this);
            }
        }
        
        public function set piexlX(value : Number) : void {
            this._piexlX = value;
            this._titleX = value / SceneConfig.ZONE_WIDTH;
        }
        
        public function get piexlX() : Number {
            return this._piexlX;
        }
        
        public function set piexlY(value : Number) : void {
            this._piexlY = value;
            this._titleY = value / SceneConfig.ZONE_HEIGHT;
        }
        
        public function get piexlY() : Number {
            return this._piexlY;
        }
         
        public function set titleX(value : int) : void {
            this._titleX = value;
            this._piexlX = value * SceneConfig.ZONE_WIDTH;
        }
        
        public function get titleX() : int {
            return this._titleX;
        }
        
        public function set titleY(value : int) : void {
            this._titleY = value;
            this._piexlY = value * SceneConfig.ZONE_HEIGHT;
        }
        
        public function get titleY() : int {
            return this._titleY;
        }
        
        public function set state(value : int) : void {
            this._state = value;
        }
        
        public function get state() : int{
            return this._state;
        }
        
        public function get key() : String {
            return this._key;
        }
    }
}
