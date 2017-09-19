package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.zhanchang.jiucengyaota.Tips_yata2;
	
	public class NineTowerTipExt extends SkinUI implements ITip
	{
		private static var _ins : NineTowerTipExt = null;
		
		public static function get instance() : NineTowerTipExt
		{
			if (!_ins)
			{
				_ins = new NineTowerTipExt();
			}
			return _ins;
		}
		public function NineTowerTipExt(skin:StateSkin=null)
		{
			super(new Tips_yata2());
		}
		
		public function setTipData(data:*):void
		{
		}
		
		public function hideTips():void
		{
		}
	}
}