package
{
	import flash.filters.BevelFilter;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.ConvolutionFilter;
	import flash.filters.DisplacementMapFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientBevelFilter;
	import flash.filters.GradientGlowFilter;
	import flash.filters.ShaderFilter;
	
	import feathers.controls.text.Fontter;

	/**
	 * UI配置
	 * @author wewell
	 * 
	 */	
	public class UISetting
	{
		[Embed(source="setting.xml",mimeType="application/octet-stream")]
		protected static const USERCONFIG_XML:Class;
		
		
		public function UISetting()
		{
		}
		
		public function setup():void
		{
			var filterObj:Object = {};
			var textFormatObj:Object = {};
			var settingXml:XML =  XML(new USERCONFIG_XML()) 
			var filterXmlList:XMLList = settingXml.descendants("filterArr");
			for each (var filterXml:XML in filterXmlList) 
			{
				var arr:Array = getFilter(filterXml);
				filterObj[filterXml.@id] = arr;  
			}
			
			var textFormatXmlList:XMLList = settingXml.descendants("textFormat");
			for each (var textFormatXml:XML in textFormatXmlList) 
			{
				var obj:Object = {};
				obj["id"] = String(textFormatXml.@id);
				obj["name"] = String(textFormatXml.@name);
				obj["textColor"] = String(textFormatXml.@textColor);
				obj["textFilter"] = String(textFormatXml.@textFilter);
				textFormatObj[obj.id] = obj;  
			}
			
			var defaultTextColor:uint = settingXml.descendants("defalutTextColor");
			var defaultTextSize:uint = settingXml.descendants("defalutFontSize");
			Fontter.truncateToFit = settingXml.descendants("truncateToFit") == "1";
			Fontter.filterObj = filterObj;
			
			Fontter.DEFAULT_FONT_NAME = settingXml.descendants("defalutFontFamily");
			Fontter.DEFAULT_FONT_COLOR = defaultTextColor;
			Fontter.DEFAULT_FONT_SIZE = defaultTextSize;
			
			Fontter.textFormatObj = textFormatObj;
			
			
			//init scale9grids
//			GuiTheme.initScale9GridsInfo(XML(new SCALE9GRIDS_XML()) );
		}
		
		private function getFilter(filterArrXml:XML):Array
		{
			var filterXmlList:XMLList = filterArrXml.descendants("filter");
			var filterArr:Array = [];
			for each (var filterXml:XML in filterXmlList) 
			{
				var filterType:String = filterXml.@filterType;
				var filter:BitmapFilter = getFilterByType(filterType);
				var temp:XMLList =  filterXml.attributes(); 
				for(var i:int = 1 ; i < temp.length() ; i++)  
				{  
					var key:String = temp[i].name();  
					if(filter.hasOwnProperty(key))
					{
						var value:String = temp[i];
						if(value == "true" || value == "false")
						{
							filter[key] = value == "true";  
						}else
						{
							filter[key] = temp[i];  
						}
					}
				}
				filterArr.push(filter);
			}
			return filterArr;
		}
		
		private function getFilterByType(filterType:String):BitmapFilter
		{
			var filter:BitmapFilter;
			if(filterType == "GlowFilter")
			{
				filter = new GlowFilter();
			}
			else if(filterType == "BevelFilter")
			{
				filter = new BevelFilter();
			}
			else if(filterType == "BlurFilter")
			{
				filter = new BlurFilter();
			}
			else if(filterType == "ColorMatrixFilter")
			{
				filter = new ColorMatrixFilter();
			}
			else if(filterType == "ConvolutionFilter")
			{
				filter = new ConvolutionFilter();
			}
			else if(filterType == "BevelFilter")
			{
				filter = new DisplacementMapFilter();
			}
			else if(filterType == "DisplacementMapFilter")
			{
				filter = new BevelFilter();
			}
			else if(filterType == "DropShadowFilter")
			{
				filter = new DropShadowFilter();
			}
			else if(filterType == "GradientBevelFilter")
			{
				filter = new GradientBevelFilter();
			}
			else if(filterType == "GradientGlowFilter")
			{
				filter = new GradientGlowFilter();
			}
			else if(filterType == "DisplacementMapFilter")
			{
				filter = new ShaderFilter();
			}
			return filter;
		}
		
	}
}