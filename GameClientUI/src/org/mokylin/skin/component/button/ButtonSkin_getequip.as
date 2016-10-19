package org.mokylin.skin.component.button
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_getequip extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_getequip()
		{
			super();
			
			this.currentState = "down";
			labelFilterBlack_i();
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x98692D
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xD4C996
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xD4C996
						}
					]
				,
				disabled:[
						{target:"labelDisplay",
							name:"color",
							value:0x4A4744
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
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xD4C996
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"disabled":"ui/component/button/skin_getequip/disabled.png",
			"down":"ui/component/button/skin_getequip/down.png",
			"hover":"ui/component/button/skin_getequip/over.png",
			"up":"ui/component/button/skin_getequip/up.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.left = 0;
			temp.right = 0;
			temp.text = "按钮";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
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