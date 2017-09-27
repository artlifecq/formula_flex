package com.rpgGame.app.ui.main.guide
{
	import org.mokylin.skin.app.msg.ArrowLeftSkin;

	
	public class ArrowLeft extends BaseGuideArrow
	{
		public function ArrowLeft()
		{
			super(EnumArrowDir.DIR_LEFT, new ArrowLeftSkin());
		}
	}
}