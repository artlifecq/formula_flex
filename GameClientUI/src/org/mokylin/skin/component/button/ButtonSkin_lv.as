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
	public class ButtonSkin_lv extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var labelFilter:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_lv()
		{
			super();
			
			this.currentState = "down";
			this.height = 27;
			this.width = 79;
			labelFilter_i();
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x4E4023
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xFFF8D4
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xC9B48A
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
			skinNames={"down":"ui/component/button/skin_lv/down.png", "hover":"ui/component/button/skin_lv/over.png", "up":"ui/component/button/skin_lv/up.png"};
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
			temp.height = 27;
			temp.left = 0;
			temp.text = "天一";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 0;
			temp.verticalAlign = "middle";
			temp.width = 79;
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