package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.coreData.cfg.country.CountryWarCfgData;
    import com.rpgGame.coreData.cfg.LanguageConfig;

    public class ActivityGuoZhanForeshowButton extends ActivityButton 
    {


        override protected function onTextRuning():String
        {
            var _local1:String = "";
            ui.txtTitle.htmlText = _local1;
            return (_local1);
        }

        override protected function onTextEnd(second:int):String
        {
            var _local2:String = "";
            ui.txtTitle.htmlText = _local2;
            return _local2;
        }

        override protected function dynamicTips():Array
        {
            var _local2:int = (CountryWarCfgData.startWarDurationWhenServerStart / 86400000) + 1;
            var _local1:int = _local2 - 1;
            var _local3:String = LanguageConfig.getText("COUNTRY_WAR_FORESHOW_TIPS", _local2, _local1);
            return [_local3];
        }
    }
}