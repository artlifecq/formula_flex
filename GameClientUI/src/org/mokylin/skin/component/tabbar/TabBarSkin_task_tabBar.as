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
	public class TabBarSkin_task_tabBar extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var filterSelect:flash.filters.GlowFilter;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_task_tabBar()
		{
			super();
			
			this.currentState = "upAndSelected";
			filterSelect_i();
			this.elementsContent = [];
			labelDisplay_i();
			
			
			states = {
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
							value:12
						}
						,
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xE9C099
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["labelFilterBlack"]
						}
					]
			};
			skinNames={"disabled":"ui/component/tabbar/skin_task_tabBar/up.png",
			"disabledAndSelected":"ui/component/tabbar/skin_task_tabBar/upAndSelected.png",
			"down":"ui/component/tabbar/skin_task_tabBar/up.png",
			"downAndSelected":"ui/component/tabbar/skin_task_tabBar/upAndSelected.png",
			"hover":"ui/component/tabbar/skin_task_tabBar/over.png",
			"up":"ui/component/tabbar/skin_task_tabBar/up.png",
			"upAndSelected":"ui/component/tabbar/skin_task_tabBar/upAndSelected.png"};
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
			temp.left = 1;
			temp.right = 0;
			temp.fontSize = 12;
			temp.text = "默认文本";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 4;
			return temp;
		}

	}
}