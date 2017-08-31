package feathers.controls
{
   import feathers.core.FeathersControl;
   import feathers.display.RepeatScale9Image;
   import feathers.textures.RepeatScale9Textures;
   import feathers.themes.GuiTheme;
   import flash.geom.Rectangle;
   import starling.display.DisplayObject;
   import starling.display.Image;
   import starling.styles.IMeshStyle;
   import starling.styles.MeshStyle;
   import starling.textures.IStarlingTexture;
   
   public class UIAsset extends FeathersControl implements IMeshStyle
   {
      
      public static const IMAGE_SCALE_MODE_NO_SCALE:int = 0;
      
      public static const IMAGE_SCALE_MODE_AUTO:int = 1;
      
      public static const IMAGE_FORMAT_BITMAP:int = 0;
      
      public static const IMAGE_FORMAT_ATFX:int = 1;
       
      
      public var onImageLoaded:Function;
      
      private var _content:DisplayObject;
      
      private var _styleName:String;
      
      public var loadPriorityType:int = 6000;
      
      public var imageFormat:int = 0;
      
      private var _imgScaleMode:int = 1;
      
      private var _imgVisible:Boolean = true;
      
      private var _repeatSkin:Boolean = false;
      
      private var _repeatScale9Skin:Boolean = false;
      
      private var _touchAcross:Boolean;
      
      private var _style:MeshStyle;
      
      private var _uv:Rectangle;
      
      public function UIAsset()
      {
         super();
         touchGroup = true;
      }
      
      override public function set styleName(value:String) : void
      {
         imageVisible = false;
         if(GuiTheme.isErrorStr(value))
         {
            onCompelte();
            return;
         }
         if(value.indexOf("?") >= 0)
         {
            value = value.split("?")[0];
         }
         if(_styleName == value && _content != null)
         {
            if(!_imgVisible)
            {
               imageVisible = true;
            }
            onCompelte();
            return;
         }
         _styleName = value;
         if(GuiTheme.ins.hasTexture(value))
         {
            setTexture(GuiTheme.ins.getTexture(value),value);
         }
         else
         {
            GuiTheme.ins.LoadAsset(styleName,onAssetLoad,loadPriorityType,imageFormat);
         }
      }
      
      override public function get styleName() : String
      {
         return _styleName;
      }
      
      private function onAssetLoad(texture:IStarlingTexture) : void
      {
         if(!_styleName)
         {
            return;
         }
         setTexture(GuiTheme.ins.getTexture(styleName));
      }
      
      public function setTexture(texture:IStarlingTexture, key:String = null) : void
      {
         if(!texture)
         {
            onCompelte();
            return;
         }
         if(_repeatScale9Skin && GuiTheme.ins.isCanRepeatWithGpu(key))
         {
            setRepeatSacle9Texture(key);
         }
         else
         {
            setImageTexture(texture,key);
         }
         if(!_imgVisible)
         {
            imageVisible = true;
         }
      }
      
      private function setRepeatSacle9Texture(key:String = null) : void
      {
         var texture:RepeatScale9Textures = GuiTheme.ins.getRepeatScale9Textures(key);
         if(!texture)
         {
            return;
         }
         if(_content is Image)
         {
            _content.removeFromParent(true);
            _content = null;
         }
         if(!_content)
         {
            _content = new RepeatScale9Image(texture);
         }
         var repeatScale9Image:RepeatScale9Image = _content as RepeatScale9Image;
         repeatScale9Image.textures = texture;
         setBg(repeatScale9Image);
      }
      
      private function setImageTexture(texture:IStarlingTexture, key:String = null) : void
      {
         if(!texture)
         {
            return;
         }
         if(_content is RepeatScale9Image)
         {
            _content.removeFromParent(true);
            _content = null;
         }
         if(!_content)
         {
            _content = new Image(texture);
         }
         var image:Image = _content as Image;
         image.texture = texture;
         if(_repeatSkin)
         {
            image.tileGrid = image.tileGrid || new Rectangle();
         }
         else if(key)
         {
            if(GuiTheme.ins.isScale9Textue(key))
            {
               GuiTheme.ins.applayScale9Gird(image,key);
            }
            else if(GuiTheme.ins.isScale3Textue(key))
            {
               GuiTheme.ins.applayScale9Gird(image,key);
            }
         }
         setBg(image);
      }
      
      public function get repeatSkin() : Boolean
      {
         return _repeatSkin;
      }
      
      public function set repeatSkin(value:Boolean) : void
      {
         if(_repeatSkin != value)
         {
            _repeatSkin = value;
            invalidate("styles");
         }
      }
      
      public function get repeatScale9Skin() : Boolean
      {
         return _repeatScale9Skin;
      }
      
      public function set repeatScale9Skin(value:Boolean) : void
      {
         if(_repeatScale9Skin == value)
         {
            return;
         }
         _repeatScale9Skin = value;
         invalidate("styles");
      }
      
      private function setBg(img:DisplayObject) : void
      {
         var image:* = null;
         var useOriginalSize:* = _imgScaleMode == 0;
         if(img is Image)
         {
            image = img as Image;
            if(useOriginalSize)
            {
               useOriginalSize = image.tileGrid == null && image.scale9Grid == null;
            }
            if(_style != null)
            {
               Image(img).setStyle(_style);
            }
            if(_uv && !repeatSkin)
            {
               Image(img).setTextureUVCoords(_uv.x,_uv.y,_uv.width,_uv.height);
            }
         }
         if(!img.parent)
         {
            this.addChildAt(img,0);
         }
         if(useOriginalSize || !this.width)
         {
            this.width = img.width;
         }
         else
         {
            img.width = this.width;
         }
         if(useOriginalSize || !this.height)
         {
            this.height = img.height;
         }
         else
         {
            img.height = this.height;
         }
         img.touchAcross = _touchAcross;
         img.visible = _imgVisible;
         onCompelte();
         invalidate("styles");
      }
      
      override public function set touchAcross(value:Boolean) : void
      {
         if(_touchAcross == value)
         {
            return;
         }
         _touchAcross = value;
         if(_content)
         {
            _content.touchAcross = value;
         }
      }
      
      private function onCompelte() : void
      {
         if(onImageLoaded != null)
         {
            onImageLoaded(this);
         }
         if(hasEventListener("complete"))
         {
            dispatchComplete();
         }
      }
      
      private function dispatchComplete() : void
      {
         this.dispatchEventWith("complete");
      }
      
      override public function set width(value:Number) : void
      {
         if(super.width != value)
         {
            super.width = value;
         }
         if(this._content && this._content.width != value)
         {
            this._content.width = value;
         }
      }
      
      override public function set height(value:Number) : void
      {
         if(super.height != value)
         {
            super.height = value;
         }
         if(this._content && this._content.height != value)
         {
            this._content.height = value;
         }
      }
      
      override public function setSize(width:Number, height:Number) : void
      {
         this.width = width;
         this.height = height;
      }
      
      private function set imageVisible(value:Boolean) : void
      {
         if(_imgVisible == value)
         {
            return;
         }
         _imgVisible = value;
         if(_content && _content.visible != value)
         {
            _content.visible = value;
         }
      }
      
      public function set imageScaleMode(value:int) : void
      {
         if(_imgScaleMode != value)
         {
            _imgScaleMode = value;
            if(_content != null)
            {
               setBg(this._content);
            }
         }
      }
      
      public function get style() : MeshStyle
      {
         return _style;
      }
      
      public function set style(value:MeshStyle) : void
      {
         if(_style == value)
         {
            return;
         }
         _style = value;
         if(_content is Image)
         {
            Image(_content).setStyle(value);
         }
         else if(_content is IMeshStyle)
         {
            IMeshStyle(_content).style = value;
         }
      }
      
      public function setTextureUVCoords(u1:Number, v1:Number, u2:Number, v2:Number) : void
      {
         if(!_uv)
         {
            _uv = new Rectangle();
         }
         _uv.setTo(u1,v1,u2,v2);
         if(_content is Image && !repeatSkin)
         {
            Image(_content).setTextureUVCoords(u1,v1,u2,v2);
         }
         else if(_content != null)
         {
            throw new Error("非法使用uv坐标设置,此功能仅适用于普通贴图(不包括平铺或九宫拉伸)");
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _style = null;
         _content = null;
         _styleName = null;
         onImageLoaded = null;
      }
   }
}
