package com.rpgGame.app.manager
{
    import com.game.engine3D.utils.MathUtil;
    import com.game.engine3D.vo.BaseObj3D;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.manager.role.SceneRoleSelectManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.rpgGame.app.state.role.RoleStateUtil;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import __AS3__.vec.Vector;

    public class TabManager 
    {
        private static var _tabRoleTypes:Array;
        private static var _selectRoleIndex:int;
        private static var _selectFlagRoleIndex:int;

        public static function init():void
        {
            _tabRoleTypes = [SceneCharType.PLAYER, SceneCharType.MONSTER, SceneCharType.NPC, SceneCharType.COLLECT, SceneCharType.DROP_GOODS];
            _selectRoleIndex = -1;
            _selectFlagRoleIndex = -1;
        }

        public static function selectNextRole():void
        {
            var sceneRole:SceneRole = null;
            var selectRole:SceneRole = null;
            var inViewSceneObjList:Vector.<SceneRole> = new Vector.<SceneRole>();
            var sceneObjList:Vector.<BaseObj3D> = SceneManager.getScene().sceneRenderLayer.baseObjList;
            for each (var sceneObj:BaseObj3D in sceneObjList)
            {
                if (_tabRoleTypes.indexOf(sceneObj.type) > -1)
                {
					sceneRole = SceneRole(sceneObj);
                    if (!sceneRole.isMainChar)
                    {
                        if (!sceneRole.isMainCamouflage)
                        {
                            if (!(SceneRole(sceneObj).type != SceneCharType.PLAYER && SceneRole(sceneObj).stateMachine.isDeadState))
                            {
                                if (RoleStateUtil.isTargetInMyEye(SceneRole(sceneObj)))
                                {
									inViewSceneObjList.push(SceneRole(sceneObj));
                                }
                            }
                        }
                    }
                }
            }
            if (inViewSceneObjList.length > 0)
            {
				inViewSceneObjList.sort(onSortNearestRole);
				selectRole = SceneRoleSelectManager.selectedRole;
                if (selectRole)
                {
                    _selectRoleIndex = inViewSceneObjList.indexOf(selectRole);
                }
                else
                {
                    _selectRoleIndex = -1;
                }
                _selectRoleIndex++;
                if (_selectRoleIndex >= inViewSceneObjList.length)
                {
                    _selectRoleIndex = 0;
                }
				selectRole = inViewSceneObjList[_selectRoleIndex];
                SceneRoleSelectManager.selectedRole = selectRole;
            }
            else
            {
                _selectRoleIndex = -1;
            }
        }

        public static function selectNextFlagRole():void
        {
            var sceneRole:SceneRole = null;
            var selectRole:SceneRole = null;
            var inViewSceneObjList:Vector.<SceneRole> = new Vector.<SceneRole>();
            var sceneObjList:Vector.<BaseObj3D> = SceneManager.getScene().sceneRenderLayer.baseObjList;
            for each (var sceneObj:BaseObj3D in sceneObjList)
            {
                if (_tabRoleTypes.indexOf(sceneObj.type) > -1)
                {
					sceneRole = SceneRole(sceneObj);
                    if (!sceneRole.isMainChar)
                    {
                        if (!sceneRole.isMainCamouflage)
                        {
                            if (SceneRole(sceneObj).type == SceneCharType.MONSTER)
                            {
                                if (SceneRole(sceneObj).stateMachine.isDeadState) continue;
//                                if (!MonsterData(sceneObj.data).focusKeyFlag) continue;
                            }
                            else
                            {
                                continue;
                            }
                            if (RoleStateUtil.isTargetInMyEye(SceneRole(sceneObj)))
                            {
								inViewSceneObjList.push(SceneRole(sceneObj));
                            }
                        }
                    }
                }
            }
            if (inViewSceneObjList.length > 0)
            {
				inViewSceneObjList.sort(onSortNearestRole);
				selectRole = SceneRoleSelectManager.selectedRole;
                if (selectRole)
                {
                    _selectFlagRoleIndex = inViewSceneObjList.indexOf(selectRole);
                }
                else
                {
                    _selectFlagRoleIndex = -1;
                }
                _selectFlagRoleIndex++;
                if (_selectFlagRoleIndex >= inViewSceneObjList.length)
                {
                    _selectFlagRoleIndex = 0;
                }
				selectRole = inViewSceneObjList[_selectFlagRoleIndex];
                SceneRoleSelectManager.selectedRole = selectRole;
            }
            else
            {
                _selectFlagRoleIndex = -1;
            }
        }

        private static function onSortNearestRole(roleA:SceneRole, roleB:SceneRole):int
        {
            var dis1:Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleA.x, roleA.z);
            var dis2:Number = MathUtil.getDistanceNoSqrt(MainRoleManager.actor.x, MainRoleManager.actor.z, roleB.x, roleB.z);
            if (dis1 > dis2)
            {
                return 1;
            }
            return -1;
        }
    }
}