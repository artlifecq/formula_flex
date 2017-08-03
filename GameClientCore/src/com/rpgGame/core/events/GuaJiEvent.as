package com.rpgGame.core.events
{
    import com.rpgGame.coreData.UNIQUEID;

    public class GuaJiEvent 
    {
        public static const SPELL_LIST_ADDED:int = UNIQUEID.NEXT;
        public static const SPELL_LIST_REMOVED:int = UNIQUEID.NEXT;
        public static const SPELL_LIST_CLEARED:int = UNIQUEID.NEXT;
        public static const HP_GOODS_ID_CHANGED:int = UNIQUEID.NEXT;
        public static const MP_GOODS_ID_CHANGED:int = UNIQUEID.NEXT;
    }
}