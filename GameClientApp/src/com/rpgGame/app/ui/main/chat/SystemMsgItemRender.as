package com.rpgGame.app.ui.main.chat
{
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.coreData.utils.ColorUtils;
	import com.rpgGame.netData.chat.message.ResChatMessage;
	
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	import feathers.controls.text.Fontter;

	public class SystemMsgItemRender extends BaseDefaultListItemRenderer
	{
		public static var WIDTH:int = 185;
		private static var _defaultFormat:TextFormat;
		private var _richText:RichTextArea3D;
		
		public function SystemMsgItemRender()
		{
			this.initRichTextArea3D();
		}
		
		override public function get height():Number
		{
			if(_richText)
			{
				return _richText.height - 3;
			}
			return super.height;
		}
		
		protected function initRichTextArea3D(textFormat:TextFormat = null, textWidth:int = 0):void
		{
			if(this._richText != null)return;
			
			if(textWidth <= 0)textWidth= WIDTH;//_customSkin.scroller.width - RICH_TEXT_PADDING_RIGTH
			
			_richText = RichTextArea3D.getFromPool();
			_richText.setSize(textWidth); 
			_richText.filters = ColorUtils.getDefaultStrokeFilter();
			_richText.breakLineManual = true;
			_richText.setConfig(RichTextCustomUtil.getChatUnitConfigVec());
			_richText.wordWrap = true;
			_richText.multiline = true;
			
			if(!textFormat)
			{
				if(!_defaultFormat)
				{
					_defaultFormat = new TextFormat(Fontter.FONT_Hei);
					_defaultFormat.color = 0xF9F0CC;
					_defaultFormat.size = 12;
					_defaultFormat.align = TextFieldAutoSize.LEFT;
					_defaultFormat.letterSpacing = 1;
					_defaultFormat.leading = 4;
				}
				
				textFormat = _defaultFormat;
			}
			_richText.defaultTextFormat = _defaultFormat;
			this.addChild(_richText);
		}
		
		override protected function commitData():void
		{
			var info:ResChatMessage=this._data as ResChatMessage;
			if(info && this._owner)
			{
				_richText.text = ChatUtil.getHTMLSystemMsg(info);
				_richText.setSize(WIDTH);
				this.width = _richText.width;
			}
		}
		
		override public function dispose():void
		{
			RichTextArea3D.pushToPool(_richText);
			_richText = null;
			//这里必须放最后，不然会报错
			super.dispose();
		}
	}
}


