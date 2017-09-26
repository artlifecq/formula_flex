package com.rpgGame.app.ui.main.guide
{
	import org.mokylin.skin.app.msg.ArrowRightSkin;

	
	public class ArrowRight extends BaseGuideArrow
	{
		public function ArrowRight()
		{
			super(EnumArrowDir.DIR_RIGHT, new ArrowRightSkin());
		}
	}
}