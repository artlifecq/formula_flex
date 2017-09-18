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
	public class TabBarSkin_tab extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_tab()
		{
			super();
			
			this.currentState = "up";
			this.height = 33;
			this.width = 80;
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
					]
				,
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xBBBDAA
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_tab/down.png",
			"downAndSelected":"ui/component/tabbar/skin_tab/select.png",
			"hover":"ui/component/tabbar/skin_tab/over.png",
			"hoverAndSelected":"ui/component/tabbar/skin_tab/select.png",
			"up":"ui/component/tabbar/skin_tab/up.png",
			"upAndSelected":"ui/component/tabbar/skin_tab/select.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "标签标签";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 3;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}