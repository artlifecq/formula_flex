package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 主角寻路事件
	 * @author L.L.M.Sunny
	 * 创建时间：2016-5-3 上午10:02:16
	 *
	 */
	public class MainRoleSearchPathEvent
	{
		/**寻路*/
		public static const Event_PathFinding : uint = UNIQUEID.NEXT;
		/**更新跨地图寻路引导面板的数据*/
		public static const Event_UpdataPaths : uint = UNIQUEID.NEXT;

		public function MainRoleSearchPathEvent()
		{
		}
	}
}
