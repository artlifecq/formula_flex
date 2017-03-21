package com.gameClient.alert
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.ui.Keyboard;

	public class AlertPanel extends Sprite
	{
		private var btnClose:Sprite = new Sprite();
		private var perContiainer:DisplayObjectContainer = null;
		private var _textFld:TextField = null;
		public var _callBackFunc:Function = null;
		private static var _stage:Stage;
		
		private static var _alertPanel:AlertPanel=null;
		
//		[Embed(source="assets/btn.png")]
//		public var BtnClass:Class;
		
		public static function initStage(stage:Stage):void
		{
			_stage = stage;
		}
		
		public static function showMsg( info:String, par:DisplayObjectContainer = null, append:Boolean = true, callBack:Function = null, isForce:Boolean = false):void
		{
//            if (isForce == false)
//            {
//                // 一个手动屏蔽
//			    return;
//            }
            
            if (info == null)
                return;
            
            if (par == null)
            {
                par = _stage;
            }
            
			if(_alertPanel==null){
				_alertPanel = new AlertPanel();
				_alertPanel.init();
			}
			if(_alertPanel.visible)
			{
				if ( append )
					_alertPanel.setText( _alertPanel._textFld.text+"\r\n"+info );
				else
				{
//					_alertPanel.closeHandler( null );
					_alertPanel.setText( info );
					_alertPanel.show(par);
				}
			}
			else
			{
				_alertPanel.setText( info );
				_alertPanel.show(par);
			}
            trace("[异常对话框] " + info);
			
			_alertPanel.x = par.width / 2 - _alertPanel.width / 2;
			_alertPanel.y = par.height / 2 - _alertPanel.height / 2;
			
			if ( callBack != null )
				_alertPanel._callBackFunc = callBack;
		}
		
		public function AlertPanel()
		{
//			this.graphics.beginFill( 0x7f7f7f, 0.7 );
//			this.graphics.drawRect( 0, 0 
		}
		
		public function setText(txt:String):void
		{
			var rectW:int = 350;
            _textFld.width = 1030;
            _textFld.text = txt;
            
            var rectH:int = _textFld.textHeight + 100;
			rectW = _textFld.textWidth + 50;
			
			this.graphics.clear();
			this.graphics.beginFill( 0x202020, 0.9 );
			this.graphics.drawRect( 0, 0, rectW, rectH );
			this.graphics.endFill();
			
			this.graphics.lineStyle( 2, 0x000000 );
			this.graphics.drawRect( 4, 4, rectW - 8,  rectH - 8 );
			
			_textFld.x = ( rectW / 2 ) - ( _textFld.textWidth / 2 );
			_textFld.y = ( rectH  / 2 ) - ( _textFld.textHeight / 2);
			_textFld.width = _textFld.textWidth + 5;
			_textFld.height = _textFld.textHeight + 5;

			btnClose.x = rectW / 2 - btnClose.width / 2;
			btnClose.y = rectH - 25 - 4;
		}
		
		public function show( par:DisplayObjectContainer ):void
		{
			perContiainer=par;
			this.visible=true;
			perContiainer.addChild(this);
			
			this.x = perContiainer.stage.stageWidth / 2 - ( this.width / 2 );
			this.y = perContiainer.stage.stageHeight / 2 - this.height / 2;
            
            
            perContiainer.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			btnClose.addEventListener(MouseEvent.CLICK, closeHandler );
		}
        
        protected function keyDownHandler(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.ESCAPE)
            {
                closeHandler(null);
            }
        }
        
		public function init():void
		{
			this.visible=false;
			
			_textFld = new TextField();
			//textFld.selectable = false;
			//_textFld.text = info;
			_textFld.type = TextFieldType.INPUT;
			_textFld.selectable = true;
			_textFld.multiline = true;
			_textFld.wordWrap =  true;
			_textFld.textColor = 0xffffff;
			_textFld.width = 350;
//			_textFld.height = 
//			var tf:TextFormat = _textFld.getTextFormat();
//			tf.align = TextAlign.CENTER;
//			_textFld.setTextFormat( tf );
			
//			var ft:TextFormat = textFld.getTextFormat();
//			ft.align = TextFormatAlign.CENTER;
//			textFld.setTextFormat( ft ); 
			

			this.addChild( _textFld );
			
//			var bitmap:Bitmap = new BtnClass();
//			btnClose.addChild( bitmap );
			
		
			btnClose.x = this.width / 2 - 25 ;
			btnClose.y = this.height - 25;
			var texttemp:TextField = new TextField();
			texttemp.text = "确定";
			texttemp.textColor = 0xb39879;
//			texttemp.x = bitmap.width / 2 - texttemp.textWidth / 2; 
//			texttemp.y = bitmap.height / 2 - texttemp.textHeight / 2 - 3; 
			texttemp.selectable = false;
			texttemp.width = texttemp.textWidth + 5;
			texttemp.height = texttemp.textHeight + 5;
			btnClose.addChild( texttemp );

			btnClose.addEventListener(MouseEvent.CLICK, closeHandler );
			
			this.addChild( btnClose );
		}
		
		private function closeHandler(event:MouseEvent):void
		{
			btnClose.removeEventListener(MouseEvent.CLICK, closeHandler );
			perContiainer.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			if(this.parent)
			{
				this.parent.removeChild(this);
			}
			
			this._textFld.text="";
			this.visible=false;
			if ( _callBackFunc != null )
			{
				_callBackFunc();
			}
		}
	}
}