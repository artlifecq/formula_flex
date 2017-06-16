package org.mokylin.skin.component.radio
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RadioButtonSkin_1 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioButtonSkin_1()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"left"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xcfc6ae
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["labelFilterBlack"]
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/radio/skin_1/down.png",
			"downAndSelected":"ui/component/radio/skin_1/downAndSelected.png",
			"hover":"ui/component/radio/skin_1/over.png",
			"hoverAndSelected":"ui/component/radio/skin_1/overAndSelected.png",
			"up":"ui/component/radio/skin_1/up.png",
			"upAndSelected":"ui/component/radio/skin_1/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 20;
			temp.left = 21;
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0xcfc6ae;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.width = 115;
			temp.y = 0;
			return temp;
		}

	}
}