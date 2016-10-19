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
	public class RadioButtonV3_skin_4 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioButtonV3_skin_4()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:12
						}
						,
						{target:"labelDisplay",
							name:"textAlign",
							value:"left"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFABA5B
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlack"]
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/radio/v3_skin_4/down.png",
			"downAndSelected":"ui/component/radio/v3_skin_4/downAndSelected.png",
			"hover":"ui/component/radio/v3_skin_4/over.png",
			"overAndSelected":"ui/component/radio/v3_skin_4/overAndSelected.png",
			"up":"ui/component/radio/v3_skin_4/up.png",
			"upAndSelected":"ui/component/radio/v3_skin_4/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.fontSize = 12;
			temp.text = "银两";
			temp.textAlign = "left";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.x = 31;
			return temp;
		}

	}
}