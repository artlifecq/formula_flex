package com.rpgGame.app.ui.main.smallmap {
    import com.game.mainCore.core.timer.GameTimer;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.core.events.MapEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.TransCfgData;
    import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
    import com.rpgGame.coreData.cfg.npc.NpcCfgData;
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.coreData.info.map.SceneData;
    import com.rpgGame.coreData.role.MonsterBornData;
    
    import gs.TweenLite;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.map.map_Skin;
    
    import starling.display.DisplayObject;
    import starling.display.Shape;
    
    public class SmallMapBar extends SkinUI {
        private static const MAXMAPSCALE : Number = 1.50;
        private static const MINMAPSCALE : Number = 0.50;
        private static const STEPMAPSCALE : Number = 0.25;
        private var _skin : map_Skin;
        
        private var _initBgX : int;
        
        private var _gapDecX : int;
        private var _gapIncX : int;
        private var _gapMX : int;
        private var _gapWX : int;
        
        private var _tween : TweenLite;
        
        private var _smallMap : SmallMap;
        
        private var _timer : GameTimer;
        
        private var _mapScale : Number = 1;
        
        public function SmallMapBar() {
            this._skin = new map_Skin();
            super(this._skin);
            
            this._initBgX = this._skin.grp_cont.x;
            
            this._gapDecX = this._skin.btnDecrease.x - this._skin.grp_cont.x;
            this._gapIncX = this._skin.btnIncrease.x - this._skin.grp_cont.x;
            this._gapMX = this._skin.btnM.x - this._skin.grp_cont.x;
            this._gapWX = this._skin.btnWord.x - this._skin.grp_cont.x;
            
            this.initSmallMap();
            this.setState(true);
            this.startTimer();
            
            EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, this.onMapSwitchCompleteHandler);
        }
        
        public function resize(w : int, h : int) : void {
            this.y = 28;
            this.x = w - this._skin.width;
        }
        
        override protected function onShow():void {
            super.onShow();
            this.showSmallMap();
        }
        
        override protected function onTouchTarget(target:DisplayObject):void {
            switch (target) {
                case this._skin.btnClose:
                    this.setState(false);
                    break;
                case this._skin.btnOpen:
                    this.setState(true);
                    break;
                case this._skin.btnIncrease:
                    this.setMapScale(true);
                    break;
                case this._skin.btnDecrease:
                    this.setMapScale(false);
                    break;
            }
        }
        
        // event
        private function onMapSwitchCompleteHandler() : void {
            this.showSmallMap();
        }
        
        private function initSmallMap() : void {
            var mask : Shape = new Shape();
            mask.graphics.beginFill(0x00FF00);
            mask.graphics.drawRoundRect(0, 0, this._skin.UIMap.width, this._skin.UIMap.height, 5);
            mask.graphics.endFill();
            mask.x = this._skin.UIMap.x;
            mask.y = this._skin.UIMap.y;
            this._skin.grp_cont.addChildAt(mask, this._skin.grp_cont.getChildIndex(this._skin.UIMap) + 1);
            
            this._smallMap = new SmallMap(this, SmallMap.RadarMap, this._skin.UIMap.width, this._skin.UIMap.height, this._mapScale);
            this._smallMap.x = this._skin.UIMap.x;
            this._smallMap.y = this._skin.UIMap.y;
            this._skin.grp_cont.addChildAt(this._smallMap, this._skin.grp_cont.getChildIndex(this._skin.UIMap) + 1);
            this._smallMap.mask = mask;
			
			this._skin.lbLocation.width=110;
			this._skin.lbLocation.wordWrap=false;
        }
        
        private function setState(isOpen : Boolean) : void {
            if (this._tween) {
                this._tween.kill();
            }
            var targetX : int = isOpen ? this._initBgX : this._skin.width + this._initBgX;
            this._tween = TweenLite.to(this._skin.grp_cont, 0.5, {x : targetX, onUpdate : onUpdateDisplayObjectsPos});
            this._skin.btnClose.visible = isOpen;
            this._skin.btnOpen.visible = !isOpen;
        }
        
        private function onUpdateDisplayObjectsPos() : void {
            this._skin.btnDecrease.x = this._skin.grp_cont.x + this._gapDecX;
            this._skin.btnIncrease.x = this._skin.grp_cont.x + this._gapIncX;
            this._skin.btnM.x = this._skin.grp_cont.x + this._gapMX;
            this._skin.btnWord.x = this._skin.grp_cont.x + this._gapWX;
        }
        
        private function setMapScale(add : Boolean) : void {
            this._mapScale += STEPMAPSCALE * (add ? 1 : -1);
            if (this._mapScale < MINMAPSCALE) {
                this._mapScale = MINMAPSCALE;
            } else if (this._mapScale > MAXMAPSCALE) {
                this._mapScale = MAXMAPSCALE;
            }
            this._smallMap.mapScale = this._mapScale;
        }
        
        private function showSmallMap() : void {
            var sceneData : SceneData = MapDataManager.currentScene;
            if (null == sceneData) {
                return;
            }
            this._smallMap.showMap(sceneData.sceneId);
            this._smallMap.openRoad();
            var npcs : Vector.<MonsterBornData> = NpcCfgData.getSceneNpcDatas(sceneData.sceneId);
            var monsters : Array = MonsterDataManager.getSceneMonsterDatas(sceneData.sceneId);
            var transports : Array = TransCfgData.getSceneTransportDatas(sceneData.sceneId);
            this._smallMap.updataData(monsters, transports, npcs);
        }
        
        private function startTimer() : void {
            this._timer = new GameTimer("SmallMapBar", 500);
            this._timer.onUpdate = this.timerUpdate;
            this._timer.start();
        }
        
        private function timerUpdate() : void {
            if (MapDataManager.currentScene) {
                this._skin.lbName.text = MapDataManager.currentScene.name;
                this._skin.lbLocation.text = "(" + int(MainRoleManager.actor.position.x) + "," + Math.abs(int(MainRoleManager.actor.position.z)) + ")";
            }
            //this._smallMap.timerUpdate();
        }
    }
}
