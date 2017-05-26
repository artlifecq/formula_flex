package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsPropChangeData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	import feathers.core.FeathersControl;
	
	import org.mokylin.skin.app.tips.BaseTipsSkin;
	
	import away3d.events.Event;
	import starling.text.TextFieldAutoSize;
	
	import utils.StringUtil;
	
	
	
	/**
	 * 文本Tip
	 * @author Carver
	 *
	 */
	public class TxtPropChangeTip extends FeathersControl implements ITip
	{
		private var _tf : TextFormat;
		/** 文本 **/
		private var _txtTipTxt : Label;
		/** 米黄文字 1 (默认) **/
		private var _defaultColor : uint = StaticValue.COLOR_CODE_1;
		
		public function TxtPropChangeTip():void
		{
			super();
		}
		override protected function initialize():void
		{
			this.touchable = false;
		}
		private static var _instance : TxtPropChangeTip = null;
		
		public static function get instance() : TxtPropChangeTip
		{
			if (null == _instance)
			{
				_instance = new TxtPropChangeTip();
			}
			return _instance;
		}
		private var _tipsData:TextTipsPropChangeData;
		public function setTipData(args : *) : void
		{
			var tipsData : TextTipsPropChangeData = args as TextTipsPropChangeData;
			if (tipsData == null)
				return;
			_tipsData = tipsData;
			updateText();
			_tipsData.addEventListener(TextTipsPropChangeData.TEXTTIPCHANGE,updateText);
			this.addEventListener(Event.REMOVED_FROM_STAGE,removeFromStageHandler);
		}
		
		private function removeFromStageHandler():void
		{
			this.removeEventListener(Event.REMOVED_FROM_STAGE,removeFromStageHandler);
			_tipsData.removeEventListener(TextTipsPropChangeData.TEXTTIPCHANGE,updateText);
			_tipText == null;
		}
		private var _tipText:String;

		private function updateText():void
		{
			_tipText = _tipsData.getTipsInfo();
			this.invalidate(FeathersControl.INVALIDATION_FLAG_DATA);
		}
		override protected function draw():void
		{
			var dataInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_DATA);
			var stylesInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_STYLES);
			var sizeInvalid:Boolean = this.isInvalid(INVALIDATION_FLAG_SIZE);
			if(stylesInvalid)
			{
				createSkin();
				createLable();
			}
			if(dataInvalid)
			{
				refeashTipView();
			}
			if(sizeInvalid)
			{
				refeashskin();
			}
			this.autoSizeIfNeeded();
		}
		private var tipBGSkin:Object;//BaseTipsSkin;
		private function createSkin():void
		{
			tipBGSkin = new BaseTipsSkin();
			addChild( tipBGSkin.imgBG );
		}
		private function createLable():void
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
		private function refeashTipView():void
		{
			_txtTipTxt.width = _txtTipTxt.height = 0; //清除上一次的宽高缓存
			_txtTipTxt.maxWidth = 270; //美术要求,最宽270
			_txtTipTxt.color = _defaultColor;
			_txtTipTxt.text = _tipText;
			_txtTipTxt.isHtmlText = StringUtil.isHtmlChars(_tipText);
		}
		protected function autoSizeIfNeeded():void
		{
			var hx : int = _txtTipTxt.numLines > 1 ? 20 + _txtTipTxt.leading : 20;
			this.setSize(_txtTipTxt.textBounds.width + 25, _txtTipTxt.textBounds.height + hx);
		}
		
		private function refeashskin():void
		{
			tipBGSkin.imgBG.width = this.width;
			tipBGSkin.imgBG.height = this.height;	
		}
		
		public function hideTips() : void
		{
			
		}
		
	}
}