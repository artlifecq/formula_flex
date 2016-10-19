package org.mokylin.skin.app.equip.radio
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RadioButtonSkin_equipradio extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RadioButtonSkin_equipradio()
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
			skinNames={"disabled":"ui/app/equip/radio/skin_equipradio/down.png",
			"disabledAndSelected":"ui/app/equip/radio/skin_equipradio/downAndSelected.png",
			"down":"ui/app/equip/radio/skin_equipradio/down.png",
			"downAndSelected":"ui/app/equip/radio/skin_equipradio/downAndSelected.png",
			"hover":"ui/app/equip/radio/skin_equipradio/over.png",
			"overAndSelected":"ui/app/equip/radio/skin_equipradio/overAndSelected.png",
			"up":"ui/app/equip/radio/skin_equipradio/up.png",
			"upAndSelected":"ui/app/equip/radio/skin_equipradio/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 24;
			temp.fontSize = 12;
			temp.text = "银两";
			temp.textAlign = "left";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.verticalAlign = "middle";
			temp.width = 135;
			temp.x = 25;
			temp.y = 0;
			return temp;
		}

	}
}