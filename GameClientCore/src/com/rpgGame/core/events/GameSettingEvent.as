package com.rpgGame.core.events
{
    import com.rpgGame.coreData.UNIQUEID;

    public class GameSettingEvent 
    {
        public static const SOUND_MUTE_ONE:int = UNIQUEID.NEXT;
        public static const SOUND_MUTE_ALL:int = UNIQUEID.NEXT;
        public static const FILTRATE_UPDATE:int = UNIQUEID.NEXT;
    }
}