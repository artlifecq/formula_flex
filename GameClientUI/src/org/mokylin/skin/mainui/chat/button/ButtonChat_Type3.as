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
	public class ButtonChat_Type3 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDispla:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonChat_Type3()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				init:[
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
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
					]
			};
			skinNames={"down":"ui/mainui/chat/button/chat_Type2/down.png",
			"hover":"ui/mainui/chat/button/chat_Type2/over.png",
			"up":"ui/mainui/chat/button/chat_Type2/up.png",
			"upAndSelected":"ui/mainui/chat/button/chat_Type2/select.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function iconDispla_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDispla = temp;
			temp.name = "iconDispla";
			temp.height = 26;
			temp.width = 26;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 20;
			temp.left = 2;
			temp.fontSize = 14;
			temp.text = "标";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 4;
			temp.width = 22;
			return temp;
		}

	}
}