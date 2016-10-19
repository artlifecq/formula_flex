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
	public class TabBarSkin_big_naormal extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var filterSelect:flash.filters.GlowFilter;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_big_naormal()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 38;
			this.width = 74;
			filterSelect_i();
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xC9B48A
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
							value:0xC9B48A
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xC9B48A
						}
					]
				,
				init:[
						{target:"filterSelect",
							name:"color",
							value:0x072b2d
						}
						,
						{target:"labelDisplay",
							name:"bold",
							value:true
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj[[filterSelect]]
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
							value:0xC9C6A0
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_big_normal/up.png",
			"downAndSelected":"ui/component/tabbar/skin_big_normal/upAndSelected.png",
			"hover":"ui/component/tabbar/skin_big_normal/over.png",
			"overAndSelected":"ui/component/tabbar/skin_big_normal/overAndSelected.png",
			"up":"ui/component/tabbar/skin_big_normal/up.png",
			"upAndSelected":"ui/component/tabbar/skin_big_normal/upAndSelected.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function filterSelect_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			filterSelect = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x072b2d;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[filterSelect]];
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "默认文本";
			temp.textAlign = "center";
			temp.color = 0xC9C6A0;
			temp.width = 70;
			temp.x = 2;
			temp.y = 8;
			return temp;
		}

	}
}