package com.rpgGame.app.ui.main.guide
{
	import org.mokylin.skin.app.msg.ArrowUpSkin;

	
	public class ArrowUp extends BaseGuideArrow
	{
		public function ArrowUp()
		{
			super(EnumArrowDir.DIR_UP, new ArrowUpSkin());
		}
	}
}