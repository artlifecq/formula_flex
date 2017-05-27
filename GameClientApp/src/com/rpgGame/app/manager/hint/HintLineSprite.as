package com.rpgGame.app.manager.hint
{
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	import com.rpgGame.coreData.enum.HintMoveDirectionEnum;
	import com.rpgGame.coreData.utils.ColorUtils;

	import flash.utils.getDefinitionByName;

	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.text.Fontter;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.VerticalAlign;
	import feathers.themes.GuiThemeStyle;

	import starling.display.Sprite;

	/**
	 * 单行显示精灵， 集成底图，文字，还有mask
	 * @author Mandragora
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-09-13 下午3:05:12
	 *
	 */
	public class HintLineSprite extends Sprite
	{
		private var _itemBg : UIAsset;
		protected var _label : Label;
		private var closeBtn : Button;
		private var _hintTypeSet : HintTypeSetInfo;
		private var _bgMarginTop : int;
		private var _bgMarginBottom : int;
		private var _bgMarginLeft : int;
		private var _bgMarginRight : int;
		private var _isFinished : Boolean;
		public var preTime : int;

		public function HintLineSprite(hintTypeSet : HintTypeSetInfo)
		{
			super();
			_hintTypeSet = hintTypeSet;
			initSprite();
		}

		private function initSprite() : void
		{
			if (!_hintTypeSet)
			{
				return;
			}

			var bgMargins : Array = _hintTypeSet.bgMargin.split(";");
			if (bgMargins.length > 0)
				_bgMarginTop = bgMargins[0];
			else
				_bgMarginTop = 0;
			if (bgMargins.length > 1)
				_bgMarginBottom = bgMargins[1];
			else
				_bgMarginBottom = 0;
			if (bgMargins.length > 2)
				_bgMarginLeft = bgMargins[2];
			else
				_bgMarginLeft = 0;
			if (bgMargins.length > 3)
				_bgMarginRight = bgMargins[3];
			else
				_bgMarginRight = 0;

			if (_hintTypeSet.itemBg)
			{
				_itemBg = new UIAsset();
				_itemBg.visible = true;
				_itemBg.styleName = _hintTypeSet.itemBg;
				_itemBg.setSize(_hintTypeSet.itemWidth || _hintTypeSet.width, _hintTypeSet.height);
				addChild(_itemBg);
			}
			_label = new Label();
			_label.verticalAlign = VerticalAlign.MIDDLE;
			_label.fontSize = _hintTypeSet.textSize;
			_label.fontName = Fontter.DEFAULT_FONT_NAME;
			_label.touchable = false;
			_label.isHtmlText = true;
			_label.nativeFilters = ColorUtils.getDefaultStrokeFilter();
			this.addChild(_label);

			if (_hintTypeSet.canClose && _hintTypeSet.closeBtnSkin != "")
			{
				var closeBtnMarginTop : int;
				var closeBtnMarginBottom : int;
				var closeBtnMarginLeft : int;
				var closeBtnMarginRight : int;
				var closeBtnMargins : Array = _hintTypeSet.closeBtnMargin.split(";");
				if (closeBtnMargins.length > 0)
					closeBtnMarginTop = closeBtnMargins[0];
				else
					closeBtnMarginTop = 0;
				if (closeBtnMargins.length > 1)
					closeBtnMarginBottom = closeBtnMargins[1];
				else
					closeBtnMarginBottom = 0;
				if (closeBtnMargins.length > 2)
					closeBtnMarginLeft = closeBtnMargins[2];
				else
					closeBtnMarginLeft = 0;
				if (closeBtnMargins.length > 3)
					closeBtnMarginRight = closeBtnMargins[3];
				else
					closeBtnMarginRight = 0;

				closeBtn = new Button();
				if (closeBtnMarginRight > 0)
					closeBtn.x = _hintTypeSet.width - closeBtnMarginRight;
				else
					closeBtn.x = closeBtnMarginLeft;
				if (closeBtnMarginBottom > 0)
					closeBtn.y = _hintTypeSet.height - closeBtnMarginBottom;
				else
					closeBtn.y = closeBtnMarginTop;
				GuiThemeStyle.setFeatherSkinClass(closeBtn, getDefinitionByName(ClientConfig.getBtnSkin(_hintTypeSet.closeBtnSkin)) as Class);
				addChild(closeBtn);
			}
			resetLine();
		}

		public function updateLabel(lastLine : HintLineSprite, topOffset : int) : void
		{
			if (!_hintTypeSet)
			{
				return;
			}
			if (_hintTypeSet.waitTime > 0)
			{
				var duration : Number = _hintTypeSet.waitTime + _hintTypeSet.showTime + _hintTypeSet.hideTime; //总时间
				if (preTime >= duration)
				{
					_isFinished = true;
				}
			}
			switch (_hintTypeSet.showMoveDirection)
			{
				case HintMoveDirectionEnum.ENUM_NORMAL:
					this.x = _bgMarginLeft;
					this.y = _bgMarginTop;
					return;
				case HintMoveDirectionEnum.ENUM_LEFT_TO_RIGHT:
					if (_hintTypeSet.textMoveFrameDis > 0)
					{
						if (this.x >= _label.width - _bgMarginLeft)
						{
							this.x = -_label.width + _bgMarginLeft;
							if (_hintTypeSet.waitTime <= 0)
								_isFinished = true;
							return;
						}
						this.x += _hintTypeSet.textMoveFrameDis;
						this.y = _bgMarginTop;
					}
					break;
				case HintMoveDirectionEnum.ENUM_RIGHT_TO_LEFT:
					if (_hintTypeSet.textMoveFrameDis > 0)
					{
						if (this.x <= -_label.width + _bgMarginRight)
						{
							this.x = _label.width - _bgMarginRight;
							if (_hintTypeSet.waitTime <= 0)
								_isFinished = true;
							return;
						}
						this.x -= _hintTypeSet.textMoveFrameDis;
						this.y = _bgMarginTop;
					}
					break;
				case HintMoveDirectionEnum.ENUM_TOP_TO_LOW:
					this.x = _bgMarginLeft;
					if (_hintTypeSet.textMoveFrameDis > 0)
					{
						if (this.y >= _label.height - _bgMarginTop)
						{
							this.y = -_label.height + _bgMarginTop;
							if (_hintTypeSet.waitTime <= 0)
								_isFinished = true;
							return;
						}
						this.y += _hintTypeSet.textMoveFrameDis;
					}
					else
					{
						this.y = (lastLine ? (lastLine.y + lastLine.height) : topOffset) + _bgMarginTop;
					}
					break;
				case HintMoveDirectionEnum.ENUM_LOW_TO_TOP:
					this.x = _bgMarginLeft;
					if (_hintTypeSet.textMoveFrameDis > 0)
					{
						if (this.y <= -_label.height + _bgMarginBottom)
						{
							this.y = _label.height - _bgMarginBottom;
							if (_hintTypeSet.waitTime <= 0)
								_isFinished = true;
							return;
						}
						this.y -= _hintTypeSet.textMoveFrameDis;
					}
					else
					{
						this.y = (lastLine ? (lastLine.y + lastLine.height) : topOffset) + _bgMarginTop;
					}
					break;
			}
		}

		public function resetLine() : void
		{
			if (!_hintTypeSet)
			{
				return;
			}
			var textAlign : String = _hintTypeSet.textAlign;
			switch (textAlign)
			{
				case HorizontalAlign.LEFT:
					break;
				case HorizontalAlign.RIGHT:
					break;
				case HorizontalAlign.CENTER:
					break;
				default:
					textAlign = HorizontalAlign.LEFT;
					break;
			}
			switch (_hintTypeSet.showMoveDirection)
			{
				case HintMoveDirectionEnum.ENUM_NORMAL:
					_label.textAlign = textAlign;
					this.x = _bgMarginLeft;
					this.y = _bgMarginTop;
					break;
				case HintMoveDirectionEnum.ENUM_LEFT_TO_RIGHT:
					_label.textAlign = HorizontalAlign.LEFT;
					this.x = -_label.width + _bgMarginLeft;
					this.y = _bgMarginTop;
					break;
				case HintMoveDirectionEnum.ENUM_RIGHT_TO_LEFT:
					_label.textAlign = HorizontalAlign.LEFT;
					this.x = (_hintTypeSet.itemWidth || _hintTypeSet.width) - _bgMarginRight;
					this.y = _bgMarginTop;
					break;
				case HintMoveDirectionEnum.ENUM_TOP_TO_LOW:
					_label.textAlign = textAlign;
					this.x = _bgMarginLeft;
					this.y = -_label.height + _bgMarginTop;
					break;
				case HintMoveDirectionEnum.ENUM_LOW_TO_TOP:
					_label.textAlign = textAlign;
					this.x = _bgMarginLeft;
					this.y = (_hintTypeSet.height > 0 ? _hintTypeSet.height : _label.height) - _bgMarginBottom;
					break;
			}
			_isFinished = false;
			preTime = 0;
		}

		public function setText(text : String, color : uint) : void
		{
			if (!_hintTypeSet)
			{
				return;
			}
			var useTextWidth : Boolean = false;
			var useTextHeight : Boolean = false;
			if ((_hintTypeSet.itemWidth == 0 && _hintTypeSet.width == 0) || _hintTypeSet.showMoveDirection == HintMoveDirectionEnum.ENUM_LEFT_TO_RIGHT || _hintTypeSet.showMoveDirection == HintMoveDirectionEnum.ENUM_RIGHT_TO_LEFT)
			{
				_label.width = _label.maxWidth = 2000;
				useTextWidth = true;
			}
			else
			{
				_label.width = _label.maxWidth = (_hintTypeSet.itemWidth || _hintTypeSet.width) - _bgMarginLeft - _bgMarginRight;
			}
			if (_hintTypeSet.height > 0)
			{
				_label.height = _label.maxHeight = _hintTypeSet.height - _bgMarginTop - _bgMarginBottom;
			}
			else
			{
				_label.height = _label.maxHeight = 2000;
				useTextHeight = true;
			}
			_label.color = color;
			_label.htmlText = text;
			if (useTextWidth)
			{
				_label.width = _label.textWidth;
			}

			if (_hintTypeSet.maxWidth > 0)
			{
				if (_label.width > _hintTypeSet.maxWidth)
				{
					_label.width = _label.maxWidth = _hintTypeSet.maxWidth;
					_label.htmlText = text;
				}
			}

			if (useTextHeight)
			{
				_label.height = _label.textHeight;
			}

			if (_itemBg)
			{
				var bgWidth : int = _hintTypeSet.itemWidth || _hintTypeSet.width;
				var bgHeight : int = _hintTypeSet.height;
				if (bgWidth == 0)
				{
					bgWidth = _label.width + _bgMarginLeft + _bgMarginRight;
				}
				if (bgHeight == 0)
				{
					bgHeight = _label.height + _bgMarginTop + _bgMarginBottom;
				}
				_itemBg.setSize(bgWidth, bgHeight);
			}
			resetLine();
		}

		public function get isFinished() : Boolean
		{
			return _isFinished;
		}

		public function get lineWidth() : int
		{
			if (_hintTypeSet.width == 0)
			{
				if (!_label)
					return 0;
				return _label.width;
			}
			else
			{
				return _hintTypeSet.itemWidth || _hintTypeSet.width;
			}
		}

		public function get lineHeight() : int
		{
			if (_hintTypeSet.height == 0)
			{
				if (!_label)
					return 0;
				return _label.height;
			}
			else
			{
				return _hintTypeSet.height;
			}
		}
	}
}
