package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 讨逆事件
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-03 下午3:05:12
	 *
	 */
	public class TaoNiEvent
	{
		/**
		 * 讨逆阶段改变
		 */
		public static const TAO_NI_STAGE_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 讨逆击杀改变
		 */
		public static const TAO_NI_MONSTER_KILL_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 创建粮仓
		 */
		public static const TAO_NI_LIANG_CANG_ADD_TO_SCENE : int = UNIQUEID.NEXT;
		/**
		 * 粮仓属性改变
		 */
		public static const TAO_NI_LIANG_CANG_STATE_CHANGE : int = UNIQUEID.NEXT;
		/**
		 * 讨逆状态改变
		 */
		public static const TAO_NI_STATUS_CHANGE : int = UNIQUEID.NEXT;

		public function TaoNiEvent()
		{
		}
	}
}
