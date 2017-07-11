package org.mokylin.skin.app.banghui.button
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonYeqian extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonYeqian()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xcfc6ae
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0x8b8d7b
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
							value:0x8b8d7b
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
			skinNames={"down":"ui/app/banghui/button/yeqian/down.png",
			"downAndSelected":"ui/app/banghui/button/yeqian/over.png",
			"hover":"ui/app/banghui/button/yeqian/over.png",
			"overAndSelected":"ui/app/banghui/button/yeqian/over.png",
			"up":"ui/app/banghui/button/yeqian/up.png",
			"upAndSelected":"ui/app/banghui/button/yeqian/over.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "";
			temp.textAlign = "center";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}