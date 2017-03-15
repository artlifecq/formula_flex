package com.rpgGame.app.ui.main.head
{
	import org.mokylin.skin.mainui.head.Head_boss;
	
	/**
	 *boss 
	 * @author dik
	 * 
	 */
	public class MonsterBossBar extends MonsterHeadBase
	{
		private var _skin:Head_boss;
		public function MonsterBossBar()
		{
			_skin=new Head_boss();
			super(_skin);
		}
	}
}