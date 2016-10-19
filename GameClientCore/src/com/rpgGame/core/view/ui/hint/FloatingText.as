package com.rpgGame.core.view.ui.hint
{
	
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import gs.TweenLite;
	import gs.TweenMax;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.text.TextFieldAutoSize;
	
	public class FloatingText extends Sprite 
	{
		private var _tm:TweenMax;
		private var _msgText:TextField;
		private var _bg:Image;
		
		private var _onHideComplete:Function;
		
		public function FloatingText()
		{
			touchable = false;
			
			addBGImage();
			addText();
		}
		
		private function addBGImage():void
		{
			//			_bg = new Image();
			//			addChild(_bg);
		}
		
		private function addText():void
		{
			_msgText = new TextField( 300, 20, "" );
			_msgText.autoSize = TextFieldAutoSize.VERTICAL;
			_msgText.isHtmlText = true;
			_msgText.color = StaticValue.COLOR_CODE_1;
			addChild(_msgText);
		}
		
		
		/**
		 * 显示文本
		 * @param htmlortextstr
		 * 
		 */		
		public function show( htmlortextstr:String ):void
		{
			_msgText.text = htmlortextstr;
//			_msgText.width = _msgText.textWidth + 20;
//			_msgText.height = _msgText.textHeight + 5;
			
//			_bg.setSize(_msgText.textWidth + 25 ,_msgText.textHeight + 15);
			
			beginShow();
		}
 
		private function resetPosx():void
		{
			var stageWidth:int = Starling.current.stage.stageWidth;
			if (x < 4)
			{
				x = 4;
			}
			else if (x + width > stageWidth)
			{
				x = stageWidth - width - 4;
			}
		}
		
		private function beginShow():void
		{
			x = int( Starling.current.nativeStage.mouseX - ( width / 2 ) );
			y = int( Starling.current.nativeStage.mouseY - height );
			
			resetPosx();
			alpha = 0;
			
			var tweenArgs:Object = {};
			tweenArgs["y"] = y + moveNum( y );
			tweenArgs["alpha"] = 1;
			tweenArgs["onComplete"] = showComplete;
			_tm = TweenMax.to( this, 1, tweenArgs );
		}
		/**
		 *鼠标在屏幕上侧边缘  应该往下运动 
		 * @param height
		 * @return 
		 * 
		 */		
		private function moveNum( height:Number ):int
		{
			var res:int = height - 60 < 0 ? 60 : -60;
			return res;
		}
		
		/**
		 *  展示结束的回调
		 */		
		private function showComplete():void
		{
			TweenLite.delayedCall( 1.5, hideShow );
		}
		
		/**
		 *  隐藏this
		 */		
		private function hideShow():void
		{
			var tweenobj:Object = {};
			tweenobj["alpha"] = 0;
			tweenobj["onComplete"] = hideComplete;
			_tm = TweenMax.to(this, 1, tweenobj);
		}
		
		/**
		 *  清理this
		 */		
		private function hideComplete():void{
			if (_tm != null)
			{
				_tm.kill();
				_tm = null;
			}
			
			if( _onHideComplete != null )
				_onHideComplete();
		}
		 
		override public function dispose():void
		{
			super.dispose();
			
			_msgText.text = "";
			
			if (_tm != null)
			{
				_tm.kill();
				_tm = null;
			}
			
			if( parent != null )
				parent.removeChild( this );
		}

		public function get onHideComplete():Function
		{
			return _onHideComplete;
		}

		public function set onHideComplete(value:Function):void
		{
			_onHideComplete = value;
		}

	}
}