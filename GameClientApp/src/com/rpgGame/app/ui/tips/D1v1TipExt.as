package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.zhanchang.dianfengduijue.Tips_Msg;
	
	public class D1v1TipExt extends SkinUI implements ITip
	{
		private static var _ins : D1v1TipExt = null;
		
		public static function get instance() : D1v1TipExt
		{
			if (!_ins)
			{
				_ins = new D1v1TipExt();
			}
			return _ins;
		}
		public function D1v1TipExt(skin:StateSkin=null)
		{
			super(new Tips_Msg());
		}
		
		public function setTipData(data:*):void
		{
		}
		
		public function hideTips():void
		{
		}
	}
}