package com.rpgGame.app.richText.component
{
	import com.rpgGame.app.richText.RichTextCustomUnitType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	
	import flash.display.BitmapData;
	import flash.display.StageQuality;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.AntiAliasType;
	import flash.text.GridFitType;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextLineMetrics;
	import flash.utils.ByteArray;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	import feathers.controls.text.Fontter;
	import feathers.events.FeathersEventType;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureFactory;
	
	/**
	 * 富文本对象，使用方法见RichTextCustomUtil类的顶部
	 * @author GuoDong.Zhang
	 * 
	 */
	public class RichTextArea3D extends Sprite
	{
		private static var _pool:Vector.<RichTextArea3D>;
		public static function pushToPool(value:RichTextArea3D):void
		{
			if(value == null)
			{
				return;
			}
			value.removeFromParent();
			value.reset();
			if(_pool == null)
			{
				_pool = new Vector.<RichTextArea3D>();
			}
			_pool.push(value);
		}
		
		public static function getFromPool():RichTextArea3D
		{
			if(_pool != null && _pool.length > 0)
			{
				return _pool.pop();
			}
			return new RichTextArea3D();
		}
		public static var onMouseDoubleClickUnit:Function;
		public static var onMouseClickUnit:Function;
		public static var onMouseMoveUnit:Function;
		public static var onMouseOutUnit:Function;
		public static var onUpdateRichUnit:Function;
		public static var onGetBackDisplayObjWhenUnitDispose:Function;
		
		private const PLACEHOLDER:String = "　";
		private const SEPARATOR:String = "[@6dn@]";
		/**原始配置的富文本单元的数据*/
		private var _originalUnitConfigVec:Vector.<RichTextUnitConfigData>;
		/**总的富文本单元的配置数据*/
		private var _totalUnitConfigVec:Vector.<RichTextUnitConfigData>;
		/**动态添加的富文本单元的配置数据*/
		private var _dynamicUnitConfigVec:Vector.<RichTextUnitConfigData>;
		/**用于渲染文本用的*/
		private var _textField:TextField;
		/**用于手动处理断行用的*/
		private var _breakLineManaulTextField:TextField;
		/**用于临时处理文本用的*/
		private var _tempTextField:TextField;
		/**用于临时处理文本用的*/
		private var _tempTextFormat:TextFormat;
		/**用于记录鼠标指针在文本中的信息*/
		private var _cursorInfo:RichTextCursorInfo;
		/**用于记录鼠标指针在文本中的信息*/
		private var _tempCursorInfo:RichTextCursorInfo;
		/**原始格式*/
		private var _originalFormat:TextFormat;
		/**当前格式*/
		private var _defaultFormat:TextFormat;
		
		/**富文本单元对象列表*/
		private var _unitVec:Vector.<RichTextUnit>;
		private var _unitsContainer:Sprite;
		private var _unitsMask:Quad;
		private var _texture:IStarlingTexture;
		private var _textImage:Image;
		
		private var _setHeight:int;
		/**可输入的最大字符数*/
		public var maxChars:int;
		public var maxCharsIsLetterCount:Boolean;
		
		private var _isEditable:Boolean;
		private var _isInputFocus:Boolean;
		private var _byteA:ByteArray;
		/**锁定文本绘制，锁定期间不会绘制*/
		private var _lockRedraw:Boolean;
		/**是否手动断行*/
		private var _breakLineManual:Boolean;
		/**用于手动断行的初始化html文本记录*/
		private var _breakLineInitHtmlText:String;
		private var _textRecord:String;
		private var _textFieldPoint:Point;
		private var _unitTextFormat:TextFormat
		
		/**
		 * 
		 * @param $w 文本框宽
		 * @param $h 文本框高，为0时会根据内容自动变化高度
		 * @param filters 文本框滤镜
		 * @param breakLineManual 是否需要手动换行，以解决英文或数字会整体自动换行的问题，只针对非输入框有用
		 * 
		 */
		public function RichTextArea3D( $w:int = 100, $h:int = 0, filters:Array = null, breakLineManual:Boolean = false ) 
		{
			_unitVec = new Vector.<RichTextUnit>();
			_cursorInfo = new RichTextCursorInfo();
			//原始文本框格式
			_originalFormat = new TextFormat(Fontter.FONT_Hei);
			_originalFormat.size = 14;
			_originalFormat.color = 0xded8c7;
			_originalFormat.letterSpacing = 0;
			//创建文本框
			_textField = new TextField();
			_textField.width = $w;
			_textField.useRichTextClipboard = true;
			_textField.wordWrap = false;
			_textField.thickness = Fontter.DEFAULT_THICKNESS;
			_textField.embedFonts = true;
			_textField.gridFitType = GridFitType.NONE;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			//创建富单元容器和遮罩
			_unitsMask = new Quad(4,4);
			_unitsContainer = new Sprite();
			_unitsContainer.mask = _unitsMask;
			this.addChild(_unitsContainer);
			this.addChild(_unitsMask);
			//设置默认属性
			defaultTextFormat = _originalFormat;
			this.filters = filters;
			this.breakLineManual = breakLineManual;
			setSize($w,$h);
		}
		
		/**
		 * 设置文本框滤镜
		 * @param value
		 * 
		 */
		public function set filters(value:Array):void
		{
			_textField.filters = value;
		}
		
		public function get breakLineManual():Boolean
		{
			return !_isEditable && _breakLineManual;
		}
		
		/**
		 * 设置是否需要手动换行，以解决英文或数字会整体自动换行的问题，只针对非输入框有用
		 * @param value
		 * 
		 */
		public function set breakLineManual(value:Boolean):void
		{
			if(_breakLineManual != value)
			{
				_breakLineManual = value;
				if(_breakLineManual)
				{
					if(_breakLineManaulTextField == null)
					{
						_breakLineManaulTextField = new TextField();
						_breakLineManaulTextField.useRichTextClipboard = _textField.useRichTextClipboard;
						_breakLineManaulTextField.filters = _textField.filters;
						_breakLineManaulTextField.wordWrap = _textField.wordWrap;
						_breakLineManaulTextField.defaultTextFormat = _textField.defaultTextFormat;
						_breakLineManaulTextField.thickness = _textField.thickness;
						_breakLineManaulTextField.embedFonts = _textField.embedFonts;
						_breakLineManaulTextField.gridFitType = _textField.gridFitType;
						_breakLineManaulTextField.antiAliasType = _textField.antiAliasType;
						_breakLineManaulTextField.width = _textField.width;
					}
				}
				else
				{
					_breakLineManaulTextField = null;
				}
			}
		}
		
		/**设置富文本单元的配置列表*/
		public function setConfig(value:Vector.<RichTextUnitConfigData>):void
		{
			if(value)
			{
				if(!_originalUnitConfigVec)
				{
					_originalUnitConfigVec = new Vector.<RichTextUnitConfigData>();
				}
				else
				{
					_originalUnitConfigVec.length = 0;
				}
				putElementVectorAToVectorB(value,_originalUnitConfigVec);
				if(!_totalUnitConfigVec)
				{
					_totalUnitConfigVec = new Vector.<RichTextUnitConfigData>();
				}
				putElementVectorAToVectorB(_originalUnitConfigVec,_totalUnitConfigVec);
			}
			else
			{
				if(_originalUnitConfigVec)
				{
					if(_totalUnitConfigVec)
					{
						var len:int = _originalUnitConfigVec.length;
						for(var i:int = 0; i < len; i++)
						{
							var element:RichTextUnitConfigData = _originalUnitConfigVec[i];
							var index:int = _totalUnitConfigVec.indexOf(element);
							if(index >= 0)
							{
								_totalUnitConfigVec.splice(index,1);
							}
						}
					}
					_originalUnitConfigVec.length = 0;
				}
			}
		}
		
		/**
		 * 设置整段文本
		 * @param $str
		 * 
		 */		
		public function set text($str:String):void
		{
			if(_textRecord == $str)
			{
				return;
			}
			clear();
			addDynamicConfigIconData( $str, RichTextConfig.SEPARATOR );
			_textRecord = $str;
			_textField.htmlText = $str;
			_breakLineInitHtmlText = null;
			if(_isEditable)
			{
				this.dispatchEventWith(away3d.events.Event.CHANGE);
			}
			convertCodeToRichTextUnit();
		}
		
		public function get text():String
		{
			var $_replaceStr :String= PLACEHOLDER;
			
			var $_len:int = _unitVec.length;
			
			var $_index:int;
			
			var $_info:RichTextUnit;
			var $_item:Sprite;
			
			var $_returnStr:String ="";
			if(!_tempTextField)
			{
				_tempTextField = new TextField();
			}
			_tempTextField.defaultTextFormat = _defaultFormat;
			_tempTextField.htmlText = _textField.htmlText;
			_unitVec.sort(sortUnit);
			
			while ($_len--) {
				$_info  = _unitVec[$_len];
				if($_info){
					$_index = $_info.unitData.indexInMessageStringToShow;
					_tempTextField.replaceText($_index, $_index + $_replaceStr.length, $_info.unitData.code);
				}
			}
			$_returnStr = _tempTextField.text;	
			
			return $_returnStr;
		}
		
		/**
		 * 在文本的当前指正添加信息，非输入文本会自动换行，输入文本不会自动换行
		 * @param $str
		 * 
		 */		
		public function appendRichText($str:String):void
		{
			if( $str == null || $str.length == 0 )
				return;
			//如果已选中文本，取消选中，简化逻辑复杂度
			var preSelectLength:int = _cursorInfo.selectionEndIndex - _cursorInfo.selectionBeginIndex;
			if(preSelectLength > 0)
			{
				selectRange(_cursorInfo.selectionEndIndex,_cursorInfo.selectionEndIndex);
			}
			//判断是否还能输入字符
			/*在这里加一个文本判断 如果是富文本则提取实际的文字来*/
			var lab:RichTextUnitData=RichTextConfig.getUnitData($str);
			if(lab){
				if(remainChars < getCharsByStr(lab.label))
				{
					return;
				}
			}
			else{
				if(remainChars < getCharsByStr($str))
				{
					return;
				}
			}
			addDynamicConfigIconData( $str, RichTextConfig.SEPARATOR );
			//如果是输入文本不需要自动添加段落标签
			if(_isEditable)
			{
				var cursorIndex:int = _cursorInfo.selectionBeginIndex;
				var startCursorIndex:int = cursorIndex;
				var endIndexOfChanged:int = startCursorIndex + $str.length;
				_textField.replaceSelectedText($str);
				cursorIndex += $str.length;
				selectRange(cursorIndex,cursorIndex);
				var offsetIndex:int = $str.length;
				_textField.setTextFormat(_defaultFormat,startCursorIndex,endIndexOfChanged);
				//更新变化的富文本对象
				updateUnitsIndexAndCheckRemoveWhenTextChanged(startCursorIndex,offsetIndex);
				this.dispatchEventWith(away3d.events.Event.CHANGE);
			}
			else
			{
				var info:String = (_breakLineInitHtmlText?_breakLineInitHtmlText:_textField.htmlText) + $str;
				_textField.htmlText = info;
				_breakLineInitHtmlText = null;
			}
			if(_textRecord)
			{
				_textRecord = $str;
			}
			else
			{
				_textRecord += $str;
			}
			convertCodeToRichTextUnit();
			
		}
		
		/**
		 * 设置文本宽高
		 * @param $w
		 * @param $h
		 * 
		 */		
		public function setSize($w:int, $h:int = 0):void
		{
			if($w == _textField.width && $h == _setHeight)
			{
				return;
			}
			_setHeight = $h;
			_textField.width = $w;
			if(_breakLineManaulTextField)
			{
				_breakLineManaulTextField.width = _textField.width;
			}
			if(_setHeight > 0)
			{
				_textField.height = _setHeight;
			}
			reDrawMask();
			setContainerPos();
			reDrawTextField();
		}
		
		/**
		 * 重置到第一次创建时的状态，用于回收
		 * 
		 */
		public function reset():void
		{
			clear();
			isEditable = false;
			breakLineManual = false;
			filters = null;
			defaultTextFormat = _originalFormat;
			if(_originalUnitConfigVec)
			{
				_originalUnitConfigVec.length = 0;
			}
			if(_totalUnitConfigVec)
			{
				_totalUnitConfigVec.length = 0;
			}
			wordWrap = false;
			multiline = false;
			maxChars = 0;
			maxCharsIsLetterCount = false;
			removeFocus();
			x = 0;
			y = 0;
		}
		
		/**
		 * 释放对象,用于丢弃
		 * 
		 */
		override public function dispose():void
		{
			reset();
			super.dispose();
		}
		
		public function get defaultTextFormat():TextFormat
		{
			return _defaultFormat;
		}
		
		public function set defaultTextFormat($textFormat:TextFormat):void
		{
			_defaultFormat = $textFormat;
			if(_defaultFormat.letterSpacing == null)
			{
				_defaultFormat.letterSpacing = 0;
			}
			_textField.defaultTextFormat = _defaultFormat;
			if(_breakLineManaulTextField)
			{
				_breakLineManaulTextField.defaultTextFormat = _defaultFormat;
			}
		}
		
		/**是否可以输入，默认不可以*/
		public function set isEditable(value:Boolean):void
		{
			if(_isEditable == value)
			{
				return;
			}
			_isEditable = value;
			if(_isEditable)
			{
				this.addEventListener(TouchEvent.TOUCH,onTouchThis);
				_textField.addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
			}
			else
			{
				_textField.removeEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
				onFocusOut(null);
			}
		}
		
		/**
		 * 设置成舞台焦点
		 * 
		 */
		public function setFocus():void
		{
			if(_isEditable)
			{
				_isInputFocus = true;
				Starling.current.nativeStage.addEventListener(flash.events.Event.RESIZE,onResize);
				Starling.current.nativeStage.addEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
				_textField.addEventListener(FocusEvent.FOCUS_IN,onFocusIn);
				_textField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
				_textField.addEventListener(flash.events.Event.CHANGE , onTextChanged);
				_textField.addEventListener(flash.events.Event.SCROLL , onTextScroll);
				_textField.addEventListener(KeyboardEvent.KEY_UP, onTextKeyUp);
				_textField.addEventListener(KeyboardEvent.KEY_DOWN , onTextKeyDown);
				_textImage.removeFromParent();
				Starling.current.nativeStage.addChild(_textField);
				updateTextFieldPos();
				_textField.type = TextFieldType.INPUT;
				Starling.current.nativeStage.focus = _textField;
			}
		}
		
		/**
		 * 设置为非舞台焦点
		 * 
		 */
		public function removeFocus():void
		{
			if(_isInputFocus)
			{
				Starling.current.nativeStage.focus = null;
			}
		}
		
		public function moveCorsorToEnd():void
		{
			var textLength:int = _textField.text.length;
			_textField.setSelection(textLength,textLength);
			updateCursorInfo();
		}
		
		public function selectRange(beginIndex:int,endIndex:int):void
		{
			_textField.setSelection(beginIndex,endIndex);
			updateCursorInfo();
		}
		
		/**
		 * 是否自动换行
		 * @param value
		 * 
		 */
		public function set wordWrap( value:Boolean):void
		{
			_textField.wordWrap = value;
			if(_breakLineManaulTextField)
			{
				_breakLineManaulTextField.wordWrap = _textField.wordWrap;
			}
		}
		
		/**
		 * 是否支持多行
		 * @param value
		 * 
		 */
		public function set multiline( value:Boolean):void
		{
			_textField.multiline = value;
			if(_breakLineManaulTextField)
			{
				_breakLineManaulTextField.multiline = _textField.multiline;
			}
		}
		
		override public function set width(value:Number):void
		{
			setSize(value,_setHeight);
		}
		
		override public function get width():Number
		{
			return _textField.width;
		}
		
		override public function set height(value:Number):void
		{
			setSize(width,value);
		}
		
		override public function get height():Number
		{
			if(_setHeight > 0)
			{
				return _setHeight;
			}
			return _textField.height;
		}
		
		/**
		 * 剩余可输入字符数
		 * @return 
		 * 
		 */
		public function get remainChars():int
		{
			var totalNum:int = maxChars;
			if(totalNum <= 0)
			{
				totalNum = int.MAX_VALUE;
			}
			return totalNum - getCharsByStr(_textField.text,true);
		}
		
		public function get textHeight():int
		{
			return _textField.textHeight;
		}
		
		public function get textWidth():int
		{
			return _textField.textWidth;
		}
		
		public function get isInputFocus():Boolean
		{
			return _isInputFocus;
		}
		
		public function get numLines():int
		{
			return _textField.numLines;
		}
		
		//===================================================================================
		/**
		 * 清除内容
		 * 
		 */
		private function clear():void
		{
			var unit:RichTextUnit;
			var i:int;
			for(i = _unitVec.length - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				_unitVec.splice( i, 1 );
				RichTextUnit.putUnit( unit );
			}
			_unitVec.length = 0;
			_cursorInfo.reset();
			while (_unitsContainer.numChildren) 
			{
				_unitsContainer.removeChildAt(0);
			}
			_textRecord = null;
			_textField.htmlText = "";
			_breakLineInitHtmlText = null;
			if(_totalUnitConfigVec)
			{
				_totalUnitConfigVec.length = 0;
				if(_originalUnitConfigVec)
				{
					putElementVectorAToVectorB(_originalUnitConfigVec,_totalUnitConfigVec);
				}
			}
			if(_dynamicUnitConfigVec)
			{
				var len:int = _dynamicUnitConfigVec.length;
				for(i = len - 1; i >= 0; i--)
				{
					var configData:RichTextUnitConfigData = _dynamicUnitConfigVec[i];
					_dynamicUnitConfigVec.splice(i,1);
					RichTextUnitConfigData.pushToPool(configData);
				}
				_dynamicUnitConfigVec.length = 0;
			}
			if(_texture)
			{
				_texture.dispose();
			}
			_texture = null;
			if( _textImage != null )
			{
				_textImage.texture = null;
			}
		}
		
		/**
		 * 重绘文本为贴图
		 * 
		 */		
		private function reDrawTextField():void
		{
			if(_lockRedraw)
			{
				return;
			}
			if(breakLineManual)
			{
				handleAutoBreakLine();
			}
			//如果没有设置固定高，动态修正文本框高度
			if(_setHeight <= 0)
			{
				_textField.height = _textField.textHeight+4;
				reDrawMask();
				this.dispatchEventWith(away3d.events.Event.RESIZE);
			}
			//刷新富单元位置
			refreshUnitsPos();
			//重绘文本
			if(_textField.parent == null)
			{
				var bitmapData:BitmapData = new BitmapData( _textField.width, _textField.height, true, 0 );
				var drawWithQualityFunc:Function = 
					"drawWithQuality" in bitmapData ? bitmapData["drawWithQuality"] : null;
				
				// Beginning with AIR 3.3, we can force a drawing quality. Since "LOW" produces
				// wrong output oftentimes, we force "MEDIUM" if possible.
				
				if (drawWithQualityFunc is Function)
					drawWithQualityFunc.call(bitmapData, _textField, null, 
						null, null, null, false, StageQuality.MEDIUM);
				else
					bitmapData.draw(_textField);
				
				if(_texture)
				{
					_texture.dispose();
				}
				_texture = TextureFactory.fromBitmapDataByMemoryItem(bitmapData);
				_texture.key = _textField.htmlText;
				
				if( _textImage == null )
				{
					_textImage = new Image( _texture );
				}
				if(_textImage.parent == null)
				{
					addChildAt( _textImage, 0 );
				}
				var oldTexture:IStarlingTexture = _textImage.texture;
				_textImage.texture = _texture;
				_textImage.readjustSize( _textField.width, _textField.height ); 
				if(oldTexture && oldTexture != _texture)oldTexture.dispose();
			}
		}
		
		/**
		 * 还原富对象的文本索引为初始值
		 * 
		 */
		private function restoreIndexOfAllUnit():void
		{
			var len:int = _unitVec.length;
			var unit:RichTextUnit;
			for(var i:int = len - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				if(unit)
				{
					unit.unitData.indexInMessageStringToShow = unit.unitData.indexInMessageStringFirstConvert;
				}
			}
		}
		
		/**
		 * 处理手动换行，解决英文和数字会整体自动换行的问题
		 * 
		 */
		private function handleAutoBreakLine():void
		{
			var tfWidth:int = _breakLineManaulTextField.width - 10;
			if(_breakLineInitHtmlText == null)
			{
				_breakLineInitHtmlText = _textField.htmlText;
			}
			if(_breakLineManaulTextField.htmlText != _breakLineInitHtmlText)
			{
				_breakLineManaulTextField.htmlText = _breakLineInitHtmlText;
			}
			//这里一定要设置高度，否则后面getCharBoundaries方法可能会拿不到数据
			_breakLineManaulTextField.height = _breakLineManaulTextField.textHeight + 4;
			var htmlText:String = _breakLineInitHtmlText;
			var indexsOfAddBreakTag:Array = [];
			var pArr:Array = htmlText.match(/<P.*?<\/P>/g);
			var indexTF:int;
			var brCount:int = 0;
			var len:int = pArr.length;
			var i:int;
			var lineStrArr:Array = [];
			loop1:for(i = 0; i < len; i++)
			{
				var pStr:String = pArr[i];
				var lenPStr:int = pStr.length;
				var iPStr:int = 0;
				var ignore:Boolean = false;
				var lineWidth:int = 0;
				var lineStr:String = "";
				loop2:for(iPStr = 0; iPStr < lenPStr; iPStr++)
				{
					var char:String = pStr.charAt(iPStr);
					if(!ignore && char == "<")
					{
						ignore = true;
					}
					if(!ignore)
					{
						var rect:Rectangle = _breakLineManaulTextField.getCharBoundaries(indexTF);
						if(rect)
						{
							lineWidth += rect.width;
							if(lineWidth > tfWidth)
							{
								indexsOfAddBreakTag.push(indexTF + brCount);
								lineStr += "<br>";
								brCount++;
								lineWidth = rect.width;
							}
						}
						indexTF++;
					}
					else if(char == ">")
					{
						ignore = false;
					}
					lineStr += char;
				}
				lineStrArr.push(lineStr);
				indexTF++;//段落会占用一个字符
			}
			htmlText = lineStrArr.join("");
			_textField.htmlText = htmlText;
			restoreIndexOfAllUnit();
			len = indexsOfAddBreakTag.length;
			for(i = 0; i < len; i++)
			{
				updateUnitsIndexWhenHandleBreakLine(indexsOfAddBreakTag[i],1);
			}
		}
		
		//============================================================================
		// Event Handler
		//============================================================================
		
		private function onTouchThis(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this,TouchPhase.BEGAN);
			if(touch != null)
			{
				setTimeout(setFocus,10);
			}
		}
		
		private function onFocusIn(event:FocusEvent):void
		{
			this.dispatchEventWith(FeathersEventType.FOCUS_IN);
		}
		
		private function onFocusOut(event:FocusEvent = null):void
		{
			if(!_isInputFocus)
			{
				return;
			}
			_isInputFocus = false;
			if(_textField.parent)
			{
				Starling.current.nativeStage.removeChild(_textField);
				_textField.type = TextFieldType.DYNAMIC;
				Starling.current.nativeStage.removeEventListener(flash.events.Event.RESIZE,onResize);
				Starling.current.nativeStage.removeEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
				_textField.removeEventListener(FocusEvent.FOCUS_IN,onFocusIn);
				_textField.removeEventListener(FocusEvent.FOCUS_OUT,onFocusOut)
				_textField.removeEventListener(flash.events.Event.CHANGE , onTextChanged);
				_textField.removeEventListener(flash.events.Event.SCROLL , onTextScroll);
				_textField.removeEventListener(KeyboardEvent.KEY_UP, onTextKeyUp);
				_textField.removeEventListener(KeyboardEvent.KEY_DOWN , onTextKeyDown);
			}
			if(_textImage.parent == null)
			{
				addChildAt( _textImage, 0 );
			}
			reDrawTextField();
			this.dispatchEventWith(FeathersEventType.FOCUS_OUT);
		}
		
		private function onResize(event:flash.events.Event = null):void
		{
			setTimeout(updateTextFieldPos,10);
		}
		
		private function updateTextFieldPos():void
		{
			if(!_textFieldPoint)
			{
				_textFieldPoint = new Point();
			}
			_textFieldPoint.x = this.x;
			_textFieldPoint.y = this.y;
			if(this.parent)
			{
				_textFieldPoint = this.parent.localToGlobal(_textFieldPoint);
				_textField.x = _textFieldPoint.x;
				_textField.y = _textFieldPoint.y;
			}
		}
		
		private function clickHandler(evt:flash.events.Event):void
		{
			setFocus();
			updateCursorInfo();
		}
		
		private function onTextScroll(event:flash.events.Event):void
		{
			reDrawTextField();
			updateCursorInfo();
		}
		
		private function onTextKeyDown(event:KeyboardEvent):void
		{
			setTimeout(updateCursorInfo,10);
		}
		
		private function onStageMouseUp(event:*):void
		{
			setTimeout(updateCursorInfo,10);
		}
		
		private function onTextKeyUp(event:*):void
		{
			setTimeout(updateCursorInfo,10);
		}
		
		private function updateCursorInfo():void
		{
			getCurrentCursorInfo(_cursorInfo);
		}
		
		private function onTextChanged( event:flash.events.Event ):void
		{
			_tempCursorInfo = getCurrentCursorInfo(_tempCursorInfo);
			//变化部分的起始index
			var startIndexOfChanged:int;
			var endIndexOfChanged:int;
			if(_tempCursorInfo.selectionBeginIndex < _cursorInfo.selectionBeginIndex)
			{
				startIndexOfChanged = _tempCursorInfo.selectionBeginIndex;
				endIndexOfChanged = _cursorInfo.selectionBeginIndex;
			}
			else
			{
				startIndexOfChanged = _cursorInfo.selectionBeginIndex;
				endIndexOfChanged = _tempCursorInfo.selectionBeginIndex;
			}
			var preSelectLength:int = _cursorInfo.selectionEndIndex - _cursorInfo.selectionBeginIndex;
			//如果输入之前有选中文本，先删除文本对应的富单元
			if(preSelectLength > 0)
			{
				toRemovePreSelectUnit(_cursorInfo.selectionBeginIndex,_cursorInfo.selectionEndIndex);
			}
			//变化部分后面的内容产生的偏移量
			var offsetIndex:int = _tempCursorInfo.selectionBeginIndex - _cursorInfo.selectionBeginIndex;
			//判断是否还能输入字符
			if(offsetIndex > 0)
			{
				//当粘贴内容超出最大长度时，自动截取到最大长度
				while(remainChars < 0)
				{
					_textField.replaceText(endIndexOfChanged-1,endIndexOfChanged,"");
					endIndexOfChanged--;
					offsetIndex--;
				}
				selectRange(endIndexOfChanged,endIndexOfChanged);
			}
			//更新变化的富文本对象
			updateUnitsIndexAndCheckRemoveWhenTextChanged(startIndexOfChanged,offsetIndex);
			if (offsetIndex > 0)
			{
				checkAddUnitWhenInputed(startIndexOfChanged, endIndexOfChanged);
			}
			reDrawTextField();
			updateCursorInfo();
			_textRecord = null;
			this.dispatchEventWith(away3d.events.Event.CHANGE);
		}
		
		/**
		 * 把源码文本转化成富文本显示对象
		 * 
		 */
		private function convertCodeToRichTextUnit():void
		{
			_lockRedraw = true;
			var $_replaceStr:String = PLACEHOLDER;
			var $_strLen:int;
			var $_id:int;
			var $_index:int;
			var $_iconStr:String ;
			var unitData:RichTextUnitData;
			while ($_index != -1) 
			{	
				
				unitData = getFirstUnitData( _textField.text );
				if( unitData == null )
					break;
				
				$_index = unitData.indexInMessageStringToShow;
				
				if ($_index != -1) 
				{
					$_strLen = unitData.code.length;
					_textField.replaceText( unitData.indexInMessageStringToShow, unitData.indexInMessageStringToShow + $_strLen, $_replaceStr );
					if(_isEditable)
					{
						if(_cursorInfo.selectionBeginIndex == unitData.indexInMessageStringToShow + $_strLen)
						{
							var cursorIndex:int = unitData.indexInMessageStringToShow + $_replaceStr.length;
							_textField.setSelection(cursorIndex,cursorIndex);
							updateCursorInfo();
						}
					}
					updateUnitsIndexAndCheckRemoveWhenTextChanged($_index + 1, $_replaceStr.length - unitData.code.length);
					addUnit( unitData );
				}
			}
			updateCursorInfo();
			selectRange(_cursorInfo.selectionBeginIndex,_cursorInfo.selectionEndIndex);
			_lockRedraw = false;
			reDrawTextField();
		}
		
		public function get textfield():TextField
		{
			return _textField;
		}
		
		/**
		 * 刷新所有富文本单元的位置
		 * 
		 */
		private function refreshUnitsPos():void
		{
			var $_len:int = _unitVec.length;
			var unit:RichTextUnit;
			var $_rect:Rectangle;
			var $_txtLineMetrics :TextLineMetrics ;
			while ($_len--) 
			{
				unit = _unitVec[$_len];
				if(unit && unit.displayObj)
				{
					$_rect = _textField.getCharBoundaries(unit.unitData.indexInMessageStringToShow);
					var checkChar:String = _textField.text.charAt(unit.unitData.indexInMessageStringToShow);
					if ($_rect)
					{
						$_txtLineMetrics = _textField.getLineMetrics(_textField.getLineIndexOfChar(unit.unitData.indexInMessageStringToShow));
						//						unit.displayObj.visible = true;
						var offsetY:Number = 0;
						//这里是临时处理
						if(unit.displayObj.height < 100)
						{
							offsetY = $_rect.height - unit.displayObj.height - $_txtLineMetrics.descent + 4 + unit.unitData.offsetY;
						}
						switch(unit.unitData.align)
						{
							case RichUnitAlign.LEFT:
								unit.displayObj.x = Math.round( $_rect.x );
								break;
							case RichUnitAlign.RIGHT:
								unit.displayObj.x = Math.round( $_rect.x + $_rect.width - unit.displayObj.width );
								break;
							default:
								unit.displayObj.x = Math.round( $_rect.x + ($_rect.width - unit.displayObj.width) * 0.5 );
						}
						
						//						unit.displayObj.y = Math.round( $_rect.y +  offsetY);
						var rowH:int=Math.ceil($_rect.height);
						unit.displayObj.y=$_rect.y+(rowH-unit.displayObj.height)/2+$_txtLineMetrics.descent-4;
					}
					//					else
					//					{
					//						unit.displayObj.visible = false;
					//					}
				}
			}
			setContainerPos();
		}
		
		private function getPlaceholderHeight():int
		{
			if(!_tempTextField)
			{
				_tempTextField = new TextField();
			}
			_tempTextFormat.font = _defaultFormat.font;
			_tempTextField.setTextFormat(_unitTextFormat);
			_tempTextField.text=PLACEHOLDER;
			return _tempTextField.textHeight;
		}
		
		/**
		 * 获取占位符的宽度
		 * @param $size
		 * @return 
		 * 
		 */
		private function getPlaceholderWidth($size:int):int
		{
			if(!_tempTextField)
			{
				_tempTextField = new TextField();
			}
			if(!_tempTextFormat)
			{
				_tempTextFormat = new TextFormat();
			}
			_tempTextFormat.size = $size;
			_tempTextFormat.font = _defaultFormat.font;
			_tempTextField.text = PLACEHOLDER;
			//			_tempTextField.defaultTextFormat = _tempTextFormat;
			_tempTextField.setTextFormat(_tempTextFormat);
			return _tempTextField.textWidth-2;
		}
		
		/**
		 * 检测输入的字符是否是富单元对象并添加
		 * @param $beginIndex
		 * @param $endIndex
		 * 
		 */
		private function checkAddUnitWhenInputed( $beginIndex:int, $endIndex:int ):void
		{
			var $_gap :int = $endIndex - $beginIndex;
			var $_textFormat:TextFormat;
			var $_str:String;
			var $_index:int;
			var $_arr:Array;
			var unitData:RichTextUnitData;
			
			while ($_gap--) 
			{
				$_index = $endIndex - $_gap - 1;
				var character:String = _textField.text.charAt($_index);
				if(character == PLACEHOLDER)
				{
					$_textFormat = _textField.getTextFormat($_index);
					$_str = $_textFormat.url;
					if ($_str.indexOf(SEPARATOR)!=-1) 
					{
						$_arr = $_str.split(SEPARATOR);
						var code:String = $_arr[0];
						//先在已有库中寻找
						unitData = getFirstUnitData(code);
						//找不到再根据源码生成
						if(unitData == null)
						{
							unitData = RichTextConfig.getUnitData(code);
						}
						if(unitData)
						{
							unitData.indexInMessageStringFirstConvert = $_index;
							addUnit(unitData);
						}
					}
				}
				else 
				{
					_textField.setTextFormat(_defaultFormat,$_index,$_index + 1);
				}
			}
		}
		
		/**
		 * 获取当前指针对应的信息
		 * @return 
		 * 
		 */
		private function getCurrentCursorInfo(cursorInfo:RichTextCursorInfo = null):RichTextCursorInfo
		{
			if(cursorInfo == null)
			{
				cursorInfo = new RichTextCursorInfo();
			}
			cursorInfo.selectionBeginIndex = _textField.selectionBeginIndex;
			cursorInfo.selectionEndIndex = _textField.selectionEndIndex;
			cursorInfo.firstPartLength = _textField.caretIndex;
			cursorInfo.lastPartLength = _textField.length - _textField.caretIndex;
			return  cursorInfo;
		}
		
		//-------------------------------------------------------------------------
		// position
		//-------------------------------------------------------------------------
		
		private function getTextFieldPos():Object
		{
			var $_xpos:Number = _textField.scrollH;
			var $_n:int = _textField.scrollV-1;
			var $_ypos:Number = 0;
			while ($_n--) 
			{
				$_ypos += _textField.getLineMetrics($_n).height;
			}
			return { x:-$_xpos, y:-$_ypos };
		}
		
		private function setContainerPos():void
		{
			var $_txtPos:Object = getTextFieldPos();
			_unitsContainer.x = $_txtPos.x;
			_unitsContainer.y = $_txtPos.y;
		}
		//-------------------------------------------------------------------------
		// configXML
		//-------------------------------------------------------------------------
		/**
		 * 从字符串中得到第一个富单元对象的数据
		 * @param $str
		 * @return 
		 * 
		 */
		private function getFirstUnitData($str:String):RichTextUnitData
		{
			if(_totalUnitConfigVec == null)
			{
				return null;
			}
			var $_len:int = _totalUnitConfigVec.length;
			var $_index:int = -1;
			var $_id:int = -1;
			if ($_len <= 0) 
				return null;
			
			var unitData:RichTextUnitData;
			for (var i:int = $_len - 1; i >= 0; i-- )
			{
				var iconData:RichTextUnitConfigData = _totalUnitConfigVec[i];
				$_index = $str.indexOf( iconData.shortcutCode );
				if ($_id == -1 || ($_index != -1 && $_id > $_index)) 
				{
					$_id = $_index;
					//动态富文本处理
					unitData = RichTextConfig.getUnitData(iconData.shortcutCode);
					//表情处理
					if(unitData == null)
					{
						unitData = RichTextUnitData.getFromPool();
						unitData.code = iconData.shortcutCode;
						unitData.type = iconData.type;
						unitData.res = iconData.res;
						unitData.chars = iconData.chars;
					}
					unitData.indexInMessageStringFirstConvert = $_index;
				}
			}
			return unitData; 
		}
		
		/**
		 * 更新变化的富文本对象索引位置并检测是否移除
		 * @param startIndex
		 * @param offsetIndex
		 * 
		 */
		private function updateUnitsIndexWhenHandleBreakLine(startIndex:int, offsetIndex:int):void
		{
			var len:int = _unitVec.length;
			var unit:RichTextUnit;
			for(var i:int = len - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				if(unit)
				{
					if (unit.unitData.indexInMessageStringToShow >= startIndex)
					{
						unit.unitData.indexInMessageStringToShow += offsetIndex;
					}
				}
			}
		}
		
		private function toRemovePreSelectUnit(startIndex:int, endIndex:int):void
		{
			var len:int = _unitVec.length;
			var unit:RichTextUnit;
			for(var i:int = len - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				if(unit)
				{
					if (unit.unitData.indexInMessageStringToShow >= startIndex && unit.unitData.indexInMessageStringToShow < endIndex)
					{
						RichTextUnit.putUnit(unit);
						_unitVec.splice(i,1);
					}
				}
			}
		}
		
		/**
		 * 更新变化的富文本对象索引位置并检测是否移除
		 * @param startIndex
		 * @param offsetIndex
		 * 
		 */
		private function updateUnitsIndexAndCheckRemoveWhenTextChanged(startIndex:int, offsetIndex:int):void
		{
			var len:int = _unitVec.length;
			var unit:RichTextUnit;
			for(var i:int = len - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				if(unit)
				{
					if (unit.unitData.indexInMessageStringToShow >= startIndex)
					{
						unit.unitData.indexInMessageStringFirstConvert += offsetIndex;
						if(unit.unitData.indexInMessageStringToShow < startIndex || unit.unitData.indexInMessageStringToShow >= _textField.length) 
						{
							RichTextUnit.putUnit(unit);
							_unitVec.splice(i,1);
						}
					}
				}
			}
		}
		
		/**
		 * 添加富单元对象
		 * @param unitData
		 * 
		 */
		private function addUnit(unitData:RichTextUnitData):void
		{
			if(unitData.labelSize <= 0)
			{
				unitData.labelSize = int(_defaultFormat.size);
			}
			if(unitData.labelColor <= 0)
			{
				unitData.labelColor = uint(_defaultFormat.color);
			}
			unitData.labelFilters = _textField.filters;
			var unit:RichTextUnit = RichTextUnit.getUnit();
			_unitVec.push(unit);
			unit.onLoaded = onUnitLoaded;
			unit.setUnitData(unitData);
			if(unit.displayObj)
			{
				_unitsContainer.addChild(unit.displayObj);
			}
		}
		
		/**
		 * 排序富单元对象
		 * @param unit1
		 * @param unit2
		 * @return 
		 * 
		 */
		private function sortUnit(unit1:RichTextUnit,unit2:RichTextUnit):int
		{
			if(unit1.unitData.indexInMessageStringToShow < unit2.unitData.indexInMessageStringToShow)
			{
				return -1;
			}
			else if(unit1.unitData.indexInMessageStringToShow > unit2.unitData.indexInMessageStringToShow)
			{
				return 1;
			}
			return 0;
		}
		
		/**
		 * 富单元对象资源加载完成回调
		 * @param unit
		 * 
		 */
		private function onUnitLoaded(unit:RichTextUnit):void
		{
			if(unit.displayObj == null || _unitVec.indexOf(unit) < 0)
			{
				return;
			}
			if(unit.unitData.width <= 0)
			{
				unit.unitData.width = unit.displayObj.width;
			}
			if(breakLineManual && _breakLineInitHtmlText && !_lockRedraw)
			{
				var textRecord:String = _textRecord;
				_textRecord = null;
				text = textRecord;
			}
			else
			{
				var $_fontSize : int;
				if(!_unitTextFormat)
				{
					_unitTextFormat = new TextFormat();
				}
				/*	if(unit.displayObj is Label)
				{
				$_fontSize = int(_defaultFormat.size);
				}
				else
				{*/
				//					$_fontSize = unit.displayObj.height;
				$_fontSize = int(_defaultFormat.size);
				//				}
				_unitTextFormat.size = $_fontSize;
				_unitTextFormat.url = unit.unitData.code + SEPARATOR;
				_unitTextFormat.letterSpacing = unit.unitData.width - getPlaceholderWidth($_fontSize);
				var endIndex:int = unit.unitData.indexInMessageStringToShow + PLACEHOLDER.length;
				_textField.setTextFormat(_unitTextFormat, unit.unitData.indexInMessageStringToShow,endIndex);
				if(_textField.selectionEndIndex > 0)//呃，强制更新鼠标指针位置，文本滚动状态
				{
					_textField.setSelection(_textField.selectionEndIndex - 1,_textField.selectionEndIndex - 1);
					_textField.setSelection(_textField.selectionEndIndex + 1,_textField.selectionEndIndex + 1);
				}
				reDrawTextField();
			}
		}
		
		/**
		 * 重绘遮罩层
		 * @param $w
		 * @param $h
		 * 
		 */
		private function reDrawMask():void 
		{
			_unitsMask.width = width;
			_unitsMask.height = height;
		}
		
		/**
		 * 添加动态特殊对象到配置数据中
		 * @param msg
		 * @param separator
		 * 
		 */		
		private function addDynamicConfigIconData( msg:String, separator:String ):void
		{
			if( msg == null )
				return;
			
			var data:Array = msg.split( separator );
			var len:int = data.length;
			if( len <= 0 )
				return;
			
			var iconConfigData:RichTextUnitConfigData;
			for(var i:int = 1; i < len; i += 2)
			{
				var shortcutCode:String = separator + data[i] + separator;//把分割符加回去
				if(!checkUnitConfigDataExist(shortcutCode))//检查是否重复添加
				{
					iconConfigData = RichTextUnitConfigData.getFromPool();
					iconConfigData.shortcutCode = shortcutCode;
					if(_dynamicUnitConfigVec == null)
					{
						_dynamicUnitConfigVec = new Vector.<RichTextUnitConfigData>();
					}
					_dynamicUnitConfigVec.push(iconConfigData);
					if(_totalUnitConfigVec == null)
					{
						_totalUnitConfigVec = new Vector.<RichTextUnitConfigData>();
					}
					_totalUnitConfigVec.push( iconConfigData );
				}
			}
			
		}
		
		/**
		 * 检查某个动态富文本是否已添加到配置列表里
		 * @param shortcutCode
		 * @return 
		 * 
		 */
		private function checkUnitConfigDataExist(shortcutCode:String):Boolean
		{
			if(_dynamicUnitConfigVec != null)
			{
				for each(var iconData:RichTextUnitConfigData in _dynamicUnitConfigVec)
				{
					if(iconData.shortcutCode == shortcutCode)
					{
						return true;
					}
				}
			}
			return false;
		}
		
		private function getTextLetterCountByStr(info:String,checkExistedUnit:Boolean = false):int
		{
			var letterCount:int = info.length;
			var data:Array;
			var len:int;
			var i:int = 0;
			var unitData:RichTextUnitData;
			//替换链接文本代码字符长度为显示字符长度
			data = info.split( RichTextConfig.SEPARATOR );
			len = data.length;
			if( len > 0 )
			{
				var iconData:RichTextUnitConfigData;
				for(i = 1; i < len; i += 2)
				{
					var shortcutCode:String = RichTextConfig.SEPARATOR + data[i] + RichTextConfig.SEPARATOR;//把分割符加回去
					unitData = RichTextConfig.getUnitData(shortcutCode);
					if(unitData)
					{
						if(unitData.type == RichTextCustomUnitType.LINK)
						{
							if(unitData.label && unitData.label.length)
							{
								letterCount -= shortcutCode.length;
								letterCount += unitData.label.length;
							}
						}
						RichTextUnitData.pushToPool(unitData);
					}
				}
			}
			//表情宽度检测
			if(_originalUnitConfigVec)
			{
				len = _originalUnitConfigVec.length;
				for(i = len - 1; i >= 0; i--)
				{
					var unitConfigData:RichTextUnitConfigData = _originalUnitConfigVec[i];
					var indexMatchStr:int = 0;
					while(indexMatchStr >= 0)
					{
						indexMatchStr = info.indexOf(unitConfigData.shortcutCode);
						if(indexMatchStr >= 0)
						{
							letterCount -= unitConfigData.shortcutCode.length;
							if(unitConfigData.chars > 0)
							{
								letterCount += unitConfigData.chars;
							}
							else
							{
								letterCount += 1;
							}
							info = info.replace(unitConfigData.shortcutCode,"");
						}
					}
				}
			}
			//替换已转换的富单元的PLACEHOLDER宽度为指定宽度
			if(checkExistedUnit)
			{
				info = _textField.text;
				var $_gap :int = info.length;
				var $_textFormat:TextFormat;
				var $_str:String;
				var $_arr:Array;
				while ($_gap--) 
				{
					var character:String = _textField.text.charAt($_gap);
					if(character == PLACEHOLDER)
					{
						$_textFormat = _textField.getTextFormat($_gap);
						$_str = $_textFormat.url;
						if ($_str.indexOf(SEPARATOR)!=-1) 
						{
							$_arr = $_str.split(SEPARATOR);
							var code:String = $_arr[0];
							//先在已有库中寻找
							unitData = getFirstUnitData(code);
							//找不到再根据源码生成
							if(unitData == null)
							{
								unitData = RichTextConfig.getUnitData(code);
							}
							if(unitData)
							{
								if(unitData.type == RichTextCustomUnitType.LINK)
								{
									if(unitData.label && unitData.label.length)
									{
										letterCount -= 1;
										letterCount += unitData.label.length;
									}
								}
								else if(unitData.chars > 0)
								{
									letterCount -= 1;
									letterCount += unitData.chars;
								}
								RichTextUnitData.pushToPool(unitData);
							}
						}
					}
				}
			}
			return letterCount;
		}
		
		private function getCharsByStr(info:String,checkExistedUnit:Boolean = false):int
		{
			if(maxCharsIsLetterCount)
			{
				return getTextLetterCountByStr(info,checkExistedUnit);
			}
			return getTextByteLen(info);
		}
		/**
		 * 得到字符串的字节长度
		 * @param	info
		 * @return
		 */
		private function getTextByteLen(info : String) : int
		{
			return info.length;//toByteArray(info).length;
		}
		
		/**
		 * 将字符串长度
		 * @param	info
		 * @return
		 */
		private function toByteArray(info : String) : ByteArray
		{
			if(_byteA == null)
			{
				_byteA = new ByteArray();
			}
			else
			{
				_byteA.clear();
			}
			_byteA.writeMultiByte(info, "utf8");
			_byteA.position = 0;
			return _byteA;
		}
		
		private function putElementVectorAToVectorB(a:Vector.<RichTextUnitConfigData>,b:Vector.<RichTextUnitConfigData>):void
		{
			if(!a || !b)
			{
				return;
			}
			var len:int = a.length;
			for(var i:int = 0; i < len; i++)
			{
				var elementA:RichTextUnitConfigData = a[i];
				if(b.indexOf(elementA) < 0)
				{
					b.push(elementA);
				}
			}
		}
		
		public function getUnitByIndex(index:int):RichTextUnit
		{
			if(_unitVec.length>index)
				return _unitVec[index];
			return null;
		}
	}
}

