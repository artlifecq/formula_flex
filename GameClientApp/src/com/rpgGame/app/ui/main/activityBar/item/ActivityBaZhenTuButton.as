package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.coreData.info.MapDataManager;
    import com.rpgGame.app.manager.FunctionOpenManager;

    public class ActivityBaZhenTuButton extends ActivityButton 
    {
        override public function onActivityUpdate():Boolean
        {
            if (MapDataManager.currentScene && MapDataManager.currentScene.isNormalScene == false)
            {
                return false;
            }
            return true;
        }

        /*override public function checkCanOpen():Boolean
        {
            return FunctionOpenManager.clientFunctionIsOpen("BA_ZHEN_TU");
        }*/
    }
}