package com.rpgGame.app.ui.main.head
{
	import org.mokylin.skin.mainui.head.Head_small;
	
	/**
	 *小怪 
	 * @author dik
	 * 
	 */
	public class MonsterNormalBar extends MonsterHeadBase
	{
		private var _skin:Head_small;
	
		public function MonsterNormalBar()
		{
			_skin=new Head_small();
			super(_skin);
		}
	}
}