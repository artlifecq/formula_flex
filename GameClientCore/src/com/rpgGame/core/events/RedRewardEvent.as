package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class RedRewardEvent
	{
		/** 更新红包数量*/
		public static const UPDATA_COUNTINFO : int = UNIQUEID.NEXT;
		/** 更新红包领取信息*/
		public static const UPDATA_REDREWARDGETINFO : int = UNIQUEID.NEXT;
		/** 更新红包信息*/
		public static const UPDATA_REDREWARDINFO : int = UNIQUEID.NEXT;
		/** 更新红包状态列表*/
		public static const UPDATA_REDREWARDSTATES : int = UNIQUEID.NEXT;
		/** 更新红包领取列表*/
		public static const UPDATA_REDREWARDLOGS : int = UNIQUEID.NEXT;
		/** 更新红包月累计数量*/
		public static const UPDATA_REDREWARDMONTHCOUNT : int = UNIQUEID.NEXT;
	}
}