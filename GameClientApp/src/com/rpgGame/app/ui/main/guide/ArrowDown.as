package com.rpgGame.app.ui.main.guide
{
	import org.mokylin.skin.app.msg.ArrowDownSkin;

	
	public class ArrowDown extends BaseGuideArrow
	{
		public function ArrowDown()
		{
			super(EnumArrowDir.DIR_DOWN, new ArrowDownSkin());
		}
	}
}