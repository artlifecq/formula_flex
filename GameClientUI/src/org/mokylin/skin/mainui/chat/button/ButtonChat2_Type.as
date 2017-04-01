package org.mokylin.skin.mainui.chat.button
{
	import feathers.controls.text.Fontter;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.GradientLabel;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonChat2_Type extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.GradientLabel;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonChat2_Type()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xdba35a
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0xd0bda4
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0xDCCE9B
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xDCCE9B
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0x61584b
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0x61584b
						}
					]
				,
				disabled:[
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xBCA78A
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0xBCA78A
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xBCA78A
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xf2b453
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0xC1AB89
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0x725b3c
						}
						,
						{target:"labelDisplay",
							name:"gradientColor_a",
							value:0x70675b
						}
					]
				,
				disabledAndSelected:[
						{target:"labelDisplay",
							name:"gradientColor_b",
							value:0xBCA78A
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
							value:0xBCA78A
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["labelFilterBlack"]
						}
					]
			};
			skinNames={"down":"ui/mainui/chat/button/chat_Type/down.png",
			"downAndSelected":"ui/mainui/chat/button/chat_Type/select_down.png",
			"hover":"ui/mainui/chat/button/chat_Type/over.png",
			"overAndSelected":"ui/mainui/chat/button/chat_Type/select_over.png",
			"up":"ui/mainui/chat/button/chat_Type/up.png",
			"upAndSelected":"ui/mainui/chat/button/chat_Type/select_up.png"};
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

		private function labelDisplay_i():feathers.controls.GradientLabel
		{
			var temp:feathers.controls.GradientLabel = new feathers.controls.GradientLabel();
			labelDisplay = temp;
			temp.gradientColor_a = 0xbca78a;
			temp.text = "按钮";
			temp.textAlign = "center";
			temp.color = 0xBCA78A;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.y = 2;
			return temp;
		}

	}
}