package org.mokylin.skin.mainui.chat.button
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonChat_Type2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonChat_Type2()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xbca78a
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x7a6d5a
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xbca78a
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
							value:0xbca78a
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/mainui/chat/button/chat_Type2/down.png",
			"downAndSelected":"ui/mainui/chat/button/chat_Type2/select.png",
			"hover":"ui/mainui/chat/button/chat_Type2/over.png",
			"hoverAndSelected":"ui/mainui/chat/button/chat_Type2/select.png",
			"up":"ui/mainui/chat/button/chat_Type2/up.png",
			"upAndSelected":"ui/mainui/chat/button/chat_Type2/select.png"};
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
			temp.left = 0;
			temp.right = 0;
			temp.text = "世";
			temp.textAlign = "center";
			temp.color = 0xbca78a;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}