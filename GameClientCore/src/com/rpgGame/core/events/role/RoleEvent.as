package com.rpgGame.core.events.role
{
    import com.rpgGame.coreData.UNIQUEID;

    public class RoleEvent
    {
        // 金针更新事件
        public static const UPDATE_NEEDLE : int = UNIQUEID.NEXT;
		// 战旗更新事件
		public static const UPDATE_ZHANQI : int = UNIQUEID.NEXT;
		// 角色受伤事件
		public static const HURTED_ROLE:int=UNIQUEID.NEXT;
    }
}