package feathers.controls
{
	import feathers.core.FeathersControl;
	import feathers.layout.ILayout;
	import feathers.themes.GuiTheme;
	import feathers.themes.GuiThemeStyle;
	
	import starling.display.Image;
	import starling.textures.IStarlingTexture;
	
	import utils.UIStateSetHelper;
	
	/**
	 * 位图数字组件 
	 * @author wewell@163.com
	 */
	public class UINumber extends FeathersControl
	{
		protected var _styleName:String;
		protected var _skin:StateSkin;
		
		/**字符间距*/	
		public var gap:int;
		
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
		private var _lastValue:String;
		
		
		private var _clipCache:Array;
		private var _clipw:int;
		private var _cliph:int;
		private var _mWidth:Number;
		private var _mHeight:Number;
		
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
					onSubInfoLoad(sub)
				}else{
					GuiTheme.ins.LoadAsset(url, function():void{
						onSubInfoLoad(GuiTheme.ins.getSubThemeInfo(url));
					});
				}
				
			}else if(_value)update();
		}
		
		private function onSubInfoLoad(sub:Object):void
		{
			if(sub)
			{
				_clipw = sub.width;
				_cliph = sub.height;
				if(_value)update();
			}
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
			_lastValue = _value;
			_value = value;
			update();
		}
		
		public function get label():String
		{
			return _value;
		}
		
		private function update():void
		{
			if(!_styleName)
			{
				//trace("UINumber::请先设置数字贴图风格,如:uiNumber.styleName = 'xxx'或uiNumber.styleClass='Class' ");
				return;
			}
			this.removeChildren();
			
			var str:String =_value;
			for(var i:int=0; i<str.length; i++)
			{
				appendChar( str.charAt(i), i);
			}
			
			_mWidth = str.length * (_clipw + gap);
			_mHeight = _cliph;
			this.width = _mWidth;
			this.height = _mHeight;
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
		
		/**
		 * 追加字符对应贴图
		 * @param char 字符
		 */		
		private function appendChar(char:String, charIndex:int):void{
			var img:Image = creatNumberClip(char, charIndex);
			
			//横向布局
			img.y = 0;
			img.x = charIndex * (_clipw + gap);
			
			this.addChild(img);
		}
		
		private function creatNumberClip(char:String, index:int):Image
		{
			if(_clipCache == null)_clipCache = [];
			var img:Image;
			var frameLabel:String = getFrameLabel(char);
			var clipStyleName:String = _skin.skinNames[frameLabel];
			var texture:IStarlingTexture = GuiTheme.ins.getTexture(clipStyleName);
			if(index >= _clipCache.length)
			{
				img = new Image(texture);
				_clipCache[index] = img;
			}else
			{
				img = _clipCache[index];
				img.texture = texture;
				img.readjustSize();
			}
			return img;
		}
		
		override public function set width(value:Number):void
		{
			super.width = _mWidth;
		}
		override public function get width():Number
		{
			return this._mWidth;
		}
		override public function set height(valeu:Number):void
		{
			super.height = _mHeight;
		}
		override public function get height():Number
		{
			return this._mHeight;
		}
		
		public function set layout(value:ILayout):void
		{
			//兼容老版本UI
			if(value && Object(value).hasOwnProperty("gap") && value["gap"])
			{
				this.gap = value["gap"];
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
			removeChildren();
			
			frameLabelPreFix = null;
			_clipCache = null;
		}
	}
}