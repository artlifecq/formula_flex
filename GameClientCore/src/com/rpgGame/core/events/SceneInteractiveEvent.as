package com.rpgGame.core.events
{
	import com.rpgGame.coreData.UNIQUEID;

	/**
	 *
	 * 场景交互事件
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-27 下午2:22:13
	 *
	 */
	public class SceneInteractiveEvent
	{
		/**
		 * 选择场景角色，function(role:SceneRole):void
		 */
		public static const SELECTED_SCENE_ROLE : int = UNIQUEID.NEXT;

		public function SceneInteractiveEvent()
		{
		}
	}
}
