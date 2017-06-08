package org.mokylin.skin.app.zhuangbei.qianghua
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ListItem_Skin extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ListItem_Skin()
		{
			super();
			
			this.currentState = "down";
			this.height = 22;
			this.width = 68;
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"left"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xCFC6AE
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
			skinNames={"down":"ui/common/hover/xuanqukuang.png", "hover":"ui/common/hover/xuanqukuang.png", "up":"ui/common/hover/xuanqukuang.png"};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.text = "二阶";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			temp.verticalAlign = "middle";
			return temp;
		}

	}
}