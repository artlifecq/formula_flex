package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class HintEvent
	{
		/** 右下角战斗信息显示区域   参数   msg:String **/
		public static const BATTLE_HINT : int = UNIQUEID.NEXT;
		/** 右下角传闻信息显示区域   参数   msg:String **/
		public static const BATTLE_CHUANWEN : int = UNIQUEID.NEXT;
	}
}