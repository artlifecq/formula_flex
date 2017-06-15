package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import org.mokylin.skin.app.zhanchang.paihangbang.Tps_MagPaiHang;
	
	public class D1v1RankRewardExt extends SkinUI implements ITip
	{
		private static var _ins : D1v1RankRewardExt = null;
		
		public static function get instance() : D1v1RankRewardExt
		{
			if (!_ins)
			{
				_ins = new D1v1RankRewardExt();
			}
			return _ins;
		}
		private var _skin:Tps_MagPaiHang;
		public function D1v1RankRewardExt()
		{
			_skin=new Tps_MagPaiHang();
			super(_skin);
		}
		
		public function setTipData(data:*):void
		{
		}
		
		public function hideTips():void
		{
		}
	}
}