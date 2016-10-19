package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 * 御马场、奇兽苑事件 
	 * @author 陈鹉光
	 * 
	 */	
	public class YuMaQiShouEvent
	{
		/** 御马场弼马温活动开启时，全服广播 **/
		public static const YU_MA_QI_SHOU_ACTIVITY_BEGIN_EVENT:int = UNIQUEID.NEXT;
		/** 寻找弼马温位置成功 **/
		public static const YU_MA_QI_SHOU_BI_MA_WEN_POS_EVENT:int = UNIQUEID.NEXT;
		/** 御马场弼马温活动结束，关闭ui **/
		public static const YU_MA_QI_SHOU_ACTIVITY_BEGIN_END_EVENT:int = UNIQUEID.NEXT;
		
		public function YuMaQiShouEvent()
		{
		}
	}
}