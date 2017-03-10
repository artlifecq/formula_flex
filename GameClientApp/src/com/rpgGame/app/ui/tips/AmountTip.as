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
			_itemTip.lbl_miaoshu.wordWrap=true;
			_itemTip.lbl_miaoshu.leading=5;
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
			_itemTip.lbl_name.text=data.name;
			_itemTip.lbl_huobi.text=data.value;
			_itemTip.lbl_miaoshu.htmlText=data.des;
			_itemTip.bg.height=_itemTip.lbl_miaoshu.y+_itemTip.lbl_miaoshu.textHeight+10;
		}
		
		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
		}
		
		public override function get height() : Number
		{
			
			return _itemTip.bg.height;
		}
	}
}