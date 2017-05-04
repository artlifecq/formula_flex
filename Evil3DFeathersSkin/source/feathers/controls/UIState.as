package feathers.controls
{

	/**
	 * 编辑器-组件库  配套支持的状态设定 
	 * @author wewell
	 * 
	 */	
	public class UIState
	{
		public static const INIT:String = "init";
		
		public static const NORMAL:String = "normal";
		public static const SELECT:String = "select";
		
		public static const ENABLED:String = "enabled";
		public static const FOCUSED:String = "focused";
		
		public static const UP:String = "up";
		
		public static const DOWN:String = "down";
		
		public static const HOVER:String = "hover";
		
		public static const DISABLED:String = "disabled";
		
		public static const UP_AND_SELECTED:String = "upAndSelected";
		
		public static const DOWN_AND_SELECTED:String = "downAndSelected";
		
		public static const HOVER_AND_SELECTED:String = "hoverAndSelected";
		
		public static const DISABLED_AND_SELECTED:String = "disabledAndSelected";
		
		
		/**
		 *用于SmartDisplayObjectStateValueSelector的状态集合 
		 */		
		public static const SMART_STATES:Array=[
			UP,
			DOWN,
			HOVER,
			DISABLED,
			ENABLED,
			FOCUSED,
			UP_AND_SELECTED,
			DOWN_AND_SELECTED,
			HOVER_AND_SELECTED,
			DISABLED_AND_SELECTED
		];
		
		
		public static const POS_AND_SIZE_PROPS:String = "x,y,width,height";
		
		//选中时状态后辍
		public static const AND_SELECTED:String = "AndSelected";
		
		//state初始化属性设置参数
		public static const LabelStateProptiesKey:String = "_";
		public static const NATIVE_FILTERS:String = "nativeFilters";
		public static const LABEL_DISPLAY:String = "labelDisplay";
		public static const TEXT_DISPLAY:String = "textDisplay";
		public static const TARGET:String = "target";
		public static const NAME:String = "name";
		public static const VALUE:String = "value";
		public static const ALPHA:String = "alpha";
		public static const STRENGTH:String = "strength";
		
		
		public static function transToTextFormatProp(name:String):String
		{
			switch(name)
			{
				case "textAlign":return "align";
				case "fontSize":return "size";
				case "fontName":return "font";
				case "textColor":return "color";
			}
			return name;
		}
	}
}