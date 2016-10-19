package org.mokylin.skin.component.tabbar
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabBarSkin_chat extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_chat()
		{
			super();
			
			this.currentState = "up";
			this.height = 18;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"center"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xDFB777
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_chat/down.png",
			"downAndSelected":"ui/component/tabbar/skin_chat/select.png",
			"hover":"ui/component/tabbar/skin_chat/over.png",
			"overAndSelected":"ui/component/tabbar/skin_chat/select.png",
			"select":"ui/component/tabbar/skin_chat/select.png",
			"up":"ui/component/tabbar/skin_chat/up.png",
			"upAndSelected":"ui/component/tabbar/skin_chat/select.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 18;
			temp.text = "ddd";
			temp.textAlign = "center";
			temp.color = 0xDFB777;
			temp.width = 39;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}