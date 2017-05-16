package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.coreData.cfg.LanguageConfig;

    public class ActivityGuoZhanButton extends ActivityButton 
    {
        override protected function dynamicTips():Array
        {
            var _local1:String = LanguageConfig.getText("COUNTRY_WAR_ICON_TIPS");
            return [_local1];
        }
    }
}