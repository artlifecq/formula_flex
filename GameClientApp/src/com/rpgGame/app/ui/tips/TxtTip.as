package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	
	import starling.text.TextFieldAutoSize;
	
	import utils.StringUtil;



	/**
	 * 文本Tip
	 * @author Carver
	 *
	 */
	public class TxtTip extends BaseTip implements ITip
	{
		private var _tf : TextFormat;
		/** 文本 **/
		private var _txtTipTxt : Label;
		/** 米黄文字 1 (默认) **/
		private var _defaultColor : uint = StaticValue.BEIGE_TEXT;

		public function TxtTip()
		{
			_txtTipTxt = new Label();
			_txtTipTxt.touchable = false;
			_txtTipTxt.autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
			_txtTipTxt.leading = 6;

			_txtTipTxt.nativeFilters = ColorUtils.getDefaultStrokeFilter();

			addChild(_txtTipTxt);

			_txtTipTxt.x = 10;
			_txtTipTxt.y = 10;
		}

		private static var _instance : TxtTip = null;

		public static function get instance() : TxtTip
		{
			if (null == _instance)
			{
				_instance = new TxtTip();
			}
			return _instance;
		}

		public function setTipData(args : *) : void
		{
			var tipsData : TextTipsData = args as TextTipsData;
			if (tipsData == null)
				return;

			var str : String = tipsData.getTipsInfo();

			_txtTipTxt.width = _txtTipTxt.height = 0; //清除上一次的宽高缓存
			_txtTipTxt.maxWidth = 270; //美术要求,最宽270
			_txtTipTxt.color = _defaultColor;

			_txtTipTxt.text = str;
			_txtTipTxt.isHtmlText = StringUtil.isHtmlChars(str);

			var hx : int = _txtTipTxt.numLines > 1 ? 20 + _txtTipTxt.leading : 20;
			setBgSize(_txtTipTxt.textBounds.width + 25, _txtTipTxt.textBounds.height + hx);
		}

		public function hideTips() : void
		{

		}

		override public function get height() : Number
		{
			return getBgHeight();
		}
	}
}