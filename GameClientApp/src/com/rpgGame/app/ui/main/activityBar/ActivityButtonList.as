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
            skinConfig[102] = [ActivityButton, ButtonLunjian];
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
			
			
           /* var activityInfos:Array = ActivityBarCfgData.list;
			var i:int = 0;
            while (i < activityInfos.length)
            {
                info = activityInfos[i] as ActivityBarInfo;
                addActivityButtonBase(info);
                i++;
            }*/
            updatePosition();
        }

        private function onButtonClick(button:ActivityButtonBase):void
        {
            trace("点击了：" + button.title);
            switch (button.type)
            {
                case 102:
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
		
		private function getBtn(id:int):ActivityButtonBase
		{
			var data:ActivityBarInfo=ActivityBarCfgData.getActivityBarInfo(id);
			if(!data){
				return null;
			}
			var btnType:int=id;
			var skinCls:Class;
			var btnCls:Class;
			var btn:ActivityButtonBase = null;
			if (skinConfig[btnType] == undefined)
			{
				return null;
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
			btn.title = data.name;
			btn.setTips(null, data.name, data.name);
			btn.skin = skinCls;
			//					btn.setTimeData(data.openTime, data.duration, data.openTimeAdvance);
			btn.onClick = onButtonClick;
			return btn;
		}
		
        private function onOpenActivityGroup(id:int):void
        {
			var btn:ActivityButtonBase=getBtn(id);
			if(btn){
				this.addChild(btn);
				buttonList.push(btn);
			}
			updatePosition();
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

        private function getActivityType(activityType:String):ActivityButtonBase
        {
            return ActivityBarManager.buttonDics[activityType] as ActivityButtonBase;
        }

        private function updatePosition():void
        {
            buttonList.sortOn(["row","order"], 16);
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