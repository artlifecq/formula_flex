package com.rpgGame.core.events.country
{
	import com.rpgGame.coreData.UNIQUEID;

	public class CountryEvent
	{
		/**国家历史记录更新*/
		public static const COUNTRY_HISTORY_RECORDS_UPDATE : int = UNIQUEID.NEXT;
		/**国库记录更新*/
		public static const COUNTRY_EXCHEQUER_RECORDS_UPDATE : int = UNIQUEID.NEXT;
		/**本国官员列表更新*/
		public static const COUNTRY_OFFICE_UPDATE : int = UNIQUEID.NEXT;
		/**国家信息变更*/
		public static const COUNTRY_INFO_CHANGE : int = UNIQUEID.NEXT;
		/**他国信息变更*/
		public static const COUNTRY_OTHER_COUNTRY_INFO_CHANGE : int = UNIQUEID.NEXT;
		/**自己国家移民*/
		public static const COUNTRY_SELF_TRANSFER_COUNTRY : int = UNIQUEID.NEXT;
		/**国家移民*/
		public static const COUNTRY_TRANSFER_COUNTRY : int = UNIQUEID.NEXT;
		/**国家国库变更*/
		public static const COUNTRY_EXCHEQUER_CHANGE : int = UNIQUEID.NEXT;
		/**结盟状态改变**/
		public static const COUNTRY_UNION_STATE_CHANGE : int = UNIQUEID.NEXT;
		/**军费补贴数据改变**/
		public static const COUNTRY_MILITARY_CHANGE : int = UNIQUEID.NEXT;
		/**禁卫军申请更新**/
		public static const COUNTRY_JIN_WEI_APPLICANT_UPDATE : int = UNIQUEID.NEXT;
		/**禁卫军设置**/
		public static const COUNTRY_GET_JIN_WEI_SET : int = UNIQUEID.NEXT;
		/**国王评价改变了**/
		public static const COUNTRY_VOTE_CHANGE : int = UNIQUEID.NEXT;
		/**上线收到国家数据**/
		public static const COUNTRY_DATA_ONLINE : int = UNIQUEID.NEXT;
		/**国家面板打开的时候切换到哪个面板**/
		public static const COUNTRY_PANEL_TABBAR_SELECT : int = UNIQUEID.NEXT;

		public function CountryEvent()
		{
		}
	}
}
