package starling.utils
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	
	import starling.display.MeshBatch;
	
	/**
	 * 创建返回文字纹理的控制器  (存放文字的大图)
	 * @author guoqing.wen
	 * 
	 */	
	public class DynamicFont
	{
		//开关
		static public var isDynamicFont:Boolean = true;
		/** 文本渲染layer */
		public static var LAYER_TEXTFIELD:int = 0;
		
		static private var _defaultKey:String;
		static private var _fontFilters:Dictionary = new Dictionary();
		static private var _fontUints:Dictionary = new Dictionary();
		
		public function DynamicFont()
		{
		}
		
		/**
		 * 增加新的文本 
		 * @param text
		 */		
		static public function getText(text:String, format:TextFormat,  nativeFilters:Array = null):MeshBatch
		{
			var filterKey:String = hasRegisterFilter(nativeFilters);
			var key:String = FontFormat.getKey(format.font, int(format.size), int(format.color), format.bold, filterKey);
			var fontUnit:FontUnit = _fontUints[key];
			if (fontUnit == null)
			{
				fontUnit = new FontUnit(new FontFormat(format,null,filterKey));
				_fontUints[key] = fontUnit;
			}
			return fontUnit.getMeshBatch(text);
		}
		
		static public function hasRegisterFilter(filters:Array):String
		{
			if (filters == null || filters.length == 0)return null;
			for (var i:String in _fontFilters) 
			{
				if (filters == _fontFilters[i])	return i;
			}
			return null;
		}
		
		static public function registerFont(fontFormat:FontFormat):void
		{
			_fontUints[fontFormat.key] = new FontUnit(fontFormat);
		}
		
		static public function unRegisterFont(fontFormat:FontFormat):void
		{
			var unit:FontUnit = _fontUints[fontFormat.key];
			if (unit)
			{
				_fontUints[fontFormat.key] = null;
				delete _fontUints[fontFormat.key];
				unit.dispose();
			}
		}
		
		static public function registerFilter(key:String, filters:Array):void
		{
			_fontFilters[key] = filters;
		}
		
		static public function unRegisterFilter(key:String):void
		{
			_fontFilters[key] = null;
			delete _fontFilters[key];
		}
		
		static public function setDefaultTextFiledFormat(textFormat:TextFormat, renderSize:uint = 1024):void
		{
			var format:FontFormat = new FontFormat(textFormat);
			var fontUint:FontUnit = new FontUnit(format, renderSize);
			_defaultKey = format.key;
			_fontUints[_defaultKey] = fontUint;
			trace("初始化FontUtils字体库！！");
		}
		
		static public function clearAllFont():void
		{
			for (var key:String in _fontUints) 
			{
				if (key != _defaultKey)
				{
					_fontUints[key].dispose();
					_fontUints[key] = null;
					delete _fontUints[key];
				}
			}
		}
		
		public static function createTextField(format:FontFormat):TextField
		{
			var filters:Array = _fontFilters[format.filterKey] ||= [];
			var vTextField:TextField = new TextField();
			vTextField.defaultTextFormat = format.textFormat;
			vTextField.filters = filters;
			return vTextField;
		}
	}
}
import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Dictionary;

import starling.display.Image;
import starling.display.MeshBatch;
import starling.textures.SubTexture;
import starling.textures.IStarlingTexture;
import starling.textures.TextureFactory;
import starling.utils.DynamicFont;

class FontUnit
{
	private static var helperImage:Image = null;
	private static var helperRect:Rectangle = new Rectangle();
	private var _imageSize:int = 512;     //图片的大小
	private var _textBd:BitmapData;
	private var _textField:flash.text.TextField;
	private var _charDic:Object;
	private var _textDic:Object;
	private var _currentRow:int;
	private var _currentCol:int;
	
	private var _texture:IStarlingTexture;
	private var _leading:int = 2;
	private var _format:FontFormat;
	private var _batchs:Dictionary;
	
	public function FontUnit(format:FontFormat, size:uint = 512)
	{
		_format = format;
		_imageSize = size;
		_charDic = {};
		_textDic = {};
		_batchs = new Dictionary();
	}
	
	private function createEmptyBitmapData(imageSize:int):BitmapData
	{
		return new BitmapData(imageSize, imageSize, true, 0x00000000);
	}
	
	private function createEmptyTexture(imageSize:int):IStarlingTexture
	{
		return TextureFactory.empty(imageSize, imageSize, false, false);
	}
	
	public function get imageSize():int
	{
		return _imageSize;
	}

	public function set imageSize(value:int):void
	{
		_imageSize = value;
	}

	/**
	 * 返回指定文本的索引 (行数和列数)
	 * @param text
	 * 
	 */		
	public function getMeshBatch(text:String):MeshBatch
	{
		var charStr:String;
		var index:int = -1;
		var len:int = text.length;
		var hasUpdated:Boolean = false;
		var charUnit:CharUnit = null;
		var subTexture:SubTexture = null;
		var quadBatch:MeshBatch = _textDic[text];
		
		if (quadBatch)
			return quadBatch;
		quadBatch = new MeshBatch();
		while(++index < len)
		{
			charStr = text.charAt(index);
			charUnit = _charDic[charStr];
			if(charUnit == null)
			{
				charUnit = pushChar(charStr);
				hasUpdated = true;
			}
			helperRect.setTo(charUnit.offsetX, charUnit.offsetY, _format.fontSize, _format.fontSize);
			subTexture = new SubTexture(_texture, helperRect);
			
			if (helperImage == null)
				helperImage = new Image(subTexture);
			else
				helperImage.texture = subTexture;
			helperImage.x = index*charUnit.charWidth + _leading;
			helperImage.setupVerticesImmediately();
			quadBatch.addMesh(helperImage);
		}
		
		if(hasUpdated)
		{
			updateTextBitmapData();
		}
		_textDic[text] = quadBatch;
		
		return quadBatch;
	}
	
	/** 当IMAGE_SIZE大小装不完的时候,扩大 
	private function reCreateBitmapData():void
	{
		imageSize << 1;
		_textBd = new BitmapData(imageSize, imageSize, true, 0x00000000);
		_texture = TextureFactory.fromBitmapData(_textBd);
	}*/
	
	private function updateTextBitmapData():void
	{
		_texture.root.uploadBitmapData(_textBd);
	}
	
	private function pushChar(charStr:String):CharUnit
	{
		var charUnit:CharUnit = null;
		var offsetX:int,offsetY:int;
		var bdSize:int = _format.fontSize + 2 * _leading;
		var bd:BitmapData = new BitmapData(bdSize, bdSize, true, 0);
		
		if (_textField == null)
			_textField = DynamicFont.createTextField(_format);
		if (_textBd == null)
		{
			_textBd = createEmptyBitmapData(_imageSize);
		}
		if (_texture == null)
		{
			_texture = createEmptyTexture(_imageSize);
		}
		_textField.text = charStr;
		//优化直接draw到一张RenderTexture上
		bd.draw(_textField, null, null);
		
		offsetX = _format.fontSize * _currentCol;
		offsetY = _currentRow * _format.fontSize;

		charUnit = new CharUnit(offsetX, offsetY, _textField.getLineMetrics(0).width);
		_charDic[charStr] = charUnit;
		
		
		_textBd.copyPixels(bd, 
			new Rectangle(_leading, _leading, _format.fontSize, _format.fontSize), 
			new Point(offsetX, offsetY));
		
		if(offsetX + _format.fontSize > imageSize) //x大于最大值
		{
			_currentCol = 0;
			_currentRow++;//下一行
		}
		else
		{
			_currentCol++;
		}
		//if (offsetY + _format.fontSize > imageSize)
		
		bd.dispose();
		
		return charUnit;
	}
	
	public function dispose():void
	{
		if (_textBd)
			_textBd.dispose();
		_textBd = null;
		_charDic = null;
		if (_texture)
			_texture.dispose();
		_texture = null;
		for each (var batch:MeshBatch in _batchs) 
		{
			batch.dispose();
		}
		_batchs = null;
		_textField = null;
	}
}

class CharUnit
{
	public var offsetX:uint;
	public var offsetY:uint;
	public var charWidth:int;
	
	public function CharUnit(offsetX:uint, offsetY:uint, charWidth:int){
		this.offsetX = offsetX;
		this.offsetY = offsetY;
		this.charWidth = charWidth;
	}
}

class FontFormat
{
	public var textFormat:TextFormat;
	public var htmlStr:String;
	public var filterKey:String;
	private var _fontSize:int = 12;
	
	public function FontFormat(textFormat:TextFormat,
							   htmlStr:String = null,filterKey:String = null)
	{
		this.textFormat = textFormat;
		this.htmlStr = htmlStr;
		this.filterKey = filterKey;
		if (textFormat.size)
			_fontSize = int(textFormat.size);
	}

	public function get fontSize():int
	{
		return _fontSize;
	}

	public function get key():String
	{
		return textFormat.font + textFormat.size + "" + textFormat.color + textFormat.bold + filterKey;
	}

	static public function getKey(fontName:String,fontSize:uint,fontColor:uint,bold:Boolean,filterKey:String):String
	{
		return fontName + fontSize + "" + fontColor + bold + filterKey;
	}
	
	public function equad(format:FontFormat):Boolean
	{
		if (this.textFormat.font != format.textFormat.font 
			|| this.textFormat.size != format.textFormat.size 
			|| this.textFormat.color != format.textFormat.color
			|| this.textFormat.bold != format.textFormat.bold 
			|| this.filterKey != format.filterKey
			|| this.htmlStr != format.htmlStr)
		{
			return false;
		}
		return true;
	}
}