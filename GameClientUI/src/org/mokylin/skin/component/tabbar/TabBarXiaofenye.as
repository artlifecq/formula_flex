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
	public class TabBarXiaofenye extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var labelFilter:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarXiaofenye()
		{
			super();
			
			this.currentState = "upAndSelected";
			labelFilter_i();
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xffe258
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xffe258
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x503717
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xffe258
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xffe258
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
							name:"nativeFilters",
							value:Fontter.filterObj[[labelFilter]]
						}
						,
						{target:"labelDisplay",
							name:"fontSize",
							value:14
						}
						,
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xc09051
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/xiaofenye/down.png",
			"downAndSelected":"ui/component/tabbar/xiaofenye/select.png",
			"hover":"ui/component/tabbar/xiaofenye/over.png",
			"overAndSelected":"ui/component/tabbar/xiaofenye/select.png",
			"up":"ui/component/tabbar/xiaofenye/up.png",
			"upAndSelected":"ui/component/tabbar/xiaofenye/select.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.nativeFilters = Fontter.filterObj[[labelFilter]];
			temp.left = 0;
			temp.right = 0;
			temp.fontSize = 14;
			temp.text = "按钮";
			temp.textAlign = "center";
			temp.color = 0xc09051;
			temp.top = 12;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function labelFilter_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilter = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}