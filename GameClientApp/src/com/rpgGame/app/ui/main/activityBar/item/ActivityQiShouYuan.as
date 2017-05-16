package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;

    public class ActivityQiShouYuan extends ActivityButton 
    {
        override public function checkCanOpen():Boolean
        {
            return FunctionOpenManager.clientFunctionIsOpen("QI_SHOU_YUAN");
        }
    }
}