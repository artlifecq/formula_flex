package org.mokylin.skin.app.paihangbang.button
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
	public class ButtonBtnBase extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonBtnBase()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				upAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xe3d9bf
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xe3d9bf
						}
					]
				,
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0x727468
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xa3a594
						}
					]
				,
				hoverAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xe3d9bf
						}
					]
				,
				downAndSelected:[
						{target:"labelDisplay",
							name:"color",
							value:0xe3d9bf
						}
					]
				,
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
							value:0xa3a594
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
			skinNames={"down":"ui/app/paihangbang/button/btnBase/down.png",
			"downAndSelected":"ui/app/paihangbang/button/btnBase/over.png",
			"hover":"ui/app/paihangbang/button/btnBase/over.png",
			"hoverAndSelected":"ui/app/paihangbang/button/btnBase/over.png",
			"up":"ui/app/paihangbang/button/btnBase/up.png",
			"upAndSelected":"ui/app/paihangbang/button/btnBase/over.png"};
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
			temp.fontSize = 14;
			temp.text = "按 钮";
			temp.textAlign = "center";
			temp.color = 0xa3a594;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}