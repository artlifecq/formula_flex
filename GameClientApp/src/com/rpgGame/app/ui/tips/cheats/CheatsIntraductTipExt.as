package com.rpgGame.app.ui.tips.cheats
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.beibao.Xinfa.Shuoming_Tips;
	
	public class CheatsIntraductTipExt extends SkinUI implements ITip
	{
		private static var _instance : CheatsIntraductTipExt = null;
		
		public static function get instance() : CheatsIntraductTipExt
		{
			if (!_instance)
			{
				_instance = new CheatsIntraductTipExt();
			}
			return _instance;
		}
		public function CheatsIntraductTipExt(skin:StateSkin=null)
		{
			super(new Shuoming_Tips());
		}
		
		public function setTipData(data:*):void
		{
		}
		
		public function hideTips():void
		{
		}
	}
}