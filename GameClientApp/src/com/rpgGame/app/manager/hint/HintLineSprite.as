package com.rpgGame.app.manager.hint
{
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.HintCfgData;
	import com.rpgGame.coreData.clientConfig.HintTypeSetInfo;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.utils.getDefinitionByName;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.text.Fontter;
	import feathers.layout.VerticalAlign;
	import feathers.themes.GuiThemeStyle;
	
	import starling.display.Quad;
	import starling.display.Sprite;
	
	import utils.StringUtil;

	/**
	 * 单行显示精灵， 集成底图，文字，还有mask
	 * @author Mandragora
	 * 
	 */
	public class HintLineSprite extends Sprite
	{
		private var bg : UIAsset;
		private var label:Label;
		private var labelContainer : Sprite;
		private var closeBtn : Button;
		private var labelMask : Quad;
		private var _noticeType:int;
		
		public function HintLineSprite(noticeType:int)
		{
			super();
			_noticeType = noticeType;
			initSprite();
		}
		
		private function initSprite():void
		{
			if(hintTypeSet.bg != "")
			{
				bg = new UIAsset()//.bg;
				bg.visible = true;
				bg.styleName = hintTypeSet.bg;
				bg.setSize(hintTypeSet.width,hintTypeSet.height);
				addChild(bg);
			}
			
			labelContainer = new Sprite();
			labelContainer.width = hintTypeSet.width;
			labelContainer.height = hintTypeSet.height;
			addChild(labelContainer);
			label = new Label();
			label.width = hintTypeSet.width;
			label.height = hintTypeSet.height;
			label.textAlign = hintTypeSet.textAlign;
			label.verticalAlign = VerticalAlign.MIDDLE;
			label.fontSize = hintTypeSet.textSize;
			label.fontName = Fontter.DEFAULT_FONT_NAME;
			label.touchable = false;
			label.isHtmlText = true;
			label.nativeFilters = ColorUtils.getDefaultStrokeFilter();
			if(hintTypeSet.textIsMove)
			{
				if(hintTypeSet.textMoveDirIsToLeft)
					label.x = hintTypeSet.width;
				else
					label.x = -hintTypeSet.width;
			}else
				label.x = 0;
				
			labelContainer.addChild(label);
			if(hintTypeSet.textIsMove)
			{
				labelMask =new Quad(hintTypeSet.width,hintTypeSet.height);
				labelContainer.mask = labelMask;
			}
			
			if(hintTypeSet.canClose && hintTypeSet.closeBtnSkin != "")
			{
				closeBtn = new Button();
				closeBtn.x = hintTypeSet.width - hintTypeSet.closeBtnHeight;
				closeBtn.y = hintTypeSet.closeBtnHeight;
				GuiThemeStyle.setFeatherSkinClass(closeBtn,getDefinitionByName(ClientConfig.getBtnSkin(hintTypeSet.closeBtnSkin)) as Class);
				closeBtn.width = hintTypeSet.closeBtnWidth;
				closeBtn.height = hintTypeSet.closeBtnHeight;
				addChild(closeBtn);
			}
			
		}
		/**
		 * 文字总共播放的次数 
		 */	
		public var textMoveCount : int = 0;
		public function updateLabel():void
		{
			if(!hintTypeSet.textIsMove)
				return;
			if(hintTypeSet.textMoveDirIsToLeft)
			{
				if(label.x <= -hintTypeSet.width)
				{
					label.x = hintTypeSet.width;
					textMoveCount ++;
					return;
				}
				label.x-=hintTypeSet.textMoveFrameDis;
			}else
			{
				if(label.x >= hintTypeSet.width)
				{
					label.x = -hintTypeSet.width;
					textMoveCount ++;
					return;
				}
				label.x+=hintTypeSet.textMoveFrameDis;
			}
		}
		
		public function resetLine():void
		{
			if(hintTypeSet.textIsMove)
			{
				textMoveCount = 0;
				if(hintTypeSet.textMoveDirIsToLeft)
				{
					label.x = hintTypeSet.width;
				}else
				{
					label.x = -hintTypeSet.width;
				}
			}else
			{
				label.x = 0;
			}
		}
		
		public function set htmlText(value:String):void
		{
			if(StringUtil.isHtmlChars(value))
				label.htmlText = value;
			else
				label.text = value;
		}
		
		public function set color(value:uint):void
		{
			label.color = value;
		}
		
		private function get hintTypeSet():HintTypeSetInfo
		{
			return HintCfgData.getHintTypeSet(_noticeType);
		}
	}
}