package org.mokylin.skin.component.button
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
	public class ButtonSkin_green_redlabel extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var labelFilter:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_green_redlabel()
		{
			super();
			
			this.currentState = "down";
			this.width = 50;
			labelFilter_i();
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0xC989C2
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0x89C3C9
						}
					]
				,
				disabled:[
						{target:"labelDisplay",
							name:"color",
							value:0xFA0408
						}
						,
						{target:"labelDisplay",
							name:"fontSize",
							value:16
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
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xC9B489
						}
					]
			};
			skinNames={"down":"ui/component/button/skin_green2/down.png", "hover":"ui/component/button/skin_green2/over.png", "up":"ui/component/button/skin_green2/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.nativeFilters = Fontter.filterObj[[labelFilter]];
			temp.left = 0;
			temp.right = 0;
			temp.text = "123";
			temp.textAlign = "center";
			temp.color = 0xC9B489;
			temp.verticalCenter = 0;
			return temp;
		}

		private function labelFilter_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilter = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}