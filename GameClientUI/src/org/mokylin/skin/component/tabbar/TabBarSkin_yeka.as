package org.mokylin.skin.component.tabbar
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabBarSkin_yeka extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var labelFilter:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_yeka()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 64;
			this.width = 25;
			labelFilter_i();
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEFEFF3
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0x9C8049
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0x9C8049
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x9C8049
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEFEFF3
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xEFEFF3
						}
					]
				,
				init:[
						{target:"labelFilter",
							name:"color",
							value:0x000000
						}
						,
						{target:"labelDisplay",
							name:"bold",
							value:true
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj[[labelFilter]]
						}
						,
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
							value:0xFFFFFF
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_yeka/up.png",
			"downAndSelected":"ui/component/tabbar/skin_yeka/upAndSelected.png",
			"hover":"ui/component/tabbar/skin_yeka/over.png",
			"overAndSelected":"ui/component/tabbar/skin_yeka/overAndSelected.png",
			"up":"ui/component/tabbar/skin_yeka/up.png",
			"upAndSelected":"ui/component/tabbar/skin_yeka/upAndSelected.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilter]];
			temp.height = 64;
			temp.left = 0;
			temp.maxWidth = 26;
			temp.fontSize = 16;
			temp.text = "天下";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.width = 25;
			return temp;
		}

		private function labelFilter_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilter = temp;
			temp.alpha = 1.00;
			temp.blurX = 3;
			temp.blurY = 3;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}