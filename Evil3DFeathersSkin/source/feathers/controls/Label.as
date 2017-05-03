package feathers.controls
{
	import flash.display.BitmapData;
	import flash.display.StageQuality;
	import flash.display3D.Context3DTextureFormat;
	import flash.filters.BitmapFilter;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	
	import feathers.controls.text.Fontter;
	import feathers.events.FeathersEventType;
	import feathers.layout.AnchorLayoutData;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.ILayoutData;
	import feathers.layout.ILayoutDisplayObject;
	import feathers.layout.VerticalAlign;
	import feathers.themes.GuiTheme;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Shape;
	import starling.events.Event;
	import starling.rendering.LayerBatchID;
	import starling.rendering.Painter;
	import starling.styles.IMeshStyle;
	import starling.styles.MeshStyle;
	import starling.text.TextFieldAutoSize;
	import starling.textures.IStarlingTexture;
	import starling.utils.Pool;
	import starling.utils.RectangleUtil;
	import starling.utils.deg2rad;

/** A TextField displays text, either using standard true type fonts or custom bitmap fonts.
 *  
 *  <p>You can set all properties you are used to, like the font name and size, a color, the 
 *  horizontal and vertical alignment, etc. The border property is helpful during development, 
 *  because it lets you see the bounds of the TextField.</p>
 *  
 *  <p>There are two types of fonts that can be displayed:</p>
 *  
 *  <ul>
 *    <li>Standard TrueType fonts. This renders the text just like a conventional Flash
 *        TextField. It is recommended to embed the font, since you cannot be sure which fonts
 *        are available on the client system, and since this enhances rendering quality. 
 *        Simply pass the font name to the corresponding property.</li>
 *    <li>Bitmap fonts. If you need speed or fancy font effects, use a bitmap font instead. 
 *        That is a font that has its glyphs rendered to a texture atlas. To use it, first 
 *        register the font with the method <code>registerBitmapFont</code>, and then pass 
 *        the font name to the corresponding property of the text field.</li>
 *  </ul> 
 *    
 *  For bitmap fonts, we recommend one of the following tools:
 * 
 *  <ul>
 *    <li>Windows: <a href="http://www.angelcode.com/products/bmfont">Bitmap Font Generator</a>
 *        from Angel Code (free). Export the font data as an XML file and the texture as a png
 *        with white characters on a transparent background (32 bit).</li>
 *    <li>Mac OS: <a href="http://glyphdesigner.71squared.com">Glyph Designer</a> from 
 *        71squared or <a href="http://http://www.bmglyph.com">bmGlyph</a> (both commercial). 
 *        They support Starling natively.</li>
 *  </ul>
 *
 *  <p>When using a bitmap font, the 'color' property is used to tint the font texture. This
 *  works by multiplying the RGB values of that property with those of the texture's pixel.
 *  If your font contains just a single color, export it in plain white and change the 'color'
 *  property to any value you like (it defaults to zero, which means black). If your font
 *  contains multiple colors, change the 'color' property to <code>Color.WHITE</code> to get
 *  the intended result.</p>
 *
 *  <strong>Batching of TextFields</strong>
 *  
 *  <p>Normally, TextFields will require exactly one draw call. For TrueType fonts, you cannot
 *  avoid that; bitmap fonts, however, may be batched if you enable the "batchable" property.
 *  This makes sense if you have several TextFields with short texts that are rendered one
 *  after the other (e.g. subsequent children of the same sprite), or if your bitmap font
 *  texture is in your main texture atlas.</p>
 *  
 *  <p>The recommendation is to activate "batchable" if it reduces your draw calls (use the
 *  StatsDisplay to check this) AND if the TextFields contain no more than about 10-15
 *  characters (per TextField). For longer texts, the batching would take up more CPU time
 *  than what is saved by avoiding the draw calls.</p>
 */
public class Label extends DisplayObjectContainer implements IMeshStyle, ILayoutDisplayObject
{
	// the texture format that is used for TTF rendering
	private static var _defaultTextureFormat:String =
		"BGRA_PACKED" in Context3DTextureFormat ? "bgraPacked4444" : "bgra";
		
	private var _fontSize:Number;
	private var _color:uint;
	private var _text:String;
	private var _fontName:String;
	private var _horizontalAlign:String;
	private var _verticalAlign:String;
	private var _bold:Boolean;
	private var _italic:Boolean;
	private var _underline:Boolean;
	private var _autoScale:Boolean;
	private var _autoSize:String;
	private var _kerning:Boolean;
	private var _letterSpacing:Number;
	private var _leading:Number;
	private var _nativeFilters:Array;
	private var _requiresRedraw:Boolean;
	private var _isHtmlText:Boolean;
	private var _textBounds:Rectangle;
	private var _batchable:Boolean;
	private var _embedFont:Boolean = Fontter.embedFonts;
	
	private var _hitArea:Rectangle;
	private var _border:Shape;
	
	private var _image:Quad;
	
	public var 	minWidth:int = 4;
	public var 	minHeight:int = 4;
	public var 	maxWidth:int = 0;
	public var 	maxHeight:int = 0;
	private var _numLines:int;
	private var _textWidth:int;
	private var _textHeight:int;
	private var _textureKey:String;
	private var _charImages:Vector.<Image>;
	
	private static const MAX_WIDTH:int = 1980;
	private static const MAX_HEIGHT:int = 800;
	
	/** Helper objects. */
	private static var sHelperMatrix:Matrix = new Matrix();
	private static var sNativeTextField:flash.text.TextField = new flash.text.TextField();
	
	public function Label()
	{
		_fontName = Fontter.DEFAULT_FONT_NAME;
		_fontSize = Fontter.DEFAULT_FONT_SIZE;
		
		_color = 0xFFFFFF;
		_border = null;
		_kerning = true;
		_letterSpacing = 0;
		_leading = 0;
		_bold = false;
		_wordWrap = true;
		_autoSize = TextFieldAutoSize.BOTH_DIRECTIONS;
		_hitArea = new Rectangle(0, 0, minWidth, minHeight);//label container size
		_textBounds = new Rectangle();//textfiled size
		_text = "";
		
		_horizontalAlign = HorizontalAlign.LEFT;
		_verticalAlign = VerticalAlign.TOP;
		_layerBatchId = LayerBatchID.LABEL;
		
		CONFIG::Starling_Debug
		{
			border = true;
		}
		touchable =  true;
		touchGroup = true;
	}
	
	/**
	 * 垂直对齐方式,支持VerticalAlign.TOP,VerticalAlign.BOTTOM,VerticalAlign.MIDDLE和VerticalAlign.JUSTIFY(两端对齐);
	 * 默认值：VerticalAlign.TOP。
	 */
	public function get verticalAlign():String
	{
		return _verticalAlign;
	}
	public function set verticalAlign(value:String):void
	{
		if(_verticalAlign==value)
			return;
		_verticalAlign = value;
		vAlign = value;
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
		hAlign = value;
	}
	
	/**
	 * @private
	 */
	public function get htmlText():String
	{
		return this.text;
	}
	
	/**
	 * @private
	 */
	public function set htmlText(value:String):void
	{
		this.text = value;
		isHtmlText = true;
	}
	
	/**
	 * @private
	 */
	protected var _wordWrap:Boolean = true;
	
	/**
	 * Determines if the text wraps to the next line when it reaches the
	 * width (or max width) of the component.
	 *
	 * <p>In the following example, the label's text is wrapped:</p>
	 *
	 * <listing version="3.0">
	 * label.wordWrap = true;</listing>
	 *
	 * @default false
	 */
	public function get wordWrap():Boolean
	{
		return this._wordWrap;
	}
	
	/**
	 * @private
	 */
	public function set wordWrap(value:Boolean):void
	{
		if(this._wordWrap == value)
		{
			return;
		}
		this._wordWrap = value;
	}
	
	private var _textFormat:TextFormat;
	public function setTextFormat(textFormat:TextFormat):void
	{
			if(!textFormat)return;
			_fontName = textFormat.font;
			_fontSize = int(textFormat.size);
			_color = uint(textFormat.color);
			_bold = textFormat.bold;
			_italic = textFormat.italic;
			_underline = textFormat.underline;
			_horizontalAlign = textFormat.align;
			_kerning = textFormat.kerning;
			_leading = Number(textFormat.leading);
			_textFormat = textFormat;
			invalidate();
	}
	
	public function set textFormat(value:TextFormat):void
	{
		setTextFormat(value);
	}
	
	public function get textFormat():TextFormat
	{
		return this._textFormat;
	}
	
	/** This method is called immediately before the text is rendered. The intent of
	 *  'formatText' is to be overridden in a subclass, so that you can provide custom
	 *  formatting for the TextField. In the overridden method, call 'setFormat' (either
	 *  over a range of characters or the complete TextField) to modify the format to
	 *  your needs.
	 *  
	 *  @param textField  the flash.text.TextField object that you can format.
	 *  @param textFormat the default text format that's currently set on the text field.
	 */
	protected function formatText(textField:flash.text.TextField, textFormat:TextFormat):void
	{
		textField.defaultTextFormat = textFormat;
		if(this._embedFont)
		{
			Fontter.transTextFormat(textField.defaultTextFormat);
		}
	}
	
	
	/** Disposes the underlying texture data. */
	public override function dispose():void
	{
		super.dispose();
		
		if(_border)
		{
			_border.dispose();
			_border = null;
		}
		
		_hitArea = null;
		_image = null;
	}
	
	/** @inheritDoc */
	public override function render(painter:Painter):void
	{
		if(! painter.contextValid )
			return;
		
		if (_requiresRedraw) 
		{
			redraw();
		}
		super.render(painter);
	}
	
	/** Forces the text field to be constructed right away. Normally, 
	 *  it will only do so lazily, i.e. before being rendered. */
	public function redraw():void
	{
		if (_requiresRedraw)
		{
			if(_useBitmapFonts && !_isHtmlText)
			{
				renderBitmapFonts();
			}else{
				createRenderedContents();
			}
			
			if(_border != null)updateBorder();
			
			_requiresRedraw = false;
		}
	}
	
	private function getTextureKey(chars:String):String
	{
		var filterId:String = Fontter.getFilterId(_nativeFilters);
		return _fontName+"_"+fontSize+"_"+_color+"_"+filterId+"_"+chars;
	}
	
	// TrueType font rendering
	private function createRenderedContents():void
	{
		if(!_text)return;
		
		var texture:IStarlingTexture;
		var scale:Number = Starling.contentScaleFactor;
		
		//get texture cache
		_textureKey = getTextureKey(_text);
		
		texture = GuiTheme.ins.getTexture(_textureKey);
		
		//may be has disposed!
		if(texture && texture.disposed)
		{
			texture = null;
		}
		
		var bitmapData:BitmapData = renderText(scale);
		
		if(bitmapData.width < 1 || bitmapData.height < 1 || bitmapData.width > MAX_WIDTH || bitmapData.height > MAX_HEIGHT)
		{
			if(Starling.current.showTrace)tracing("[Starling]Label: can't render size:",bitmapData.width, bitmapData.height, text);
			bitmapData.dispose();
			return;
		}
		
		//裁剪至最小
		var clip:Rectangle = bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
		if(!clip || clip.width < 1 || clip.height < 1)
		{
			if(Starling.current.showTrace)tracing("[Starling]Label:can't render clip size:", clip.width, clip.height);
			return;
		}
		
		if (_image == null) 
		{
			_image = new Quad(clip.width, clip.height);
			_image.touchable = false;
			_image.pixelSnapping = true;
			addChild(_image);
		}
		_image.x = clip ?  int(clip.x) : 0;
		_image.y = clip ? int(clip.y) : 0;
		
		if(!texture)
		{
			texture = GuiTheme.ins.pushDynamicLabelBitmapData(_textureKey, bitmapData, clip);
		}
		
		//立即释放内存
		bitmapData.dispose();
		bitmapData = null;
		
		_image.texture = texture;
		
		if(Starling.current.showTrace)tracing("[Starling]Label:render size:",_image.texture.width, _image.texture.height, text );
	}
	
	protected function getTextuerFormat():String
	{
		return _defaultTextureFormat;
	}
	
	public function clearCacheSize():void
	{
		this.width = this.height = 0;
	}
	
	protected function invalidate():void
	{
		_requiresRedraw = true;
		setRequiresRedraw();
	}
	/**
	 * @inheritDoc
	 */
	public function measureText(result:Point = null):Point
	{
		if(!result)
		{
			result = new Point();
		}
		
		if(_requiresRedraw)
		{
			measure();
		}
		result.x = _textWidth;
		result.y = _textHeight;
		return result;
	}
	
	protected function measure():void
	{
		var width:Number  = _hitArea.width;
		var height:Number = _hitArea.height;
		
		if (isHorizontalAutoSize)
		{
			width = maxWidth ? maxWidth : MAX_WIDTH;
		}
		if (isVerticalAutoSize)
		{
			height = maxHeight ? maxHeight : MAX_HEIGHT;
		}
		
		if(_textFormat == null)_textFormat = new TextFormat();
		_textFormat.font = _fontName;
		_textFormat.size = _fontSize;
		_textFormat.color = _color;
		_textFormat.bold = _bold;
		_textFormat.italic = _italic;
		_textFormat.underline = _underline;
		_textFormat.align = _horizontalAlign;
		_textFormat.kerning = _kerning;
		_textFormat.leading = _leading;
		_textFormat.letterSpacing = _letterSpacing;
		
		sNativeTextField.defaultTextFormat = _textFormat;
		sNativeTextField.width = width;
		sNativeTextField.height = height;
		sNativeTextField.antiAliasType = AntiAliasType.ADVANCED;
		sNativeTextField.thickness = Fontter.DEFAULT_THICKNESS;		
		sNativeTextField.gridFitType = GridFitType.NONE;
		sNativeTextField.selectable = false;            
		sNativeTextField.multiline = true;            
		sNativeTextField.wordWrap = true;         
		sNativeTextField.useRichTextClipboard = true;
		
		sNativeTextField.embedFonts = _embedFont;
		
		formatText(sNativeTextField, _textFormat);
		
		if (_isHtmlText) sNativeTextField.htmlText = _text;
		else             sNativeTextField.text     = _text;
		
		sNativeTextField.filters = _nativeFilters;
		
//		if (_autoScale)
//			autoScaleNativeTextField(sNativeTextField);
		
		var textWidth:Number  = sNativeTextField.textWidth;
		var textHeight:Number = sNativeTextField.textHeight;
		
		var measuredH:Number = Math.ceil(textHeight + 4);
		var measuedW:Number = Math.ceil(textWidth + 6);
		
		if (isHorizontalAutoSize || !_hitArea.width)
			sNativeTextField.width = width = measuedW;
		if(_hitArea.width)
			sNativeTextField.width = width =  _hitArea.width < measuedW ? measuedW : _hitArea.width;
		if (isVerticalAutoSize || !_hitArea.height)
			sNativeTextField.height = height = measuredH;
		if(_hitArea.height)
			sNativeTextField.height = height = _hitArea.height < measuredH ? measuredH : _hitArea.height;
		
		// avoid invalid texture size
		if (width  < minWidth) 
			width  = minWidth;
		if (height < minHeight)
			height = minHeight;
		
		_hitArea.width = width;
		_hitArea.height = height;
		
		this._textWidth = sNativeTextField.textWidth;
		this._textHeight = sNativeTextField.textHeight;
		this._numLines = sNativeTextField.numLines;
		var charClip:Rectangle = sNativeTextField.getCharBoundaries(0);
		if(charClip)
		{
			this._textBounds.x = charClip.x;
			this._textBounds.y = charClip.y;
		}
		this._textBounds.width = this._textWidth;
		this._textBounds.height = this._textHeight;
	}
	
	private function renderText(scale:Number):BitmapData
	{
		//measure and set best textField size
		measure();
		
		var width:Number  = _hitArea.width;
		var height:Number = _hitArea.height;
		
		var textOffsetX:Number = 0.0;
		//		if (hAlign == HAlign.LEFT)        textOffsetX = 2; // flash adds a 2 pixel offset
		//		else
		if (hAlign == HorizontalAlign.CENTER) 
			textOffsetX = (width - _textWidth) / 2.0;
		//		else
		//			if (hAlign == HorizontalAlign.RIGHT)  textOffsetX =  width - textWidth - 2;
		
		var textOffsetY:Number = 0.0;
		//		if (vAlign == VerticalAlign.TOP)         textOffsetY = 2; // flash adds a 2 pixel offset
		//		else 
		if (vAlign == VerticalAlign.MIDDLE) 
			textOffsetY = (height - _textHeight) / 2.0;
		else
			if (vAlign == VerticalAlign.BOTTOM) textOffsetY =  height - textHeight - 2;
		
		// if 'nativeFilters' are in use, the text field might grow beyond its bounds
		var filterOffset:Point = calculateFilterOffset(sNativeTextField, hAlign, vAlign);
		
		// finally: draw text field to bitmap data
		var bitmapData:BitmapData = null;
		bitmapData = new BitmapData(width, height, true, 0x0);
		var drawMatrix:Matrix = new Matrix(1, 0, 0, 1,
			filterOffset.x, filterOffset.y + textOffsetY);
		
		drawText(sNativeTextField, drawMatrix, bitmapData);
		sNativeTextField.text = "";
		
		return bitmapData;
	}
	
	protected function drawText(textFiled:TextField, matrix:Matrix, bitmapData:BitmapData):void
	{
		var drawWithQualityFunc:Function = 
			"drawWithQuality" in bitmapData ? bitmapData["drawWithQuality"] : null;
		
		// Beginning with AIR 3.3, we can force a drawing quality. Since "LOW" produces
		// wrong output oftentimes, we force "MEDIUM" if possible.
		
		if (drawWithQualityFunc is Function)
			drawWithQualityFunc.call(bitmapData, sNativeTextField, matrix, 
				null, null, null, false, StageQuality.MEDIUM);
		else
			bitmapData.draw(sNativeTextField, matrix);
	}
	
	private function calculateFilterOffset(textField:flash.text.TextField,
										   hAlign:String, vAlign:String):Point
	{
		var resultOffset:Point = new Point();
		var filters:Array = textField.filters;
		
		if (filters != null && filters.length > 0)
		{
			var textWidth:Number  = textField.textWidth;
			var textHeight:Number = textField.textHeight;
			var bounds:Rectangle  = new Rectangle();
			
			for each (var filter:BitmapFilter in filters)
			{
				var blurX:Number    = "blurX"    in filter ? filter["blurX"]    : 0;
				var blurY:Number    = "blurY"    in filter ? filter["blurY"]    : 0;
				var angleDeg:Number = "angle"    in filter ? filter["angle"]    : 0;
				var distance:Number = "distance" in filter ? filter["distance"] : 0;
				var angle:Number = deg2rad(angleDeg);
				var marginX:Number = blurX * 1.33; // that's an empirical value
				var marginY:Number = blurY * 1.33;
				var offsetX:Number  = Math.cos(angle) * distance - marginX / 2.0;
				var offsetY:Number  = Math.sin(angle) * distance - marginY / 2.0;
				var filterBounds:Rectangle = new Rectangle(
					offsetX, offsetY, textWidth + marginX, textHeight + marginY);
				
				bounds = bounds.union(filterBounds);
			}
			
			if (hAlign == HorizontalAlign.LEFT && bounds.x < 0)
				resultOffset.x = -bounds.x;
			else if (hAlign == HorizontalAlign.RIGHT && bounds.y > 0)
				resultOffset.x = -(bounds.right - textWidth);
			
			if (vAlign == VerticalAlign.TOP && bounds.y < 0)
				resultOffset.y = -bounds.y;
			else if (vAlign == VerticalAlign.BOTTOM && bounds.y > 0)
				resultOffset.y = -(bounds.bottom - textHeight);
			
			//text has 2 pixel off when use Filter
			if(hAlign == HorizontalAlign.LEFT)
				resultOffset.x -= resultOffset.x;
			if(vAlign == VerticalAlign.TOP)
				resultOffset.y -= resultOffset.y;
		}
		
		return resultOffset;
	}
	
	private function updateBorder():void
	{
		if (_border == null) return;
		
		var width:Number  = _hitArea.width;
		var height:Number = _hitArea.height;
		
		var boder:Shape = _border;
		boder.clear();
		boder.lineStyle(1,_color);
		boder.moveTo(0, 0);
		boder.lineTo(width, 0);
		boder.lineTo(width, height);
		boder.lineTo(0, height);
		boder.lineTo(0, 0);
	}
	
	// properties
	private function get isHorizontalAutoSize():Boolean
	{
		return _autoSize == TextFieldAutoSize.HORIZONTAL || 
			_autoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
	}
	
	private function get isVerticalAutoSize():Boolean
	{
		return _autoSize == TextFieldAutoSize.VERTICAL || 
			_autoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
	}
	
	/** Returns the bounds of the text within the text field. */
	private var outTextBounds:Rectangle;
	public function get textBounds():Rectangle
	{
		if(_requiresRedraw)
		{
			measure();
		}
		if(outTextBounds == null)outTextBounds = new Rectangle();
		outTextBounds.copyFrom(_textBounds);
		return outTextBounds;
	}
	
	/** @inheritDoc */
	public override function getBounds(targetSpace:DisplayObject, resultRect:Rectangle=null):Rectangle
	{
		if(_requiresRedraw)
		{
			measure();
		}
		getTransformationMatrix(targetSpace, sHelperMatrix);
		return RectangleUtil.getBounds(_hitArea, sHelperMatrix, resultRect);
	}
	
	/** @inheritDoc */
	public override function hitTest(localPoint:Point):DisplayObject
	{
		if ((!visible || !touchable)) return null;
		else if (_hitArea.containsPoint(localPoint) && hitTestMask(localPoint)) return this;
		else return null;
	}
	
	/** @inheritDoc */
	public override function set width(value:Number):void
	{
		// different to ordinary display objects, changing the size of the text field should 
		// not change the scaling, but make the texture bigger/smaller, while the size 
		// of the text/font stays the same (this applies to the height, as well).
		
		//init maxWidth
		if(!maxWidth && value > 0)
		{
			maxWidth = value;
		}
		
		if(_hitArea.width != value)
		{
			_hitArea.width = value;
			invalidate();
		}
	}
	
	public override function get width():Number
	{
		if(_requiresRedraw)
		{
			measure();
		}
		return _hitArea.width;
	}
	
	/** @inheritDoc */
	public override function set height(value:Number):void
	{
		//init maxHeight
		if(!maxHeight && value > 0)
		{
			maxHeight = value;
		}
		if(_hitArea.height != value)
		{
			_hitArea.height = value;
			invalidate();
		}
	}

	public override function get height():Number
	{
		if(_requiresRedraw)
		{
			measure();
		}
		return _hitArea.height;
	}
	
	/** The displayed text. */
	public function get text():String { return _text; }
	public function set text(value:String):void
	{
		if (value == null) value = "";
		if(_image)_image.visible = value;
		if (_text != value)
		{
			_text = value;
			invalidate();
		}
	}
	
	/**
	 * @inheritDoc
	 */
	public function get baseline():Number
	{
		if(!sNativeTextField)
		{
			return 0;
		}
		return sNativeTextField.getLineMetrics(0).ascent;
	}
	
	//===========================文本上下左右的偏移=====================
	protected var _padding:Number = 0;
	/**
	 * 四个边缘的共同内边距。若单独设置了任一边缘的内边距，则该边缘的内边距以单独设置的值为准。
	 * 此属性主要用于快速设置多个边缘的相同内边距。默认值：0。
	 */
	public function get padding():Number
	{
		return _padding;
	}
	public function set padding(value:Number):void
	{
		if(_padding==value)
			return;
		_padding = value;
		invalidate();
	}
	
	protected var _paddingLeft:Number = NaN;
	/**
	 * 文字距离左边缘的空白像素,若为NaN将使用padding的值，默认值：NaN。
	 */
	public function get paddingLeft():Number
	{
		return _paddingLeft;
	}
	
	public function set paddingLeft(value:Number):void
	{
		if (_paddingLeft == value)
			return;
		
		_paddingLeft = value;
		invalidate();
	}    
	
	protected var _paddingRight:Number = NaN;
	/**
	 * 文字距离右边缘的空白像素,若为NaN将使用padding的值，默认值：NaN。
	 */
	public function get paddingRight():Number
	{
		return _paddingRight;
	}
	
	public function set paddingRight(value:Number):void
	{
		if (_paddingRight == value)
			return;
		
		_paddingRight = value;
		invalidate();
	}    
	
	protected var _paddingTop:Number = NaN;
	/**
	 * 文字距离顶部边缘的空白像素,若为NaN将使用padding的值，默认值：NaN。
	 */
	public function get paddingTop():Number
	{
		return _paddingTop;
	}
	
	public function set paddingTop(value:Number):void
	{
		if (_paddingTop == value)
			return;
		
		_paddingTop = value;
		invalidate();
	}    
	
	protected var _paddingBottom:Number = NaN;
	/**
	 * 文字距离底部边缘的空白像素,若为NaN将使用padding的值，默认值：NaN。
	 */
	public function get paddingBottom():Number
	{
		return _paddingBottom;
	}
	
	public function set paddingBottom(value:Number):void
	{
		if (_paddingBottom == value)
			return;
		
		_paddingBottom = value;
		invalidate();
	}    
	
	/** The name of the font (true type or bitmap font). */
	public function get fontName():String { return _fontName; }
	public function set fontName(value:String):void
	{
		if (_fontName != value)
		{
			_fontName = value;
			invalidate();
		}
	}
	
	/** The size of the font. For bitmap fonts, use <code>BitmapFont.NATIVE_SIZE</code> for 
	 *  the original size. */
	public function get fontSize():Number { return _fontSize; }
	public function set fontSize(value:Number):void
	{
		if (_fontSize != value)
		{
			_fontSize = value;
			invalidate();
		}
	}
	
	/** The color of the text. Note that bitmap fonts should be exported in plain white so
	 *  that tinting works correctly. If your bitmap font contains colors, set this property
	 *  to <code>Color.WHITE</code> to get the desired result. @default black */
	public function get color():uint { return _color; }
	public function set color(value:uint):void
	{
		if (_color != value)
		{
			_color = value;
			invalidate();
		}
	}
	
	/** The horizontal alignment of the text. @default center @see starling.utils.HAlign */
	private function get hAlign():String { return _horizontalAlign; }
	private function set hAlign(value:String):void
	{
		
		if (_horizontalAlign != value)
		{
			_horizontalAlign = value;
			invalidate();
		}
	}
	
	/** The vertical alignment of the text. @default center @see starling.utils.HorizontalAlign */
	private function get vAlign():String { return _verticalAlign; }
	private function set vAlign(value:String):void
	{
		
		if (_verticalAlign != value)
		{
			_verticalAlign = value;
			invalidate();
		}
	}
	
	/** Draws a border around the edges of the text field. Useful for visual debugging. 
	 *  @default false */
	public function get border():Boolean { return _border != null; }
	public function set border(value:Boolean):void
	{
		if (value && _border == null)
		{                
			_border = new Shape();
			addChild(_border);
			updateBorder();
		}
		else if (!value && _border != null)
		{
			_border.removeFromParent(true);
			_border = null;
		}
	}
	
	/** Indicates whether the text is bold. @default false */
	public function get bold():Boolean { return _bold; }
	public function set bold(value:Boolean):void 
	{
		if (_bold != value)
		{
			_bold = value;
			invalidate();
		}
	}
	
	/** Indicates whether the text is italicized. @default false */
	public function get italic():Boolean { return _italic; }
	public function set italic(value:Boolean):void
	{
		if (_italic != value)
		{
			_italic = value;
			invalidate();
		}
	}
	
	/** Indicates whether the text is underlined. @default false */
	public function get underline():Boolean { return _underline; }
	public function set underline(value:Boolean):void
	{
		if (_underline != value)
		{
			_underline = value;
			invalidate();
		}
	}
	
	/** Indicates whether kerning is enabled. @default true */
	public function get kerning():Boolean { return _kerning; }
	public function set kerning(value:Boolean):void
	{
		if (_kerning != value)
		{
			_kerning = value;
			invalidate();
		}
	}
	
	/** Indicates whether kerning is enabled. @default 1 */
	public function get letterSpacing():Number { return _letterSpacing; }
	public function set letterSpacing(value:Number):void
	{
		if (_letterSpacing != value && !isNaN(value))
		{
			_letterSpacing = value;
			invalidate();
		}
	}
	
	/** Indicates whether the font size is scaled down so that the complete text fits
	 *  into the text field. @default false */
	public function get autoScale():Boolean { return _autoScale; }
	public function set autoScale(value:Boolean):void
	{
		if (_autoScale != value)
		{
			_autoScale = value;
			invalidate();
		}
	}
	
	/** Specifies the type of auto-sizing the TextField will do.
	 *  Note that any auto-sizing will make auto-scaling useless. Furthermore, it has 
	 *  implications on alignment: horizontally auto-sized text will always be left-, 
	 *  vertically auto-sized text will always be top-aligned. @default "BOTH_DIRECTIONS" 
	 * autoSize:TextFieldAutoSize.HORIZONTAL, TextFieldAutoSize.VERTICAL, TextFieldAutoSize.BOTH_DIRECTIONS*/

	public function get autoSize():String { return _autoSize; }
	public function set autoSize(value:String):void
	{
		if (_autoSize != value)
		{
			_autoSize = value;
			invalidate();
		}
	}
	
	/** The native Flash BitmapFilters to apply to this TextField.
	 *
	 *  <p>BEWARE: this property is ignored when using bitmap fonts!</p> */
	public function get nativeFilters():Array { return _nativeFilters; }
	public function set nativeFilters(value:Array) : void
	{
		if(_nativeFilters != value)
		{
			_nativeFilters = value
			invalidate();
		}
	}
	
	/** Indicates if the assigned text should be interpreted as HTML code. For a description
	 *  of the supported HTML subset, refer to the classic Flash 'TextField' documentation.
	 *  Clickable hyperlinks and external images are not supported.
	 *
	 *  <p>BEWARE: this property is ignored when using bitmap fonts!</p> */
	public function get isHtmlText():Boolean { return _isHtmlText; }
	public function set isHtmlText(value:Boolean):void
	{
		if (_isHtmlText != value)
		{
			_isHtmlText = value;
			invalidate();
		}
	}
	
	/** The amount of vertical space (called 'leading') between lines. @default 0 */
	public function get leading():Number { return _leading; }
	public function set leading(value:Number):void
	{
		if (_leading != value)
		{
			_leading = value;
			invalidate();
		}
	}
	
	/** The Context3D texture format that is used for rendering of all TrueType texts.
	 *  The default (<pre>Context3DTextureFormat.BGRA_PACKED</pre>) provides a good
	 *  compromise between quality and memory consumption; use <pre>BGRA</pre> for
	 *  the highest quality. */
	public static function get defaultTextureFormat():String { return _defaultTextureFormat; }
	public static function set defaultTextureFormat(value:String):void
	{
		_defaultTextureFormat = value;
	}
	
	/**
	 * 是否使用内嵌字体. @default false 
	 * */
	public function get embedFonted():Boolean { return _embedFont; }
	public function set embedFonted(value:Boolean):void{ _embedFont = value;}
	
	// optimization for 'toLowerCase' calls
	
	private static var sStringCache:Dictionary = new Dictionary();
	
	private static function convertToLowerCase(string:String):String
	{
		var result:String = sStringCache[string];
		if (result == null)
		{
			result = string.toLowerCase();
			sStringCache[string] = result;
		}
		return result;
	}
	
	//========================layout=================================
	/**
	 * @private
	 */
	protected var _includeInLayout:Boolean = true;
	
	/**
	 * @inheritDoc
	 *
	 * @default true
	 */
	public function get includeInLayout():Boolean
	{
		return this._includeInLayout;
	}
	
	/**
	 * @private
	 */
	public function set includeInLayout(value:Boolean):void
	{
		if(this._includeInLayout == value)
		{
			return;
		}
		this._includeInLayout = value;
		this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
	}
	
	/**
	 * @private
	 */
	protected var _layoutData:ILayoutData;
	
	/**
	 * @inheritDoc
	 *
	 * @default null
	 */
	public function get layoutData():ILayoutData
	{
		return this._layoutData;
	}
	
	/**
	 * @private
	 */
	public function set layoutData(value:ILayoutData):void
	{
		if(this._layoutData == value)
		{
			return;
		}
		if(this._layoutData)
		{
			this._layoutData.removeEventListener(Event.CHANGE, layoutData_changeHandler);
		}
		this._layoutData = value;
		if(this._layoutData)
		{
			this._layoutData.addEventListener(Event.CHANGE, layoutData_changeHandler);
		}
		this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
	}
	/**
	 * @private
	 */
	protected function layoutData_changeHandler(event:Event):void
	{
		this.dispatchEventWith(FeathersEventType.LAYOUT_DATA_CHANGE);
	}
	
	private var _left:Number;
	
	/**
	 * @inheritDoc
	 */
	public function get left():Number
	{
		return _left;
	}
	public function set left(value:Number):void
	{
		if(_left == value)
			return;
		_left = value;
		invalidateAnchorLayoutDataData("left", value);
	}
	
	private var _right:Number;
	/**
	 * @inheritDoc
	 */
	public function get right():Number
	{
		return _right;
	}
	public function set right(value:Number):void
	{
		if(_right == value)
			return;
		_right = value;
		invalidateAnchorLayoutDataData("right", value);
	}
	
	private var _top:Number;
	/**
	 * @inheritDoc
	 */
	public function get top():Number
	{
		return _top;
	}
	public function set top(value:Number):void
	{
		if(_top == value)
			return;
		_top = value;
		invalidateAnchorLayoutDataData("top", value);
	}
	
	private var _bottom:Number;
	/**
	 * @inheritDoc
	 */	
	public function get bottom():Number
	{
		return _bottom;
	}
	public function set bottom(value:Number):void
	{
		if(_bottom == value)
			return;
		_bottom = value;
		invalidateAnchorLayoutDataData("bottom", value);
	}
	
	private var _horizontalCenter:Number;
	/**
	 * @inheritDoc
	 */
	public function get horizontalCenter():Number
	{
		return _horizontalCenter;
	}
	public function set horizontalCenter(value:Number):void
	{
		if(_horizontalCenter == value)
			return;
		_horizontalCenter = value;
		invalidateAnchorLayoutDataData("horizontalCenter", value);
	}
	
	private var _verticalCenter:Number;
	/**
	 * @inheritDoc
	 */
	public function get verticalCenter():Number
	{
		return _verticalCenter;
	}
	
	public function set verticalCenter(value:Number):void
	{
		if(_verticalCenter == value)
			return;
		_verticalCenter = value;
		invalidateAnchorLayoutDataData("verticalCenter", value);
	}
	
	private function invalidateAnchorLayoutDataData(prop:String, value:Number):void
	{
		if(layoutData == null)
		{
			layoutData = new AnchorLayoutData();
		}
		layoutData[prop] = value;
	}

	public function get truncateToFit():Boolean
	{
		return false;
	}
	
	public function set truncateToFit(value:Boolean):void
	{
	}
	
	public function get maxDisplayedLines():Number
	{
		return 0;
	}
	
	public function set maxDisplayedLines(value:Number):void
	{
	}

	public function get numLines():int
	{
		if(_requiresRedraw)
		{
			measure();
		}
		return _numLines;
	}
	
	public function get textWidth():Number
	{
		if(_requiresRedraw)
		{
			measure();
		}
		return _textBounds.width;
	}
	
	public function get textHeight():Number
	{
		if(_requiresRedraw)
		{
			measure();
		}
		return _textBounds.height;
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
		_style = value;
		if(_image)
		{
			_image.setStyle(value);
		}
	}
	
	//============================动态位图字体=======================
	private var _styleName:String;
	private var _useBitmapFonts:Boolean;
	public function set autoCreateBitmapFonts(value:Boolean):void
	{
		_useBitmapFonts = value;
	}
	
	public function registerBitmapFonts(chars:String):void
	{
		var len:int = chars.length;
		for(var i:int=0; i<len; i++)
		{
			drawCharToTexture( chars.charAt(i) );
		}
		_useBitmapFonts = true;
	}
	
	private function renderBitmapFonts():void
	{
		var chars:String = _text;
		
		if(!chars)return;
		
		var bitmapData:BitmapData = renderText(scale);
		var clip:Rectangle = bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
		bitmapData.dispose();
		bitmapData = null;
		
		_charImages ||= new <Image>[];
		
		
		var len:int = chars.length;
		var image:Image;
		var key:String;
		var texture:IStarlingTexture;
		var startX:int = clip.x;
		var startY:int = clip.y;
		var offset:Point;
		var gui:GuiTheme = GuiTheme.ins;
		for(var i:int=0; i<len; i++)
		{
			key =getTextureKey( chars.charAt(i) );
			texture = gui.getTexture( key );
			
			if(!texture)
			{
				texture = drawCharToTexture( chars.charAt(i) );
			}
			
			if(!texture)continue;
			
			offset = gui.getOffSet(key);
			image = i < _charImages.length ? _charImages[i] : Pool.getImage( texture );
			image.texture = texture;
			image.readjustSize();
			image.x = startX;
			image.y = offset.y;
			Pool.putPoint(offset);
			
			startX += texture.width + letterSpacing;
			
			this.addChild(image);
			
			_charImages[i] = image;
		}
		
		while(_charImages.length > len)
		{
			image = _charImages.pop();
			image.removeFromParent();
			Pool.putImage(image);
		}
	}
	
	
	private function drawCharToTexture(char:String):IStarlingTexture
	{
		var oldText:String = _text;
		
		_text = char;
		
		var id:String = getTextureKey(char)
		
		var t:IStarlingTexture = GuiTheme.ins.getTexture(id);
		if(t)
		{
			return t;
		}
		
		var bitmapData:BitmapData = renderText(scale);
		
		if(bitmapData.width < 1 || bitmapData.height < 1 || bitmapData.width > MAX_WIDTH || bitmapData.height > MAX_HEIGHT)
		{
			return null;
		}
		
		var clip:Rectangle = bitmapData.getColorBoundsRect(0xFF000000, 0x00000000, false);
		if(!clip || clip.width < 1 || clip.height < 1)
		{
			return null;
		}
		
		t = GuiTheme.ins.pushDynamicLabelBitmapData(id, bitmapData, clip, true);
		
		bitmapData.dispose();
		bitmapData = null;
		
		_text = oldText;
		
		return t;
	}
}
}


