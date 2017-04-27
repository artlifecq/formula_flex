package com.rpgGame.appModule.mount
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.zuoqi.huoquSkin;
	
	public class MountShowPane extends SkinUIPanel
	{
		private var _skin:huoquSkin;
		public function MountShowPane():void
		{
			_skin = new huoquSkin();
			super(_skin);
		}
	}
}