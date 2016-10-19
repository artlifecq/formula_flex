package com.rpgGame.app.manager
{

	/**
	 * 游戏设置
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-24 下午6:50:25
	 *
	 */
	public class GameSetting
	{
		/**
		 * 自动同意入帮申请
		 */
		public static var autoAgreeJoinApprove : Boolean = false;
		/**
		 * 自动拒绝入帮邀请
		 */
		public static var autoRefuseJoinInvite : Boolean = false;
		/**
		 * 使用景深
		 */
		public static var useRingDepthOfFieldFilter : Boolean = true;

		public function GameSetting()
		{
		}
	}
}
