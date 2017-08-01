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
            var _local3 = null;
            var _local2 = null;
            var _local1 = null;
            if (_initedData)
            {
                _local3 = getSoundSetProtoC();
                _local2 = getDisplaySetProtoC();
                _local1 = getFunctionSetProtoC();
                FunctionSetManager.defaultSetting();
                BGMManager.applySetting(_local3);
                DisplaySetUpManager.applySetting(_local2);
                FunctionSetManager.applySetting(_local1);
            }
        }

        public static function isInitedData():Boolean
        {
            return _initedData;
        }

        public static function getGameSetProtoC():GameSetProtoC
        {
            return (((gameSetProtoC) || ((gameSetProtoC = new GameSetProtoC()))));
        }

        public static function getSoundSet():SoundSetProtoC
        {
            var _local1:GameSetProtoC = getGameSetProtoC();
            if (_local1.soundSet == null)
            {
                _local1.soundSet = new SoundSetProtoC();
                BGMManager.defaultSetting();
                _local1.soundSet.openSound = BGMManager.soundMute;
                _local1.soundSet.openMusic = BGMManager.musicMute;
                _local1.soundSet.soundVolume = BGMManager.soundVolume;
                _local1.soundSet.musicVolume = BGMManager.musicVolume;
            }
            return _local1.soundSet;
        }

        public static function getDisplaySet():DisplaySetProtoC
        {
            var _local1:GameSetProtoC = getGameSetProtoC();
            if (_local1.dispaySet == null)
            {
                _local1.dispaySet = new DisplaySetProtoC();
                DisplaySetUpManager.defaultSetting();
                _local1.dispaySet.quality = DisplaySetUpManager.configLevel;
                _local1.dispaySet.antiAlias = DisplaySetUpManager.viewAntiAlias;
                _local1.dispaySet.displayLevel = DisplaySetUpManager.displayLevel;
                _local1.dispaySet.shadowLevel = DisplaySetUpManager.shadowLevel;
                _local1.dispaySet.openPhantom = DisplaySetUpManager.openPhantom;
                _local1.dispaySet.openBlendPass = DisplaySetUpManager.openBlend;
                _local1.dispaySet.openHeightEffect = DisplaySetUpManager.openHeightEffect;
                _local1.dispaySet.openHeat = DisplaySetUpManager.openHeat;
                _local1.dispaySet.openGlow = DisplaySetUpManager.openGlow;
                _local1.dispaySet.filterQuality = DisplaySetUpManager.filterQuality;
            }
            return _local1.dispaySet;
        }

        public static function getFunctionSetProtoC():FunctionSetProtoC
        {
            var _local1:GameSet = getGameSetProtoC();
            if (_local1.functonSet == null)
            {
                _local1.functonSet = new FunctionSetProtoC();
                _local1.functonSet.showFamilyTitle = FunctionSetManager.showFamilyTitle;
                _local1.functonSet.showGuildTitle = FunctionSetManager.showGuildTitle;
                _local1.functonSet.showRoleTitle = FunctionSetManager.showRoleTitle;
            };
            return _local1.functonSet;
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