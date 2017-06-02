package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.text.TextFormat;
	
	import feathers.controls.text.Fontter;
	
	import org.mokylin.skin.mainui.chat.ChatFrameOnRoleSkin;
	
	
	public class ChatFramOnRole extends SkinUI
	{
		private var _customSkin : ChatFrameOnRoleSkin;
		private var _richText : RichTextArea3D;
		private const PAD : int = 8;
		
		public function ChatFramOnRole()
		{
			_customSkin = new ChatFrameOnRoleSkin();
			super(_customSkin);
			var defaultFormat : TextFormat = new TextFormat(Fontter.FONT_Hei);
			defaultFormat.color = 0xded8c7;
			defaultFormat.size = 14;
			defaultFormat.leading = 8;
			_richText = new RichTextArea3D(200, 100, ColorUtils.getDefaultStrokeFilter());
			_richText.setConfig(RichTextCustomUtil.cloneChatUnitConfigVec());
			_richText.x = PAD;
			_richText.y = PAD;
			_richText.wordWrap = true;
			_richText.multiline = true;
			_richText.defaultTextFormat = defaultFormat;
			addChild(_richText);
		}
		
		public function show(message : String) : void
		{
			if (!_richText)
			{
				return;
			}
			_richText.text = "";
			_richText.appendRichText(message);
			_customSkin.bg.width = _richText.textWidth + PAD * 2 + 6;
			_customSkin.bg.height = _richText.textHeight + PAD * 2 + (_richText.textHeight > 30 ? 4 : -2);
			_customSkin.arrow.x = (_customSkin.bg.width - _customSkin.arrow.width) / 2;
			_customSkin.arrow.y = _customSkin.bg.height - 1;
		}
		
		override public function get width() : Number
		{
			return _customSkin.bg.width;
		}
		
		override public function get height() : Number
		{
			return _customSkin.arrow.y + _customSkin.arrow.height;
		}
		
		override public function dispose() : void
		{
			super.dispose();
			if (_richText)
			{
				_richText.removeFromParent();
				_richText.dispose();
				_richText = null;
			}
		}
	}
}
