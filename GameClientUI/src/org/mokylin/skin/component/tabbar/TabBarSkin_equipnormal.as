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
	public class TabBarSkin_equipnormal extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_equipnormal()
		{
			super();
			
			this.currentState = "upAndSelected";
			labelFilterBlack_i();
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xF4BD63
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xCAAF94
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xCAAF94
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x98692D
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xF4BD63
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0x98692D
						}
					]
				,
				init:[
						{target:"labelFilterBlack",
							name:"color",
							value:0x000000
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj[[labelFilterBlack]]
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
							value:0xFFFFFF
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_equipnormal/down.png",
			"downAndSelected":"ui/component/tabbar/skin_equipnormal/select.png",
			"hover":"ui/component/tabbar/skin_equipnormal/over.png",
			"overAndSelected":"ui/component/tabbar/skin_equipnormal/select.png",
			"up":"ui/component/tabbar/skin_equipnormal/up.png",
			"upAndSelected":"ui/component/tabbar/skin_equipnormal/select.png"};
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
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.left = 0;
			temp.right = 0;
			temp.fontSize = 14;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 1;
			temp.blurY = 1;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}