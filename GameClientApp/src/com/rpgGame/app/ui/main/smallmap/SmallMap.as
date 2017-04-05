package com.rpgGame.app.ui.main.smallmap
{
    import com.game.engine3D.display.InterObject3D;
    import com.game.engine3D.manager.SceneMapDataManager;
    import com.game.engine3D.utils.MathUtil;
    import com.game.engine3D.vo.SceneMapData;
    import com.game.engine3D.vo.map.ClientMapData;
    import com.game.mainCore.core.controller.KeyController;
    import com.game.mainCore.core.timer.GameTimer;
    import com.gameClient.log.GameLog;
    import com.rpgGame.app.manager.input.KeyMoveManager;
    import com.rpgGame.app.manager.map.MapUnitDataManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.manager.scene.SceneSwitchManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.sender.SceneSender;
    import com.rpgGame.app.state.role.control.WalkMoveStateReference;
    import com.rpgGame.core.events.MapEvent;
    import com.rpgGame.core.events.UserMoveEvent;
    import com.rpgGame.core.manager.tips.TargetTipsMaker;
    import com.rpgGame.core.manager.tips.TipTargetManager;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.core.utils.MouseListenerUtil;
    import com.rpgGame.coreData.cfg.ClientConfig;
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.coreData.info.map.MapCountryMemeberInfo;
    import com.rpgGame.coreData.info.map.MapEmemyInfo;
    import com.rpgGame.coreData.info.map.MapFamilyMemberInfo;
    import com.rpgGame.coreData.info.map.MapIconType;
    import com.rpgGame.coreData.info.map.MapOfficerInfo;
    import com.rpgGame.coreData.info.map.MapTeamMemberInfo;
    import com.rpgGame.coreData.info.map.SceneData;
    import com.rpgGame.coreData.role.BaseEntityData;
    import com.rpgGame.coreData.role.MonsterBornData;
    import com.rpgGame.coreData.role.RoleData;
    import com.rpgGame.coreData.role.SceneTranportData;
    import com.rpgGame.coreData.type.EffectUrl;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Vector3D;
    import flash.ui.Keyboard;
    import flash.utils.getTimer;
    
    import gameEngine2D.NetDebug;
    
    import org.client.load.loader.multi.vo.LoadData;
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;
    
    import starling.core.Starling;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.events.TouchPhase;
    import starling.textures.IStarlingTexture;
    
    /**
     * 小地图
     * @author Wing
     * @modifier L.L.M.Sunny
     * 修改时间：2016-06-02 下午3:05:12
     */
    public class SmallMap extends Sprite
    {
        //-----------------------------类型
        /** 雷达小地图、主界面上**/
        public static const RadarMap : int = 1;
        /** 寻路小地图 ，世界地图里**/
        public static const MiniMap : int = 2;
        //----------------------------------
        private static const POINT_DIS : int = 10;
        
        private var _roadOpend : Boolean = false;
        /**最底层容器**/
        private var baseSpr : Sprite;
        /**缩略图**/
        private var thumbnaiSpr : Sprite;
        private var thumbnaiImage : Image;
        /**玩家**/
        private var playerSpr : Sprite;
        /**怪物**/
        private var monsterSpr : Sprite;
        /**官员**/
        private var officerSpr : Sprite;
        /**家族成员**/
        private var familySpr : Sprite;
        /**盟国成员**/
        private var bornCountrySpr : Sprite;
        /**敌国成员**/
        private var bornEnemySpr : Sprite;
        /**队友**/
        private var teamMemberSpr : Sprite;
        /**寻路的点**/
        private var pathSpr : Sprite;
        /**主角自己**/
        private var myselfSpr : Sprite;
        /**缩略图的类型**/
        private var thumbnailMapType : int;
        /**寻路的点图标**/
        private var pathIcoVect : Vector.<MapPathIcon>;
        /**自己的图标**/
        private var myIco : SmallMapMainPlayerIcon;
        /**格子缩放比例 **/
        private var scaleMapX : Number = 0;
        private var scaleMapY : Number = 0;
        /**地图绝对宽高 **/
        private var absMaxWidth : int = 0;
        private var absMaxHeight : int = 0;
        
        private var gTime : GameTimer;
        
        private var _miniMapPosDx : int = 0;
        private var _miniMapPosDy : int = 0;
        
        private var _thumbnailX : int = 0;
        private var _thumbnailY : int = 0;
        
        /**
         * 小地图缩放
         * @Sunny.L.L.M 20150728
         */
        private var _scale : Number = 1;
        private var _touchTime : int;
        /**记录画到地图上面最后一个点的位置*/
        private var _lastDrawPoint : Point;
        private var _lastDist : int;
        
        /**当前显示的地图编号*/
        private var _currentMapId : int;
        
        /**地图是否下载完成*/
        private var _isMapLoadComplete : Boolean;
        
        /**地图上面对象数据*/
        private var _fixMonsters : Array;
        private var _transports : Array;
        private var _npcs : Vector.<MonsterBornData>;
        private var _rootUI : SkinUI;
        private var _xunluPointEffect : InterObject3D;
        
        private var _miniMapWidth : int;
        private var _miniMapHeight : int;
        
        private var _lastPointPos : Point = new Point();
        private var _lastPath : Vector.<Vector3D> = null;
        /**玩家与怪物**/
        private var _moveIcoMap : HashMap = new HashMap();
        
        private var _officericons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
        private var _familyicons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
        private var _mapCountryMembericons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
        private var _enemyicons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
        private var _teammateicons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
        private var _bornMonsterVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        private var _transVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        private var _npcVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        private var _sceneMonsterVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        private var _scenePlayerMyCountryVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        private var _scenePlayerEnemyCountryVect : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>;
        
        private var _officerShow : Boolean = true;
        private var _familyMemberShow : Boolean = true;
        private var _countryMemberShow : Boolean = true;
        private var _enemyMemberShow : Boolean = true;
        private var _teammateShow : Boolean = true;
        private var _scenePlayerMyCountryShow : Boolean = true;
        private var _scenePlayerEnemyCountryShow : Boolean = true;
        
        public function SmallMap(rootUI : SkinUI, thumbMapType : int, miniMapWidth : int, miniMapHeight : int, scale : Number = 1)
        {
            _rootUI = rootUI;
            thumbnailMapType = thumbMapType;
            _miniMapWidth = miniMapWidth;
            _miniMapHeight = miniMapHeight;
            _scale = scale;
            _touchTime = 0;
            initPanel();
        }
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////                                         public
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        public function clearAll() : void
        {
            onClearPath();
            clearBornMonster();
            clearTrans();
            clearNpcs();
            
            clearMapIcons(_officericons);
            clearMapIcons(_familyicons);
            clearMapIcons(_mapCountryMembericons);
            clearMapIcons(_enemyicons);
            clearMapIcons(_teammateicons);
            
            clearMonsterAndPlayer();
            _sceneMonsterVect.length = 0;
            _scenePlayerMyCountryVect.length = 0;
            _scenePlayerEnemyCountryVect.length = 0;
            
            baseSpr.removeEventListener(TouchEvent.TOUCH, onMapTouch);
            Starling.current.nativeStage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onRightDown);
            Starling.current.nativeStage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        }
        
        /**
         * 显示小地图之前先加载配置数据，再加载地图位图数据
         * 分两步操作进行
         */
        private var _sceneMapData : SceneMapData;
        
        public function showMap(mapId : int) : void
        {
            clearAll();
            var senceData : SceneData = MapDataManager.getMapInfo(_currentMapId);
            if (senceData)
            {
                var mapUrl : String = ClientConfig.getMap(senceData.map);
                if (_sceneMapData)
                {
                    SceneMapDataManager.removeMapData(this, mapUrl, onMapDataComplete, onMapDataFaild);
                    SceneMapDataManager.removeMiniMap(mapUrl, onLoadBitmapDataComplete, onMapDataFaild);
                    SceneMapDataManager.removeRadarMap(mapUrl, onLoadBitmapDataComplete, onMapDataFaild);
                    _sceneMapData = null;
                }
            }
            
            _isMapLoadComplete = false;
            _currentMapId = mapId;
            var point : Point = this.parent.localToGlobal(new Point(this.x, this.y));
            var rootPoint : Point = _rootUI.parent ? _rootUI.parent.localToGlobal(new Point(_rootUI.x, _rootUI.y)) : new Point(0, 0);
            _thumbnailX = point.x - rootPoint.x;
            _thumbnailY = point.y - rootPoint.y;
            
            senceData = MapDataManager.getMapInfo(_currentMapId);
            if (senceData)
            {
                mapUrl = ClientConfig.getMap(senceData.map);
                var mapName : String = ClientConfig.getMapName(senceData.map);
                var mapDataName : String = ClientConfig.getMapDataName();
                _sceneMapData = SceneMapDataManager.addMapData(this, mapName, mapUrl + "/" + mapDataName, onMapDataComplete, onMapDataFaild);
            }
            
            baseSpr.addEventListener(TouchEvent.TOUCH, onMapTouch);
            Starling.current.nativeStage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, onRightDown);
            Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        }
        
        public function showMapUnitType(value : int) : void
        {
            var units : Vector.<SmallMapRoleIcon>;
            switch (value)
            {
                case MapIconType.BORN_OFFICER:
                    units = _officericons;
                    _officerShow = true;
                    break;
                case MapIconType.BORN_FAMILY:
                    units = _familyicons;
                    _familyMemberShow = true;
                    break;
                case MapIconType.BORN_COUNTRY_MEMBER:
                    units = _mapCountryMembericons;
                    _countryMemberShow = true;
                    break;
                case MapIconType.BORN_ENEMY_MEMBER:
                    units = _enemyicons;
                    _enemyMemberShow = true;
                    break;
                case MapIconType.BORN_TEAMMATE:
                    units = _teammateicons;
                    _teammateShow = true;
                    break;
                case MapIconType.SCENE_PLAYER_MY_COUNTRY:
                    units = _scenePlayerMyCountryVect;
                    _scenePlayerMyCountryShow = true;
                    break;
                case MapIconType.SCENE_PLAYER_ENEMY_COUNTRY:
                    units = _scenePlayerEnemyCountryVect;
                    _scenePlayerEnemyCountryShow = true;
                    break;
            }
            
            if (units)
            {
                for (var i : int = 0; i < units.length; i++)
                {
                    units[i].visible = true;
                }
            }
        }
        
        public function hideMapUnitType(value : int) : void
        {
            var units : Vector.<SmallMapRoleIcon>;
            switch (value)
            {
                case MapIconType.BORN_OFFICER:
                    units = _officericons;
                    _officerShow = false;
                    break;
                case MapIconType.BORN_FAMILY:
                    units = _familyicons;
                    _familyMemberShow = false;
                    break;
                case MapIconType.BORN_COUNTRY_MEMBER:
                    units = _mapCountryMembericons;
                    _countryMemberShow = false;
                    break;
                case MapIconType.BORN_ENEMY_MEMBER:
                    units = _enemyicons;
                    _enemyMemberShow = false;
                    break;
                case MapIconType.BORN_TEAMMATE:
                    units = _teammateicons;
                    _teammateShow = false;
                    break;
                case MapIconType.SCENE_PLAYER_MY_COUNTRY:
                    units = _scenePlayerMyCountryVect;
                    _scenePlayerMyCountryShow = false;
                    break;
                case MapIconType.SCENE_PLAYER_ENEMY_COUNTRY:
                    units = _scenePlayerEnemyCountryVect;
                    _scenePlayerEnemyCountryShow = false;
                    break;
            }
            
            if (units)
            {
                for (var i : int = 0; i < units.length; i++)
                {
                    units[i].visible = false;
                }
            }
        }
        
        private function onMapDataComplete(sceneMapData : SceneMapData) : void
        {
            if (sceneMapData.miniMapData)
            {
                onLoadBitmapDataComplete(sceneMapData);
            }
            else
            {
                var senceData : SceneData = MapDataManager.getMapInfo(_currentMapId);
                var mapUrl : String = ClientConfig.getMap(senceData.map);
                var mapName : String = ClientConfig.getMapName(senceData.map);
                if (isRadarMap)
                {
                    var radarMapName : String = ClientConfig.getRadarMapName(sceneMapData.clientMapData.radarMapRes);
                    SceneMapDataManager.addRadarMap(mapName, mapUrl + "_2d/" + radarMapName, sceneMapData.clientMapData.radarMapRect, onLoadBitmapDataComplete, onMapDataFaild);
                }
                else
                {
                    var miniMapName : String = ClientConfig.getMiniMapName(sceneMapData.clientMapData.miniMapRes);
                    SceneMapDataManager.addMiniMap(mapName, mapUrl + "_2d/" + miniMapName, sceneMapData.clientMapData.miniMapRect, onLoadBitmapDataComplete, onMapDataFaild);
                }
            }
        }
        
        private function onLoadBitmapDataComplete(sceneMapData : SceneMapData) : void
        {
            var texture : IStarlingTexture = isRadarMap ? sceneMapData.radarMapTexture : sceneMapData.miniMapTexture;
            absMaxWidth = sceneMapData.clientMapData.boundMaxX;
            absMaxHeight = sceneMapData.clientMapData.boundMaxY;
            if (!texture)
            {
                return;
            }
            _isMapLoadComplete = true;
            updateMiniMap(texture);
        }
        
        private function onMapDataFaild(sceneMapData : SceneMapData) : void
        {
        }
        
        public function updataData(fixMonsters : Array, transports : Array, npcs : Vector.<MonsterBornData>) : void
        {
            _fixMonsters = fixMonsters;
            _transports = transports;
            _npcs = npcs;
            
            updateBornMonster();
            updateTrans();
            updateNpcs();
        }
        
        /**
         * 对外提供寻路接口，寻到面板上面的像素点
         * @param pos
         */
        public function moveTo(pos : Point) : void
        {
            //			var pos2D:Point = getChangeMapToScene(pos.x, pos.y);
            onFindPath(pos);
        }
        
        /**
         * 是否是当前场景的小地图
         * @return
         */
        public function get isInCurrentMap() : Boolean
        {
            return _currentMapId == SceneSwitchManager.currentMapId;
        }
        
        /**
         * 是否是雷达小地图
         * @return
         */
        public function get isRadarMap() : Boolean
        {
            return RadarMap == thumbnailMapType;
        }
        
        /**
         * 开启寻路路径的绘制
         */
        public function openRoad() : void
        {
            _roadOpend = true;
            EventManager.addEvent(UserMoveEvent.MOVE_START, onDrawPath);
            EventManager.addEvent(UserMoveEvent.MOVE_END, onClearPath);
            
            EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_ADD, updateMoveIco);
            EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, updateMoveIco);
            EventManager.addEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE, updateRemoveIco);
            
            myIco.visible = true;
            if (gTime == null)
            {
                gTime = new GameTimer("Thumbnail" + thumbnailMapType, 100, 0, onUpdate);
            }
            gTime.start();
            onDrawPath();
            updateGraphic();
        }
        
        /**
         * 关闭寻路路径的绘制
         */
        public function closeRoad() : void
        {
            _roadOpend = false;
            EventManager.removeEvent(UserMoveEvent.MOVE_START, onDrawPath);
            EventManager.removeEvent(UserMoveEvent.MOVE_END, onClearPath);
            
            EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_ADD, updateMoveIco);
            EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_MOVE, updateMoveIco);
            EventManager.removeEvent(MapEvent.UPDATE_MAP_ROLE_REMOVE, updateRemoveIco);
            
            if (gTime != null)
            {
                gTime.stop();
            }
            
            _lastPath = null;
            myIco.visible = false;
            onClearPath();
        }
        
        /**
         * 清除路线
         */
        public function onClearPath() : void
        {
            while (pathIcoVect.length > 0)
            {
                pathIcoVect[0].removeMyself();
                SmallMapUtil.putMapIco(pathIcoVect.shift());
            }
            if (_xunluPointEffect)
            {
                _rootUI.removeChild3D(_xunluPointEffect);
                _xunluPointEffect = null;
            }
            _lastPointPos.setTo(0, 0);
        }
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////                                         private
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private function initPanel() : void
        {
            baseSpr = new Sprite();
            addChild(baseSpr);
            
            thumbnaiSpr = new Sprite();
            baseSpr.addChild(thumbnaiSpr);
            
            //显示顺序，不要随意调整！！！
            monsterSpr = new Sprite();
            baseSpr.addChild(monsterSpr);
            
            bornCountrySpr = new Sprite();
            baseSpr.addChild(bornCountrySpr);
            
            bornEnemySpr = new Sprite();
            baseSpr.addChild(bornEnemySpr);
            
            playerSpr = new Sprite();
            baseSpr.addChild(playerSpr);
            
            teamMemberSpr = new Sprite();
            baseSpr.addChild(teamMemberSpr);
            
            familySpr = new Sprite();
            baseSpr.addChild(familySpr);
            
            officerSpr = new Sprite();
            baseSpr.addChild(officerSpr);
            
            pathSpr = new Sprite();
            baseSpr.addChild(pathSpr);
            
            myselfSpr = new Sprite();
            baseSpr.addChild(myselfSpr);
            
            pathIcoVect = new Vector.<MapPathIcon>();
            myIco = new SmallMapMainPlayerIcon();
            myselfSpr.addChild(myIco);
            myIco.visible = false;
            
            TipTargetManager.show(thumbnaiSpr, TargetTipsMaker.makeSimpleTextTips("$,$", null, getMouseScenePos));
            MouseListenerUtil.addEventListener(baseSpr, null, onMouseOver, onMouseOut);
        }
        
        private function onUpdate() : void
        {
            updateMyselfPos();
            updataMapUnits();
        }
        
        private function onMapLoadFaild(ld : LoadData, e : Event) : void
        {
            GameLog.add("加载地图失败  " + ld.url);
        }
        
        private function updateMiniMap(texture : IStarlingTexture) : void
        {
            if (thumbnaiImage != null && thumbnaiImage.parent != null)
            {
                thumbnaiSpr.removeChild(thumbnaiImage);
                thumbnaiImage.dispose();
                thumbnaiImage = null;
            }
            thumbnaiImage = new Image(texture);
            
            thumbnaiSpr.addChild(thumbnaiImage);
            
            if (isRadarMap)
            {
                thumbnaiImage.alpha = 1; //0.5;
            }
            else
            {
                thumbnaiImage.alpha = 1;
            }
            
            _isMapLoadComplete = true;
            updateGraphic();
        }
        
        private function updateGraphic() : void
        {
            if (!thumbnaiSpr || !thumbnaiImage)
                return;
            thumbnaiSpr.scaleX = thumbnaiSpr.scaleY = _scale;
            
            scaleMapX = (thumbnaiImage.width / absMaxWidth) * _scale;
            scaleMapY = (thumbnaiImage.height / absMaxHeight) * _scale;
            
            if (isRadarMap)
            {
                scrollRadarMap();
            }
            updateBornMonster();
            updateTrans();
            updateNpcs();
            updatePlayerAndMonster();
            
            updateMyselfPos();
            updataMapUnits();
            updateDrawPath();
        }
        
        /**
         * 更新自己的位置
         */
        private function updateMyselfPos() : void
        {
            if (!_isMapLoadComplete || !_roadOpend)
            {
                return;
            }
            var player : SceneRole = MainRoleManager.actor;
            if (player == null)
                return;
            myIco.updatePos(getChangeSceneToMap(player.position));
            
            if (isRadarMap)
            {
                scrollRadarMap();
            }
            
            shiftPointFromMap();
        }
        
        /**
         * 画线
         * @param path
         * @author 卢国征  2015-4-28
         */
        private function onDrawPath() : void
        {
            if (MainRoleManager.actor == null)
                return;
            if (KeyMoveManager.getInstance().keyMoving)
            {
                _lastPath = null;
            }
            else
            {
                //寻找镖车的引导路线，在大地图显示不出来的bug（bug单号：31241）2016-08-26-陈鹉光改
                var ref : WalkMoveStateReference;
                var camouflageEntity : SceneRole = MainRoleManager.actor.getCamouflageEntity() as SceneRole;
                if (camouflageEntity)
                    ref = camouflageEntity.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
                else
                    ref = MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
                _lastPath = (ref && ref.path) ? ref.path : null;
            }
            updateDrawPath();
        }
        
        private function updateDrawPath() : void
        {
            if (!_isMapLoadComplete || !_roadOpend)
            {
                return;
            }
            onClearPath();
            if (_lastPath == null)
                return;
            
            var beforePoint : Vector3D = MainRoleManager.actor.position;
            
            _lastDrawPoint = getChangeSceneToMap(beforePoint);
            drawPointOnMiniMap(_lastDrawPoint);
            
            var pos3D : Vector3D;
            var len : int = _lastPath.length;
            var pixNextPos : Point;
            for (var i : int = 0; i < len; i++)
            {
                pos3D = _lastPath[i];
                pixNextPos = getChangeSceneToMap(pos3D);
                _lastDist = int.MAX_VALUE;
                addPointOnPaths(_lastDrawPoint, pixNextPos);
            }
            if (pixNextPos)
            {
                _lastPointPos.setTo(pixNextPos.x, pixNextPos.y);
                if (!_xunluPointEffect)
                {
                    _xunluPointEffect = _rootUI.playInter3DAt(ClientConfig.getEffect(EffectUrl.XUN_LU_END_POINT_EFFECT), 0, 0, 0);
                }
                updateXunluPoint();
            }
        }
        
        private function updateXunluPoint() : void
        {
            if (_xunluPointEffect)
            {
                _xunluPointEffect.x = _lastPointPos.x + _thumbnailX + baseSpr.x;
                _xunluPointEffect.y = _lastPointPos.y + _thumbnailY + baseSpr.y;
                
                var canShow : Boolean = false;
                if (_xunluPointEffect.x < _thumbnailX)
                {
                    canShow = false;
                }
                else if (_xunluPointEffect.x > _thumbnailX + _miniMapWidth)
                {
                    canShow = false;
                }
                else if (_xunluPointEffect.y < _thumbnailY)
                {
                    canShow = false;
                }
                else if (_xunluPointEffect.y > _thumbnailY + _miniMapHeight)
                {
                    canShow = false;
                }
                else
                {
                    canShow = true;
                }
                _xunluPointEffect.visible = canShow;
            }
        }
        
        /**
         * 在两点之间填充连接点数据
         * @param lastPos
         * @param nextPos
         */
        private function addPointOnPaths(beforePos : Point, endPos : Point) : void
        {
            if (beforePos == null || endPos == null)
                return;
            var dx : Number = endPos.x - beforePos.x;
            var dy : Number = endPos.y - beforePos.y;
            var d : int = MathUtil.getDistance(beforePos.x, beforePos.y, endPos.x, endPos.y);
            if (d < _lastDist)
            {
                _lastDist = d;
            }
            if (_lastDist < d || d <= POINT_DIS)
            {
                _lastDrawPoint = beforePos;
                return;
            }
            
            var radians : Number = Math.atan2(dy, dx);
            var cos : Number = Math.cos(radians);
            var sin : Number = Math.sin(radians);
            
            _lastDrawPoint.x = beforePos.x + POINT_DIS * cos;
            _lastDrawPoint.y = beforePos.y + POINT_DIS * sin;
            
            drawPointOnMiniMap(_lastDrawPoint);
            addPointOnPaths(_lastDrawPoint, endPos);
        }
        
        /**
         * 往小地图上面画一个点
         * @param pos
         */
        private function drawPointOnMiniMap(pos : Point) : void
        {
            var pathIco : MapPathIcon = SmallMapUtil.getMapIco();
            pathIco.updatePos(pos);
            pathIcoVect.push(pathIco);
            pathSpr.addChild(pathIco);
        }
        
        private function shiftPointFromMap() : void
        {
            var myPos : Vector3D = MainRoleManager.actor.position;
            var myPos2D : Point = getChangeSceneToMap(myPos);
            while (pathIcoVect && pathIcoVect.length > 0)
            {
                var icon : MapPathIcon = pathIcoVect[0];
                var dx : Number = myPos2D.x - icon.x;
                var dy : Number = myPos2D.y - icon.y;
                var d : int = MathUtil.getDistance(icon.x, icon.y, myPos2D.x, myPos2D.y);
                
                if (d <= POINT_DIS)
                {
                    icon.removeMyself();
                    SmallMapUtil.putMapIco(pathIcoVect.shift());
                }
                else
                {
                    break;
                }
            }
        }
        
        /**
         * 点击开始寻路
         * @param event
         */
        private function onFindPath(pos2D : Point) : void
        {
            var mapID : int = SceneSwitchManager.currentMapId;
            MainRoleSearchPathManager.walkToScene(mapID, pos2D.x, pos2D.y);
        }
        
        /**
         * 显示当前坐标
         * @param event
         * @author 卢国征  2015-4-28
         */
        private function onMapTouch(e : TouchEvent) : void
        {
            e.stopPropagation();
            var pos : Point;
            var pos2D : Point
            var touch : Touch;
            touch = e.getTouch(baseSpr, TouchPhase.BEGAN);
            if (touch != null)
            {
                var currTime : int = getTimer();
                if (currTime - _touchTime < 200)
                    return;
                _touchTime = currTime;
                
                pos = touch.getLocation(baseSpr);
                pos2D = getChangeMapToScene(pos.x, pos.y);
                
                var baseRoleData : BaseEntityData = null;
                if (touch.target is SmallMapRoleIcon)
                {
                    baseRoleData = (touch.target as SmallMapRoleIcon).data;
                }
                MainRoleSearchPathManager.gotoTargetData.setData(_currentMapId, pos2D.x, pos2D.y, baseRoleData);
                onFindPath(pos2D);
            }
        }
        
        private var mouseIn : Boolean;
        
        private function onMouseOut() : void
        {
            mouseIn = false;
        }
        
        private function onMouseOver() : void
        {
            mouseIn = true;
        }
        
        /**
         * 鼠标右键单击则传送到目标点
         * @param event
         */
        private function onRightDown(event : MouseEvent) : void
        {
            var mousePoint : Point = baseSpr.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
            if (!baseSpr.hitTest(mousePoint) || !mouseIn)
                return;
            
            mousePoint = getChangeMapToScene(mousePoint.x, mousePoint.y);
            
            if (KeyController.instance.isKeyDown(Keyboard.CONTROL))
            {
                SceneSender.sceneMapTransport(SceneSwitchManager.currentMapId, mousePoint.x, mousePoint.y);
                return;
            }
        }
        /**记录当前鼠标经过的点*/
        private var curPosition : Array = [];
        
        private function onMouseMove(event : MouseEvent) : void
        {
            var mousePoint : Point = baseSpr.globalToLocal(new Point(Starling.current.nativeStage.mouseX, Starling.current.nativeStage.mouseY))
            if (!baseSpr.hitTest(mousePoint) || !mouseIn)
                return;
            
            mousePoint = getChangeMapToScene(mousePoint.x, mousePoint.y);
            curPosition[0] = int(mousePoint.x);
            curPosition[1] = int(mousePoint.y);
        }
        
        private function getMouseScenePos() : Array
        {
            return curPosition;
        }
        
        /**
         * 滚动雷达小地图
         */
        private function scrollRadarMap() : void
        {
            var player : SceneRole = MainRoleManager.actor;
            if (player == null)
                return;
            var position : Vector3D = player.position;
            if (position == null)
                return;
            ////	缩略图大小
            var thumbWith : Number = thumbnaiSpr.width;
            var thumbHeight : Number = thumbnaiSpr.height;
            
            var myMapPos : Point = getChangeSceneToMap(position);
            ////移动小地图
            moveMap(myMapPos.x, myMapPos.y, thumbWith, thumbHeight);
        }
        
        public function set mapScale(value : Number) : void
        {
            _scale = value;
            updateGraphic();
        }
        
        /**
         * 移动位置
         * @param posx
         * @param posy
         * @param mapWidth
         * @param mapHeight
         * @return
         * @author 卢国征  2015-4-28
         */
		protected function moveMap(posx : Number, posy : Number, mapWidth : Number, mapHeight : Number) : void
        {
            var halfW : int = int(_miniMapWidth * 0.5);
            var halfH : int = int(_miniMapHeight * 0.5);
            var mapX : int = halfW - posx;
            var mapY : int = halfH - posy;
            if (mapX > 0)
                mapX = 0;
            if (mapY > 0)
                mapY = 0;
            if (mapX < _miniMapWidth - mapWidth)
                mapX = _miniMapWidth - mapWidth;
            if (mapY < _miniMapHeight - mapHeight)
                mapY = _miniMapHeight - mapHeight;
            CONFIG::netDebug {
                var player : SceneRole = MainRoleManager.actor;
                var p : Vector3D = player.position;
//                NetDebug.LOG("[SmallMap] [moveRadarMap] playerPos:(" + p.x + "," + p.y + "," + p.z + ") " +
//                    "inSamllMapPos(" + posx + "," + posy + ") " +
//                    "mapPos(" + mapX + "," + mapY + ") " + 
//                    "mapWH(" + this._miniMapWidth + "," + this._miniMapHeight + ") " +
//                    "halfWH(" + halfW + "," + halfH + ") " +
//                    "absWH(" + this.absMaxWidth + "," + this.absMaxHeight + ")");
            }
            /////	设置缩略图位置
            baseSpr.x = mapX;
            baseSpr.y = mapY;
            updateXunluPoint();
        }
        
        /**
         * 检查位置是否过偏
         * @param value
         * @param maxValue
         * @return
         * @author 卢国征  2015-4-28
         */
        private function checkPos(value : Number, maxValue : Number, len : int) : Number
        {
            var curValue : Number = value - len;
            if (curValue < 0)
            {
                curValue = 0;
            }
            
            if (value + len >= maxValue)
            {
                curValue = maxValue - len;
            }
            return curValue;
        }
        
        //----------------------------------------------------
        /**
         * 得到转换坐标			小地图换算成场景上坐标
         * @param posx
         * @param posy
         * @return
         *
         */
        private function getChangeMapToScene(posx : int, posy : int) : Point
        {
            var mapData : ClientMapData = SceneManager.clientMapData;
            if (mapData == null)
                return null;
            
            //投射转换@L.L.M.Sunny 20150930 
            var offsetX : int = mapData.miniCorrectOffsetX * mapData.miniScaleX * this.scaleMapX;
            var offsetY : int = mapData.miniCorrectOffsetY * mapData.miniScaleY * this.scaleMapY;
            var tilt : Number = MathUtil.angleToRadian(mapData.miniCorrectTilt);
            var pan : Number = MathUtil.angleToRadian(mapData.miniCorrectPan);
            var roll : Number = MathUtil.angleToRadian(mapData.miniCorrectRoll);
            var pos : Point = MathUtil.backProjection(posx - offsetX, posy - offsetY, tilt, pan, roll);
            pos.x = pos.x / (mapData.miniScaleX * this.scaleMapX);
            pos.y = /*absMaxHeight*/ -pos.y / (mapData.miniScaleY * this.scaleMapY);
            return pos;
        }
        
        /**
         * 得到转换坐标			场景上坐标换算成小地图
         * @param posx
         * @param posy
         * @return
         *
         */
        private function getChangeSceneToMap(position : Vector3D) : Point
        {
            var mapData : ClientMapData = SceneManager.clientMapData;
            if (mapData == null)
                return new Point(0, 0);
            
            //投射转换@L.L.M.Sunny 20150930 
            var posx : int = position.x * mapData.miniScaleX * this.scaleMapX;
            var posy : int = -position.z/*(absMaxHeight - position.z)*/ * mapData.miniScaleY * this.scaleMapY;
            var tilt : Number = MathUtil.angleToRadian(mapData.miniCorrectTilt);
            var pan : Number = MathUtil.angleToRadian(mapData.miniCorrectPan);
            var roll : Number = MathUtil.angleToRadian(mapData.miniCorrectRoll);
            var pos : Point = MathUtil.projection(posx, posy, tilt, pan, roll);
            pos.x += mapData.miniCorrectOffsetX * mapData.miniScaleX * this.scaleMapX;
            pos.y += mapData.miniCorrectOffsetY * mapData.miniScaleY * this.scaleMapY;
            
            return pos;
        }
        
        private function updateBornMonster() : void
        {
            if (!_isMapLoadComplete)
            {
                return;
            }
            if (!_fixMonsters)
            {
                return;
            }
            var monsterArr : Array = _fixMonsters;
            var monsterData : MonsterBornData;
            var len : int = monsterArr.length;
            var monsters : Vector.<MonsterBornData> = new Vector.<MonsterBornData>();
            for (var i : int = 0; i < len; i++)
            {
                monsterData = monsterArr[i];
                if (monsterData.showInSmallMapType == 1)
                {
                    continue;
                }
                monsters.push(monsterData);
            }
            updateIcos(MapIconType.BORN_MONSTER, Vector.<BaseEntityData>(monsters), _bornMonsterVect);
        }
        
        private function clearBornMonster() : void
        {
            for (var i : int = _bornMonsterVect.length - 1; i >= 0; i--)
            {
                SmallMapUtil.putMapRoleIco(_bornMonsterVect[i]);
                _bornMonsterVect.splice(i, 1);
            }
        }
        
        private function updateTrans() : void
        {
            if (!_isMapLoadComplete)
            {
                return;
            }
            if (!_transports)
            {
                return;
            }
            var transferList : Array = _transports;
            var len : int = transferList.length;
            var transportData : SceneTranportData;
            var transports : Vector.<SceneTranportData> = new Vector.<SceneTranportData>();
            for (var i : int = 0; i < len; i++)
            {
                transportData = transferList[i];
                if (transportData.showInSmallMapType == 1)
                {
                    continue;
                }
                transports.push(transportData);
            }
            updateIcos(MapIconType.BORN_TRANPORTS, Vector.<BaseEntityData>(transports), _transVect);
        }
        
        private function clearTrans() : void
        {
            for (var i : int = _transVect.length - 1; i >= 0; i--)
            {
                SmallMapUtil.putMapRoleIco(_transVect[i]);
                _transVect.splice(i, 1);
            }
        }
        
        private function updateNpcs() : void
        {
            if (!_isMapLoadComplete)
            {
                return;
            }
            if (!_npcs)
            {
                return;
            }
            var npcList : Vector.<MonsterBornData> = _npcs;
            var len : int = npcList.length;
            var npcData : MonsterBornData;
            var npcs : Vector.<MonsterBornData> = new Vector.<MonsterBornData>();
			
            for (var i : int = 0; i < len; i++)
            {
                npcData = npcList[i];
                if (npcData.showInSmallMapType == 1)
                {
                    continue;
                }
                if (!npcData.smallMapIcon)
                {
                    continue;
                }
                npcs.push(npcData);
            }
			
            updateIcos(MapIconType.BORN_NPC, Vector.<BaseEntityData>(npcs), _npcVect);
        }
        
        private function clearNpcs() : void
        {
            for (var i : int = _npcVect.length - 1; i >= 0; i--)
            {
                SmallMapUtil.putMapRoleIco(_npcVect[i]);
                _npcVect.splice(i, 1);
            }
        }
        
        private function updatePlayerAndMonster() : void
        {
            if (!_isMapLoadComplete || !_roadOpend)
            {
                return;
            }
            var i : int;
            var len : int;
            var role : SceneRole;
            var roleList : Array = SceneManager.getScene().getSceneObjsByType(SceneCharType.MONSTER);
            if (roleList != null)
            {
                len = roleList.length;
                for (i = 0; i < len; i++)
                {
                    role = roleList[i];
                    updateMoveIco(role);
                }
            }
            
            roleList = SceneManager.getScene().getSceneObjsByType(SceneCharType.PLAYER);
            if (roleList != null)
            {
                len = roleList.length;
                for (i = 0; i < len; i++)
                {
                    role = roleList[i];
                    
                    if (role.id == MainRoleManager.actorInfo.id)
                        continue;
                    
                    updateMoveIco(role);
                }
            }
        }
        
        private function updateRemoveIcoByKey(key : String) : void
        {
            var ico : SmallMapRoleIcon = _moveIcoMap.remove(key);
            if (ico == null)
                return;
            var index : int;
            switch (ico.type)
            {
                case MapIconType.SCENE_MONSTER:
                    index = _sceneMonsterVect.indexOf(ico);
                    if (index > -1)
                        _sceneMonsterVect.splice(index, 1);
                    break;
                case MapIconType.SCENE_PLAYER_ENEMY_COUNTRY:
                    index = _scenePlayerEnemyCountryVect.indexOf(ico);
                    if (index > -1)
                        _scenePlayerEnemyCountryVect.splice(index, 1);
                    break;
                case MapIconType.SCENE_PLAYER_MY_COUNTRY:
                    index = _scenePlayerMyCountryVect.indexOf(ico);
                    if (index > -1)
                        _scenePlayerMyCountryVect.splice(index, 1);
                    break;
            }
            SmallMapUtil.putMapRoleIco(ico);
        }
        
        private function updateRemoveIco(type : int, id : Number) : void
        {
            updateRemoveIcoByKey(type + "_" + id);
        }
        
        protected function updateMoveIco(sceneRole : SceneRole) : void
        {
            if (sceneRole.isMainChar)
            {
                return;
            }
            if (sceneRole.type == SceneCharType.MONSTER || sceneRole.type == SceneCharType.PLAYER)
            {
                var ico : SmallMapRoleIcon = _moveIcoMap.getValue((sceneRole.data as RoleData).type + "_" + (sceneRole.data as RoleData).id);
                if (ico == null)
                {
                    ico = SmallMapUtil.getMapRoleIco();
                    _moveIcoMap.add((sceneRole.data as RoleData).type + "_" + (sceneRole.data as RoleData).id, ico);
                    
                    if (sceneRole.type == SceneCharType.MONSTER)
                    {
                        monsterSpr.addChild(ico);
                        ico.setData(MapIconType.SCENE_MONSTER, sceneRole.data as RoleData, sceneRole.x, sceneRole.z);
                        _sceneMonsterVect.push(ico);
                        ico.visible = true;
                    }
                    else if (sceneRole.type == SceneCharType.PLAYER)
                    {
                        playerSpr.addChild(ico);
                        ico.setData(MapIconType.SCENE_PLAYER_MY_COUNTRY, sceneRole.data as RoleData, sceneRole.x, sceneRole.z);
                        _scenePlayerMyCountryVect.push(ico);
                        ico.visible = _scenePlayerMyCountryShow;
                    }
                }
                ico.updatePos(getChangeSceneToMap(sceneRole.position));
            }
        }
        
        private function clearMonsterAndPlayer() : void
        {
            var ids : Array = _moveIcoMap.keys();
            for (var i : int = ids.length - 1; i >= 0; i--)
            {
                updateRemoveIcoByKey(ids[i]);
            }
        }
        
        private function updateIcos(type : int, datas : Vector.<BaseEntityData>, icons : Vector.<SmallMapRoleIcon>) : void
        {
            var pos3d : Vector3D = new Vector3D();
            var ruledOutIcons : Vector.<SmallMapRoleIcon> = new Vector.<SmallMapRoleIcon>();
            var len : int = icons.length;
            var ico : SmallMapRoleIcon;
            var index : int = 0;
            for (var i : int = 0; i < datas.length; i++)
            {
                var entityData : BaseEntityData = datas[i];
                if (entityData.id == MainRoleManager.actorID)
                {
                    continue;
                }
                pos3d.x = entityData.x;
                pos3d.z = entityData.y;
                if (index < len)
                {
                    ico = icons[index];
                }
                else
                {
                    ico = SmallMapUtil.getMapRoleIco();
                    ico.showText = !isRadarMap;
                    icons.push(ico);
                    switch (type)
                    {
                        case MapIconType.BORN_OFFICER:
                            officerSpr.addChild(ico);
                            break;
                        case MapIconType.BORN_FAMILY:
                            familySpr.addChild(ico);
                            break;
                        case MapIconType.BORN_COUNTRY_MEMBER:
                            bornCountrySpr.addChild(ico);
                            break;
                        case MapIconType.BORN_ENEMY_MEMBER:
                            bornEnemySpr.addChild(ico);
                            break;
                        case MapIconType.BORN_TEAMMATE:
                            teamMemberSpr.addChild(ico);
                            break;
                        default:
                            playerSpr.addChild(ico);
                    }
                }
                ico.setData(type, entityData, entityData.x, entityData.y);
                ico.updatePos(getChangeSceneToMap(pos3d));
                ruledOutIcons.push(ico);
                index++;
                
                switch (type)
                {
                    case MapIconType.BORN_OFFICER:
                        ico.visible = _officerShow;
                        break;
                    case MapIconType.BORN_FAMILY:
                        ico.visible = _familyMemberShow;
                        break;
                    case MapIconType.BORN_COUNTRY_MEMBER:
                        ico.visible = _countryMemberShow;
                        break;
                    case MapIconType.BORN_ENEMY_MEMBER:
                        ico.visible = _enemyMemberShow;
                        break;
                    case MapIconType.BORN_TEAMMATE:
                        ico.visible = _teammateShow;
                        break;
                    default:
                        ico.visible = true;
                }
            }
            clearMapIcons(icons, ruledOutIcons);
        }
        
        private function updataMapUnits() : void
        {
            if (!_isMapLoadComplete || !_roadOpend)
            {
                return;
            }
            //官员
            var officers : Vector.<MapOfficerInfo> = MapUnitDataManager.countryOfficers;
            updateIcos(MapIconType.BORN_OFFICER, Vector.<BaseEntityData>(officers), _officericons);
            //家族成员
            var familyes : Vector.<MapFamilyMemberInfo> = MapUnitDataManager.familyMembers;
            updateIcos(MapIconType.BORN_FAMILY, Vector.<BaseEntityData>(familyes), _familyicons);
            //盟国成员
            var countryers : Vector.<MapCountryMemeberInfo> = MapUnitDataManager.countryMembers;
            updateIcos(MapIconType.BORN_COUNTRY_MEMBER, Vector.<BaseEntityData>(countryers), _mapCountryMembericons);
            //敌国成员
            var enemyes : Vector.<MapEmemyInfo> = MapUnitDataManager.enemyMembers;
            updateIcos(MapIconType.BORN_ENEMY_MEMBER, Vector.<BaseEntityData>(enemyes), _enemyicons);
            //队友
            var teammates : Vector.<MapTeamMemberInfo> = MapUnitDataManager.myTeammates;
            updateIcos(MapIconType.BORN_TEAMMATE, Vector.<BaseEntityData>(teammates), _teammateicons);
        }
        
        /**
         * 清理一组点
         * @param icons
         */
        private function clearMapIcons(clearIcons : Vector.<SmallMapRoleIcon>, ruledOutIcons : Vector.<SmallMapRoleIcon> = null) : void
        {
            for (var i : int = clearIcons.length - 1; i >= 0; i--)
            {
                var ico : SmallMapRoleIcon = clearIcons[i];
                if (ruledOutIcons)
                {
                    var index : int = ruledOutIcons.indexOf(ico);
                    if (index < 0)
                    {
                        SmallMapUtil.putMapRoleIco(ico);
                        clearIcons.splice(i, 1);
                    }
                }
                else
                {
                    SmallMapUtil.putMapRoleIco(ico);
                    clearIcons.splice(i, 1);
                }
            }
        }
    }
}
