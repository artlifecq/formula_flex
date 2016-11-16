package com.game.engine2D.scene.layers {
    import com.game.engine2D.Scene;
    import com.game.engine2D.config.GlobalConfig2D;
    import com.game.engine2D.config.SceneConfig;
    import com.game.engine2D.scene.SceneCamera;
    import com.game.engine2D.scene.map.vo.MapZone2;
    import com.game.engine2D.utils.SceneUtil;
    import com.game.engine2D.utils.Transformer;
    import com.game.engine2D.vo.PoolContainer;
    import com.game.mainCore.libCore.utils.ZMath;

    import gameEngine2D.LRUCache;
    import gameEngine2D.NetDebug;
    
    import flash.geom.Point;
    import flash.utils.Dictionary;

    public class SceneZoneMapLayer2 extends PoolContainer {
        private static const ZONE_MAX_CACHE_X : int = 0;        // 最大zone格x范围
        private static const ZONE_MAX_CACHE_Y : int = 0;        // 最大zone格y范围
        private static const DISPOSE_GAP : int = 60 * 3;        // 销毁时间间隔
        private static const IS_QUEUE_DRAW : Boolean = true;    // 是否队列绘制
        private static const IS_IMMED_DISPOSE : Boolean = false;// 是否立即销毁
        private static const TIMEOUT : int = 20 * 1000;         // 超时时间
        private static const LOADCNT : int = 5;                 // 每帧加载个数
        
        private var _isStrongLoadMap : Boolean = false;         // 是否强制加载地图
        private var _isNeedSortMapZone : Boolean = true;        // 是否需要排序
        private var _scene : Scene;                             // 场景
        private var _camera : SceneCamera;                      // 场景摄像机
        private var _oldCameraPos : Point;                      // 旧的摄像机位置
        
        private var _mapZoneCache : LRUCache;                   // 区域块缓存
        private var _mapZoneWaitLoad : Dictionary;              // 区域块等待加载
        private var _mapZoneLoadList : Dictionary;              // 加载中队列
        private var _mapZoneDraw : Dictionary;                  // 渲染队列
        
        private var _loadList : Vector.<MapZone2> = new Vector.<MapZone2>();
        
        private var _cameraTilePoint : Point = new Point();
        private var _cameraZonePoint : Point = new Point();
        
        private var _cameraZone : MapZone2 = null;
        private var _oldMapZone : MapZone2 = new MapZone2();
        private var _curMapZone : MapZone2 = new MapZone2();
        
        private var _disposeTime : int = 0;                     // 最后销毁时间
        private var _disposeTick : int = 0;                     // 等待销毁
        
        
        public function SceneZoneMapLayer2(scene : Scene) {
            this._oldCameraPos = new Point(int.MAX_VALUE, int.MAX_VALUE);
            this._scene = scene;
            this._camera = scene.sceneCamera;
            
            this._mapZoneCache = new LRUCache(200);
            this._mapZoneWaitLoad = new Dictionary();
            this._mapZoneLoadList = new Dictionary();
            this._mapZoneDraw = new Dictionary();
        }
        
        public function run() : void {
            if (!this._scene.mapConfig) {
                this._isNeedSortMapZone = true;
                return;
            }
            // 队列加载
            this.queueLoad();
            // 队列渲染
            this.queueDraw();
            if (!this._isStrongLoadMap) {
                //var nowTime : int = GlobalConfig2D.nowTime;
                //var isTimeout : Boolean = nowTime - this._disposeTime > TIMEOUT;
                var isStop : Boolean = this._oldCameraPos.x == this._camera.posX &&
                                       this._oldCameraPos.y == this._camera.posY;
                if (isStop) {
                    return;
                }
                //if (isStop) {
                //    ++this._disposeTick;
                //    if (this._disposeTick > DISPOSE_GAP) {
                //        this._disposeTick = 0;
                //        this._disposeTime = nowTime;
                //        this.queueDispose();
                //    }
                //    return;
                //} else if (isTimeout) {
                //    this._disposeTick = 0;
                //    this._disposeTime = nowTime;
                //    this.queueDispose();
                //    return;
                //}
            }
            this._oldCameraPos.x = this._camera.posX;
            this._oldCameraPos.y = this._camera.posY;
            //this._disposeTick = 0;
            this.loadMap();
        }
        
        public override function dispose() : void {
            this._oldCameraPos = new Point(int.MAX_VALUE, int.MAX_VALUE);
            
            var key : String;
            // 移除缓存
            this._mapZoneCache.removeAll();
            // 等待队列
            for (key in this._mapZoneWaitLoad) {
                this._mapZoneWaitLoad[key].dispose();
                delete this._mapZoneWaitLoad[key];
            }
            // 加载队列
            for (key in this._mapZoneLoadList) {
                this._mapZoneLoadList[key].dispose();
                delete this._mapZoneLoadList[key];
            }
            // 渲染队列
            for (key in this._mapZoneDraw) {
                this._mapZoneDraw[key].dispose();
                delete this._mapZoneDraw[key];
            }
        }
        
        public function set isStrongLoadMap(value : Boolean) : void {
            this._isStrongLoadMap = value;
        }

        public function set strongLoadMap(value : Boolean) : void {
            this._isStrongLoadMap = value;
        }
        
        private function queueLoad() : void {
            var cnt : int = 0;
            if (this._isNeedSortMapZone) {
                this._isNeedSortMapZone = false;
            }
            var key : String;
            var filePath : String;
            for (key in this._mapZoneWaitLoad) {
                this._mapZoneLoadList[key] = this._mapZoneWaitLoad[key];
                filePath = this._scene.mapConfig.zoneMapUrl.replace("#", key);
                if (null != GlobalConfig2D.version) {
                    filePath = GlobalConfig2D.version(filePath);
                }
                this._mapZoneLoadList[key].load(filePath, 0, null, onMapZoneCompleteHandler);
                delete this._mapZoneWaitLoad[key];
                ++cnt;
                if (cnt > 5) {
                    break;
                }
            }
        }
        
        private function queueDraw() : void {
            var cnt : int = 0;
            for (var key : String in this._mapZoneDraw) {
                this._mapZoneDraw[key].draw();
                delete this._mapZoneDraw[key];
                ++cnt;
                if (cnt > 5) {
                    break;
                }
            }
        }
        
        private function queueDispose() : void {
            //var cnt : int = 0;
            //for (var key : String in this._mapZoneDispose) {
            //    if (this._mapZoneCache[key]) {
            //        trace();
            //    } else if (this._mapZoneDraw[key]) {
            //        trace();
            //    } else if (this._mapZoneLoadList[key]) {
            //        trace();
            //    } else if (this._mapZoneWaitLoad[key]) {
            //        trace();
            //    }
            //    this._mapZoneDispose[key].dispose();
            //    delete this._mapZoneDispose[key];
            //    ++cnt;
            //    if (cnt > 5) {
            //        break;
            //    }
            //}
        }
        
        private function loadMap() : void {
            this._cameraTilePoint.x = (this._camera.posX / SceneConfig.TILE_WIDTH) >> 0;
            this._cameraTilePoint.y = (this._camera.posY / SceneConfig.TILE_HEIGHT) >> 0;
            this._cameraZonePoint.x = (this._cameraTilePoint.x / SceneConfig.ZONE_SCALE_WIDTH) >> 0;
            this._cameraZonePoint.y = (this._cameraTilePoint.y / SceneConfig.ZONE_SCALE_HEIGHT) >> 0;
            this._curMapZone = getMapZone(this._cameraZonePoint.x, this._cameraZonePoint.y, this._curMapZone);
            if (MapZone2.STATE_INVALID == this._curMapZone.state) {
                return;
            }
            // 队列销毁
            this._cameraZone = this._curMapZone;
            if (this._isStrongLoadMap || 
                (this._oldMapZone.titleX != this._curMapZone.titleX ||
                 this._oldMapZone.titleY != this._curMapZone.titleY)) {
                if (this._isStrongLoadMap) {
                    this._isNeedSortMapZone = true;
                }
                this._isStrongLoadMap = false;
                
                var cameraZoneRangeX : int = this._camera.zoneRangeXY.x;
                var cameraZoneRangeY : int = this._camera.zoneRangeXY.y;
                var pa : Array = SceneUtil.findViewZonePoints(this._curMapZone.titleX,
                                                              this._curMapZone.titleY,
                                                              cameraZoneRangeX,
                                                              cameraZoneRangeY);
                var zoneMaxX : int = Math.ceil(this._scene.mapConfig.gridH / SceneConfig.ZONE_SCALE_WIDTH);
                var zoneMaxY : int = Math.ceil(this._scene.mapConfig.gridV / SceneConfig.ZONE_SCALE_HEIGHT);
                var key : String = null;
                var tempMapZone : MapZone2;
                var minX : int = pa[0].x - 2;
                var minY : int = pa[0].y - 2;
                var maxX : int = pa[pa.length - 1].x + 2;
                var maxY : int = pa[pa.length - 1].y + 2;
                // 移除缓存
                // 等待队列
                for (key in this._mapZoneWaitLoad) {
                    tempMapZone = this._mapZoneWaitLoad[key];
                    if (tempMapZone.titleX < minX || tempMapZone.titleY < minY ||
                        tempMapZone.titleX > maxX || tempMapZone.titleY > maxY) {
                        tempMapZone.dispose();
                        delete this._mapZoneWaitLoad[key];
                    }
                }
                // 加载队列
                for (key in this._mapZoneLoadList) {
                    tempMapZone = this._mapZoneLoadList[key];
                    if (tempMapZone.titleX < minX || tempMapZone.titleY < minY ||
                        tempMapZone.titleX > maxX || tempMapZone.titleY > maxY) {
                        this.addWaitDisposeList(tempMapZone);
                        delete this._mapZoneLoadList[key];
                    }
                }
                // 渲染队列
                for (key in this._mapZoneDraw) {
                    tempMapZone = this._mapZoneDraw[key];
                    if (tempMapZone.titleX < minX || tempMapZone.titleY < minY ||
                        tempMapZone.titleX > maxX || tempMapZone.titleY > maxY) {
                        delete this._mapZoneDraw[key];
                    }
                }
                for (var i : int = 0, len : int = pa.length; i < len; ++i) {
                    if (pa[i].x < 0 || pa[i].y < 0 || pa[i].x >= zoneMaxX || pa[i].y >= zoneMaxY) {
                        continue;
                    }
                    key = MapZone2.getKey(pa[i].x, pa[i].y);
                    do {
                        tempMapZone = this._mapZoneCache.get(key) as MapZone2;
                        if (null != tempMapZone) {
                            // 已经在缓存里
                            break;
                        }
                        tempMapZone = this._mapZoneDraw[key];
                        if (null != tempMapZone) {
                            // 已经在渲染队列里
                            break;
                        }
                        tempMapZone = this._mapZoneWaitLoad[key];
                        if (null != tempMapZone) {
                            // 已经在等待加载队列里
                            break;
                        }
                        tempMapZone = this._mapZoneLoadList[key];
                        if (null != tempMapZone) {
                            // 已经在加载队列里
                            break;
                        }
                        // 新结点 添加到等待队列
                        tempMapZone = this.getMapZone(pa[i].x, pa[i].y);
                        tempMapZone.setContainer(this, tempMapZone.piexlX, tempMapZone.piexlY);
                        this._mapZoneWaitLoad[key] = tempMapZone;
                    } while (0);
                }
            }
            this._oldMapZone.titleX = this._curMapZone.titleX;
            this._oldMapZone.titleY = this._curMapZone.titleY;
        }

        private function addWaitDisposeList(mapZone : MapZone2) : void {
            mapZone.waitDispose();
        }
        
        private function getMapZone(zoneX : int, zoneY : int, mapZone : MapZone2 = null) : MapZone2 {
            var h : int = Math.ceil(this._scene.mapConfig.gridH / SceneConfig.ZONE_SCALE_WIDTH);
            var v : int = Math.ceil(this._scene.mapConfig.gridV / SceneConfig.ZONE_SCALE_HEIGHT);
            if (zoneX < 0 || zoneY < 0 || zoneX >= h || zoneY >= v) {
                if (null != mapZone) {
                    mapZone.state = MapZone2.STATE_INVALID;
                }
                return mapZone;
            }
            var key : String = MapZone2.getKey(zoneX, zoneY);
            if (null == mapZone) {
                mapZone = new MapZone2();
            }
            mapZone.state = MapZone2.STATE_VALID;
            mapZone.titleX = zoneX;
            mapZone.titleY = zoneY;
            return mapZone;
        }
        
        private function sortOnMapZone(a : MapZone2, b : MapZone2) : int {
            if (null != this._cameraZone && MapZone2.STATE_INVALID != this._cameraZone.state) {
                var pa : int = ZMath.getDisSquare(a.piexlX, a.piexlY, this._cameraZone.piexlX, this._cameraZone.piexlY);
                var pb : int = ZMath.getDisSquare(b.piexlX, b.piexlY, this._cameraZone.piexlX, this._cameraZone.piexlY);
                if (pa > pb) {
                    return -1;
                } else if (pa < pb) {
                    return 1;
                }
            }
            return 0;
        }
        
        private function onMapZoneCompleteHandler(mapZone : MapZone2) : void {
            if (MapZone2.STATE_LOADED == mapZone.state) {
                // 加载完成
                this._mapZoneCache.put(mapZone.key, mapZone);
                this._mapZoneDraw[mapZone.key] = mapZone;
            } else {
                // 销毁
                mapZone.dispose();
                //this._mapZoneDispose[mapZone.key] = mapZone;
            }
            delete this._mapZoneLoadList[mapZone.key];
        }
    }
}
