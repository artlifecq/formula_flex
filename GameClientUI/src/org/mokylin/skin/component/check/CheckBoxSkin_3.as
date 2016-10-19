package org.mokylin.skin.component.check
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CheckBoxSkin_3 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CheckBoxSkin_3()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 23;
			this.width = 100;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:14
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
					]
			};
			skinNames={"down":"ui/component/check/skin_3/down.png",
			"downAndSelected":"ui/component/check/skin_3/downAndSelected.png",
			"hover":"ui/component/check/skin_3/over.png",
			"overAndSelected":"ui/component/check/skin_3/overAndSelected.png",
			"up":"ui/component/check/skin_3/up.png",
			"upAndSelected":"ui/component/check/skin_3/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = -3;
			temp.left = 20;
			temp.right = 0;
			temp.fontSize = 14;
			temp.text = "12313";
			temp.textAlign = "left";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.top = 3;
			return temp;
		}

	}
}