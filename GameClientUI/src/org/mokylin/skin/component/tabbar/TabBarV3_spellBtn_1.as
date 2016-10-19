package org.mokylin.skin.component.tabbar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabBarV3_spellBtn_1 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarV3_spellBtn_1()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 40;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"fontSize",
							value:16
						}
						,
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xFFE258
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
			skinNames={"down":"ui/component/tabbar/v3_spellBtn_1/up.png",
			"downAndSelected":"ui/component/tabbar/v3_spellBtn_1/upAndSelected.png",
			"hover":"ui/component/tabbar/v3_spellBtn_1/over.png",
			"overAndSelected":"ui/component/tabbar/v3_spellBtn_1/overAndSelected.png",
			"up":"ui/component/tabbar/v3_spellBtn_1/up.png",
			"upAndSelected":"ui/component/tabbar/v3_spellBtn_1/upAndSelected.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.fontSize = 16;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}