package feathers.themes{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display3D.Context3DTextureFormat;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.System;
	import flash.text.TextFormat;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	import away3d.events.Event;
	import away3d.loaders.multi.MultiDobjLoadManager;
	import away3d.loaders.multi.MultiDobjLoader;
	import away3d.loaders.multi.MultiLoadData;
	import away3d.textures.TextureFormatEnum;
	import away3d.tools.utils.TextureUtils;
	
	import feathers.EVIL3D_FEATHERS_VERSION;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.ComboBox;
	import feathers.controls.GroupedList;
	import feathers.controls.GroupedTree;
	import feathers.controls.List;
	import feathers.controls.NumericStepper;
	import feathers.controls.ProgressBar;
	import feathers.controls.Radio;
	import feathers.controls.ScrollBar;
	import feathers.controls.ScrollContainer;
	import feathers.controls.Scroller;
	import feathers.controls.Slider;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import feathers.controls.UIState;
	import feathers.controls.text.Fontter;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.core.FeathersControl;
	import feathers.skins.ImageSkin;
	import feathers.textures.FastDynamicBitmapTexture;
	import feathers.textures.RepeatScale9Textures;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.textures.ConcreteTexture;
	import starling.textures.DynamicBitmapTexture;
	import starling.textures.DynamicLabelTextureAtlas;
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureAtlas;
	import starling.textures.TextureFactory;
	import starling.utils.Pool;
	
	import utils.KeyboardMananger;
	import utils.StringUtil;
	import utils.UIStateSetHelper;
	
	/**
	 * 自定义GUI皮肤配置系统
	 * @author wewell@163.com
	 * 
	 */
	public class GuiTheme extends DefaultTheme
	{
		/**
		 * @private
		 */
		[Embed(source="./../../../assets/images/aeon_desktop.xml",mimeType="application/octet-stream")]
		protected static const ATLAS_XML:Class;
		/**
		 * @private
		 */
		[Embed(source="./../../../assets/images/aeon_desktop.png")]
		protected static const ATLAS_BITMAP:Class;
		
		
		/**
		 * 记录纹理所在纹理集的关键字
		 */
		private static const TEXTURE_ATLAS_ID:String = "atlasID";
		
		private static const CUSTOM_COMMON_TEXTURES_ID:String = "custom_common_textures";
		
		private static const SCALE9_GRID:String = "scale9grid";
		
		/**
		 * 相对于GameLoader.swf的res相对路径
		 */
		public static var RES_ROOT:String = "../res/";
		
		/**
		 * 是否采用worker来解压纹理数据
		 */
		public static var useWorkerLoadTextureBytes:Boolean = true;
		
		/**
		 * 是否采用压缩纹理
		 */
		public static var useCompressedTexture:Boolean = false;
		
		/**
		 * 采用哪种格式的纹理,默认为不指定,由url决定
		 * */
		public static var defaultTextureFormat:int = TextureFormatEnum.UNKNOWN;
		
		
		/**
		 *当纹理上载完成后是否释放bgraBytes所占用的内存 
		 */		
		public static var disposeBgraBytesOnUploaded:Boolean = true;
		
		/**
		 *当平铺超过这个数时将偿试使用GPU填充,会增加一次drawCall
		 */	
		public static var checkGpuRepeatTileCount:int = 2;

		/**
		 * @private
		 */
		protected static var CUSTOM_COMMON_BITMAP:Class;
		/**
		 * @private
		 */
		protected static var  CUSTOM_COMMON_XML:Class;
		
		private static var helperTexture:IStarlingTexture;
		
		
		/**
		 *全局纹理配置数据,含九宫格信息,资源相对路径,所在的纹理集等
		 */		
		private var themeInfo:Dictionary;
		
		/**
		 * 全部纹理集,包括静态纹理集和动态纹理集
		 */	
		private var textureAtlasMap:Dictionary;
		
		/**
		 * 单独加载的png或jpg生成的Textrue
		 */	
		private var textureMap:Dictionary;
		
		/**
		 * 全部纹理bitmapData集,包括静态纹理bitmapData和动态纹理bitmapData
		 */	
		private var textureBdMap:Dictionary;
		
		/**
		 *全局共享的可缩放纹理(横向3宫,纵向3宫,9宫)
		 *3宫格视为9宫格的特例
		 */
		private var mSubScale9Textures:Dictionary;
		
		/**
		 * 系统自动生成的动态变化的纹理集序号,递增ID
		 * 动态纹理<尺寸2048x2048>,当一张贴图满载时,开辟下一张
		 */	
		private static var dynamicIndex:int=1;
		
		/**
		 *仅当纹理尺寸大于等于SINGLE_TEXTURE_MIN_SIZE时 系统会为此单独开辟一张纹理
		 */	
		public static const SINGLE_TEXTURE_MIN_SIZE:Point = new Point(256, 256);
		private static const HELPER_POINT:Point = new Point(0,0);
		
		/**
		 * 默认自动补充灰度纹理的图片像素总值,如100x100的图片像素总值为10000;不希望生成时，赋值为0
		 */	
		private static var CREAT_GRAY_IMG_PIXES:int = 0;
		
		/**
		 *自定义的纹理集key所包含的subKeys
		 */		
		private var customTexturesKeyMap:Dictionary;
		public static var decodeURL:Function;
		
		private static var _ins:GuiTheme;
		public static function get ins():GuiTheme
		{
			if(_ins == null)_ins = new GuiTheme();
			return _ins;
		}
		
		/**
		 * Constructor.
		 */
		public function GuiTheme()
		{
			super();
			if(_ins != null){
				throw new Error("Singleton Instance!");
			}
			mSubScale9Textures = new Dictionary();
			themeInfo = new Dictionary();
			textureAtlasMap = new Dictionary();
			textureMap = new Dictionary();
			textureBdMap = new Dictionary();
			customTexturesKeyMap = new Dictionary();
			new KeyboardMananger(Starling.current.nativeStage);
			this.initialize();
		}
		
		//==========================================================================
		//                                库初始化
		//==========================================================================
		/**
		 * 安装一套默认主题,兼容老版本
		 * 
		 */		
		public static function setup(pngCls:Class, xmlCls:Class):void
		{
			if(pngCls != null &&  xmlCls != null)
			{
				ins.pushBitmapTexture(CUSTOM_COMMON_TEXTURES_ID, Bitmap(new pngCls()).bitmapData,  XML(new xmlCls()));
			}
		}
		
		/**
		 * @private
		 */
		override protected function initialize():void
		{
			trace("[UIFrameWork]",EVIL3D_FEATHERS_VERSION +" based on Evil3DStarling " +Starling.VERSION);
			
			this.initializeTextureAtlas();
			super.initialize();
			FeathersControl.defautStyleClassParseFunction = GuiThemeStyle.setFeatherSkinClass;
			
			//控件默认皮肤配置函数
			this.getStyleProviderForClass(Button).defaultStyleFunction = setCustomButtonStyle;
			this.getStyleProviderForClass(ToggleButton).defaultStyleFunction = setToggleButtonStyle;
			this.getStyleProviderForClass(TextInput).defaultStyleFunction = setTextInputStyle;
			this.getStyleProviderForClass(TextArea).defaultStyleFunction = setTextAreaStyle;
			this.getStyleProviderForClass(Check).defaultStyleFunction = setToggleButtonStyle;
			this.getStyleProviderForClass(TabBar).defaultStyleFunction = setTabBarStyle;
			this.getStyleProviderForClass(ComboBox).defaultStyleFunction = setComboBoxStyle;
			this.getStyleProviderForClass(List).defaultStyleFunction = setCustomListStyle;
			this.getStyleProviderForClass(GroupedList).defaultStyleFunction = setCustomListStyle;
			this.getStyleProviderForClass(GroupedTree).defaultStyleFunction = setCustomListStyle;
			this.getStyleProviderForClass(Slider).defaultStyleFunction = setSliderStyle;
			this.getStyleProviderForClass(ProgressBar).defaultStyleFunction = setProgressBarStyle;
			this.getStyleProviderForClass(ScrollContainer).defaultStyleFunction = setScrollContainerStyle;
			this.getStyleProviderForClass(Radio).defaultStyleFunction = setToggleButtonStyle;
			this.getStyleProviderForClass(ScrollBar).defaultStyleFunction = setScrollBarStyle;
			this.getStyleProviderForClass(NumericStepper).defaultStyleFunction = setNumericStepperStyle;
		}
		
		/**
		 * 系统默认组件皮肤
		 * @private
		 */
		protected function initializeTextureAtlas():void
		{
			var atlasTexture:IStarlingTexture = TextureFactory.fromEmbeddedAsset(ATLAS_BITMAP, false, false);
			
			this.atlas = new TextureAtlas(atlasTexture, XML(new ATLAS_XML()) );
			
			//creat the static helperTexture for imageSkin defautlTexture
			var bd:BitmapData = new BitmapData(4,4,true,0);
			helperTexture = TextureFactory.fromBitmapData(bd);
		}

		private function updateDefaultTextFormat(name:String, size:int):void
		{
			this.defaultTextFormat.font = name;
			this.disabledTextFormat.font = name;
			this.headingTextFormat.font = name;
			this.headingDisabledTextFormat.font = name;
			this.detailTextFormat.font = name;
			this.detailDisabledTextFormat.font = name;
			this.invertedTextFormat.font = name;
			
			this.defaultTextFormat.size = size;
			this.disabledTextFormat.size = size;
			this.headingTextFormat.size = size;
			this.headingDisabledTextFormat.size = size;
			this.detailTextFormat.size = size;
			this.detailDisabledTextFormat.size = size;
			this.invertedTextFormat.size = size;
		}
		
		public static function updateDefaultFont(name:String, size:int):void
		{
			if(!_ins)return;
			ins.updateDefaultTextFormat(name, size);
		}
		
		//==========================================================================
		//                                自定义组件外观设置--组件支持多套外观
		//==========================================================================
		//button
		public function addButtonStyle(styleName:String):void{
			this.getStyleProviderForClass(Button).setFunctionForStyleName(styleName, setCustomButtonStyle);
		}
		private function setCustomButtonStyle(button:Button, styleName:String = null):void
		{
			styleName = styleName || button.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Button);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				 setButtonStyles(button);
				 return;
			}
			if(!button.styleName)button.styleName = styleName;
			button.defaultSkin = creatImageSkin(styleName);
			button.stateToLabelPropertiesFunction = updateButtonLabelState;
		}
		
		//ToggleButton
		public function addToggleButtonStyle(styleName:String):void{
			this.getStyleProviderForClass(ToggleButton).setFunctionForStyleName(styleName, setToggleButtonStyle);
		}
		private function setToggleButtonStyle(button:ToggleButton, styleName:String = null):void
		{
			styleName = styleName || button.styleName || GuiThemeStyle.getFeatherDefaultStyleName(ToggleButton);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setButtonStyles(button);
				return;
			}
			if(!button.styleName)button.styleName = styleName;
			button.defaultIcon = creatImageSkin(styleName);
			button.stateToLabelPropertiesFunction = updateButtonLabelState;
		}
		
		//radio
		public function addRadioStyle(styleName:String):void
		{
			this.getStyleProviderForClass(Radio).setFunctionForStyleName(styleName, setRadioStyle);
		}
		private function setRadioStyle(button:Radio, styleName:String = null):void
		{
			styleName = styleName || button.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Radio);
			setToggleButtonStyle(button, styleName);
		}
		
		//Check
		public function addCheckStyle(styleName:String):void
		{
			this.getStyleProviderForClass(Check).setFunctionForStyleName(styleName, setCheckStyle);
		}
		private function setCheckStyle(check:Check, styleName:String = null):void
		{
			styleName = styleName || check.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Check);
			setToggleButtonStyle(check, styleName);
		}
		
		//textInput
		public function addTextInputStyle(styleName:String):void
		{
			this.getStyleProviderForClass(TextInput).setFunctionForStyleName(styleName, setTextInputStyle);
		}
		private function setTextInputStyle(input:TextInput, styleName:String = null):void
		{
			styleName = styleName || input.styleName || GuiThemeStyle.getFeatherDefaultStyleName(TextInput);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
//				setTextInputStyles(input);
				return;
			}
			if(!input.styleName)input.styleName = styleName;
			input.backgroundSkin = creatImageSkin(styleName);
			var stateSkin:StateSkin = GuiThemeStyle.getStateSkin(styleName);
			var textDisplay:TextFieldTextEditor = stateSkin[UIState.TEXT_DISPLAY];
			var initProps:Array = stateSkin.states[UIState.INIT];
			var tfm:TextFormat =  input.textEditorProperties.textFormat;
			
			if(!tfm)
			{
				var temp:TextFormat = new TextFormat(Fontter.DEFAULT_FONT_NAME, Fontter.DEFAULT_FONT_SIZE, Fontter.DEFAULT_FONT_COLOR);
				temp.align = "left";
				tfm = temp;
			}
			
			//tfm = UIStateSetHelper.clone(tfm);
			if(input.prompt)
			{
				input.promptProperties.textFormat = tfm;
				input.promptProperties.alpha = 0.5;
			}
			
			if(textDisplay != null)
			{
				input.paddingLeft = textDisplay.left;
//				input.paddingTop = textDisplay.top;
				input.paddingRight = textDisplay.right;
//				input.paddingBottom = textDisplay.bottom;
				tfm.color = textDisplay.color;
				tfm.size = textDisplay.fontSize;
				tfm.align = textDisplay.textAlign;
			}
			input.textEditorProperties.textFormat = tfm;
		}
		
		//textArea
		public function addTextAreaStyle(styleName:String):void
		{
			this.getStyleProviderForClass(TextArea).setFunctionForStyleName(styleName, setTextAreaStyle);
		}
		private function setTextAreaStyle(input:TextArea, styleName:String = null):void
		{
			styleName = styleName || input.styleName || GuiThemeStyle.getFeatherDefaultStyleName(TextArea);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setTextAreaStyles(input);
				return;
			}
			if(!input.styleName)input.styleName = styleName;
			input.backgroundSkin = creatImageSkin(styleName);
			var stateSkin:StateSkin = GuiThemeStyle.getStateSkin(styleName);
			var textDisplay:TextFieldTextEditor = stateSkin.hasOwnProperty(UIState.TEXT_DISPLAY) ? stateSkin[UIState.TEXT_DISPLAY] : null;
//			var initProps:Array = stateSkin.states[UIState.INIT]; 
			var tfm:TextFormat =  input.textEditorProperties.textFormat;
			if(!tfm)tfm =	new TextFormat(Fontter.DEFAULT_FONT_NAME, Fontter.DEFAULT_FONT_SIZE, Fontter.DEFAULT_FONT_COLOR);
//			input.padding = 2;
			if(textDisplay != null)
			{
				input.textEditorProperties.paddingLeft = textDisplay.left;
				input.textEditorProperties.paddingTop = textDisplay.top;
				input.textEditorProperties.paddingRight = textDisplay.right;
				input.textEditorProperties.paddingBottom = textDisplay.bottom;
			}
			input.textEditorProperties.textFormat = tfm;
			
			//scrollBar
			setCustomListStyle(input, styleName);
			//滚动条出现时间[fixed, none, float, fixedFloat]
			input.scrollBarDisplayMode = ScrollContainer.SCROLL_BAR_DISPLAY_MODE_FIXED_FLOAT;
		}
		
		//TabBar
		public function addTabBarStyle(styleName:String):void
		{
			this.getStyleProviderForClass(ToggleButton).setFunctionForStyleName(styleName, setCustomButtonStyle);
			this.getStyleProviderForClass(TabBar).setFunctionForStyleName(styleName, setTabBarStyle);
		}
		private function setTabBarStyle(tabBar:TabBar, styleName:String=null):void
		{
			styleName = styleName || tabBar.styleName || GuiThemeStyle.getFeatherDefaultStyleName(TabBar);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setTabBarStyles(tabBar);
				return;
			}
			if(!tabBar.styleName)tabBar.styleName = styleName;
			tabBar.customTabStyleName = styleName;
		}
		
		//ComboBox
		public function addComboBoxStyle(styleName:String):void
		{
			this.getStyleProviderForClass(ComboBox).setFunctionForStyleName(styleName, setComboBoxStyle);
		}
		private function setComboBoxStyle(comboBox:ComboBox, styleName:String = null):void
		{
			styleName = styleName || comboBox.styleName || GuiThemeStyle.getFeatherDefaultStyleName(ComboBox);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				//throw new Error("set ComboBox instance styleName or styleClass property first please!");
				return;
			}
			if(!comboBox.styleName)comboBox.styleName = styleName;
			var stateSkin:StateSkin = GuiThemeStyle.getStateSkin(styleName);
			//set openButton
			if(stateSkin.hasOwnProperty("openButton"))
			{
				var btn:Button = stateSkin["openButton"] as Button;
				addButtonStyle(btn.styleName);
				comboBox.customButtonStyleName = btn.styleName;
				comboBox.buttonFactory = function():Button
				{
					var abtn:Button = new Button();
					setCustomButtonStyle(abtn, btn.styleName);
//					abtn.width = btn.width;
//					abtn.height = btn.height;
					abtn.y = btn.y;
					abtn.x = comboBox.width -btn.right- btn.width;
					return abtn;
				}
			}
			//set textInput
			if(stateSkin.hasOwnProperty("textInput"))
			{
				var input:TextInput = stateSkin["textInput"] as TextInput;
				addTextInputStyle(input.styleName);
				comboBox.customTextInputStyleName = input.styleName;
				comboBox.textInputFactory = function():TextInput
				{
					var aInput:TextInput = new TextInput();
					aInput.isEditable = true;
					setTextInputStyle(aInput, input.styleName);
					aInput.width = comboBox.width;
					aInput.height = comboBox.height;
					aInput.left = input.left;
					aInput.right = input.right;
					return aInput;
				}
			}
			//set pop up list
			if(stateSkin.hasOwnProperty("dropDown"))
			{
				var list:List = stateSkin["dropDown"] as List;
				addListStyle(list.styleName);
				comboBox.customListStyleName = list.styleName;
				comboBox.listFactory = function():List
				{
					var aList:List = new List();
					setCustomListStyle(aList, list.styleName);
					aList.width = comboBox.width - int(list.left) -int(list.right);
					aList.height = list.height ? list.height : stateSkin.height;
					aList.padding = 10;
					return aList;
				}
			}
		}
		
		//list
		public function addListStyle(styleName:String):void
		{
			this.getStyleProviderForClass(List).setFunctionForStyleName(styleName, setListStyle);
		}
		private function setListStyle(list:List, styleName:String = null):void
		{
			styleName = styleName || list.styleName || GuiThemeStyle.getFeatherDefaultStyleName(List);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setListStyles(list);
				return;
			}
			if(!list.styleName)list.styleName = styleName;
			setCustomListStyle(list, styleName);
		}
		
		//GroupedList
		public function addGroupedListStyle(styleName:String):void
		{
			this.getStyleProviderForClass(GroupedList).setFunctionForStyleName(styleName, setGroupedListStyle);
		}
		private function setGroupedListStyle(list:GroupedList, styleName:String = null):void
		{
			styleName = styleName || list.styleName || GuiThemeStyle.getFeatherDefaultStyleName(GroupedList);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setGroupedListStyles(list);
				return;
			}
			if(!list.styleName)list.styleName = styleName;
			setCustomListStyle(list, styleName);
		}
		
		//GroupedTree
		public function addGroupedTreeStyle(styleName:String):void
		{
			this.getStyleProviderForClass(GroupedTree).setFunctionForStyleName(styleName, setGroupedTreeStyle);
		}
		private function setGroupedTreeStyle(list:GroupedTree, styleName:String = null):void
		{
			styleName = styleName || list.styleName || GuiThemeStyle.getFeatherDefaultStyleName(GroupedTree);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setGroupedListStyles(list);
				return;
			}
			if(!list.styleName)list.styleName = styleName;
			setCustomListStyle(list, styleName);
		}
		
		private function setCustomListStyle(list:Scroller, styleName:String = null):void
		{
			styleName = styleName || list.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Scroller);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setScrollerStyles(list);
				return;
			}
			if(!list.styleName)list.styleName = styleName;
			var stateSkin:StateSkin = GuiThemeStyle.getStateSkin(styleName);
			//set list bg style
			var bar:ScrollContainer ;
			if(stateSkin.hasOwnProperty("bg"))
			{
				var bg:UIAsset = stateSkin["bg"] as UIAsset;
				var  newBg:UIAsset = new UIAsset();
				newBg.styleName = bg.styleName;
				list.backgroundSkin = bg != null ? newBg : null;
			}else{
				list.backgroundSkin = null;
			}
			//set list vscrollBar style
			if(stateSkin.hasOwnProperty("vBar"))
			{
				bar = stateSkin["vBar"] as ScrollContainer;
				if(bar != null)
				{
					setScrollerStyle(list, bar.styleName);
				}
			}else{
				list.verticalScrollPolicy = List.SCROLL_POLICY_OFF;
			}
			//set list hscrollBar style
			if(stateSkin.hasOwnProperty("hBar"))
			{
				bar = stateSkin["hBar"] as ScrollContainer;
				if(bar != null)
				{
					setScrollerStyle(list, bar.styleName);
				}
			}else{
				list.horizontalScrollPolicy = List.SCROLL_POLICY_OFF;
			}
		}
		
		//Slider
		public function addSliderStyle(styleName:String):void
		{
			this.getStyleProviderForClass(Slider).setFunctionForStyleName(styleName,  setSliderStyle);
		}
		private function setSliderStyle(slider:Slider, styleName:String = null):void
		{
			styleName = styleName || slider.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Slider);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				setSliderStyles(slider);
				return;
			}
			if(!slider.styleName)slider.styleName = styleName;
			//根据styleName获取自定义滚动条皮肤对应的StateSkin实例,然后分别取thumb,track对应的styleName为当前Slider换肤
			var stateSkins:Object = GuiThemeStyle.getStateSkin(styleName);
			if(!stateSkins)
			{
				try
				{
					var styleCls:Class =  getDefinitionByName(styleName) as Class;
					stateSkins = new styleCls();
				}catch(err:Error)
				{
					throw err;
					return
				}
			}
			/*slider.trackScaleMode = Slider.TRACK_SCALE_MODE_EXACT_FIT;
			slider.customThumbStyleName = FeathersControl(stateSkins["thumb"]).styleName;
			slider.customMinimumTrackStyleName = FeathersControl(stateSkins["track"]).styleName;
			if(stateSkins.hasOwnProperty("trackMax"))
			{
				slider.trackLayoutMode = ScrollBar.TRACK_LAYOUT_MODE_MIN_MAX;
				slider.customMaximumTrackStyleName = FeathersControl(stateSkins["trackMax"]).styleName;
			}*/
		}
		
		public function addNumericStepperStyle(styleName:String):void
		{
			this.getStyleProviderForClass(NumericStepper).setFunctionForStyleName(styleName,  setNumericStepperStyle);
		}
		private function setNumericStepperStyle(stepper:NumericStepper, styleName:String = null):void
		{
			styleName = styleName || stepper.styleName || GuiThemeStyle.getFeatherDefaultStyleName(NumericStepper);
			if(!styleName)
			{
				throw new Error("set ProgressBar instance styleName or styleClass property first please!");
			}
			if(!stepper.styleName)stepper.styleName = styleName;
			var stateSkin:StateSkin = cloneStateSkin(styleName);
			var skinBtn:Button = stateSkin.hasOwnProperty("decrementButton") ? stateSkin["decrementButton"] : null;
			if(skinBtn != null)
			{
				addButtonStyle(skinBtn.styleName);
				stepper.customDecrementButtonStyleName = skinBtn.styleName;
			}
			skinBtn = stateSkin.hasOwnProperty("incrementButton") ? stateSkin["incrementButton"] : null;
			if(skinBtn != null)
			{
				addButtonStyle(skinBtn.styleName);
				stepper.customIncrementButtonStyleName = skinBtn.styleName;
			}
			var skinInput:TextInput = stateSkin.hasOwnProperty("textDisplay") ? stateSkin["textDisplay"] : null;
			if(skinInput != null)
			{
				addTextInputStyle(skinInput.styleName);
				stepper.customTextInputStyleName = skinInput.styleName;
				stepper.textInputProperties.textAlign = skinInput.textAlign;
				stepper.textInputProperties.color = skinInput.color;
				stepper.textInputProperties.nativeFilters = skinInput.nativeFilters;
				stepper.textInputProperties.left = skinInput.left;
				stepper.textInputProperties.right = skinInput.right;
			}
		}
		
		//ProgressBar
		public function addProgressBarStyle(styleName:String):void
		{
			this.getStyleProviderForClass(ProgressBar).setFunctionForStyleName(styleName,  setProgressBarStyle);
		}
		private function setProgressBarStyle(progressBar:ProgressBar, styleName:String = null):void
		{
			styleName = styleName || progressBar.styleName || GuiThemeStyle.getFeatherDefaultStyleName(ProgressBar);
			if(!styleName)
			{
				throw new Error("set ProgressBar instance styleName or styleClass property first please!");
			}
			if(!progressBar.styleName)progressBar.styleName = styleName;
			var stateSkin:StateSkin = cloneStateSkin(styleName);
			
			if(!progressBar.width)progressBar.width = stateSkin.width;
			if(!progressBar.height)progressBar.height = stateSkin.height;
			
			//set ProgressBar fillSkin
			if(stateSkin.hasOwnProperty("thumb"))
			{
				progressBar.fillSkin = stateSkin["thumb"];
				if( !progressBar.paddingLeft ) progressBar.paddingLeft = progressBar.fillSkin.x;
				if( !progressBar.paddingRight ) progressBar.paddingRight = progressBar.paddingLeft;
				if( !progressBar.paddingTop ) progressBar.paddingTop = progressBar.fillSkin.y;
				if( !progressBar.paddingBottom ) progressBar.paddingBottom = progressBar.paddingTop;
				
				progressBar.fillSkin.width = progressBar.width-progressBar.paddingLeft-progressBar.paddingRight;
				progressBar.fillSkin.height = progressBar.height-progressBar.paddingTop-progressBar.paddingBottom;
			}
			//set ProgressBar backgroundSkin
			if(stateSkin.hasOwnProperty("track"))
			{
				progressBar.backgroundSkin = stateSkin["track"];
				if(!progressBar.width)progressBar.width = progressBar.backgroundSkin.width;
				if(!progressBar.height)progressBar.height = progressBar.backgroundSkin.height;
			}
		}
		
		//ScrollBar
		public function addScrollBarStyle(styleName:String):void
		{
			this.getStyleProviderForClass(ScrollBar).setFunctionForStyleName(styleName,  setScrollBarStyle);
		}
		private function setScrollBarStyle(scrollBar:ScrollBar, styleName:String = null):void
		{
			styleName = styleName || scrollBar.styleName || GuiThemeStyle.getFeatherDefaultStyleName(ScrollBar);
			if(!styleName || !GuiThemeStyle.hasStyle(styleName))
			{
				return;
			}
			if(!scrollBar.styleName)scrollBar.styleName = styleName;
			//根据styleName获取自定义滚动条皮肤对应的StateSkin实例,然后分别取increment,decrement,thumb,track对应的styleName为当前scrollbar换肤
			var stateSkins:Object = GuiThemeStyle.getStateSkin(styleName);
			if(!stateSkins)
			{
				try
				{
					var styleCls:Class =  getDefinitionByName(styleName) as Class;
					stateSkins = new styleCls();
				}catch(err:Error)
				{
					throw err;
				}
			}
			
			scrollBar.trackLayoutMode = ScrollBar.TRACK_LAYOUT_MODE_SINGLE;
			scrollBar.customIncrementButtonStyleName = FeathersControl(stateSkins["increment"]).styleName;
			scrollBar.customDecrementButtonStyleName = FeathersControl(stateSkins["decrement"]).styleName;
			scrollBar.customThumbStyleName = FeathersControl(stateSkins["thumb"]).styleName;
			scrollBar.customMinimumTrackStyleName = FeathersControl(stateSkins["track"]).styleName;
		}
		
		//ScrollContainer
		public function addScrollContainerStyle(styleName:String):void
		{
			this.getStyleProviderForClass(ScrollContainer).setFunctionForStyleName(styleName, setScrollContainerStyle);
		}
		private function setScrollContainerStyle(container:ScrollContainer, styleName:String=null):void
		{
			styleName = styleName || container.styleName || GuiThemeStyle.getFeatherDefaultStyleName(ScrollContainer);
			if(!container.styleName)container.styleName = styleName;
			this.setScrollerStyle(container, styleName);
		}
		
		public function setScrollerStyle(scroller:Scroller, scrollbarStyle:String=null):void
		{
//			scrollbarStyle = scrollbarStyle || scroller.styleName || GuiThemeStyle.getFeatherDefaultStyleName(Scroller);
//			if(!scroller.styleName)scroller.styleName = scrollbarStyle;
			scroller.clipContent = true;
			scroller.horizontalScrollBarFactory = function():ScrollBar{
				var bar:ScrollBar = new ScrollBar();
				setScrollBarStyle(bar, scrollbarStyle);
				return bar;
			};
			scroller.verticalScrollBarFactory = function():ScrollBar{
				var bar:ScrollBar = new ScrollBar();
				setScrollBarStyle(bar, scrollbarStyle);
				return bar;
			};
			scroller.customVerticalScrollBarStyleName = scrollbarStyle;
			scroller.customHorizontalScrollBarStyleName = scrollbarStyle;
			scroller.interactionMode = ScrollContainer.INTERACTION_MODE_MOUSE;
		} 
		
		private static function cloneStateSkin(styleName:String):StateSkin
		{
			var stateSkin:StateSkin;
			try
			{
				var styleCls:Class =  getDefinitionByName(styleName) as Class;
				stateSkin = new styleCls();
			}catch(err:Error)
			{
				throw err;
			}
			return stateSkin;
		}
		
		private static const AndSelected:String = "AndSelected";
		private static const STATE_UP_PNG:String="up.png";
		private static const STATE_NORMAL_PNG:String = "normal.png";
		private static const STATE_DISABLED_PNG:String = "disabled.png";
		private function creatImageSkin(styleName:String, isIcon:Boolean=false):ImageSkin
		{
			if(!styleName)
			{
				throw new Error("FeathersControl styleName undefined");
			}
			var stateSkins:Object = GuiThemeStyle.getStyle(styleName);
			var skinSelector:ImageSkin = new ImageSkin( );
			var key:String = stateSkins[UIState.UP] || stateSkins[UIState.NORMAL] || stateSkins[UIState.ENABLED];
			if(key)
			{
				//检查当前纹理集是否含有此图片,必须有up或normal状态
/*				if(!hasTexture(key))
				{
					//loadStyle(styleName);
					//return;
				}*/
				var texture:IStarlingTexture = getTexture(key);
				skinSelector.defaultTexture =  texture;
				
				//如果stateSkin没有指定大小，btn本身也未设置大小,则默认使用up/normal帧原图大小
				var sub:Object = getSubThemeInfo( key );
				if(sub)
				{
					skinSelector.readjustSize(sub.width, sub.height);
				}
				
				if(isScale9Textue(key))
				{
					applayScale9Gird(skinSelector, key);
				}
				
				//没有disabled状态图片
				if(!stateSkins[UIState.DISABLED])
				{
					//有up状态图片或normal状态图片
					if(key.indexOf(STATE_UP_PNG) != -1)
					{
						key = key.replace(STATE_UP_PNG, STATE_DISABLED_PNG);
						stateSkins[UIState.DISABLED] = key;
					}else if(key.indexOf(STATE_NORMAL_PNG) != -1)
					{
						key = key.replace(STATE_NORMAL_PNG, STATE_DISABLED_PNG);
						stateSkins[UIState.DISABLED] = key;
					}
				}
				
				//有upAndSelected,但没有disabledAndSelected状态图片
				if(stateSkins[UIState.UP_AND_SELECTED] && !stateSkins[UIState.DISABLED_AND_SELECTED])
				{
					//有up状态图片或normal状态图片
					if(key.indexOf(STATE_UP_PNG) != -1)
					{
						key = key.replace(STATE_UP_PNG, STATE_DISABLED_PNG);
						stateSkins[UIState.DISABLED_AND_SELECTED] = key;
					}
				}
			}else
			{
				/**if current stateSkin have not defaut texture , we need give one**/
				skinSelector.defaultTexture = helperTexture;  //success
//				skinSelector.defaultTexture = TextureFactory.fromColor(16,16, 0, 0); //fail
			}
			
			var skinName:String;
			for each(var state:String in UIState.SMART_STATES)
			{
				if(stateSkins.hasOwnProperty(state))
				{
					switch(state)
					{
						case UIState.UP:
						case UIState.DOWN:
						case UIState.HOVER:
						case UIState.DISABLED:
						case UIState.ENABLED:
						case UIState.FOCUSED:
							skinName = stateSkins[state];
							skinName = splitIconSkinName(skinName, isIcon);
							if(skinName)
							{
								skinSelector.setTextureForState(state, getTexture(skinName));
							}
						break;
						case UIState.UP_AND_SELECTED:
						case UIState.DOWN_AND_SELECTED:
						case UIState.HOVER_AND_SELECTED:
						case UIState.DISABLED_AND_SELECTED:
							skinName = stateSkins[UIState.UP_AND_SELECTED];
							if(isIcon)
							{
								skinName = splitIconSkinName(skinName);
							}
							if(skinName)
							{
								skinSelector.selectedTexture = getTexture(skinName);
							}
							
							skinName = stateSkins[state];
							if(isIcon)
							{
								skinName = splitIconSkinName(skinName);
							}
							if(skinName)
							{
								skinSelector.setTextureForState(state, getTexture(skinName));
							}
							break;
					}
				}
			}
			return skinSelector;
		}
		
		private function splitIconSkinName(skinName:String, isIcon:Boolean=false):String
		{
			if(isIcon)
			{
				if(skinName.indexOf(",") != -1)
				{
					return skinName.split(",").pop();
				}
				return null;
			}
			return  skinName.split(",").shift();
		}
		
		private function updateButtonLabelState(btn:Button, state:String):Object
		{
			if(!btn.label)return null;
			
			if(btn is ToggleButton && ToggleButton(btn).isSelected)
			{
				state = state + UIState.AND_SELECTED;
			}
			
			var sets:Object;
			var t:String, n:String, v:*, tfmProp:String;
			var propties:Object = {};
			var states:Object = btn.styleName ? GuiThemeStyle.getStateSkin( btn.styleName ).states : null;
			var caches:Object = btn.textFormatCacheProperties;
			
			//get from cache
			var labelStateCacheProperties:Object = btn.labelStateCacheProperties;
			if(!labelStateCacheProperties)
			{
				btn.labelStateCacheProperties = labelStateCacheProperties = {};
			}else if(labelStateCacheProperties.hasOwnProperty(state))
			{
				propties = labelStateCacheProperties[state];
				//应用最新的textFormat
				if(propties  && caches  && propties.textFormat)
				{
					tfm = propties.textFormat;
					for(tfmProp in caches)
					{
						if(tfm.hasOwnProperty(tfmProp)){
							tfm[tfmProp] = caches[tfmProp];
						}
					}
				}
				return propties;
			}
			
			//button default skin's label textFormat
			var propsets:Array = states ? states[UIState.INIT] : null;
			propsets = propsets ? propsets.concat() : [];
			
			//button replace the defalut lable textFormat
			if(caches != null)
			{
				for(tfmProp in caches)
				{
					propsets.push({target:UIState.LABEL_DISPLAY, name:tfmProp, value:caches[tfmProp]});
				}
			}
			
			//button defalut skin's label filters 
			if(states != null)
			{
				var initFilters:* = UIStateSetHelper.searchValueInStates(UIState.NATIVE_FILTERS, states, UIState.INIT);
				if(!initFilters)
				{
					var nextNativeFilters:* = UIStateSetHelper.searchValueInStates(UIState.NATIVE_FILTERS, states);
					if(nextNativeFilters != null)
					{
						initFilters = UIStateSetHelper.clone(nextNativeFilters);
						for each(var filter:* in initFilters)
						{
							if(UIState.ALPHA in filter)filter[UIState.ALPHA]=0;
							if(UIState.STRENGTH in filter)filter[UIState.STRENGTH]=0;
						}
						propsets.push({target:UIState.LABEL_DISPLAY, name:UIState.NATIVE_FILTERS, value:initFilters});
					}
				}
			}

			//button replace the default label filters
			if(btn.nativeFilters)
			{
				propsets.push({target:UIState.LABEL_DISPLAY, name:UIState.NATIVE_FILTERS, value:btn.nativeFilters});
			}

			if(states && state in states)
			{
				propsets = propsets.concat(states[state]);
			}
			
			var tfm:TextFormat = new TextFormat(btn.fontName, btn.fontSize, btn.color);
			for each(sets in propsets)
			{
				t = sets[UIState.TARGET];
				if(t != UIState.LABEL_DISPLAY)continue;
				
				n = sets[UIState.NAME];
				v = sets[UIState.VALUE];
				tfmProp = UIState.transToTextFormatProp(n);
				if(tfm.hasOwnProperty(tfmProp)){
					tfm[tfmProp] = v;
				}
				//其它属性
				else{
					propties[n] = v;
				}
			}
			if(btn.defaultLabelProperties.embedFonts)
			{
				Fontter.transTextFormat(tfm);
			}
			propties.textFormat = tfm;
			labelStateCacheProperties[state] = propties;
			return propties;
		}
		
		//==========================================================================
		//                                纹理相关方法
		//==========================================================================
		public function LoadAsset(key:String, onComplete:Function=null):void
		{
			if(isErrorStr(key))
			{
				if(onComplete !=  null)onComplete();
				return;
			}
				
			var url:String = key;
			if(key.indexOf(RES_ROOT) != -1)
			{
				url = key;
			}else{
				url = RES_ROOT+key;
			}
			
			url = checkAddExtensionName(url);
			
			if(decodeURL != null)
			{
				url = decodeURL(url);
			}
			
			key = nanoKey(key);
			
			//已经在加载中
			if(loadingAssets[url])
			{
				loadingAssets[url].push(onComplete);
				return;
			}
			loadingAssets[url] = [onComplete];
			
			if(Starling.current.showTrace)
				trace("[Feathers]GuiTheme.LoadAsset :	"+url);
			
			if(useWorkerLoadTextureBytes)
			{
				var texture:ConcreteTexture;
				var onTextureComplete:Function = function():void
				{
					textureMap[key] = texture;
					texture.removeEventListener(away3d.events.Event.COMPLETE,onTextureComplete);
					onAssetsLoaded(url);
				}
				
				texture = new ConcreteTexture();
				texture.addEventListener(away3d.events.Event.COMPLETE,onTextureComplete);
				texture.load(url);
			}
			else
			{
				var onAssetLoad:Function = function($ld : MultiLoadData, event : flash.events.Event):void
				{
					var loader : MultiDobjLoader = event.currentTarget as MultiDobjLoader;
					var bmp : Bitmap = loader.content as Bitmap;
					if(bmp != null)
					{
						pushDynamicSubTexture(bmp.bitmapData, key);
					}
					onAssetsLoaded(url);
				}
				
				var loadData:MultiLoadData = new MultiLoadData(url, onAssetLoad);
				MultiDobjLoadManager.load(loadData);
			}
		}
		
		public static function checkAddExtensionName(url:String):String
		{
			var format:int = GuiTheme.defaultTextureFormat;
			if(format != TextureFormatEnum.UNKNOWN && needAddExtenName(url))
			{
				var ext:String = TextureUtils.getTextureFileExtensionFromTextureFormat(format);
				switch(format)
				{
					case TextureFormatEnum.ATF:
					case TextureFormatEnum.JPG:
					case TextureFormatEnum.BPG:
						if(url.indexOf(ext) < 0)url += ext;
						break;
				}
			}
			return url;
		}
		
		private static function needAddExtenName(path:String):Boolean
		{
			path = path.split("?")[0];
			var i1:int = path.lastIndexOf("/");
			var i2:int = path.lastIndexOf(".");
			path =  path.substring(i1+1,i2);
			var i3:int = path.indexOf(".");
			return i3 < 0;
		}
		
		/**
		 * key的简短形式 
		 * 
		 */		
		private function nanoKey(key:String):String
		{
			//key不能带版本号
			if(key.indexOf("?") != -1)
			{
				key = key.split("?")[0];
			}
			//key是相对路径
			if(key.indexOf(RES_ROOT) != -1)
			{
				var arr:Array = key.split(RES_ROOT);
				var len:int = arr.length;
				if(len > 0)
				{
					key = arr[len - 1];
				}
			}
			return key;
		}
		
		/**
		 * 某一资源加载完成后统一回调 
		 * @param url
		 * 
		 */		
		private function onAssetsLoaded(url:String):void
		{
			var callbacks:Array = loadingAssets[url];
			for each(var fun:Function in callbacks)
			{
				if(fun != null)fun();
			}
			delete loadingAssets[url];
		}
		
		/**
		 * 根据bd生成Texture
		 */
		private function fromTextureBitmapData(key:String, bd:BitmapData, repeat:Boolean=false):IStarlingTexture
		{
			var format:String = "bgra";
			if(useCompressedTexture && TextureUtils.isPowerOfTwo(bd.width) && TextureUtils.isPowerOfTwo( bd.height ))
			{
				format = Context3DTextureFormat.COMPRESSED_ALPHA;
			}
			
			return TextureFactory.fromBitmapData(bd, false, false,format, repeat);
		}
		
		private var loadingAssets:Dictionary = new Dictionary();
		
		public function hasTexture(key:String):Boolean
		{
			return getTexture(nanoKey(key)) != null;
		}
		
		/**
		 * 根据纹理标识获取纹理
		 * @param key 纹理标识
		 * @return IStarlingTexture 纹理
		 * 
		 */		
		public function getTexture(key:String):IStarlingTexture{
			key = nanoKey(key);
			if(textureMap.hasOwnProperty(key))
				return textureMap[key];
			
			var atlas:* = getTextureAtlasBySubKey(key);
			var t:IStarlingTexture = atlas ? atlas.getTexture(key) : null;
			return t;
		}
		
		/**
		 * 根据subKey获取纹理对应的位图数据 
		 * @param key 子纹理对应的subkey
		 * @return bitmapData
		 */		
		public function getTextureBitmapData(key:String):BitmapData
		{
			var bd:BitmapData = null;
			key = nanoKey(key);
			if(key in textureBdMap)
			{
				return textureBdMap[key];
			}
			
			var sub:Object =  themeInfo[key];
			if(sub == null)return null;
			
			var parentKey:* = sub[TEXTURE_ATLAS_ID];
			
			var atlas:* = getAtlas(parentKey);
			var dyn:DynamicBitmapTexture = atlas  is DynamicBitmapTexture ? atlas as DynamicBitmapTexture : null;
			if(dyn != null)
			{
				return dyn.getBitmapData(key);
			}
			
			if(!textureBdMap[parentKey])
			{
				textureBdMap[parentKey] = ConcreteTexture(TextureAtlas(atlas).texture).bgraData.getBitmapData();
			}
			
			var parentBd:BitmapData = textureBdMap[parentKey];
			bd = new BitmapData(sub.width, sub.height,true,0)
			bd.copyPixels(parentBd, new Rectangle(sub.x, sub.y, sub.width, sub.height), HELPER_POINT);
			textureBdMap[key] = bd;
			return bd;
		}
		
		/**
		 * 二次扣图
		 * 从一个key中获取对应的位图,并根据传入参数再次剪裁
		 * @param key
		 * @param clip
		 * @param cache 针对此次剪裁缓存，以便下次快速获取
		 * @return  BitmapData
		 * 
		 */		
		public function getBitmapDataClip(key:String, clip:Rectangle, cache:Boolean=true):BitmapData
		{
			var bd:BitmapData = null;
			var parentBd:BitmapData = null;
			key = nanoKey(key);
			var clipKey:String = key+"_"+clip.x+"_"+clip.y+"_"+clip.width+"_"+clip.height;
			if(clipKey in textureBdMap)
			{
				return textureBdMap[clipKey];
			}
			
			var sub:Object =  themeInfo[key];
			if(sub == null)return null;
			
			var parentKey:* = sub[TEXTURE_ATLAS_ID];
			
			if(parentKey in textureBdMap)
			{
				parentBd = textureBdMap[parentKey];
				bd = new BitmapData(clip.width, clip.height,true,0)
				bd.copyPixels(parentBd, new Rectangle(sub.x+clip.x, sub.y+clip.y, clip.width, clip.height), HELPER_POINT);
				if(cache)textureBdMap[clipKey] = bd;
			}else
			{
				var atlas:* = getAtlas(parentKey);
				var dyn:DynamicBitmapTexture = atlas  is DynamicBitmapTexture ? atlas as DynamicBitmapTexture : null;
				if(dyn != null)
				{
					parentBd = dyn.getBitmapData(key);
					bd = new BitmapData(clip.width, clip.height,true,0)
					bd.copyPixels(parentBd, new Rectangle(clip.x, clip.y, clip.width, clip.height), HELPER_POINT);
					if(cache)textureBdMap[clipKey] = bd;
				}
			}
			return bd;
		}
		
		public function getBitmapDataClipTexture(key:String, clip:Rectangle, forcePotTexture:Boolean=true):IStarlingTexture
		{
			var clipKey:String = key+"_"+clip.x+"_"+clip.y+"_"+clip.width+"_"+clip.height;
			var t:IStarlingTexture = textureMap[clipKey];
			if(!t)
			{
				var bd:BitmapData = GuiTheme.ins.getBitmapDataClip(key, clip);
				if(bd != null)
				{
					t = TextureFactory.fromBitmapData(bd, false, false,"bgra", forcePotTexture);
					textureMap[clipKey] = t;
					
					CONFIG::Starling_Debug
						{
							t.name = clipKey;
						}
				}
			}
			return t;
		}

		public function disposeTextureBitmapData(key:String):void
		{
			key = nanoKey(key);
			if(key in textureBdMap)
			{
				var bd:BitmapData = textureBdMap[key];
				if(bd != null)
				{
					try{
						bd.dispose();
					}catch(err:Error){
						trace("无效的bitmapData:", key);
					}
				}
				textureBdMap[key] = null;
				delete textureBdMap[key];
			}
		}
		
		public function isScale9Textue(key:String):Boolean{
			key = nanoKey(key);
			var rect:Rectangle = getScale9GridRect(key);
			return rect != null;
//			return rect != null && rect.left != 0 && rect.top != 0;
		}
		
		/**
		 *横向3宫Rectange[x,0,width,0]; 纵向3宫Rectange[0,y,0,height] 
		 * 
		 */		
		public function isScale3Textue(key:String):Boolean{
			key = nanoKey(key);
			var rect:Rectangle = getScale9GridRect(key);
			return rect != null && (rect.left == 0 || rect.top == 0);
		}
		
		public function applayScale9Gird(img:Image, key:String):Boolean
		{
			var rect:Rectangle = getScale9GridRect(key);
			if(rect != null && img != null)
			{
				img.scale9Grid = rect;
				return true;
			}
			return false;
		}
		
		public function getRepeatScale9Textures(skinName:String):RepeatScale9Textures{
			skinName = nanoKey(skinName);
			var sub:RepeatScale9Textures = mSubScale9Textures[skinName];
			if(!sub)
			{
				sub = new RepeatScale9Textures(skinName);
				mSubScale9Textures[skinName] = sub;
			}
			return sub;
		}
		
/*		public function getScale3Textures(skinName:String):Scale3Textures{
			skinName = nanoKey(skinName);
			var sub:* = mSubScale9Textures[skinName];
			if(!sub)
			{
				var t:IStarlingTexture = getTexture(skinName);
				if(!t)
				{
					trace("null Scale3Texture:"+skinName);
					return null;
				}
				
				//横向3宫[x,0,width,height]; 纵向3宫[0,y,width,height]
				var rect:Rectangle = getScale9GridRect(skinName);
				if(rect.top == 0)
				{
					sub = new Scale3Textures(t, rect.x, rect.width, Scale3Textures.DIRECTION_HORIZONTAL);
				}else if(rect.left == 0)
				{
					sub = new Scale3Textures(t, rect.y, rect.height, Scale3Textures.DIRECTION_VERTICAL);
				}
				mSubScale9Textures[skinName] = sub;
			}
			return sub;
		}*/
		
		/**
		 *九宫格数据,临时使用,外部需要改变rect 时请先clone 
		 */		
		private static var scale9Rect:Rectangle = new Rectangle;
		private function getScale9GridRect(name:String):Rectangle{
			var str9:String = scale9Grids != null ? scale9Grids[name] : null;
			if(!str9)
			{
				var sub:Object =  themeInfo[name];
				str9 = sub ? sub[SCALE9_GRID] : null;
			}
			if(isErrorStr(str9))return null;
			var arr:Array = str9.split(",");
			scale9Rect.x = int(arr[0]);
			scale9Rect.y = int(arr[1]);
			scale9Rect.width = int(arr[2]);
			scale9Rect.height = int(arr[3]);
			return scale9Rect;
		}
		
		public function copyScale9GridRect(name:String, target:Rectangle = null):Rectangle
		{
			var rect:Rectangle = getScale9GridRect(name);
			if(rect)
			{
				if(!target)target = new Rectangle();
				target.x = rect.x;
				target.y = rect.y;
				target.width = rect.width;
				target.height = rect.height;
			}
			return target;
		}
		
		/**
		 * 非法字符串
		 */		
		public static function isErrorStr(str:String):Boolean
		{
			return ( str == null || StringUtil.trim(str) == "" || str == "null" || str == "undefined");
		}
		
		/**
		 *对纹理被裁剪空白后的偏移量
		 */	
		public function getOffSet(key:String):Point
		{
			key = nanoKey(key);
			var p:Point;
			var sub:Object =  themeInfo[key];
			if(sub && ("offx" in sub || "offy" in sub))
			{
				p = Pool.getPoint(int(sub.offx), int(sub.offy));
			}
			return p;
		}
		
		public function getSubThemeInfo(key:String):Object
		{
			var sub:Object =  themeInfo[key];
			return sub
		}
		
		/**
		 * json纹理配置转成Starling能识别的xml纹理配置 
		 * @param jsonStr
		 * @return 
		 */		
		
		//json文本文件  转成 xml文件
		/*			var byteDataTxt:ByteArray = new ATLAS_JSON();  
		var str:String = byteDataTxt.readUTFBytes(byteDataTxt.bytesAvailable);  
		var xml:XML = jsonTextureToXML(str);
		this.commonAtlas= new TextureAtlas(atlasTexture,  xml);*/
		
/*		protected function jsonTextureToXML(jsonStr:String):XML{
			var config:Object = JSON.parse(jsonStr);
			theme = config;
			var xml:XML = 
				<TextureAtlas imagePath="texture.png">
				</TextureAtlas>;
			xml.@imagePath = config.file;
			var f:Object = config.frames;
			for (var k:String in f)
			{
				var n:Object = f[k];
				var sxml:XML = <SubTexture/>;
				sxml.@name=k;
				sxml.@x=n.x;
				sxml.@y=n.y;
				sxml.@width=n.w;
				sxml.@height=n.h;
				xml.appendChild(sxml);
			}
//			trace(xml.toXMLString());
			return xml;
		}*/
		
		protected function parseAtlasXml(atlasXml:XML):Object
		{
			var sub:Object;
			var subs:Object={};
			for each (var subTexture:XML in atlasXml.SubTexture)
			{
				var key:String        = subTexture.@name;
				var x:Number           = parseFloat(subTexture.@x);
				var y:Number           = parseFloat(subTexture.@y);
				var width:Number       = parseFloat(subTexture.@width);
				var height:Number      = parseFloat(subTexture.@height);
				var scale9grid:String 			= subTexture.@scale9grid;
				var url:String 				= subTexture.@url;
				var offx:int					= subTexture.@offx;
				var offy:int					= subTexture.@offy;
				
				sub = {key:key,x:x,y:y,width:width,height:height,url:url}
				if(scale9grid != "null" && scale9grid)
				{
					sub.scale9grid=scale9grid;//有九宫值时才有属性
				}
				if(offx || offy)
				{
					sub.offx = offx;
					sub.offy = offy;
				}
				subs[key] = sub;
			}
			return subs;
		}
		
		private var scale9Grids:Dictionary;
		public function initScale9GridsInfo(xml:XML):void
		{
			scale9Grids = new Dictionary();
			var key:String;
			for each (var item:XML in xml.Item)
			{
				key    = item.@key;
				scale9Grids[key] = item.@scale9grid;
			}
		}
		
		//-------------------------------------------------动态纹理贴图DBT-------------------------------------------------
		/**
		 * 根据纹理集ID获取纹理集
		 * id为int,是系统自动生成的动态纹理,返回FastDynamicBitmapTexture
		 * 否则返回TextureAtlas
		 * 
		 */	
		public function getAtlas(id:*): *
		{
			if(textureAtlasMap[id] == null)
			{
				if(id is int)
				{
					if(id > 0)
					{
						textureAtlasMap[id] = new FastDynamicBitmapTexture(2048,2048);
					}
				}
			}
			return textureAtlasMap[id];
		}
		
		
		/**
		 * 获取纹理集对象 
		 * @param subKey 子纹理标识
		 * @return 子纹理所在纹理集
		 * 
		 */		
		private function getTextureAtlasBySubKey(subKey:String):*
		{
			var sub:Object =  themeInfo[subKey];
			if(sub == null)return null;
			return getAtlas(sub[TEXTURE_ATLAS_ID]);
		}
		
		/**
		 *添加纹理,如果存在此key,则不会做任何操作  
		 * 
		 */		
		private function addThemeSub(subkey:String, sub:Object, atlasID:*):Boolean
		{
			if(themeInfo[subkey])
			{
				//trace("覆盖纹理:"+subkey);
				return false;
			}
			sub[TEXTURE_ATLAS_ID] = atlasID;
			themeInfo[subkey] = sub;
			return true;
		}

		public function pushTexture(key:String,texture:IStarlingTexture, xml:XML):IStarlingTexture
		{
			key = nanoKey(key);
			var atlas:TextureAtlas = new TextureAtlas(texture, xml);
			var subs:Object = parseAtlasXml(xml);
			for (var subkey:String in subs )
			{
				var sub:Object = subs[subkey];
				addThemeSub(subkey, sub, key);
			}
			
			textureAtlasMap[key] = atlas;
			
			customTexturesKeyMap[key] = subs;
			
			return texture;
		}
		
		/**
		 * 增加一个静态纹理集,此API较快，请尽量使用，即单独打包，而不插入到动态纹理大图
		 * @param key 纹理集key
		 * @param bd  贴图数据
		 * @param xml 纹理xml描述文件
		 * @return 返回此纹理集对应的Texture
		 * 
		 */		
		public function pushBitmapTexture(key:String, bd:BitmapData, xml:XML):IStarlingTexture
		{
			key = nanoKey(key);
			var atlasTexture:IStarlingTexture = TextureFactory.fromBitmapData(bd, false, false);
			var atlas:TextureAtlas = new TextureAtlas(atlasTexture, xml);
			var subs:Object = parseAtlasXml(xml);
			var keys:Vector.<String> = new Vector.<String>;
			/*var bds:Vector.<BitmapData> = new Vector.<BitmapData>;
			var temp:BitmapData;
			var rect:Rectangle = new Rectangle();
			var grayBmd:BitmapData;
			var graysubs:Object={};*/
			for (var subkey:String in subs )
			{
				var sub:Object = subs[subkey];
				addThemeSub(subkey, sub, key);
				
				//有up状态图片或normal状态图片
/*				if(CREAT_GRAY_IMG_PIXES > 0)
				{
					var graykey:String = null;
					if(subkey.indexOf(STATE_UP_PNG) != -1)
					{
						graykey = subkey.replace(STATE_UP_PNG, STATE_DISABLED_PNG);
						
					}else if(subkey.indexOf(STATE_NORMAL_PNG) != -1)
					{
						graykey = subkey.replace(STATE_NORMAL_PNG, STATE_DISABLED_PNG);
					}
					
					//检测灰度图(有key无value时补齐,即编辑器中设计有disabled状态,但未提供对应图片,当图片总像素小于10000时生成灰度ltu)
					if(graykey && !subs[graykey] && rect.width*rect.height < CREAT_GRAY_IMG_PIXES)
					{
						rect.x = sub.x;
						rect.y = sub.y;
						rect.width = sub.width;
						rect.height = sub.height;
						temp = new BitmapData(rect.width, rect.height, true, 0);
						temp.copyPixels(bd, rect, HELPER_POINT);
						
						grayBmd = UIStateSetHelper.grayBitmapData(temp);
						keys.push(graykey);
						bds.push(grayBmd);
						temp.dispose();
						
						graysubs[graykey] = {key:graykey, "scale9grid":sub[SCALE9_GRID]}
					}	
				}*/
				
			}
			
			//动态生成的灰度纹理
/*			if(keys.length)
			{
				var dynamic:FastDynamicBitmapTexture = getAtlas(dynamicIndex);
				if(dynamic.addBitmapDatas(keys, bds) != true)
				{
					//纹理超过限制
					dynamic = getAtlas(dynamicIndex++);
					dynamic.addBitmapDatas(keys, bds);
				}
				
				for (graykey in graysubs )
				{
					sub = graysubs[graykey];
					addThemeSub(graykey, sub, dynamicIndex);
					
					subs[graykey] = sub;
				}
			}*/
			
			textureAtlasMap[key] = atlas;
			textureBdMap[key] = bd;
			
			customTexturesKeyMap[key] = subs;
			
			return atlasTexture;
		}
		
		/**
		 * 删除一个静态纹理集
		 * @param key 纹理集标识
		 * @return Boolean 是否执行成功
		 * 
		 */		
		public function popBitmapTexture(key:String):Boolean
		{
			key = nanoKey(key);
			var atlas:TextureAtlas = textureAtlasMap[key];
			if(atlas)atlas.dispose();
			__deleteTextures(key);
			
			return atlas != null;
		}
		
		/**
		 * 往GuiTheme系统注入一个新的动态贴图集
		 * 此贴图集会被打散并分配到系统动态纹理贴图集,内存占用最优。
		 * 此API调用时消耗CPU较多.需要更快注入贴图集请考虑使用pushBitmapTexture(key:String, bd:BitmapData, xml:XML):TextureAtlas
		 * @param key 纹理集key
		 * @param texture 位图数据对象
		 * @param atlasXML xml对象
		 * 
		 */	
		public function pushDynamicTexture(key:String, bd:BitmapData, xml:XML):void
		{
			key = nanoKey(key);
			var dynamic:FastDynamicBitmapTexture = getAtlas(dynamicIndex);
			var subs:Object = parseAtlasXml(xml);
			var keys:Vector.<String> = new Vector.<String>;
			var bds:Vector.<BitmapData> = new Vector.<BitmapData>;
			var temp:BitmapData;
			var rect:Rectangle = new Rectangle();
			var grayBmd:BitmapData;
			var subPlus:Object={};
			var subkey:String;
			for (subkey in subs )
			{
				var sub:Object = subs[subkey]
				keys.push(subkey);
				subPlus[subkey] = sub;
				
				rect.x = sub.x;
				rect.y = sub.y;
				rect.width = sub.width;
				rect.height = sub.height;
				temp = new BitmapData(rect.width, rect.height, true, 0);
				temp.copyPixels(bd, rect, HELPER_POINT);
				
				//存储一份供应用程序调用
				textureBdMap[subkey] = temp;
				
				bds.push(temp);
				
				//有up状态图片或normal状态图片
/*				if(CREAT_GRAY_IMG_PIXES > 0)
				{
					var graykey:String = null;
					if(subkey.indexOf(STATE_UP_PNG) != -1)
					{
						graykey = subkey.replace(STATE_UP_PNG, STATE_DISABLED_PNG);
						
					}else if(subkey.indexOf(STATE_NORMAL_PNG) != -1)
					{
						graykey = subkey.replace(STATE_NORMAL_PNG, STATE_DISABLED_PNG);
					}
					
					//检测灰度图(有key无value时补齐)
					if(graykey && !subs[graykey] && rect.width*rect.height <= CREAT_GRAY_IMG_PIXES)
					{
						grayBmd = UIStateSetHelper.grayBitmapData(temp);
						keys.push(graykey);
						bds.push(grayBmd);
						
						subPlus[graykey] = {key:graykey, "scale9grid":sub[SCALE9_GRID]}
					}
				}*/

			}
			
			if(dynamic.addBitmapDatas(keys, bds) != true)
			{
				//纹理超过限制
				dynamic = getAtlas(dynamicIndex++);
				dynamic.addBitmapDatas(keys, bds);
			}
			
			//记录其所在纹理集
			for (subkey in subPlus )
			{
				sub = subPlus[subkey];
				addThemeSub(subkey, sub, dynamicIndex);
				subPlus[subkey] = sub;
			}
			
			bd.dispose();
			bd = null;
			System.disposeXML(xml);
			
			customTexturesKeyMap[key] = subPlus;
		}
		
		/**
		 * 销毁某个动态生成的纹理集
		 * @param key
		 * 
		 */		
		public function popDynamicTexture(key:String):void
		{
			__deleteTextures(key);
		}
		
		private function __deleteTextures(key:String):void
		{
			key = nanoKey(key);
			var subKey:String;
			var subs:Object = customTexturesKeyMap[key];
			var sub:Object;
			for (subKey in subs)
			{
				sub = subs[subKey];
				if(sub[TEXTURE_ATLAS_ID] is int)
				{
					popDynamicSubTexture(subKey);
				}else{
					delete themeInfo[subKey];
				}
				disposeTextureBitmapData(subKey);
			}
			
			textureAtlasMap[key] = null;
			delete textureAtlasMap[key];
			
			disposeTextureBitmapData(key);
			
			customTexturesKeyMap[key] = null;
			delete customTexturesKeyMap[key];
		}
		
		private var delaySubs:Array=[];
		/**
		 * 往GuiTheme系统注入一个新的动态子贴图,例如图标
		 * @param bd BitmapData
		 * @param key String 访问texture的标识
		 * @param useBatch 是否批量 批量会等待一段时间,并把此时间内的操作累积合并完成，完成后回调onComplete，此方法有助于提高性能
		 * @param onBatchComplete Function 执行完成后的回调,无回调参数,当useBatch为true时有意义
		 * 
		 */
		public function pushDynamicSubTexture(bd:BitmapData, key:String,useBatch:Boolean=false, onBatchComplete:Function=null):void
		{
			key = nanoKey(key);
			if(useBatch)
			{
/*				delaySubs.push({key:key, bd:bd, fun:onBatchComplete});
				if(TimerServer.has(batchPushDynaSubs) != true)
				{
					const waitTime:int = 100;
					TimerServer.add(batchPushDynaSubs,waitTime);
				}*/
			}else
			{
				pushDynaSubNow(bd,key);
			}
		}
		
		private static const LABEL_TEXTURE_ID:String = "__LabelTexture";
		public function pushDynamicLabelBitmapData(key:String, bitmapData:BitmapData,  clipRect:Rectangle=null, isBitmapFont:Boolean=false):IStarlingTexture
		{
			var a:DynamicLabelTextureAtlas = textureAtlasMap[LABEL_TEXTURE_ID];
			if(!a)textureAtlasMap[LABEL_TEXTURE_ID] = a = new DynamicLabelTextureAtlas();
			clipRect ||= bitmapData.rect;
			var t:IStarlingTexture = a.addLabelBitmapData(key, bitmapData, clipRect, isBitmapFont);
			addThemeSub(key, {key:key,width:t.width,height:t.height,offx:clipRect.x,offy:clipRect.y},LABEL_TEXTURE_ID);
			return t;
		}
		
		/**
		 *是否适合作为单独静态纹理
		 */		
		private function isSuitSingleTexture(w:int, h:int):Boolean
		{
			if(w >= SINGLE_TEXTURE_MIN_SIZE.x && h >= SINGLE_TEXTURE_MIN_SIZE.y 
			||w >= SINGLE_TEXTURE_MIN_SIZE.y && h >= SINGLE_TEXTURE_MIN_SIZE.x )
			{
				return true;
			}
			return false;
		}
		
		/**
		 *检测是否为单独静态纹理,过大的纹理不加入到动态纹理集中
		 */		
		private  function isSingleTexture(key:String):Boolean
		{
			var sub:* = themeInfo[key];
			if(!sub)return false;
			return (sub[TEXTURE_ATLAS_ID] is int) && (sub[TEXTURE_ATLAS_ID] < 0);
		}
		
		private function pushDynaSubNow(bd:BitmapData, key:String):void
		{
			if(isSuitSingleTexture(bd.width, bd.height))
			{
				pushSingleStaticTexture(key, bd);
			}
			var dynamic:FastDynamicBitmapTexture = getAtlas(dynamicIndex);
			if(dynamic.addBitmapData(key, bd) != true)
			{
				//纹理超过限制
				dynamic = getAtlas(dynamicIndex++);
				dynamic.addBitmapData(key, bd);
			}
			
			addThemeSub(key, {key:key,width:bd.width,height:bd.height,url:key},dynamicIndex);
		}
		
		private function batchPushDynaSubs():void
		{
			var len:int = delaySubs.length;
			if(len > 0)
			{
				var subs:Array = delaySubs.concat();
				var keys:Vector.<String> = new Vector.<String>();
				var bds:Vector.<BitmapData>= new Vector.<BitmapData>();
				var sub:Object;
				for each(sub in  subs)
				{
					if(isSuitSingleTexture(sub.bd.width, sub.bd.height))
					{
						pushSingleStaticTexture(sub.key, sub.bd);
						continue;
					}
					keys.push(sub.key);
					bds.push(sub.bd);
				}
				
				var dynamic:FastDynamicBitmapTexture = getAtlas(dynamicIndex);
				if(dynamic.addBitmapDatas(keys, bds) != true)
				{
					//纹理超过限制
					dynamic = getAtlas(dynamicIndex++);
					dynamic.addBitmapDatas(keys, bds);
				}
			}
			
			//添加到全局索引库后回调
			var key:String;
			var bd:BitmapData;
			var fun:Function;
			for each(sub in  subs)
			{
				key = sub.key;
				bd = sub.bd;
				fun = sub.fun;
				addThemeSub(key, {key:key,width:bd.width,height:bd.height,url:key},dynamicIndex);
				if(fun != null)fun();
			}
			
			//从原来数组中删除已添加的
			delaySubs.splice(0,len);
		}
		
		/**
		 * 增加一张单独的静态纹理
		 * 
		 */
		protected function pushSingleStaticTexture(key:String, bd:BitmapData):void
		{
			var texture:IStarlingTexture = fromTextureBitmapData(key, bd);
			textureMap[key] = texture;
		}
		
		/**
		 * 销毁某个subkey对应的子纹理 
		 * @param subKey
		 * 
		 */		
		public function popDynamicSubTexture(key:String):void
		{
			key = nanoKey(key);
			var dbt:DynamicBitmapTexture = getTextureAtlasBySubKey(key);
			if(dbt){
				dbt.removeBitmapData(key,true,false);
				if(isSingleTexture(key))
				{
					dbt.dispose();
				}
			}
			delete themeInfo[key];
		}
		
	}
}


