package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import org.mokylin.skin.app.meiren.Tips_MeiRenGuiZe;
	
	public class MeiRenGuiZeTip extends SkinUI implements ITip
	{
		private var _meirenTip:Tips_MeiRenGuiZe;
		
		private static var _instance : MeiRenGuiZeTip = null;
		
		public function MeiRenGuiZeTip()
		{
			_meirenTip = new Tips_MeiRenGuiZe();
			super(_meirenTip);
		}
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			
		}
		
		public function hideTips() : void
		{
			
		}
		
		public static function get instance() : MeiRenGuiZeTip
		{
			if (null == _instance)
			{
				_instance = new MeiRenGuiZeTip();
			}
			return _instance;
		}
	}
}