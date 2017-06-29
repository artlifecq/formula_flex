package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import org.mokylin.skin.app.vip.Tips_Vip;
	
	public class VipNoneTipExt extends SkinUI implements ITip
	{
		private static var _ins : VipNoneTipExt = null;
		
		public static function get instance() : VipNoneTipExt
		{
			if (!_ins)
			{
				_ins = new VipNoneTipExt();
			}
			return _ins;
		}
		public function VipNoneTipExt()
		{
			
			super(new Tips_Vip());
		}
		
		public function setTipData(data:*):void
		{
		}
		
		public function hideTips():void
		{
		}
	}
}