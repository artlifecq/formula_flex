package feathers.themes
{
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
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
	import feathers.controls.SkinnableContainer;
	import feathers.controls.Slider;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import feathers.core.FeathersControl;
	
	/**
	 * 界面元素风格库
	 * 一种组件对应多种样式
	 * @author wewell
	 * 
	 */	
	public class GuiThemeStyle
	{
		public static function hasStyle(name:String):Boolean
		{
			return 	(name in styles);
		}
		
		public static function getStyle(name:String):Object
		{
			var stateSkin:StateSkin = getStateSkin(name);
			return stateSkin ? stateSkin.skinNames : null;
		}
		
		public static function getStateSkin(name:String):StateSkin
		{
			if(name in styles)
			{
				return styles[name];
			}
			
			try
			{
				var cls:Class = ApplicationDomain.currentDomain.getDefinition( name ) as Class;
				var stateSkin:StateSkin = new cls() as StateSkin;
			}
			catch( error:Error ) 
			{
				trace("className:"+name +"cann't find Definition");
			}
			return stateSkin;
		}
		
		private static function addStyle(styleName:String, stateSkin:StateSkin, hostName:String):void{
			
			if(styleName in styles)return;
			
			styles[styleName] = stateSkin;
			
			switch(hostName)
			{
				case "ToggleButton":
					GuiTheme.ins.addToggleButtonStyle(styleName);
					if(!defaultStyles[ToggleButton])defaultStyles[ToggleButton] = styleName;
					break;
				case "Button":
					GuiTheme.ins.addButtonStyle(styleName);
					if(!defaultStyles[Button])defaultStyles[Button] = styleName;
					break;
				case "TextInput":
					GuiTheme.ins.addTextInputStyle(styleName);
					if(!defaultStyles[TextInput])defaultStyles[TextInput] = styleName;
					break;
				case "TextArea":
					GuiTheme.ins.addTextAreaStyle(styleName);
					if(!defaultStyles[TextArea])defaultStyles[TextArea] = styleName;
					break;
				case "Radio":
					GuiTheme.ins.addRadioStyle(styleName);
					if(!defaultStyles[Radio])defaultStyles[Radio] = styleName;
					break;
				case "Check":
					GuiTheme.ins.addCheckStyle(styleName);
					if(!defaultStyles[Check])defaultStyles[Check] = styleName;
					break;
				case "TabBar":
					GuiTheme.ins.addTabBarStyle(styleName);
					if(!defaultStyles[TabBar])defaultStyles[TabBar] = styleName;
					break;
				case "ComboBox":
					GuiTheme.ins.addComboBoxStyle(styleName);
					if(!defaultStyles[ComboBox])defaultStyles[ComboBox] = styleName;
					break;
				case "List":
					GuiTheme.ins.addListStyle(styleName);
					if(!defaultStyles[List])defaultStyles[List] = styleName;
					break;
				case "GroupedList":
					GuiTheme.ins.addGroupedListStyle(styleName);
					if(!defaultStyles[GroupedList])defaultStyles[ToggleButton] = styleName;
					break;
				case "GroupedTree":
					GuiTheme.ins.addGroupedTreeStyle(styleName);
					if(!defaultStyles[GroupedTree])defaultStyles[GroupedTree] = styleName;
					break;
				case "ScrollContainer":
					GuiTheme.ins.addScrollContainerStyle(styleName);
					if(!defaultStyles[ScrollContainer])defaultStyles[ScrollContainer] = styleName;
					break;
				case "Slider":
					GuiTheme.ins.addSliderStyle(styleName);
					if(!defaultStyles[Slider])defaultStyles[Slider] = styleName;
					break;
				case "ScrollBar":
					GuiTheme.ins.addScrollBarStyle(styleName);
					if(!defaultStyles[ScrollBar])defaultStyles[ScrollBar] = styleName;
					break;
				case "ProgressBar":
					GuiTheme.ins.addProgressBarStyle(styleName);
					if(!defaultStyles[ProgressBar])defaultStyles[ProgressBar] = styleName;
					break;
				case "NumericStepper":
					GuiTheme.ins.addNumericStepperStyle(styleName);
					if(!defaultStyles[NumericStepper])defaultStyles[NumericStepper] = styleName;
					break;
			}
		}
		
		private static function toStateSkin(skin:Class):StateSkin{
			var styleName:String = getQName(skin);
			if(styleName in styles)return styles[styleName];
			var ss:StateSkin = new skin() as StateSkin;
			return ss;
		}
		
		public static function getStateSkinClass(styleName:String):Class
		{
			return styleName in styles ? styles[styleName] : null;
		}
		
		/**
		 * 为某种组件增加一个皮肤样式
		 * @param host 主机组件
		 * @param styleClass 皮肤样式类,必须是StateSkin的子类
		 * 
		 */		
		public static function addStyleClass(featherType:Class,styleClass:Class):void
		{
			var styleName:String = getQName(styleClass);
			var hostName:String = getHostName(featherType);
			addStyle(styleName, toStateSkin(styleClass), hostName);
		}
		
		/**
		 * 设置某一类组件默认皮肤样式
		 */	
		public static function setFeatherDefaultStyleClass(featherType:Class, styleClass:Class):void
		{
			var styleName:String = getQName(styleClass);
			var hostName:String = getHostName(featherType);
			addStyle(styleName, toStateSkin(styleClass), hostName);
			defaultStyles[featherType] = styleName;
		}
		
		/**
		 * 获取某一类组件默认皮肤样式名
		 */
		public static function getFeatherDefaultStyleName(featherType:Class):String
		{
			return defaultStyles ? defaultStyles[featherType] : null;
		}
		
		private static var QNAME_CACHE:Dictionary = new Dictionary();
		public static function getQName(any:*):String
		{
			if(any in QNAME_CACHE)return QNAME_CACHE[any];
			var name:String = getQualifiedClassName(any).replace("::", ".");
			QNAME_CACHE[any] = name;
			
			return name;
		}
		
		private static var HOSTNAME_CACHE:Dictionary = new Dictionary();
		private static function getHostName(any:*):String
		{
			if(any in HOSTNAME_CACHE)return HOSTNAME_CACHE[any];
			var hostName:String = getQName(any).split(".").pop();
			HOSTNAME_CACHE[any] = hostName;
			return hostName;
		}
		
		/**
		 * 为某一个组件实例设置皮肤
		 * @param feather 组件实例
		 * @param style 组件实例对应的自定义皮肤类,必须是StateSkin的子类
		 * 
		 */		
		public static function setFeatherSkinClass(feather:FeathersControl, style:Class):void
		{
			if(!feather)return;
			var styleName:String = getQName(style);
			var hostName:String = getHostName(feather);
			
			if(feather is SkinnableContainer || feather is UIAsset)
			{
				feather.styleName = styleName;
			}else
			{
				addStyle(styleName, toStateSkin(style), hostName);
				feather.styleName = styleName;
			}
		}
		
		/**
		 * 需要向上转换成Scroller时的样式设置,如TextArea,List,ScollerContainer等
		 */		
		public static function setScrollerStyle(scroller:Scroller, style:Class):void
		{
			addStyleClass(ScrollBar,style);
			GuiTheme.ins.setScrollerStyle(scroller, getQName(style));
		}
		
		/**
		 *自定义皮肤样式 
		 */		
		private static var styles:Dictionary= new Dictionary();
		private static var defaultStyles:Dictionary = new Dictionary();
	}
}