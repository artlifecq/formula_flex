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
	public class RadioSkin_3 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioSkin_3()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.width = 160;
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
			skinNames={"disabled":"ui/component/radio/skin_3/down.png",
			"disabledAndSelected":"ui/component/radio/skin_3/downAndSelected.png",
			"down":"ui/component/radio/skin_3/down.png",
			"downAndSelected":"ui/component/radio/skin_3/downAndSelected.png",
			"hover":"ui/component/radio/skin_3/over.png",
			"overAndSelected":"ui/component/radio/skin_3/overAndSelected.png",
			"up":"ui/component/radio/skin_3/up.png",
			"upAndSelected":"ui/component/radio/skin_3/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 24;
			temp.left = 25;
			temp.right = 0;
			temp.fontSize = 12;
			temp.text = "银两";
			temp.textAlign = "left";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.verticalAlign = "middle";
			temp.y = 0;
			return temp;
		}

	}
}