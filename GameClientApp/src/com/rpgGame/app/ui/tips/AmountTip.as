package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.tips.Tips_HuoBi;

	public class AmountTip extends SkinUI implements ITip
	{
		private var _itemTip:Tips_HuoBi;
		private static var _instance:AmountTip;
		
		public function AmountTip()
		{
			_itemTip=new Tips_HuoBi();
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
			_itemTip.lbl_name.htmlText=HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,"货币:")+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT, data.value);
			_itemTip.lbl_miaoshu.htmlText=data.des;
			_itemTip.imgBG.height=_itemTip.lbl_miaoshu.y+_itemTip.lbl_miaoshu.textHeight+10;
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
			return _itemTip.imgBG.height;
		}
	}
}