package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.WelfareManager;
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.utils.ReqLockUtil;
    import com.rpgGame.core.events.WelfareEvent;
    import com.rpgGame.coreData.cfg.LanguageConfig;
    import com.rpgGame.coreData.cfg.WelfareCfgData;
    import com.rpgGame.coreData.lang.LangSevenLogin;
    
    import org.client.mainCore.manager.EventManager;

    public class ActivityButtonSevenLogin extends ActivityButton 
    {

        private var isShowEffect:Boolean = false;

        public function ActivityButtonSevenLogin()
        {
            EventManager.addEvent(WelfareEvent.GET_PRIZE_SUCCESS, onGetPrizeSuccess);
            EventManager.addEvent(WelfareEvent.GET_STATUS_CHANGED, GetStatusChanged);
        }

        private function GetStatusChanged():void
        {
            var yes:Boolean;
            if (WelfareManager.loginDays.length < WelfareCfgData.loginPrizeCount)
            {
				yes = WelfareManager.isCanGetPrize();
                this.isShowEffect = yes;
                if (this.isShowEffect)
                {
                    this.playEffect();
                }
                if (!WelfareManager.isCanGetPrize())
                {
                    ui.txtTitle.htmlText = LanguageConfig.getText("SEVEN_LOGIN_NOT_GET");
                }
                else
                {
                    ui.txtTitle.htmlText = LanguageConfig.getText("SEVEN_LOGIN_GET");
                }
            }
        }

        private function onGetPrizeSuccess():void
        {
            if (!WelfareManager.isCanGetPrize())
            {
                this.isShowEffect = false;
                this.stopEffect();
                ui.txtTitle.htmlText = LanguageConfig.getText("SEVEN_LOGIN_NOT_GET");
            }
        }

        override protected function dynamicTips():Array
        {
            var tip:String = "";
            var loginDay:int = WelfareManager.loginDay;
            if (!WelfareManager.isCanGetPrize())
            {
				tip = LanguageConfig.getText(LangSevenLogin["ITEM_TIPS_EX" + loginDay]);
            }
            else
            {
				tip = LanguageConfig.getText(LangSevenLogin["ITEM_TIPS_" + loginDay]);
            }
            return [tip];
        }

        override protected function onButtonClick():void
        {
            var count:int;
            var remainDay:int;
            var index:int;
            if (WelfareManager.isCanGetPrize())
            {
                if (!ReqLockUtil.isReqLocked(11111111, true))
                {
					count = WelfareManager.loginDays.length;
					remainDay = WelfareManager.loginDay - count;
					index = 1;
                    while (index < remainDay + 1)
                    {
//                        WelfareSender.reqGetLoginPrize(count + index);
						index++;
                    }
                    ReqLockUtil.lockReq(11111111, 2000);
                }
            }
            else
            {
                NoticeManager.mouseFollowNotify(LanguageConfig.getText("SEVEN_LOGIN_FAIL_1"));
            }
        }

        override public function onActivityUpdate():Boolean
        {
            return MainRoleManager.actorInfo.totalStat.level >= 25 && WelfareManager.loginDays.length < WelfareCfgData.loginPrizeCount;
        }

        override protected function onTextStart(second:int):String
        {
            return "";
        }

        override protected function onTextRuning():String
        {
            return "";
        }

        override protected function onTextEnd(second:int):String
        {
            return "";
        }

        override protected function onTextColse():String
        {
            return "";
        }
    }
}