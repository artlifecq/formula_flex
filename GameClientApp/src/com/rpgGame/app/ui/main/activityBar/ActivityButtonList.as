package com.rpgGame.app.ui.main.activityBar
{
    import com.rpgGame.app.manager.chat.NoticeManager;
    import com.rpgGame.app.manager.hud.ActivityBarManager;
    import com.rpgGame.app.ui.main.activityBar.item.ActivityButton;
    import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
    import com.rpgGame.core.app.AppConstant;
    import com.rpgGame.core.app.AppManager;
    import com.rpgGame.core.events.ActivityEvent;
    import com.rpgGame.core.events.country.CountryEvent;
    import com.rpgGame.core.ui.SkinUI;
    import com.rpgGame.coreData.cfg.FuncionBarCfgData;
    import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
    
    import gs.TweenLite;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;
    import org.mokylin.skin.mainui.activityBar.button.ButtonLunjian;

    public class ActivityButtonList extends SkinUI 
    {

        private const SIZE_WIDTH:uint = 360;
        private const SIZE_HEIGHT:uint = 85;
        private const GRID_WIDTH:uint = 83;
        private const GRID_HEIGHT:uint = 80;
        private const ALIGN:String = "right";

        private var skinConfig:Object;
		private var rowMap:HashMap;

        public function ActivityButtonList()
        {
            skinConfig = {};
            super();
            graphics.clear();
            graphics.beginFill(0, 0.5);
            graphics.drawRect(0, 0, 360, 85);
            graphics.endFill();
            setup();
        }

        private function setup():void
        {
            var info:FunctionBarInfo;
			rowMap=new HashMap();
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
            updatePositionAll();
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
			var data:FunctionBarInfo=FuncionBarCfgData.getActivityBarInfo(id);
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
			btn.type = btnType;
			btn.order = data.order;
			btn.title = data.name;
			btn.row=data.row;
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
				var list:Array=rowMap.getValue(btn.row);
				if(!list){
					list=[];
					rowMap.add(btn.row,list);
				}
				list.push(btn);
				updatePositionList(list);
			}
        }
		
		private function updatePositionList(list:Array):void
		{
			var len:int;
			var btn:ActivityButtonBase;
			var rowY:int;
			list.sortOn(["row","order"], Array.NUMERIC);
			len=list.length;
			if(len>0){
				btn=list[0];
				rowY=btn.row*SIZE_HEIGHT;
			}
			for(var i:int=0;i<len;i++){
				btn=list[i];
				btn.y=rowY;
				btn.x=SIZE_WIDTH-GRID_WIDTH;
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
            }
        }

        private function getActivityType(activityType:String):ActivityButtonBase
        {
            return ActivityBarManager.buttonDics[activityType] as ActivityButtonBase;
        }

        private function updatePositionAll():void
        {
			var allRows:Array=rowMap.getValues();
			var num:int=allRows.length;
			var len:int;
			var btn:ActivityButtonBase;
			var rowY:int;
			for(var i:int=0;i<num;i++){
				var list:Array=allRows[i];
				list.sortOn(["row","order"], Array.NUMERIC);
				len=list.length;
				if(len>0){
					btn=list[0];
					rowY=btn.row*SIZE_HEIGHT;
				}
				for(var j:int=0;j<len;j++){
					btn=list[i];
					btn.y=rowY;
					btn.x=SIZE_WIDTH-GRID_WIDTH;
				}
			}
        }

        override protected function onShow():void
        {
			
        }

        override protected function onHide():void
        {
        }


        public function playEffect():void
        {
            /*var i:int = 0;
			var btn:ActivityButtonBase = null;
            while (i < buttonList.length)
            {
				btn = (buttonList[i] as ActivityButtonBase);
                if (btn.isHasEffect)
                {
					btn.playEffect();
                }
                i++;
            }*/
        }

        public function stopEffect():void
        {
           /* var i:int = 0;
            var btn:ActivityButtonBase = null;
            while (i < buttonList.length)
            {
				btn = (buttonList[i] as ActivityButtonBase);
                if (btn.isHasEffect)
                {
					btn.stopEffect();
                }
                i++;
            }*/
        }
    }
}