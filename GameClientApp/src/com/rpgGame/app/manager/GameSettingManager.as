package com.rpgGame.app.manager
{
    import com.game.engine3D.vo.BaseObj3D;
    import com.game.engine3D.vo.BaseRole;
    import com.gameClient.utils.JSONUtil;
    import com.rpgGame.app.manager.role.MainRoleManager;
    import com.rpgGame.app.sender.HeroMiscSender;
    import com.rpgGame.core.events.GameSettingEvent;
    import com.rpgGame.core.manager.BGMManager;
    import com.rpgGame.coreData.enum.EnumCustomTagType;
    import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
    import com.rpgGame.coreData.role.BiaoCheData;
    import com.rpgGame.coreData.role.HeroData;
    import com.rpgGame.coreData.type.SceneCharType;
    
    import org.client.mainCore.ds.HashMap;
    import org.client.mainCore.manager.EventManager;

    public class GameSettingManager 
    {

        private static var _initedData:Boolean;
		/**
		 * 怪物 
		 */		
        public static var checkFiltrateGuaiWu:Boolean = false;
		/**
		 * 队伍 
		 */		
        public static var checkFiltrateDuiWu:Boolean = false;
		/**
		 * 家族
		 */		
        public static var checkFiltrateJiaZu:Boolean = false;
		/**
		 * 帮会 
		 */		
        public static var checkFiltrateBangHui:Boolean = false;
		/**
		 * 镖车 
		 */		
        public static var checkFiltrateBiaoChe:Boolean = false;
		/**
		 * 本国
		 */		
        public static var checkFiltrateBenGuo:Boolean = false;

		private static var gameSetObj:Object;
		private static var gameSetHash:HashMap;

        public static function initData(dataStr:String):void
        {
			gameSetObj  = JSONUtil.decode(dataStr);
            _initedData = true;
        }

        public static function setup():void
        {
            var soundSetData:Object = null;
            var displaySetData:Object = null;
            if (_initedData)
            {
				soundSetData = getSoundSet();
				displaySetData = getDisplaySet();
				
                BGMManager.initProtoC(soundSetData);
                DisplaySetUpManager.applySetting(displaySetData);
//                FunctionSetManager.applySetting(_local1);
            }
        }

        public static function isInitedData():Boolean
        {
            return _initedData;
        }

        public static function getGameSet():Object
        {
            return gameSetObj || (gameSetObj = new Object());
        }

        public static function getSoundSet():Object
        {
            var soundSetObj:Object = getGameSet();
            if (soundSetObj.soundSet == null)
            {
				soundSetObj.soundSet = new Object();
                BGMManager.defaultSetting();
				soundSetObj.soundSet.openSound = BGMManager.soundMute;
				soundSetObj.soundSet.openMusic = BGMManager.musicMute;
				soundSetObj.soundSet.soundVolume = BGMManager.soundVolume;
				soundSetObj.soundSet.musicVolume = BGMManager.musicVolume;
            }
            return soundSetObj.soundSet;
        }

        public static function getDisplaySet():Object
        {
            var displaySetObject:Object = getGameSet();
            if (displaySetObject.dispaySet == null)
            {
				displaySetObject.dispaySet = new Object();
                DisplaySetUpManager.defaultSetting();
				displaySetObject.dispaySet.quality = DisplaySetUpManager.configLevel;
				displaySetObject.dispaySet.antiAlias = DisplaySetUpManager.viewAntiAlias;
				displaySetObject.dispaySet.displayLevel = DisplaySetUpManager.displayLevel;
				displaySetObject.dispaySet.shadowLevel = DisplaySetUpManager.shadowLevel;
				displaySetObject.dispaySet.openPhantom = DisplaySetUpManager.openPhantom;
				displaySetObject.dispaySet.openBlendPass = DisplaySetUpManager.openBlend;
				displaySetObject.dispaySet.openHeightEffect = DisplaySetUpManager.openHeightEffect;
				displaySetObject.dispaySet.openHeat = DisplaySetUpManager.openHeat;
				displaySetObject.dispaySet.openGlow = DisplaySetUpManager.openGlow;
				displaySetObject.dispaySet.filterQuality = DisplaySetUpManager.filterQuality;
            }
            return displaySetObject.dispaySet;
        }

		/**
		 * 保存数据到服务器上去 
		 * @param map
		 * 
		 */		
        public static function savaMainToServer(map:HashMap):void
        {
			var data :Array = [];
			var values :Array = map.getValues();
			var vo :ShortcutsData;
			for each ( vo in values ) 
			{
				data.push( {t :vo.type , mid :vo.id , k :vo.shortcutPos,bind:vo.itemBind} );
			}
			HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SYSTEM_SET , JSONUtil.encode(data));
        }

        public static function filtrateAll():void
        {
            checkFiltrateGuaiWu = true;
            checkFiltrateDuiWu = true;
            checkFiltrateJiaZu = true;
            checkFiltrateBangHui = true;
            checkFiltrateBiaoChe = true;
            checkFiltrateBenGuo = true;
            EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
        }

        public static function unfiltrateAll():void
        {
            checkFiltrateGuaiWu = false;
            checkFiltrateDuiWu = false;
            checkFiltrateJiaZu = false;
            checkFiltrateBangHui = false;
            checkFiltrateBiaoChe = false;
            checkFiltrateBenGuo = false;
            EventManager.dispatchEvent(GameSettingEvent.FILTRATE_UPDATE);
        }

        public static function viewFilter(baseObj:BaseObj3D):Boolean
        {
            if (baseObj is BaseRole)
            {
                if (!BaseRole(baseObj).isMainChar && !BaseRole(baseObj).isMainCamouflage)
                {
                    if (baseObj.type == SceneCharType.PLAYER)
                    {
                        if (checkFiltrateBenGuo && HeroData(baseObj.data).countryId == MainRoleManager.actorInfo.countryId)
                        {
                            return false;
                        }
                        if (checkFiltrateDuiWu && Mgr.teamMgr.isInMyTeam(HeroData(baseObj.data).serverID))
                        {
                            return false;
                        }
                        if (checkFiltrateJiaZu && HeroData(baseObj.data).societyName == MainRoleManager.actorInfo.societyName)
                        {
                            return false;
                        }
                        if (checkFiltrateBangHui && HeroData(baseObj.data).guildName == MainRoleManager.actorInfo.guildName)
                        {
                            return false;
                        }
                    }
                    else if (baseObj.type == SceneCharType.BIAO_CHE)
					{
						if (checkFiltrateBiaoChe && BiaoCheData(baseObj.data).countryId == MainRoleManager.actorInfo.countryId)
						{
							return false;
						}
					}
					else if (baseObj.type == SceneCharType.MONSTER)
					{
						return !checkFiltrateGuaiWu;
					}
                }
            }
            return true;
        }
    }
}