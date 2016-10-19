package org.mokylin.skin.mainui.chat.button
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
	public class ButtonSkin_channel extends feathers.controls.StateSkin
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
		public function ButtonSkin_channel()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 23;
			labelFilterBlack_i();
			this.elementsContent = [];
			
			states = {
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xFFC467
						}
						,
						{target:"labelDisplay",
							name:"fontName",
							value:"SimHei"
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x634a2f
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xD2B698
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
							name:"leading",
							value:0
						}
						,
						{target:"labelDisplay",
							name:"letterSpacing",
							value:0
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
							name:"verticalAlign",
							value:"top"
						}
					]
			};
			skinNames={"disabled":"ui/component/button/skin_chat_anniu/disable.png",
			"disabledAndSelected":"ui/component/button/skin_chat_anniu/disable.png",
			"down":"ui/component/button/skin_chat_anniu/down.png",
			"downAndSelected":"ui/component/button/skin_chat_anniu/over.png",
			"hover":"ui/component/button/skin_chat_anniu/over.png",
			"overAndSelected":"ui/component/button/skin_chat_anniu/over.png",
			"up":"ui/component/button/skin_chat_anniu/up.png",
			"upAndSelected":"ui/component/button/skin_chat_anniu/over.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			temp.x = 4;
			temp.y = -2;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 23;
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "aaa";
			temp.textAlign = "center";
			temp.verticalAlign = "top";
			temp.width = 57;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

	}
}