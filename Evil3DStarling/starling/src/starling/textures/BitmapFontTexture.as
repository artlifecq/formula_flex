package starling.textures
{
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	import starling.utils.FreeRectangleChoiceHeuristic;
	import starling.utils.MathUtil;
	import starling.utils.MaxRectsBinPack;

	/**
	 * 位图字体贴图
	 * 类型BitmapFontTexture.NUMBER：不变动,BitmapFontTexture.NUMBER_FONT：带汉字、其它位图经常变动
	 * @author guoqing.wen
	 * 
	 */
	public class BitmapFontTexture extends DynamicBitmapTexture
	{
		/** 只包含数字、符号  */
		static public const NUMBER:int = 0;
		/** 只包含数字、汉字、符号(1、Texture大小固定，2、修改SubTexture动态修改parent)  */
		static public const NUMBER_FONT:int = 1;
		
		private var _type:int = 0;
		private var _textGapX:int = 1;
		private var _textGapY:int = 1;
		private var _text:String;
		private var _textField:TextField;
		private var _bitmapData:BitmapData;
		
		public function BitmapFontTexture()
		{
			super();
		}
		
		/**
		 * 初始化文本
		 * @param type
		 * @param text
		 * @param txtFormat
		 * @param filters
		 * 
		 */
		private function initTextField(type:int, text:String, txtFormat:TextFormat, filters:Array = null):void
		{
			txtFormat = txtFormat || new TextFormat();
			txtFormat.align = TextFormatAlign.LEFT;
			_textField = new TextField();
			_textField.defaultTextFormat = txtFormat;
			_textField.filters = filters;
			_type = type;
			if (text != "" && text != null)
			{
				_text = text;
				if (_type == NUMBER)
					drawTextField();
				else if(type == NUMBER_FONT)
					drawTextFieldFont();
			}
		}
		
		
		/**
		 *  添加字体，生成对应的贴图 
		 * @param font：字体字符，也可以是字符串
		 * @param isSingle：字符串是否生成单一贴图，默认ture
		 * 
		 */		
		public function addFont(font:String, isSingle:Boolean = true, textFormat:TextFormat = null):IStarlingTexture
		{
			if (font == "" || font == null)
				throw new Error("参数font字体字符不能为null或空字符串!");
			if (_type == NUMBER)
				throw new Error("动态添加bitmapData到大图，使用BitmapFontTexture.createBitmapFontTexture创建对象");
			if (textFormat)
			{
				textFormat.align = TextFormatAlign.LEFT;
				_textField.defaultTextFormat = textFormat;
			}
			if (isSingle)
			{
				var bitmapData:BitmapData = drawBitmapData(font);
				return addBitmapData(font, bitmapData);
			}
			else
			{
				_text = font;
				drawTextFieldFont();
				return null;
			}
		}
		
		override public function addBitmapData(key:String, bitmapData:BitmapData):IStarlingTexture
		{
			if (_type == NUMBER)
				throw new Error("动态添加bitmapData到大图，使用BitmapFontTexture.createBitmapFontTexture创建对象");
			return super.addBitmapData(key, bitmapData);
		}
		
		override public function addBitmapDatas(keys:Vector.<String>, bitmapDatas:Vector.<BitmapData>):void
		{
			if (_type == NUMBER)
				throw new Error("动态添加bitmapData到大图，使用BitmapFontTexture.createBitmapFontTexture创建对象");
			return super.addBitmapDatas(keys, bitmapDatas);
		}
		
		private function drawTextFieldFont():void
		{
			var bitmapData:BitmapData = null;
			
			for (var i:int = _text.length - 1; i >= 0; i--) 
			{
				bitmapData = drawBitmapData(_text.charAt(i));
				insertBitmapData(_textField.text, bitmapData);
			}
			//大贴图
			createTextureAtlas();
		}
		
		private function drawBitmapData(text:String):BitmapData
		{
			var bitmapData:BitmapData = null;
				
			_textField.text = text;
			bitmapData = new BitmapData(_textField.textWidth + _textGapX*2, _textField.textHeight + _textGapY*2, true, 0);
			bitmapData.draw(_textField, new Matrix(1, 0, 0, 1, _textGapX, _textGapY));
			return bitmapData;
		}
		
		/** 初始化生成大图，使用MacRects算法  */
		private function drawTextField():void
		{
			var w:int = 0,h:int = 0;
			var len:int = _text.length;
			var rect:Rectangle = null;
			var rects:Vector.<Rectangle> = new Vector.<Rectangle>(len);
			var matrix:Matrix = new Matrix(1, 0, 0, 1, _textGapX, _textGapY);
			var maxWidth:int = 0, maxHeight:int = 0;
			
			for (var i:int = 0; i < len; i++) 
			{
				_textField.text = _text.charAt(i);
				w = _textField.textWidth + 1;
				h = _textField.textHeight + 1;
				rects[i] = new Rectangle(0, 0, w, h);
				if (w > maxWidth)
					maxWidth = w;
				
				if (h > maxHeight)
					maxHeight = h;
			}
			
			var destPoint:Point = new Point();
			var pack:MaxRectsBinPack = FreeRectangleChoiceHeuristic.findMinFitBin(rects, 
				MathUtil.getNextPowerOfTwo(maxWidth > maxHeight ? maxWidth : maxHeight)); 
			
			if (pack == null)
				throw new Error("贴图集资源大小超过2048*2048大小限制！");
			
			_bitmapData = createEmptyBitmapData(pack.binWidth,pack.binHeight);
			createEmptyTexture(pack.binWidth, pack.binHeight);
			for (i = 0; i < len; i++) 
			{
				rect = pack.usedRectangles[i];
				matrix.tx = rect.x++;
				matrix.ty = rect.y++;
				_textField.text = _text.charAt(i);
				_bitmapData.draw(_textField, matrix);
				textureAtlas.addRegion(_textField.text, rect);
			}
			uploadTexture(_bitmapData);
		}
		
		override public function dispose():void
		{
			if (_bitmapData)_bitmapData.dispose();
			_bitmapData = null;
			_textField = null;
			super.dispose();
		}
		
		/**
		 * 创建静态位图Texture,类型BitmapFontTexture.NUMBER：不变动
		 * @param text:BitmapFontTexture.NUMBER，一次初始化的所有数字
		 * @param txtFormat：贴图文本格式TextFormat
		 * @param filters:文本的滤滰
		 * @return 
		 * 
		 */
		static public function createBitmapNumberTexture(text:String, txtFormat:TextFormat=null, filters:Array = null):BitmapFontTexture
		{
			var texture:BitmapFontTexture = new BitmapFontTexture();
			texture.initTextField(BitmapFontTexture.NUMBER, text, txtFormat, filters);
			return texture;
		}
		
		/**
		 * 
		 * 创建动态位图Texture,类型BitmapFontTexture.NUMBER_FONT：带汉字、其它位图经常变动
		 * @param text:第一次初始化的字符
		 * @param txtFormat：贴图文本格式TextFormat
		 * @param filters:文本的滤滰
		 * @return 
		 * 
		 */
		static public function createBitmapFontTexture(text:String, txtFormat:TextFormat=null, filters:Array = null):BitmapFontTexture
		{
			var texture:BitmapFontTexture = new BitmapFontTexture();
			texture.initTextField(BitmapFontTexture.NUMBER_FONT, text, txtFormat, filters);
			return texture;
		}
	}
}