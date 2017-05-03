package org.mokylin.skin.app.beibao.Xinfa.button
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
	public class ButtonLongxiang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var iconDisplay:feathers.controls.UIAsset;

		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonLongxiang()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
				init:[
						{target:"labelDisplay",
							name:"textAlign",
							value:"right"
						}
						,
						{target:"labelDisplay",
							name:"color",
							value:0xE1201C
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
			skinNames={"down":"ui/app/beibao/xinfa/button/longxiang/down.png",
			"hover":"ui/app/beibao/xinfa/button/longxiang/over.png",
			"select":"ui/app/beibao/xinfa/button/longxiang/select.png",
			"up":"ui/app/beibao/xinfa/button/longxiang/up.png"};
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
			temp.left = 0;
			temp.right = 0;
			temp.text = "未激活";
			temp.textAlign = "right";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.verticalAlign = "middle";
			temp.y = 50;
			return temp;
		}

	}
}