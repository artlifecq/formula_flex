package feathers.controls
{
   import feathers.core.FeathersControl;
   import feathers.layout.ILayout;
   import feathers.themes.GuiTheme;
   import feathers.themes.GuiThemeStyle;
   
   import starling.display.Image;
   import starling.rendering.Painter;
   import starling.textures.IStarlingTexture;
   
   import utils.UIStateSetHelper;
   
   public class UINumber extends FeathersControl
   {
      
      private static const CHAR_ALIGAN_WITH_EQUAL_SIZE:int = 1;
      
      private static const CHAR_ALIGAN_WITH_SELF_SIZE:int = 2;
       
      
      protected var _styleName:String;
      
      protected var _skin:StateSkin;
      
      private var _gap:int;
      
      public var tween:Boolean = false;
      
      public var frameLabelPreFix:String;
      
      private var _value:String;
      
      private var _clipCache:Array;
      
      private var _clipw:int;
      
      private var _cliph:int;
      
      private var _mWidth:Number;
      
      private var _mHeight:Number;
      
      private var _requiresRedraw:Boolean;
      
      private var _charAlignMode:int = 2;
      
      private var _vert0Color:uint = 16777215;
      
      private var _vert1Color:uint = 16777215;
      
      private var _vert2Color:uint = 16777215;
      
      private var _vert3Color:uint = 16777215;
      
      private var _originalWidth:Number = 100;
      
      private var _originalHeight:Number = 25;
      
      private var _textAlign:String = "left";
      
      public function UINumber()
      {
         super();
      }
      
      public function setVertexColor(vertexID:int, color:uint) : void
      {
         if(vertexID == 0)
         {
            if(_vert0Color != color)
            {
               reqRedraw();
            }
            _vert0Color = color;
         }
         else if(vertexID == 1)
         {
            if(_vert1Color != color)
            {
               reqRedraw();
            }
            _vert1Color = color;
         }
         else if(vertexID == 2)
         {
            if(_vert2Color != color)
            {
               reqRedraw();
            }
            _vert2Color = color;
         }
         else
         {
            if(_vert3Color != color)
            {
               reqRedraw();
            }
            _vert3Color = color;
         }
      }
      
      public function get skin() : StateSkin
      {
         return _skin;
      }
      
      public function set skin(value:StateSkin) : void
      {
         if(_skin == value)
         {
            return;
         }
         styleName = UIStateSetHelper.getClassPath(value);
      }
      
      override public function get styleName() : String
      {
         return _styleName;
      }
      
      override public function set styleName(value:String) : void
      {
         var url:* = null;
         var sub:* = null;
         if(_styleName == value)
         {
            return;
         }
         _styleName = value;
         _skin = GuiThemeStyle.getStateSkin(_styleName);
		 var urlNumber:String=_skin.skinNames["0"];
		 var index:int=urlNumber.lastIndexOf("/");
		 urlNumber=urlNumber.substring(0,index+1);
		 var colors:Array=GuiTheme.ins.getUINumberColor(urlNumber);
		 if(colors){
			 for(var i:int=0;i<colors.length;i++){
				 this.setVertexColor(i,colors[i]);
			 }
		 }
         _clipw = _skin.width;
         _cliph = _skin.height;
         if(!_clipw || !_cliph)
         {
            url = _skin.skinNames[_skin.currentState];
            sub = GuiTheme.ins.getSubThemeInfo(url);
            if(sub)
            {
               _clipw = sub.width;
               _cliph = sub.height;
               if(_value)
               {
                  reqRedraw();
               }
            }
         }
         else if(_value)
         {
            reqRedraw();
         }
      }
      
      public function set number(value:Number) : void
      {
         label = value.toString();
      }
      
      public function get number() : Number
      {
         return parseFloat(_value);
      }
      
      public function set label(value:String) : void
      {
         if(_value == value)
         {
            return;
         }
         _value = value;
         redraw();
         setRequiresRedraw();
      }
      
      public function get label() : String
      {
         return _value;
      }
      
      override public function render(painter:Painter) : void
      {
         if(_requiresRedraw)
         {
            redraw();
         }
         super.render(painter);
      }
      
      private function redraw() : void
      {
         var char:* = null;
         var i:int = 0;
         var img:* = null;
         var charWidth:int = 0;
         this.removeChildren();
         if(!_styleName || !_value)
         {
            return;
         }
         var str:String = _value;
         _mWidth = _clipw > 0 && _charAlignMode == 1?str.length * (_clipw + gap):totalWidth();
         _mHeight = _cliph;
         var startX:int = left;
         if(_originalWidth > 0)
         {
            if(_textAlign == "right")
            {
               startX = _originalWidth - int(this.right) - _mWidth;
            }
            else if(_textAlign == "center")
            {
               startX = (_originalWidth - _mWidth) / 2;
            }
         }
         var prevCharWidth:* = 0;
         var prevCharX:* = startX;
         for(i = 0; i < str.length; )
         {
            char = str.charAt(i);
            img = creatNumberClip(char,i);
            if(img)
            {
               img.setVertexColor(0,_vert0Color);
               img.setVertexColor(1,_vert1Color);
               img.setVertexColor(2,_vert2Color);
               img.setVertexColor(3,_vert3Color);
               img.y = 0;
               charWidth = _clipw > 0 && _charAlignMode == 1?_clipw:img.width;
               img.x = prevCharX + prevCharWidth + (i > 0?gap:0);
               prevCharWidth = charWidth;
               prevCharX = int(img.x);
               this.addChild(img);
            }
            i++;
         }
         if(!_originalWidth)
         {
            this.width = _mWidth;
         }
         if(!_originalHeight)
         {
            this.height = _mHeight;
         }
         _requiresRedraw = false;
      }
      
      private function getFrameLabel(char:String) : String
      {
         if(frameLabelPreFix && char && char.indexOf(frameLabelPreFix) == 0)
         {
            return char;
         }
         var frameLabel:String = (!!frameLabelPreFix?frameLabelPreFix:"") + char;
         if(!hasOwnFrameLabel(frameLabel))
         {
            char = char.charCodeAt().toString();
            frameLabel = (!!frameLabelPreFix?frameLabelPreFix:"") + char;
         }
         return frameLabel;
      }
      
      private function hasOwnFrameLabel(frameLabel:String) : Boolean
      {
         return _skin && _skin.skinNames.hasOwnProperty(frameLabel);
      }
      
      private function totalWidth() : int
      {
         var frameLabel:* = null;
         var char:* = null;
         var total:int = 0;
         var i:int = 0;
         var clipStyleName:* = null;
         var texture:* = null;
         var len:int = !!_value?_value.length:0;
         for(i = 0; i < len; )
         {
            char = _value.charAt(i);
            frameLabel = getFrameLabel(char);
            clipStyleName = _skin.skinNames[frameLabel];
            if(clipStyleName)
            {
               texture = GuiTheme.ins.getTexture(clipStyleName);
               if(texture)
               {
                  total = total + (texture.width + gap);
               }
            }
            i++;
         }
         return total;
      }
      
      private function creatNumberClip(char:String, index:int) : Image
      {
         var img:* = null;
         if(_clipCache == null)
         {
            _clipCache = [];
         }
         var frameLabel:String = getFrameLabel(char);
         var clipStyleName:String = _skin.skinNames[frameLabel];
         if(!clipStyleName)
         {
            trace("[UINumber styleName=" + _styleName + "] char: " + char + " texture is missing");
            return null;
         }
         var texture:IStarlingTexture = GuiTheme.ins.getTexture(clipStyleName);
         img = index >= _clipCache.length?null:_clipCache[index];
         if(!img)
         {
            img = new Image(texture);
            _clipCache[index] = img;
         }
         img.texture = texture;
         img.pixelSnapping = true;
         return img;
      }
      
      override public function set width(value:Number) : void
      {
         if(_originalWidth != value)
         {
            _originalWidth = value;
            super.width = _originalWidth;
            reqRedraw();
         }
      }
      
      override public function get width() : Number
      {
         return this._mWidth || Number(_originalWidth);
      }
      
      override public function set height(value:Number) : void
      {
         if(_originalHeight != value)
         {
            _originalHeight = value;
            super.height = _originalHeight;
            reqRedraw();
         }
      }
      
      override public function get height() : Number
      {
         return this._mHeight || Number(_originalHeight);
      }
      
      public function get textAlign() : String
      {
         return _textAlign;
      }
      
      public function set textAlign(value:String) : void
      {
         if(_textAlign == value)
         {
            return;
         }
         _textAlign = value;
         reqRedraw();
      }
      
      public function set charAlignMode(value:int) : void
      {
         if(_charAlignMode == value)
         {
            return;
         }
         _charAlignMode = value;
         reqRedraw();
      }
      
      public function set layout(value:ILayout) : void
      {
         if(value && Object(value).hasOwnProperty("gap") && value["gap"])
         {
            this.gap = value["gap"];
         }
      }
      
      public function set gap(value:int) : void
      {
         if(_gap == value)
         {
            return;
         }
         _gap = value;
         reqRedraw();
      }
      
      public function get gap() : int
      {
         return _gap;
      }
      
      private function reqRedraw() : void
      {
         _requiresRedraw = true;
         setRequiresRedraw();
      }
      
      override public function dispose() : void
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
