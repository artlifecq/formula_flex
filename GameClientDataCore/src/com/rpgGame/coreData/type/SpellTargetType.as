package com.rpgGame.coreData.type
{
	/**
	 * 技能目标类型
	 * @author Administrator
	 *
	 */
	public class SpellTargetType
	{
		/**自己*/
		public static const SELF : uint = 1;
		/**队伍*/
		public static const TEAM : uint = 2;
		/**友方*/
		public static const FRIEND : uint = 3;
		/**敌方*/
		public static const ENEMY : uint = 4;

		public function SpellTargetType()
		{
		}
	}
}
