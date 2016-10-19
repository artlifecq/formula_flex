package org.mokylin.skin.component.tabbar
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabBarSkin_green extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_green()
		{
			super();
			
			this.currentState = "upAndSelected";
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
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_green/down.png",
			"downAndSelected":"ui/component/tabbar/skin_green/select.png",
			"hover":"ui/component/tabbar/skin_green/over.png",
			"overAndSelected":"ui/component/tabbar/skin_green/select.png",
			"up":"ui/component/tabbar/skin_green/up.png",
			"upAndSelected":"ui/component/tabbar/skin_green/select.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "ssss";
			temp.textAlign = "center";
			temp.color = 0xDFB777;
			temp.top = 6;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}