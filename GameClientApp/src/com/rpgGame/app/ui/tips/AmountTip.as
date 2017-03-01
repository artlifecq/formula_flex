package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import org.mokylin.skin.app.tips.huobiTips_Skin;

	public class AmountTip extends SkinUI implements ITip
	{
		private var _itemTip:huobiTips_Skin;
		private static var _instance:AmountTip;
		
		public function AmountTip()
		{
			_itemTip=new huobiTips_Skin();
			super(_itemTip);
		}
		
		public static function get instance():AmountTip
		{
			if (null == _instance)
			{
				_instance=new AmountTip();
			}
			return _instance;
		}
		
		public function setTipData(data:*):void
		{
			_itemTip.lbl_huobi.htmlText=data;
		}
		
		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
		}
	}
}