package feathers.controls
{
	import feathers.core.FeathersControl;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.ILayout;
	import feathers.themes.GuiTheme;
	import feathers.themes.GuiThemeStyle;
	
	import starling.display.Image;
	import starling.rendering.Painter;
	import starling.textures.IStarlingTexture;
	
	import utils.UIStateSetHelper;
	
	/**
	 * 位图数字组件 
	 * @author wewell@163.com
	 */
	public class UINumber extends FeathersControl
	{
		private static const  CHAR_ALIGAN_WITH_EQUAL_SIZE:int = 1;
		private static const CHAR_ALIGAN_WITH_SELF_SIZE:int = 2;
		
		protected var _styleName:String;
		protected var _skin:StateSkin;
		
		/**字符间距*/	
		private var _gap:int;
		
		/**是否需要缓动显示*/	
		public var tween:Boolean = false;
		
		/**
		 *帧标签前辍
		 */		
		public var frameLabelPreFix:String;
		
		/**
		 *字符串
		 */
		private var _value:String;
		
		
		private var _clipCache:Array;
		private var _clipw:int;
		private var _cliph:int;
		private var _mWidth:Number;
		private var _mHeight:Number;
		private var _requiresRedraw:Boolean;
		private var _charAlignMode:int = CHAR_ALIGAN_WITH_SELF_SIZE;
		
		public function UINumber()
		{
			
		}
		
		public function get skin():StateSkin
		{
			return _skin;
		}
		
		public function set skin(value:StateSkin):void
		{
			if(_skin == value)return;
			styleName = UIStateSetHelper.getClassPath(value);
		}
		
		override public function get styleName():String
		{
			return _styleName;
		}
		
		override public function set styleName(value:String):void
		{
			if(_styleName == value )
				return;
			
			_styleName = value;
			_skin = GuiThemeStyle.getStateSkin(_styleName);
			_clipw = _skin.width;
			_cliph =  _skin.height;
			
			if(!_clipw || !_cliph)
			{
				var url:String = _skin.skinNames[_skin.currentState];
				var sub:Object = GuiTheme.ins.getSubThemeInfo(url);
				if(sub)
				{
					_clipw = sub.width;
					_cliph = sub.height;
					if(_value)reqRedraw();
				}
			}else if(_value)reqRedraw();
		}
		
		public function set number(value:Number):void
		{
			label = value.toString();
		}
		
		public function get number():Number
		{
			return parseFloat(_value);
		}
		
		public function set label(value:String):void
		{
			if(_value == value)return;
			_value = value;
			
			redraw();
			setRequiresRedraw();
		}
		
		public function get label():String
		{
			return _value;
		}
		
		override public function render(painter:Painter):void
		{
			if(_requiresRedraw)
			{
				redraw();
			}
			super.render(painter);
		}
		
		private function redraw():void
		{
			this.removeChildren();
			
			if(!_styleName || !_value)
			{
				return;
			}
			
			var str:String =_value;
			_mWidth = (_clipw > 0 && _charAlignMode == CHAR_ALIGAN_WITH_EQUAL_SIZE) ? str.length * (_clipw + gap) : totalWidth();
			_mHeight = _cliph;
			
			var startX:int = int(left);
			if(_originalWidth > 0)
			{
				if(_textAlign == HorizontalAlign.RIGHT)
				{
					startX = _originalWidth - int(this.right) - _mWidth;
				}else if(_textAlign == HorizontalAlign.CENTER)
				{
					startX = (_originalWidth - _mWidth)/2;
				}
			}
			
			var prevCharWidth:int = 0;
			var prevCharX:int = startX;
			var char:String
			for(var i:int=0; i<str.length; i++)
			{
				char = str.charAt(i);
				var img:Image = creatNumberClip(char, i);
				if(!img)
				{
					continue;
				}
				
				//横向布局
				img.y = 0;
				
				var charWidth:int = (_clipw > 0 && _charAlignMode == CHAR_ALIGAN_WITH_EQUAL_SIZE) ? _clipw : img.width;
				img.x = prevCharX + prevCharWidth + (i > 0 ? gap : 0);
				prevCharWidth = charWidth;
				prevCharX = img.x;
				
				this.addChild(img);
			}
			
			if(!_originalWidth)
				this.width = _mWidth;
			if(!_originalHeight)
				this.height = _mHeight;
			
			_requiresRedraw = false;
		}
		
		
		private function getFrameLabel(char:String):String
		{
			if(frameLabelPreFix && char && char.indexOf(frameLabelPreFix) == 0)
			{
				return char;
			}
			
			var frameLabel:String = (frameLabelPreFix ? frameLabelPreFix : "") + char;
			
			if(!hasOwnFrameLabel(frameLabel))
			{
				char = char.charCodeAt().toString();
				frameLabel = (frameLabelPreFix ? frameLabelPreFix : "") + char;
			}
			
			return frameLabel;
		}
		
		private function hasOwnFrameLabel(frameLabel:String):Boolean
		{
			return _skin && _skin.skinNames.hasOwnProperty(frameLabel);
		}
		
		private function totalWidth():int
		{
			var len:int = _value ? _value.length : 0;
			var frameLabel:String;
			var char:String;
			var total:int;
			for(var i:int=0; i<len; i++)
			{
				char = _value.charAt(i);
				frameLabel = getFrameLabel( char );
				var clipStyleName:String = _skin.skinNames[frameLabel];
				
				if(!clipStyleName)
				{
					continue;
				}
				var texture:IStarlingTexture = GuiTheme.ins.getTexture(clipStyleName);
				if(texture)
				{
					total += texture.width + gap;
				}
			}
			return total;
		}
		
		private function creatNumberClip(char:String, index:int):Image
		{
			if(_clipCache == null)_clipCache = [];
			var img:Image;
			var frameLabel:String = getFrameLabel(char);
			var clipStyleName:String = _skin.skinNames[frameLabel];
			
			if(!clipStyleName)
			{
				trace("[UINumber styleName="+_styleName+ "] char: "+char+" texture is missing");
				return null;
			}
			var texture:IStarlingTexture = GuiTheme.ins.getTexture(clipStyleName);
			img = index >= _clipCache.length ?  null : _clipCache[index];
			if(!img)
			{
				img = new Image(texture);
				_clipCache[index] = img;
			}
			
			img.texture = texture;
			img.pixelSnapping = true;
			
			return img;
		}
		
		private var _originalWidth:Number = 100;
		private var _originalHeight:Number = 25;
		override public function set width(value:Number):void
		{
			if(_originalWidth != value)
			{
				_originalWidth = value;
				super.width = _originalWidth;
				reqRedraw();
			}
		}
		override public function get width():Number
		{
			return this._mWidth || _originalWidth;
		}
		
		override public function set height(value:Number):void
		{
			if(_originalHeight != value)
			{
				_originalHeight = value;
				super.height = _originalHeight;
				reqRedraw();
			}
		}
		
		override public function get height():Number
		{
			return this._mHeight || _originalHeight;
		}
		
		private var _textAlign:String = HorizontalAlign.LEFT;
		/**
		 * 文字的水平对齐方式 ,请使用HorizontalAlign中定义的常量。
		 * 默认值：HorizontalAlign.LEFT。
		 */
		public function get textAlign():String
		{
			return _textAlign;
		}
		
		public function set textAlign(value:String):void
		{
			if(_textAlign==value)
				return;
			_textAlign = value;
			reqRedraw();
		}
		
		public function set charAlignMode(value:int):void
		{
			if(_charAlignMode == value)return;
			_charAlignMode = value;
			reqRedraw();
		}
		
		public function set layout(value:ILayout):void
		{
			//兼容老版本UI
			if(value && Object(value).hasOwnProperty("gap") && value["gap"])
			{
				this.gap = value["gap"];
			}
		}
		
		public function set gap(value:int):void
		{
			if( _gap == value)
				return;
			_gap = value;
			reqRedraw();
		}
		
		public function get gap():int
		{
			return _gap;
		}
		
		private function reqRedraw():void
		{
			_requiresRedraw = true;
			setRequiresRedraw();
		}
		
		override public function dispose():void
		{
			super.dispose();
			removeChildren();
			
			_requiresRedraw = false;
			frameLabelPreFix = null;
			_clipCache = null;
			_skin = null;
			_styleName = null;
		}
	}
}