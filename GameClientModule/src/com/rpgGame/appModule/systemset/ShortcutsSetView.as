package com.rpgGame.appModule.systemset
{
	import com.rpgGame.core.ui.SkinUI;
	
	import org.mokylin.skin.app.systemSet.kuaijiejian_Skin;
	
	public class ShortcutsSetView extends SkinUI
	{
		private var _skin:kuaijiejian_Skin;
		public function ShortcutsSetView()
		{
			_skin=new kuaijiejian_Skin();
			super(_skin);
		}
	}
}