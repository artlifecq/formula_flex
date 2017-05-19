package com.rpgGame.app.ui.main.activityBar
{
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.hud.ActivityBarManager;
    import com.rpgGame.app.manager.time.SystemTimeManager;
    import com.rpgGame.app.ui.main.activityBar.item.ActivityButton;
    import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.events.country.CountryEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.ActivityBarCfgData;
    import com.rpgGame.coreData.clientConfig.ActivityBarInfo;
    import com.rpgGame.coreData.type.activity.ActivityOpenStateType;
    import com.rpgGame.coreData.type.activity.ActivityType;
    
    import flash.geom.Point;
    
    import gs.TweenLite;
    
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.activityBar.button.ButtonLunjian;
    
    import utils.TimerServer;

    public class ActivityButtonList extends SkinUI 
    {

        private const SIZE_WIDTH:uint = 360;
        private const SIZE_HEIGHT:uint = 85;
        private const GRID_WIDTH:uint = 83;
        private const GRID_HEIGHT:uint = 80;
        private const ALIGN:String = "right";

        private var buttonList:Array;
        private var skinConfig:Object;

        public function ActivityButtonList()
        {
            buttonList = [];
            skinConfig = {};
            super();
            graphics.clear();
            graphics.beginFill(0, 0);
            graphics.drawRect(0, 0, 360, 85);
            graphics.endFill();
            setup();
        }

        private function setup():void
        {
            var info:ActivityBarInfo;
            EventManager.addEvent(ActivityEvent.OPEN_ACTIVITY, onOpenActivityGroup);
            EventManager.addEvent(ActivityEvent.CLOSE_ACTIVITY, onCloseActivityGroup);
//            skinConfig["Taoni"] = [ActivityTaoNiButton, ButtonTaoni];
            skinConfig[ActivityType.LUNJIAN] = [ActivityButton, ButtonLunjian];
//            skinConfig["Maze"] = [ActivityMazeButton, ButtonMaze];
//            skinConfig["BaZhenTu"] = [ActivityBaZhenTuButton, ButtonBazhentu];
//            skinConfig["YuMaChang"] = [ActivityYuMaChangButton, ButtonYuMaChang];
//            skinConfig["Beast"] = [ActivityBeastButton, ButtonBeast];
//            skinConfig["Riot"] = [ActivityRiotButton, ButtonRiot];
//            skinConfig["DaTi"] = [ActivityDaTiButton, ButtonDati];
//            skinConfig["HotSpring"] = [ActivityHotSpringButton, ButtonHotSpring];
//            skinConfig["CanBai"] = [ActivityWorshipButton, ButtonCanbai];
//            skinConfig["CountryWar"] = [ActivityGuoZhanButton, ButtonGuozhan];
//            skinConfig["CountryWarForeshow"] = [ActivityGuoZhanForeshowButton, ButtonGuozhan];
//            skinConfig["FamilyYunBiao"] = [ActivityButton, ButtonFaimlybiao];
//            skinConfig["Boss"] = [ActivityButtonBoss, ButtonBoss];
//            skinConfig["SevenLogin"] = [ActivityButtonSevenLogin, ButtonSevenLogin];
//            skinConfig["ShiLian"] = [ActivityShiLian, ButtonShiLian];
//            skinConfig["BecomeKing"] = [ActivityBecomeKing, ButtonBecomeKing];
//            skinConfig["QiShouYuan"] = [ActivityQiShouYuan, ButtonQishouyuan];
//            skinConfig["Activity"] = [ActivityDailyButton, ButtonActivity];
//            skinConfig["FamilyBoss"] = [ActivityFamilyBossButton, ButtonFamilyBoss];
//            skinConfig["DuoJing"] = [ActivityDuoJingButton, ButtonDuojing];
//            skinConfig["YunBiao"] = [ActivityYunBiaoButton, ButtonYunbiao];
//            skinConfig["LunTan"] = [ActivityLunTanButton, ButtonLuntan];
//            skinConfig["ExpShop"] = [ActivityExpShopButton, ButtonExpShop];
//            skinConfig["DiaoDui"] = [ActivityDiaoDuiButton, ButtonDiaodui];
			
			
            var activityInfos:Array = ActivityBarCfgData.list;
			var i:int = 0;
            while (i < activityInfos.length)
            {
                info = activityInfos[i] as ActivityBarInfo;
                addActivityButtonBase(info);
                i++;
            }
            updatePosition();
        }

        private function onButtonClick(button:ActivityButtonBase):void
        {
            trace("点击了：" + button.title);
            switch (button.type)
            {
                case ActivityType.LUNJIAN:
                    AppManager.showApp(AppConstant.SWORD_PANL);
                    return;
//                case "HotSpring":
//                    HotSpringManager.walkToActivityNpc();
//                    return;
//                case "Racing":
//                    AppManager.showApp(AppConstant.ACTIVITY_HALL_PANEL);
//                    return;
//                case "BaZhenTu":
//                    BaZhenTuManager.onActivityClick();
//                    return;
//                case "YuMaChang":
//                    MountManager.transBiMaWen();
//                    return;
//                case "QiShouYuan":
//                    YuMaQiShouManager.gotoQiShouYuan();
//                    return;
                case "Beast":
                    return;
                case "Riot":
                    return;
                case "DaTi":
                    AppManager.showAppNoHide(AppConstant.DA_TI_PANEL);
                    return;
                case "CanBai":
//                    CountryWarWorshipManager.walkToNpc();
                    return;
                case "CountryWar":
                    return;
                case "CountryWarForeshow":
                    return;
                case "Maze":
//                    MazeManager.showMazeAlertCall();
                    return;
                case "FamilyBoss":
                    AppManager.showAppNoHide(AppConstant.COUNTRY_PANEL);
                    EventManager.dispatchEvent(CountryEvent.COUNTRY_PANEL_TABBAR_SELECT, 3);
                    EventManager.dispatchEvent(CountryEvent.SOCIETY_ITEM_PANEL_SHOW_PAGE, 3);
                    return;
                case "FamilyYunBiao":
                    AppManager.showAppNoHide(AppConstant.COUNTRY_PANEL);
                    EventManager.dispatchEvent(CountryEvent.COUNTRY_PANEL_TABBAR_SELECT, 3);
                    EventManager.dispatchEvent(CountryEvent.SOCIETY_ITEM_PANEL_SHOW_PAGE, 4);
                    return;
                case "Boss":
//                    AppManager.showAppNoHide(AppConstant.BOSS_PANEL);
                    return;
                case "SevenLogin":
                    return;
                case "ShiLian":
//                    AppManager.showApp(AppConstant.SHI_LIAN_PANEL);
                    return;
                case "BecomeKing":
//                    AppManager.showApp(AppConstant.BECOME_KING_PANEL);
                    return;
                case "Activity":
//                    AppManager.showAppNoHide(AppConstant.ACTIVITY_PANEL);
                    return;
                case "DuoJing":
//                    TouJingManager.transToHuGuoSiNpc();
                    return;
                case "YunBiao":
//                    YunBiaoManager.transToAcceptBiaoNpc();
                    return;
                case "LunTan":
//                    HttpUtil.openURL(LanguageConfig.getText("WEN_TI_FAN_KUI_URL"));
                    return;
                case "ExpShop":
//                    AppManager.showApp(AppConstant.GRADE_SHOP_PANEL);
                    return;
                case "DiaoDui":
//                    AppManager.showApp(AppConstant.DIAO_DUI_ZHUI_GAN_TASK_PANEL);
                    return;
                default:
                    NoticeManager.showNotify("提示：该活动图标事件暂未开放！" + button.title);
                    return;
            }
        }

        private function onOpenActivityGroup(activityType:String, openTime:*=0, duration:int=0, openTimeAdvance:int=0, data:Object=null):void
        {
            var btn:ActivityButtonBase = getActivityType(activityType);
            if (btn != null)
            {
                TweenLite.killTweensOf(btn);
				btn.onActivityData(data);
				btn.setTimeData(openTime, duration, openTimeAdvance);
				btn.debugInfo();
                onTimeTick(true);
            }
        }

        private function onCloseActivityGroup(activityType:String):void
        {
            var btn:ActivityButtonBase = getActivityType(activityType);
            if (btn != null)
            {
                trace("活动关闭:" + btn.title);
                TweenLite.killTweensOf(btn);
				btn.clearTime();
                updatePosition();
            }
        }

        private function addActivityButtonBase(data:ActivityBarInfo):void
        {
            var btnType:String;
            var skinCls:Class;
            var btnCls:Class;
            var btn:ActivityButtonBase = null;
            if (data != null)
            {
				btnType = data.key;
                if (!(ActivityBarManager.buttonDics[btnType] is ActivityButtonBase))
                {
                    if (skinConfig[btnType] == undefined)
                    {
                        trace("#######错误提示：添加的活动类型（" + data.key + "--" + data.title + "）没有关联图标皮肤，请在setup中进行关联！#######"); //not popped
                        return;
                    }
					skinCls = (skinConfig[btnType][1] as Class);
					btnCls = skinConfig[btnType][0] as Class;
                    if (!btnCls)
                    {
						btnCls = ActivityButton;
                    }
					btn = new btnCls() as ActivityButtonBase;
					btn.visible = false;
					btn.type = btnType;
					btn.order = data.order;
					btn.title = data.title;
					btn.setTips(null, data.tipReady, data.tipRuning);
					btn.skin = skinCls;
					btn.setTimeData(data.openTime, data.duration, data.openTimeAdvance);
					btn.onClick = onButtonClick;
                    addChild(btn);
                    buttonList.push(btn);
                    ActivityBarManager.buttonDics[btnType] = btn;
                }
            }
        }

        private function getActivityType(activityType:String):ActivityButtonBase
        {
            return ActivityBarManager.buttonDics[activityType] as ActivityButtonBase;
        }

        private function updatePosition():void
        {
            var _local6:int;
            var _local8:int;
            var _local10:int;
            var btn:ActivityButtonBase = null;
            var _local7:int;
            var _local9:int;
            var _local4:Boolean;
            var _local11:int;
            buttonList.sortOn("order", 16);
            var _local2:int = -20;
            var _local3:int;
            var _local5:uint = (360 / (83 + _local2));
            _local6 = 0;
            _local8 = 0;
            _local10 = 0;
            while (_local10 < buttonList.length)
            {
				btn = (buttonList[_local10] as ActivityButtonBase);
                if (btn.visible != false)
                {
                    _local7 = 0;
                    _local9 = 0;
                    _local7 = ((360 - ((_local6 + 1) * (83 + _local2))) - 5);
                    _local9 = (_local8 * (80 + _local3));
                    if ((++_local6 % _local5) == 0)
                    {
                        _local6 = 0;
                        _local8++;
                    }
                    _local4 = false;
                    _local11 = Point.distance(new Point(btn.x, btn.y), new Point(_local7, _local9));
                    if (((_local4) && ((_local11 > (83 / 2)))))
                    {
                        TweenLite.killTweensOf(btn);
                        TweenLite.to(btn, 0.2, {
                            "x":_local7,
                            "y":_local9
                        });
                    }
                    else
                    {
						btn.x = _local7;
						btn.y = _local9;
                    }
                }
                _local10++;
            }
        }

        override protected function onShow():void
        {
            TimerServer.addLoop(onTimeTick, 1000);
            onTimeTick();
        }

        override protected function onHide():void
        {
            TimerServer.remove(onTimeTick);
        }

        private function onTimeTick(onChange:Boolean=false):void
        {
            var _local3:int;
            var _local2:ActivityButtonBase = null;
            var _local5:int;
            var _local4:Number = SystemTimeManager.curtTm;
            _local3 = 0;
            while (_local3 < buttonList.length)
            {
                _local2 = (buttonList[_local3] as ActivityButtonBase);
                _local5 = _local2.updateTime(_local4);
                if (_local5 == ActivityOpenStateType.CLOSE)
                {
                    if (_local2.visible != false)
                    {
                        onChange = true;
                        _local2.visible = false;
                        _local2.onActivityClose();
                        trace("活动关闭:" + _local2.title);
                    }
                }
                else
                {
                    if (_local2.visible != true)
                    {
                        if (_local2.checkCanOpen())
                        {
                            onChange = true;
                            _local2.visible = true;
                            _local2.onActivityOpen();
                            trace("活动开启:" + _local2.title);
                        }
                    }
                }
                _local3++;
            }
            if (onChange == true)
            {
                EventManager.dispatchEvent(ActivityEvent.SHOW_NEW_ACTIVITY_BUTTON, _local2.type);
                updatePosition();
            }
        }

        public function playEffect():void
        {
            var i:int = 0;
			var btn:ActivityButtonBase = null;
            while (i < buttonList.length)
            {
				btn = (buttonList[i] as ActivityButtonBase);
                if (btn.isHasEffect)
                {
					btn.playEffect();
                }
                i++;
            }
        }

        public function stopEffect():void
        {
            var i:int = 0;
            var btn:ActivityButtonBase = null;
            while (i < buttonList.length)
            {
				btn = (buttonList[i] as ActivityButtonBase);
                if (btn.isHasEffect)
                {
					btn.stopEffect();
                }
                i++;
            }
        }
    }
}