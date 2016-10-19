package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	public class BiaoJuEvent
	{
		public function BiaoJuEvent()
		{
		}
		/**初始化镖局数据**/
		public static const BIAO_JU_DATA_INIT : uint = UNIQUEID.NEXT;
		/**充入本金成功了**/
		public static const RECHARGE_MONEY : uint=  UNIQUEID.NEXT;
		/**镖局开启、关闭了**/
		public static const OPEN_BIAO_JU : uint = UNIQUEID.NEXT;
		/**镖局log**/
		public static const BIAO_JU_LOG : uint = UNIQUEID.NEXT;
		/**镖局薪水平均分配**/
		public static const BIAO_JU_AUTO_FEN_PEI : uint = UNIQUEID.NEXT;
		/**镖局薪水分配的时候总额改变了**/
		public static const BIAO_JU_FEN_PEI_ALL_SILVER_CHANGE : uint = UNIQUEID.NEXT;
	}
}