package com.rpgGame.coreData.enum
{
	/**
	 * 场景复活枚举，用来控制显示什么面板复活的（有的场景需要显示倒计时）
	 * @author Mandragora
	 * 
	 */	
	public class SceneReliveEnum
	{
		public function SceneReliveEnum()
		{
		}
		/**普通场景**/
		public static const NORMAL_SCENE : int= 0;
		/**副本**/
		public static const DUNGEON_SCENE : int = 1;
	}
}