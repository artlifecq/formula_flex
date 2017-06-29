package org.mokylin.skin.component.tabbar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TabBarSkin_pack extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TabBarSkin_pack()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.width = 75;
			this.elementsContent = [];
			
			states = {
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xe1d4a9
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xaea790
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
							value:0xaea790
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["labelFilterBlack"]
						}
						,
						{target:"labelDisplay",
							name:"verticalAlign",
							value:"middle"
						}
					]
			};
			skinNames={"down":"ui/component/tabbar/skin_pack/down.png",
			"downAndSelected":"ui/component/tabbar/skin_pack/select.png",
			"hover":"ui/component/tabbar/skin_pack/over.png",
			"overAndSelected":"ui/component/tabbar/skin_pack/select.png",
			"up":"ui/component/tabbar/skin_pack/up.png",
			"upAndSelected":"ui/component/tabbar/skin_pack/select.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 28;
			temp.left = 0;
			temp.right = 0;
			temp.text = "活动大厅";
			temp.textAlign = "center";
			temp.color = 0xaea790;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.verticalAlign = "middle";
			temp.y = 3;
			return temp;
		}

	}
}