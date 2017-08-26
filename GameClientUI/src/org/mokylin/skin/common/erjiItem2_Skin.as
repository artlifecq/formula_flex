package org.mokylin.skin.common
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
	public class erjiItem2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function erjiItem2_Skin()
		{
			super();
			
			this.currentState = "down";
			this.height = 20;
			this.width = 60;
			this.elementsContent = [];
			
			states = {
				down:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
						,
						{target:"labelDisplay",
							name:"text",
							value:"文 本"
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:1
						}
					]
				,
				hover:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"text",
							value:"文 本"
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:1
						}
					]
				,
				up:[
						{target:"labelDisplay",
							name:"color",
							value:0xEAEABC
						}
						,
						{target:"labelDisplay",
							name:"width",
							value:60
						}
						,
						{target:"labelDisplay",
							name:"nativeFilters",
							value:Fontter.filterObj["textFilterBlackGreen"]
						}
						,
						{target:"labelDisplay",
							name:"text",
							value:"文 本"
						}
						,
						{target:"labelDisplay",
							name:"y",
							value:1
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
					]
			};
			skinNames={"down":"ui/common/tips/xialatiaoditu.png", "hover":"ui/common/tips/xialatiaoditu.png", "up":"ui/common/tips/xialatiaoditu.png"};
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
			temp.text = "文本";
			temp.textAlign = "center";
			temp.color = 0x8b8d7b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			return temp;
		}

	}
}