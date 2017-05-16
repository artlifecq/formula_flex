package com.rpgGame.core.events
{
    import com.rpgGame.coreData.UNIQUEID;

    public class BossWorldEvent 
    {
        public static const BOSS_LIST_CHANGE:uint = UNIQUEID.NEXT;
        public static const BOSS_REFRESH:uint = UNIQUEID.NEXT;
        public static const BOSS_TIME_NOTICE:uint = UNIQUEID.NEXT;
    }
}