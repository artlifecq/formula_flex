package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.coreData.info.MapDataManager;

    public class ActivityMazeButton extends ActivityButton 
    {
        override public function onActivityUpdate():Boolean
        {
            if (MapDataManager.currentScene && MapDataManager.currentScene.isNormalScene == false)
            {
                return false;
            }
            return true;
        }
    }
}