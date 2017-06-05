package com.rpgGame.app.scene.sync
{
    import com.game.engine3D.vo.IBaseObjSync;
    import com.rpgGame.app.manager.AreaMapManager;
    import com.rpgGame.app.scene.SceneRole;
    import com.game.engine3D.vo.map.ClientMapAreaData;
    import com.rpgGame.app.manager.AvatarManager;
    import com.rpgGame.app.manager.scene.SceneManager;
    import com.game.engine3D.vo.BaseObj3D;
    import flash.geom.Vector3D;

    public class HeroRoleSync implements IBaseObjSync 
    {


        public function syncInfo(initiator:BaseObj3D, position:Vector3D, rotation:Vector3D, visible:Boolean):void
        {
            var clientMapAreaData:ClientMapAreaData = AreaMapManager.getRoleInMapDataSwimArea(SceneRole(initiator));
            if (clientMapAreaData)
            {
                if (!SceneRole(initiator).isSwimming)
                {
                    SceneRole(initiator).isSwimming = true;
                    AvatarManager.callEquipmentChange(SceneRole(initiator));
                    SceneRole(initiator).clingGroundCalculate = null;
                    SceneRole(initiator).y = clientMapAreaData.depth;
                }
            }
            else
            {
                if (SceneRole(initiator).isSwimming)
                {
                    SceneRole(initiator).isSwimming = false;
                    AvatarManager.callEquipmentChange(SceneRole(initiator));
                    SceneRole(initiator).clingGroundCalculate = SceneManager.getScene().clingGround;
                }
            }
        }
    }
}