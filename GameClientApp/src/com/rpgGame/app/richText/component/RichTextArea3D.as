package com.rpgGame.app.richText.component
{
	import com.rpgGame.app.richText.RichTextCustomUnitType;
	
	import flash.display.BitmapData;
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
	
	import feathers.controls.Label;
	import feathers.controls.text.Fontter;
	import feathers.events.FeathersEventType;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import away3d.events.Event;
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
		private var _originalUnitConfigVect:Vector.<RichTextUnitConfigData>;
		
		public static var onMouseClickUnit:Function;
		public static var onMouseMoveUnit:Function;
		public static var onMouseOutUnit:Function;
		public static var updateUnitDisplayObjFunc:Function;
		
		private const PLACEHOLDER:String = "　";
		private const SEPARATOR:String = "[@6dn@]";
		/**运行中富文本单元的配置数据*/
		private var _instanceUnitVec:Vector.<RichTextUnitConfigData>;
		private var _textField:TextField;
		private var _cursorInfo:RichTextCursorInfo;
		private var _defaultFormat:TextFormat;
		
		/**富文本单元对象列表*/
		private var _unitVec:Vector.<RichTextUnit>;
		private var _unitsContainer:Sprite;
		private var _unitsMask:Shape;
		private var _texture:IStarlingTexture;
		private var _textImage:Image;
		
		private var _setHeight:int;
		/**可输入的最大字符数*/
		public var maxChars:int;
		
		private var _isEditable:Boolean;
		private var _isInputFocus:Boolean;
		private var _byteA:ByteArray;

		private var wordWrapTxt:TextField;
		
		public function RichTextArea3D( $w:int, $h:int = 0, filters:Array = null ) 
		{
			_unitVec = new Vector.<RichTextUnit>();
			setConfig(new Vector.<RichTextUnitConfigData>());
			
			_cursorInfo = new RichTextCursorInfo();
			
			_defaultFormat = new TextFormat(Fontter.FONT_Hei);
			_defaultFormat.size = 14;
			_defaultFormat.color = 0xded8c7;
			_defaultFormat.letterSpacing = 0;
			
			_textField = new TextField();
			wordWrapTxt=new TextField();
			_textField.width = $w;
			_textField.useRichTextClipboard = true;
			if(filters)
			{
				_textField.filters = filters;
			}
			_textField.wordWrap = false;
			_textField.defaultTextFormat = _defaultFormat;
			_textField.thickness = Fontter.DEFAULT_THICKNESS;
			_textField.embedFonts = true;
			_textField.gridFitType = GridFitType.NONE;
			_textField.antiAliasType = AntiAliasType.ADVANCED;
			_unitsMask = new Shape();
			_unitsContainer = new Sprite();
			_unitsContainer.mask = _unitsMask;
			this.addChild(_unitsContainer);
			this.addChild(_unitsMask);
			setSize($w,$h);
		}
		
		/**设置富文本单元的配置列表*/
		public function setConfig(value:Vector.<RichTextUnitConfigData>):void
		{
			_originalUnitConfigVect = value;
			_instanceUnitVec = _originalUnitConfigVect.concat();
		}
		
		/**
		 * 设置整段文本
		 * @param $str
		 * 
		 */		
		public function set text($str:String):void
		{
			clear();
			addMsgIconData( $str, RichTextConfig.SEPARATOR );
			_textField.htmlText = $str;
			if(_isEditable)
			{
				this.dispatchEvent(new away3d.events.Event(away3d.events.Event.CHANGE));
			}
			convert();
		}
		
		public function get text():String
		{
			var $_replaceStr :String= PLACEHOLDER;
			
			var $_len:int = _unitVec.length;
			
			var $_index:int;
			
			var $_info:RichTextUnit;
			var $_item:Sprite;
			
			var $_returnStr:String ="";
			var _cacheTextField:TextField = new TextField();
			_cacheTextField.defaultTextFormat = _defaultFormat;
			_cacheTextField.htmlText = _textField.htmlText;
			_unitVec.sort(sortUnit);
			
			while ($_len--) {
				$_info  = _unitVec[$_len];
				if($_info){
					$_index = $_info.unitData.indexInMessageString;
					_cacheTextField.replaceText($_index, $_index + $_replaceStr.length, $_info.unitData.code);
				}
			}
			$_returnStr = _cacheTextField.text;	
			
			return $_returnStr;
		}
		
		/**
		 * 在文本的当前指正添加信息，非输入文本会自动换行，输入文本不会自动换行
		 * @param $str
		 * 
		 */		
		public function appendRichText($str:String):void
		{
			if( $str == null )
				return;
			//判断是否还能输入字符
			if(remainChars < 1)
			{
				return;
			}
			addMsgIconData( $str, RichTextConfig.SEPARATOR );
			//如果是输入文本不需要自动添加段落标签
			if(_isEditable)
			{
				var cursorIndex:int = _cursorInfo.cursorIndex;
				_textField.setSelection(cursorIndex,cursorIndex);
				_textField.replaceSelectedText($str);
				cursorIndex += $str.length;
				_textField.setSelection(cursorIndex,cursorIndex);
				getCurrentCursorInfo(_cursorInfo);
				this.dispatchEvent(new away3d.events.Event(away3d.events.Event.CHANGE));
			}
			else
			{
				var info:String = _textField.htmlText + autoWordWrap($str);;
				_textField.htmlText = info;
			}
			convert();
		}
		
		private function autoWordWrap(text:String):String
		{
			wordWrapTxt.defaultTextFormat=_defaultFormat;
			wordWrapTxt.htmlText=text;
			wordWrapTxt.width=_textField.width;
			wordWrapTxt.wordWrap=_textField.wordWrap;
			wordWrapTxt.visible=false;
			Starling.current.nativeStage.addChild(wordWrapTxt);
			
			var strlen:int = wordWrapTxt.length;
			var w:Number = 0;
			for (var i:int = 0; i < strlen; i++)
			{
				w +=  wordWrapTxt.getCharBoundaries(i).width;
				if (w > wordWrapTxt.width - 5)
				{
					var temp:String = wordWrapTxt.text.charAt(i - 1) + "\n";
					wordWrapTxt.replaceText(i - 1, i, temp);
					w = 0;
				}
			}
			wordWrapTxt.parent.removeChild(wordWrapTxt);
			return wordWrapTxt.text;
		}		
		
		/**
		 * 设置文本宽高
		 * @param $w
		 * @param $h
		 * 
		 */		
		public function setSize($w:int, $h:int = 0):void
		{
			_setHeight = $h;
			_textField.width = $w;
			if(_setHeight > 0)
			{
				_textField.height = _setHeight;
				reDrawMask();
			}
			setContainerPos();
			reDrawTextField();
		}
		
		public function clear():void
		{
			var unit:RichTextUnit;
			for(var i:int = _unitVec.length - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				RichTextUnit.putUnit( unit );
				_unitVec.splice( i, 1 );
			}
			_unitVec.length = 0;
			_cursorInfo.reset();
			while (_unitsContainer.numChildren) 
			{
				_unitsContainer.removeChildAt(0);
			}
			_textField.htmlText = "";
			_instanceUnitVec = _originalUnitConfigVect.concat();
		}
		
		override public function dispose():void
		{
			super.dispose();
			clear();
			isEditable = false;
		}
		
		public function set defaultTextFormat($textFormat:TextFormat):void
		{
			_defaultFormat = $textFormat;
			if(_defaultFormat.letterSpacing == null)
			{
				_defaultFormat.letterSpacing = 0;
			}
			_textField.defaultTextFormat = _defaultFormat;
		}
		
		/**是否可以输入，默认不可以*/
		public function set isEditable(value:Boolean):void
		{
			_isEditable = value;
			if(_isEditable)
			{
				this.addEventListener(TouchEvent.TOUCH,onTouchThis);
				_textField.addEventListener(MouseEvent.CLICK, clickHandler);
			}
			else
			{
				_textField.removeEventListener(MouseEvent.CLICK, clickHandler);
				onFocusOut(null);
			}
		}
		
		public function setFocus():void
		{
			if(_isEditable)
			{
				_isInputFocus = true;
				Starling.current.nativeStage.addEventListener(flash.events.Event.RESIZE,onResize);
				_textField.addEventListener(FocusEvent.FOCUS_IN,onFocusIn);
				_textField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut);
				_textField.addEventListener(flash.events.Event.CHANGE , onTextChanged);
				_textField.addEventListener(flash.events.Event.SCROLL , onTextScroll);
				_textField.addEventListener(KeyboardEvent.KEY_DOWN , onTextKeyDown);
				_textImage.removeFromParent();
				Starling.current.nativeStage.addChild(_textField);
				updateTextFieldPos();
				_textField.type = TextFieldType.INPUT;
				Starling.current.nativeStage.focus = _textField;
			}
		}
		
		public function removeFocus():void
		{
			if(_isInputFocus)
			{
				Starling.current.nativeStage.focus = null;
			}
		}
		
		public function selectRange(beginIndex:int,endIndex:int):void
		{
			_textField.setSelection(beginIndex,endIndex);
			getCurrentCursorInfo(_cursorInfo);
		}
		
		/**
		 * 是否自动换行
		 * @param value
		 * 
		 */
		public function set wordWrap( value:Boolean):void
		{
			_textField.wordWrap = value;
		}
		
		/**
		 * 是否支持多行
		 * @param value
		 * 
		 */
		public function set multiline( value:Boolean):void
		{
			_textField.multiline = value;
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
			return totalNum - getTextByteLen(_textField.text);
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
		
		override public function get height():Number
		{
			if(_setHeight > 0)
			{
				return _setHeight;
			}
			return _textField.textHeight + 4;
		}
		
		/**
		 * 重绘文本为贴图
		 * 
		 */		
		private function reDrawTextField():void
		{
			if(_setHeight <= 0)
			{
				_textField.height = _textField.textHeight + 4;
				reDrawMask();
			}
			
			refreshUnitsPos();
			if(_textField.parent == null)
			{
				var bitmapData:BitmapData = new BitmapData( _textField.width, _textField.height, true, 0 );
				bitmapData.draw( _textField );
				
				if( _texture != null )
				{
					_texture.dispose();
					_texture = null;
				}
				_texture = TextureFactory.fromBitmapData( bitmapData, false );
				bitmapData.dispose();
				
				if( _textImage == null )
				{
					_textImage = new Image( _texture );
				}
				if(_textImage.parent == null)
				{
					addChildAt( _textImage, 0 );
				}
				_textImage.texture = _texture;
				_textImage.readjustSize( _textField.width, _textField.height ); 
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
			this.dispatchEvent(new away3d.events.Event(FeathersEventType.FOCUS_IN));
		}
		
		private function onFocusOut(event:FocusEvent = null):void
		{
			_isInputFocus = false;
			if(_textField.parent)
			{
				Starling.current.nativeStage.removeChild(_textField);
				_textField.type = TextFieldType.DYNAMIC;
				Starling.current.nativeStage.removeEventListener(flash.events.Event.RESIZE,onResize);
				_textField.removeEventListener(FocusEvent.FOCUS_IN,onFocusIn);
				_textField.removeEventListener(FocusEvent.FOCUS_OUT,onFocusOut)
				_textField.removeEventListener(flash.events.Event.CHANGE , onTextChanged);
				_textField.removeEventListener(flash.events.Event.SCROLL , onTextScroll);
				_textField.removeEventListener(KeyboardEvent.KEY_DOWN , onTextKeyDown);
			}
			if(_textImage.parent == null)
			{
				addChildAt( _textImage, 0 );
			}
			reDrawTextField();
			this.dispatchEvent(new away3d.events.Event(FeathersEventType.FOCUS_OUT));
		}
		
		private function onResize(event:flash.events.Event = null):void
		{
			setTimeout(updateTextFieldPos,10);
		}
		
		private function updateTextFieldPos():void
		{
			var point:Point = new Point(this.x,this.y);
			point = this.parent.localToGlobal(point);
			_textField.x = point.x;
			_textField.y = point.y;
		}
		
		private function clickHandler(evt:flash.events.Event):void
		{
			setFocus();
			getCurrentCursorInfo(_cursorInfo);
		}
		
		private function onTextScroll(event:flash.events.Event):void
		{
			reDrawTextField();
			getCurrentCursorInfo(_cursorInfo);
		}
		
		private function onTextKeyDown(event:KeyboardEvent):void
		{
			getCurrentCursorInfo(_cursorInfo);
		}
		
		private function onTextChanged( event:flash.events.Event ):void
		{
			var currentTextInfo:RichTextCursorInfo = getCurrentCursorInfo();
			//变化部分的起始index
			var startIndexOfChanged:int = _cursorInfo.cursorIndex;
			var endIndexOfChanged:int = currentTextInfo.cursorIndex;
			if(currentTextInfo.cursorIndex < _cursorInfo.cursorIndex)
			{
				startIndexOfChanged = currentTextInfo.cursorIndex;
				endIndexOfChanged = _cursorInfo.cursorIndex;
			}
			//变化部分后面的内容产生的偏移量
			var offsetIndex:int = currentTextInfo.cursorIndex - _cursorInfo.cursorIndex;
			//判断是否还能输入字符
			if(offsetIndex > 0 && remainChars < 0)
			{
				_textField.replaceText(startIndexOfChanged,startIndexOfChanged + Math.abs(offsetIndex),"");
				return;
			}
			//更新变化的富文本对象
			updateUnitsIndexAndCheckRemoveWhenTextChanged(startIndexOfChanged,offsetIndex);
			if (offsetIndex > 0)
			{
				checkAddUnitWhenInputed(startIndexOfChanged, currentTextInfo.cursorIndex);
			}
			reDrawTextField();
			_cursorInfo = currentTextInfo;
			this.dispatchEvent(new away3d.events.Event(away3d.events.Event.CHANGE));
		}
		
		private function convert():void
		{
			var $_replaceStr:String = PLACEHOLDER;
			var $_strLen:int;
			var $_id:int;
			var $_index:int;
			var $_iconStr:String ;
			var unitData:RichTextUnitData;
			while ($_index != -1) 
			{	
				
				unitData = getUnitData( _textField.text );
				if( unitData == null )
					break;
				
				$_index = unitData.indexInMessageString;
				
				if ($_index != -1) 
				{
					$_strLen = unitData.code.length;
					_textField.replaceText( unitData.indexInMessageString, unitData.indexInMessageString + $_strLen, $_replaceStr );
					if(_isEditable)
					{
						if(_cursorInfo.cursorIndex == unitData.indexInMessageString + $_strLen)
						{
							var cursorIndex:int = unitData.indexInMessageString + $_replaceStr.length;
							_textField.setSelection(cursorIndex,cursorIndex);
							getCurrentCursorInfo(_cursorInfo);
						}
					}
					updateUnitsIndexAfterReplaceUnit($_index, $_replaceStr.length - unitData.code.length);
					addUnit( unitData );
				}
			}
			reDrawTextField();
		}
		
		public function get textfield():TextField
		{
			return _textField;
		}
		
		/**
		 * 替换副本文单元字符后更新其他单元的索引
		 * @param $index
		 * @param $num
		 * @param $isSetSelection
		 * 
		 */
		private function updateUnitsIndexAfterReplaceUnit($index:int,$num:int):void
		{
			var $_len:int = _unitVec.length;
			var unit:RichTextUnit;
			for (var i:int = 0; i < $_len; i++)
			{
				unit = _unitVec[i];
				if (unit)
				{
					if (unit.unitData.indexInMessageString > $index) 
					{
						unit.unitData.indexInMessageString += $num;
					}
				}
			}
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
					$_rect = _textField.getCharBoundaries(unit.unitData.indexInMessageString);
					if ($_rect)
					{
						$_txtLineMetrics = _textField.getLineMetrics(_textField.getLineIndexOfChar(unit.unitData.indexInMessageString));
						unit.displayObj.visible = true;
						var offsetY:Number = $_rect.height - unit.displayObj.height - $_txtLineMetrics.descent + 4 + unit.unitData.offsetY;
						unit.displayObj.x = Math.round( $_rect.x + ($_rect.width - unit.displayObj.width) * 0.5 );
						unit.displayObj.y = Math.round( $_rect.y +  offsetY);
					}else
					{
						unit.displayObj.visible = false;
					}
				}
			}
			setContainerPos();
		}
		
		private function getTxtWidth($size:int):int
		{
			var $_txt:TextField = new TextField();
			var $_format:TextFormat = new TextFormat();
			$_txt.text = PLACEHOLDER;
			$_format.size = $size;
			$_txt.setTextFormat($_format);
			return $_txt.textWidth-2;
		}
		
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
						unitData = getUnitData($_arr[0]);
						unitData.indexInMessageString = $_index;
						addUnit(unitData);
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
			cursorInfo.cursorIndex = _textField.caretIndex;
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
		private function getUnitData($str:String):RichTextUnitData
		{
			var $_len:int = _instanceUnitVec.length;
			var $_index:int = -1;
			var $_id:int = -1;
			if ($_len <= 0) 
				return null;
			
			var unitData:RichTextUnitData = new RichTextUnitData();
			for (var i:int = $_len - 1; i >= 0; i-- )
			{
				var iconData:RichTextUnitConfigData = _instanceUnitVec[i];
				$_index = $str.indexOf( iconData.shortcutCode );
				if ($_id == -1 || ($_index != -1 && $_id > $_index)) 
				{
					$_id = $_index;
					unitData = RichTextConfig.getUnitData(iconData.shortcutCode);
					if(unitData == null)
					{
						unitData = new RichTextUnitData();
						unitData.code = iconData.shortcutCode;
						unitData.type = iconData.type;
						unitData.res = iconData.res;
					}
					unitData.indexInMessageString = $_index;
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
		private function updateUnitsIndexAndCheckRemoveWhenTextChanged(startIndex:int, offsetIndex:int):void
		{
			var len:int = _unitVec.length;
			var unit:RichTextUnit;
			for(var i:int = len - 1; i >= 0; i--)
			{
				unit = _unitVec[i];
				if(unit)
				{
					if (unit.unitData.indexInMessageString >= startIndex)
					{
						unit.unitData.indexInMessageString+= offsetIndex;
						if(unit.unitData.indexInMessageString < startIndex || unit.unitData.indexInMessageString >= _textField.length) 
						{
							if(unit.displayObj)
							{
								_unitsContainer.removeChild(unit.displayObj);
							}
							_unitVec.splice(i,1);
						}
					}
				}
			}
		}
		
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
		}
		
		private function sortUnit(unit1:RichTextUnit,unit2:RichTextUnit):int
		{
			if(unit1.unitData.indexInMessageString < unit2.unitData.indexInMessageString)
			{
				return -1;
			}
			else if(unit1.unitData.indexInMessageString > unit2.unitData.indexInMessageString)
			{
				return 1;
			}
			return 0;
		}
		
		private function onUnitLoaded(unit:RichTextUnit):void
		{
			if(unit.displayObj == null || _unitVec.indexOf(unit) < 0)
			{
				return;
			}
			_unitsContainer.addChild(unit.displayObj);
			var $_format:TextFormat;
			var $_rec:Rectangle;
			var $_fontSize : int;
			$_format = new TextFormat();
			if(unit.displayObj is Label)
			{
				$_fontSize = int(_defaultFormat.size);
			}
			else
			{
				$_fontSize = unit.displayObj.height;
			}
			$_format.size = $_fontSize;
			$_format.url = unit.unitData.code + SEPARATOR;
			$_format.letterSpacing = unit.displayObj.width - getTxtWidth($_fontSize);
			unit.unitData.textFormat = $_format;
			_textField.setTextFormat($_format, unit.unitData.indexInMessageString,unit.unitData.indexInMessageString + PLACEHOLDER.length);
			reDrawTextField();
		}
		
		/**
		 * 重绘遮罩层
		 * @param $w
		 * @param $h
		 * 
		 */
		private function reDrawMask():void 
		{
			_unitsMask.graphics.clear();
			_unitsMask.graphics.beginFill(0x0,1);
			_unitsMask.graphics.drawRect(0, 0, _textField.width,height);
			_unitsMask.graphics.endFill();
		}
		
		private function get textField():TextField
		{
			return _textField;
		}
		
		/**
		 * 
		 * @param msg
		 * @param separator
		 * 
		 */		
		private function addMsgIconData( msg:String, separator:String ):void
		{
			if( msg == null )
				return;
			
			var data:Array = msg.split( separator );
			var len:int = data.length;
			if( len <= 0 )
				return;
			
			var iconData:RichTextUnitConfigData;
			for(var i:int = 1; i < len; i += 2)
			{
				iconData = new RichTextUnitConfigData();
				iconData.shortcutCode = separator + data[i] + separator;//把分割符加回去
				iconData.type = RichTextCustomUnitType.LINK;
				iconData.res = "";
				//这个地方应该要检查是否重复添加 to do...
				_instanceUnitVec.push( iconData );
			}
			
		}
		
		/**
		 * 得到字符串的字节长度
		 * @param	info
		 * @return
		 */
		public function getTextByteLen(info : String) : int
		{
			return toByteArray(info).length;
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
	}
}

