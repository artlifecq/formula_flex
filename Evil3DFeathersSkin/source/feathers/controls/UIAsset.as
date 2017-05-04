package feathers.controls
{
	import flash.geom.Rectangle;
	
	import feathers.core.FeathersControl;
	import feathers.display.RepeatScale9Image;
	import feathers.textures.RepeatScale9Textures;
	import feathers.themes.GuiTheme;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.events.Event;
	import starling.styles.IMeshStyle;
	import starling.styles.MeshStyle;
	import starling.textures.IStarlingTexture;
	
	/**
	 * 素材包装器,支持普通素材,3宫格素材(支持clamp和repeat),9宫格素材(支持clamp和repeat)
	 * @author wewell
	 * 
	 */	
	public class UIAsset extends FeathersControl implements IMeshStyle
	{
		/**不缩放，采用图片原生尺寸**/
		public static const IMAGE_SCALE_MODE_NO_SCALE:int = 0;
		
		/**根据当前显示对象宽高自由缩放**/
		public static const IMAGE_SCALE_MODE_AUTO:int = 1;
		
		public var onImageLoaded:Function;
		
		private var _content:DisplayObject;
		
		/**
		 * 有tileGrid 或 scale9Grid的image必定使用IMAGE_SCALE_MODE_AUTO模式
		 * 其它普通素材默认为IMAGE_SCALE_MODE_AUTO,如不需要拉伸,请在外部将此属性设置为IMAGE_SCALE_MODE_NO_SCALE
		 */
		private var _imgScaleMode:int = IMAGE_SCALE_MODE_AUTO;
		
		public function UIAsset()
		{
			touchGroup = true;
		}
		
		/**
		 *  设置皮肤
		 * @param value String
		 * 1. 已存在纹理集里的key
		 * 2. 外部url,动态加载,加载完成后将发送Starling.events.Event(Event.COMPLETE)事件
		 * 
		 */		
		override public function set styleName(value:String):void
		{
			if(GuiTheme.isErrorStr(value))
			{
				return;
			}
			
			if(value.indexOf("?") >= 0)
			{
				value = value.split("?")[0];
			}
			if(styleName==value && _content != null)
				return;
			super.styleName = value;
			if(GuiTheme.ins.hasTexture(value))
			{
				setTexture(GuiTheme.ins.getTexture(value), value);
			}else if(this.stage != null){
				onAddedToStage();
			}else{
				this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			}
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			if(!styleName)return;
			
			if(!GuiTheme.ins.hasTexture(styleName))
			{
				GuiTheme.ins.LoadAsset(styleName, onAssetLoad);
			}
		}
		
		private function onAssetLoad():void
		{
			setTexture(GuiTheme.ins.getTexture(styleName));
		}
		
		public function setTexture(texture:IStarlingTexture, key:String = null):void{
			if(!texture)return;
			if(_repeatScale9Skin)
			{
				setRepeatSacle9Texture(key);
			}else{
				setImageTexture(texture, key);
			}
		}
		
		private function setRepeatSacle9Texture(key:String = null):void
		{
			var texture:RepeatScale9Textures = GuiTheme.ins.getRepeatScale9Textures(key);
			if(!texture)return;
			
			if(_content && !(_content is RepeatScale9Image))
			{
				_content.removeFromParent(true);
				_content = null;
			}
			
			_content ||= new RepeatScale9Image(texture);
			
			var repeatScale9Image:RepeatScale9Image = _content as RepeatScale9Image;
			repeatScale9Image.textures = texture;
			
			setBg( repeatScale9Image );
		}
		
		private function setImageTexture(texture:IStarlingTexture, key:String = null):void
		{
			if(!texture)return;
			
			if(_content && !(_content is Image))
			{
				_content.removeFromParent(true);
				_content = null;
			}
			
			_content ||= new Image(texture);
			
			var image:Image = _content as Image;
			image.texture = texture;
			
			if(_repeatSkin){
				image.tileGrid = image.tileGrid || new Rectangle();
			}
			else if(key)
			{
				if(GuiTheme.ins.isScale9Textue(key))
				{
					GuiTheme.ins.applayScale9Gird(image, key);
				}else if(GuiTheme.ins.isScale3Textue(key))
				{
					GuiTheme.ins.applayScale9Gird(image, key);
				} 
			}
			
			setBg( image );
		}
		
/*		public function setScale3Texture(scale3Textrue:Scale3Textures):void
		{
			if(!scale3Textrue)return;
			var img:Scale3Image;
			if(img == null){
				img =  new Scale3Image(scale3Textrue, 1, repeatScale9Skin);
			}else{
				img.textures = scale3Textrue;
			}
			setBg(img);
		}*/
		
		/**
		 * 普通平铺
		 */
		private var _repeatSkin:Boolean = false;
		
		public function get repeatSkin():Boolean
		{
			return _repeatSkin;
		}
		public function set repeatSkin(value:Boolean):void
		{
			if(_repeatSkin!=value)
			{
				_repeatSkin = value;
				invalidate(INVALIDATION_FLAG_STYLES);
			}
		}
		
		/**
		 * 支持九宫缩放的平铺
		 */
		private var _repeatScale9Skin:Boolean = false;
		
		public function get repeatScale9Skin():Boolean
		{
			return _repeatScale9Skin;
		}
		public function set repeatScale9Skin(value:Boolean):void
		{
			if(_repeatScale9Skin==value)
				return;
			_repeatScale9Skin = value;
			invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		private function setBg(img:DisplayObject):void
		{
			//是否使用原生图片大小
			var useOriginalSize:Boolean =  _imgScaleMode == IMAGE_SCALE_MODE_NO_SCALE;
			if(img is Image)
			{
				var image:Image = img as Image;
				useOriginalSize &&= ( image.tileGrid == null && image.scale9Grid == null);
				style = _style;
			}
		
			if(!img.parent)this.addChildAt(img, 0);
			if(useOriginalSize || !this.width){
				this.width = img.width;
			}else{
				img.width = this.width;
			}
			if(useOriginalSize || !this.height){
				this.height = img.height;
			}else{
				img.height = this.height;
			}
			img.touchAcross = _touchAcross;
			
			if(onImageLoaded != null)
			{
				onImageLoaded(this);
			}
			
			if (hasEventListener(Event.COMPLETE)){
//				TimerServer.callAfterFrame(dispatchComplete, 1);
				dispatchComplete();
			}
			
			invalidate(INVALIDATION_FLAG_STYLES);
		}
		
		private var _touchAcross:Boolean;
		override public function set touchAcross(value:Boolean):void
		{
			if(_touchAcross == value)return;
			_touchAcross = value;
			if(_content)_content.touchAcross = value;
		}
		
		private function dispatchComplete():void
		{
			this.dispatchEventWith(Event.COMPLETE);
		}
		
		override public function set width(value:Number):void
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
		
		override public function set height(value:Number):void
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
		
		override public function setSize(width:Number, height:Number):void
		{
			this.width = width;
			this.height = height;
		}
		
		/**
		 * 有tileGrid 或 scale9Grid的image必定使用IMAGE_SCALE_MODE_AUTO模式
		 * 其它普通素材默认为IMAGE_SCALE_MODE_NO_SCALE,如需要拉伸,请在外部将此属性设置为IMAGE_SCALE_MODE_AUTO
		 */
		public function set imageScaleMode(value:int):void
		{
			if(_imgScaleMode != value)
			{
				_imgScaleMode = value;
				if(_content != null)setBg(this._content);
			}
		}
		
		
		/** The style that is used to render the mesh. Styles (which are always subclasses of
		 *  <code>MeshStyle</code>) provide a means to completely modify the way a mesh is rendered.
		 *  For example, they may add support for color transformations or normal mapping.
		 *
		 *  <p>The setter will simply forward the assignee to <code>setStyle(value)</code>.</p>
		 *
		 *  @default MeshStyle
		 */
		private var _style:MeshStyle;
		public function get style():MeshStyle { return _style; }
		public function set style(value:MeshStyle):void
		{
			if(_style == value)return;
			_style = value;
			if(_content is Image)
			{
				Image(_content).setStyle(value);
			}else if(_content is IMeshStyle)
			{
				IMeshStyle(_content).style = value;
			}
		}
	}
}