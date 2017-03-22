package com.rpgGame.appModule.skill
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.wuxue.jineng.jinengItemsSkin;
	
	public class SkillItem extends SkinUI
	{
		private var _skin:jinengItemsSkin;
		
		public function SkillItem()
		{
			_skin=new jinengItemsSkin();
			super(_skin);
		}
	}
}