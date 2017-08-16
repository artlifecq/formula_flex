package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.ui.tips.data.AmountTipData;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.tips.Tips_HuoBi;

	/**
	 * 货币类tips
	 * @author dik
	 * 
	 */
	public class AmountTip extends SkinUI implements ITip
	{
		private var _itemTip:Tips_HuoBi;
		private static var _instance:AmountTip;
		
		private var tipsData:AmountTipData;
		
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
			tipsData=(data as DynamicTipData).data;
			
			_itemTip.lbl_name.text=tipsData.name;
			_itemTip.lbl_name.htmlText=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,tipsData.name)+HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT, tipsData.value);
			_itemTip.lbl_miaoshu.htmlText=tipsData.des;
			var bgheight:int=int(_itemTip.lbl_miaoshu.y+_itemTip.lbl_miaoshu.textHeight+10);
			_itemTip.imgBG.height=bgheight;
			_itemTip.imgBG.validate();
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
			return 	_itemTip.imgBG.height;
		}
	}
}