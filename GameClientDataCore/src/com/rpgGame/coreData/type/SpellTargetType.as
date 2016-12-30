package com.rpgGame.coreData.type
{
	/**
	 * 技能目标类型
	 * 作用对象（1自己，2友好目标，3敌对目标，4当前目标，5场景中鼠标的当前坐标点，6主人）
	 * @author Administrator
	 *
	 */
	public class SpellTargetType
	{
		/**自己*/
		public static const SELF : uint = 1;
		
		/**友方*/
		public static const FRIEND : uint = 2;
		/**敌方*/
		public static const ENEMY : uint = 3;
		/**
		 * 当前目标 
		 */		
		public static const CURRENT_TARGET : uint = 4;
		/**
		 * 当前鼠标点 
		 */		
		public static const SCENE_MOUSE_POS : uint = 5;
		
		/**队伍*/
		public static const TEAM : uint = 6;

		public function SpellTargetType()
		{
		}
	}
}
