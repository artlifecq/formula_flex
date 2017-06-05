package com.rpgGame.app.ui.main.activityBar.item
{
    import com.rpgGame.app.manager.FunctionOpenManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.events.MainPlayerEvent;
    
    import org.client.mainCore.manager.EventManager;

    public class ActivityButtonBoss extends ActivityButton 
    {

        private const SpacingSecondTime:int = 60;

        private var isShowEffect:Boolean = false;
        private var roleLevel:int = -1;
        private var notifyTimeHash:Object;
        private var notifyTimeRefreshHash:Object;
//        private var tip:BossIconTip;

        public function ActivityButtonBoss()
        {
            notifyTimeHash = {};
            notifyTimeRefreshHash = {};
            super();
//            EventManager.addEvent(BossWorldEvent.BOSS_REFRESH, boss_refresh);
//            EventManager.addEvent(BossWorldEvent.BOSS_TIME_NOTICE, boss_time_notice);
//            tip = new BossIconTip();
//            tip.x = 45;
//            tip.y = 37;
//            tip.touchable = false;
//            tip.visible = false;
//            addChild(tip);
        }

        public static function init():void
        {
            if (FunctionOpenManager.checkOpenBuyFunId(48))
            {
                showIcon();
            }
            else
            {
                EventManager.addEvent(MainPlayerEvent.OPEN_NEW_FUNCTION, newFunctionOpen);
            }
        }

        private static function showIcon():void
        {
            EventManager.dispatchEvent(ActivityEvent.OPEN_ACTIVITY, "Boss", SystemTimeManager.curtTm);
        }

        private static function newFunctionOpen(functionType:int):void
        {
            if (functionType == 48)
            {
                EventManager.removeEvent(MainPlayerEvent.OPEN_NEW_FUNCTION, newFunctionOpen);
                showIcon();
            }
        }


//        private function boss_refresh(bossInfo:SingleWorldBossInfo):void
//        {
//            this.isShowEffect = false;
//            this.tip.visible = false;
//            var _local3:int = (SystemTimeManager.curtTm / 1000);
//            var _local2:int = notifyTimeRefreshHash[bossInfo.config.isFixPos];
//            if ((_local3 - _local2) > 60)
//            {
//                notifyTimeRefreshHash[bossInfo.config.isFixPos] = _local3;
//                if (bossInfo.config.isFixPos)
//                {
//                    NoticeManager.showHint("BossWorld_KEY_101");
//                }
//                else
//                {
//                    NoticeManager.showHint("BossWorld_KEY_102");
//                }
//            }
//        }

//        private function boss_time_notice(bossInfo:SingleWorldBossInfo, duration:Number):void
//        {
//            var _local5 = null;
//            var _local6:int;
//            var _local7:MonsterDataProto = bossInfo.getMonsterDataProto();
//            var _local4:int = (SystemTimeManager.curtTm / 1000);
//            var _local3:int = notifyTimeHash[bossInfo.config.isFixPos];
//            if ((_local4 - _local3) > 60)
//            {
//                _local5 = TimeUtil.timeFormatCH((duration / 1000), 1, false);
//                _local6 = Math.ceil(((duration / 1000) / 60));
//                if ((((((_local6 == 5)) || ((_local6 == 3)))) || ((_local6 == 1))))
//                {
//                    notifyTimeHash[bossInfo.config.isFixPos] = _local4;
//                    if (bossInfo.config.isFixPos)
//                    {
//                        NoticeManager.showHint("BossWorld_KEY_103", [_local5]);
//                    }
//                    else
//                    {
//                        NoticeManager.showHint("BossWorld_KEY_104", [_local5]);
//                    }
//                }
//                this.isShowEffect = true;
//            }
//            if (bossInfo.config.isFixPos)
//            {
//                this.setTimeData(bossInfo.openTime, 0, 300000);
//            }
//        }

        override protected function onButtonClick():void
        {
            this.isShowEffect = false;
//            this.tip.visible = false;
            this.stopEffect();
        }
    }
}